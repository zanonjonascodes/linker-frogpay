Include utils.Constants

Class sapb1.dt.payment.FromOrderToDownPayment Extends (Ens.DataTransform, utils.FunctionSet)
{

ClassMethod Transform(pSource As %RegisteredObject, ByRef pTarget As %RegisteredObject, ByRef Aux) As %Status
{
	Try
	{
		#Dim statusCode As %Status        = $System.Status.OK()
		#Dim orderSAPB1 As %DynamicObject = pSource.SAPB1Order.value.%Get(0)
		#Dim downPayment As %DynamyObject = {}
		#Dim pTarget  As %DynamyObject    = {}
		//
		Set downPayment.Address                   = orderSAPB1.Address
		Set downPayment.DocCurrency               = "R$"
		Set downPayment.CardCode                  = orderSAPB1.CardCode			
		Set downPayment.DocDueDate                = orderSAPB1.DocDueDate
		Set downPayment."BPL_IDAssignedToInvoice" = orderSAPB1."BPL_IDAssignedToInvoice"
		Set downPayment.DownPaymentType           = "dptInvoice"
		Set downPayment.DocumentLines             = ..BuildItemsOrderArray(orderSAPB1)
		Set downPaymentJSON                       = downPayment.%ToJSON()
		Set pTarget                               = downPaymentJSON 
	}
	Catch (exception)
	{
		Set statusCode = exception.AsStatus()
	}
	Return statusCode
}

ClassMethod BuildItemsOrderArray(orderSAP As %DynamicObject) As %DynamicArray [ Private ]
{
	#Dim documentLines As %DynamicArray = []
	#Dim orderItemsSAP As %DynamicArray = orderSAP.DocumentLines
	#Dim iterator As %Iterator.Array    = orderItemsSAP.%GetIterator()
	#Dim countBaseLine As %Integer      = -1
	//
	While iterator.%GetNext(.key,.value)
	{
		Set itemSAP           = {}
		Set itemSAP.ItemCode  = value.ItemCode
		Set itemSAP.Quantity  = value.Quantity
		Set itemSAP.Usage     = value.Usage
		Set itemSAP.UnitPrice = value.UnitPrice
		Set itemSAP.BaseType  = $$$DAOWNPAYMENTxBASETYPE
		Set itemSAP.BaseEntry = value.DocEntry
		Set itemSAP.Currency  = "R$"
		Set itemSAP.BaseLine  = $Increment(countBaseLine)
		//
		Do documentLines.%Push(itemSAP)
	}
	Return documentLines
}

}