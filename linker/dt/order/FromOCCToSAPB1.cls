Include utils.Constants

Class linker.dt.order.FromOCCToSAPB1 Extends (Ens.DataTransform, utils.FunctionSet)
{

ClassMethod Transform(pSource As %RegisteredObject, ByRef pTarget As %RegisteredObject, ByRef Aux) As %Status
{
	Try
	{
		#Dim status As %Status                 = $System.Status.OK()
		#Dim order As %DynamicObject           = pSource.OCCOrder
		#Dim bplIDAssignedToInvoice As %String = $Select(pSource.BPLIDAssignedToInvoice '= "" : pSource.BPLIDAssignedToInvoice , 1 : 1) 
		#Dim orderOperation As %String         = pSource.OrderOperation		
		Set pTarget                            = ..MapProperties(order, orderOperation, bplIDAssignedToInvoice)
	}
	Catch (exception)
	{
		Set status = exception.AsStatus()
	}
	Return status
}

ClassMethod MapProperties(order As %String, pAction As %String = "Insert", pBPLIDAssignedToInvoice As %String) As %String
{
	Set orderOCC = order
	//
	#Dim orderSAP As %DynamyObject = {}
	#Dim orderId As %String = $$$OCCPREFIX _ orderOCC.id
	//
	Set orderSAP.Address = ..BuildSAPAddress(orderOCC)
	If (pAction = "Insert")
	{
		Set orderSAP.CardCode         = orderId
		Set orderSAP."U_OCC_ORDER_ID" = orderId
		Set orderSAP.NumAtCard        = orderId
	}			
	// In te OCC is a Timestamp with timezone and in SAPB1 is a Date.
	Set orderSAP.DocDueDate                = $Piece(orderOCC.submittedDate, "Z", 1)
	Set orderSAP."BPL_IDAssignedToInvoice" = pBPLIDAssignedToInvoice
	Set orderSAP.DocumentLines             = ..BuildItemsOrderArray(orderOCC)
	Set orderSAP.TaxExtension              = {}
	Set orderSAP.TaxExtension.MainUsage    = $$$MAIUSAGEVENDA
	//
	Set orderSAP.DocumentAdditionalExpenses = []
	Set lineShiping                         = {}
	Set lineShiping.ExpenseCode             = 1
	Set lineShiping.LineTotal               = order.priceInfo.shipping
	Set lineShiping.TaxType                 =  "aext_NormalTax"
	Set lineShiping.TaxCode                 = "5101-003"
	Set lineShiping.DistributionMethod      = "aedm_RowTotal"
	//
	Do orderSAP.DocumentAdditionalExpenses.%Push(lineShiping)
	//
	Set orderSAPJSON =  orderSAP.%ToJSON()
	//
	Return orderSAPJSON
}

ClassMethod BuildSAPAddress(orderOCC As %DynamicObject) As %String
{
	Set shippingAddressOCC = orderOCC.shippingGroups.%Get(0).shippingAddress
	Set streetOCC = shippingAddressOCC.address1
	Set postalCodeOCC = shippingAddressOCC.postalCode
	Set cityOCC = shippingAddressOCC.city
	Set stateOCC = shippingAddressOCC.state
	Set countryOCC = shippingAddressOCC.country 
	//
	return streetOCC _ "\r\r" _ postalCodeOCC _ "-" _ cityOCC _ "-" _ stateOCC _ "\r" _ countryOCC
}

ClassMethod BuildItemsOrderArray(orderOCC As %DynamicObject) As %DynamicArray [ Private ]
{
	#Dim documentLines As %DynamicArray = []
	#Dim itemsOCC As %DynamicArray = orderOCC.commerceItems
	#Dim iterator As %Iterator.Array = itemsOCC.%GetIterator()
	//
	While iterator.%GetNext(.key,.value)
	{
		Set itemSAP           = {}
		Set itemSAP.ItemCode  = value.productId
		Set itemSAP.Quantity  = value.quantity
		Set itemSAP.Usage     = 10
		Set itemSAP.UnitPrice = value.priceInfo.currentPriceDetailsSorted.%Get(0).detailedUnitPrice
		//
		Do documentLines.%Push(itemSAP)
	}
	Return documentLines
}

}