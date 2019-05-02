Class sapb1.boapi.Order Extends %RegisteredObject
{

ClassMethod MapProperties(order As %String, pAction As %String = "Insert") As %String
{
	try
	{
		Set orderOCC = ##Class(%DynamicObject).%FromJSON(order)
		//
		#Dim orderSAP As %DynamyObject = {}
		//
		Set orderSAP.Address = ..BuildSAPAddress(orderOCC)
		If (pAction = "Insert")
		{
			Set orderSAP.CardCode = "OCC_" _ orderOCC.profileId
			Set orderSAP."U_OCC_ORDER_ID" = orderOCC.id
		}			
		// In te OCC is a Timestamp with timezone and in SAPB1 is a Date.
		Set orderSAP.DocDueDate = $Piece(orderOCC.submittedDate, "Z", 1)
		Set orderSAP."BPL_IDAssignedToInvoice" = "1"
		Set orderSAP.DocumentLines = ..BuildItemsOrderArray(orderOCC)
		Set orderSAP.TaxExtension = {}
		Set orderSAP.TaxExtension.MainUsage = 10		
		//
		Set orderSAPJSON =  orderSAP.%ToJSON()
		//
		Set ^zOrder = orderSAPJSON 
	}
	catch(e)
	{
		Set statusCode = e.AsStatus()
		Throw e
	}
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
