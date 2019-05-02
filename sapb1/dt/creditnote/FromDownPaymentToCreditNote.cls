Class sapb1.dt.creditnote.FromDownPaymentToCreditNote Extends (Ens.DataTransform, utils.FunctionSet)
{
ClassMethod Transform(pSource As %RegisteredObject, ByRef pTarget As %RegisteredObject, ByRef Aux) As %Status
{
	Try
	{
		#Dim statusCode As %Status              = $System.Status.OK()
		#Dim downPaymentSAPB1 As %DynamicObject = pSource.SAPB1DownPayment
		#Dim creditNote As %DynamyObject        = {}
		#Dim pTarget  As %DynamyObject          = {}
		//
		Set creditNote.Address                   = downPaymentSAPB1.Address
		Set creditNote.DocCurrency               = downPaymentSAPB1.DocCurrency
		Set creditNote.CardCode                  = downPaymentSAPB1.CardCode			
		Set creditNote.DocDueDate                = downPaymentSAPB1.DocDueDate
		Set creditNote."BPL_IDAssignedToInvoice" = downPaymentSAPB1."BPL_IDAssignedToInvoice"
		Set creditNote.DownPaymentType           = "dptInvoice"
		Set creditNote.DocumentLines             = ..BuildItemsOrderArray(downPaymentSAPB1)
		Set downPaymentJSON                      = downPayment.%ToJSON()
		Set pTarget                              = downPaymentJSON 
	}
	Catch (exception)
	{
		Set statusCode = exception.AsStatus()
	}
	Return statusCode
}

ClassMethod BuildItemsOrderArray(downPaymentSAPB1 As %DynamicObject) As %DynamicArray [ Private ]
{
	#Dim documentLines As %DynamicArray       = []
	#Dim downPaymentItemsSAP As %DynamicArray = downPaymentSAPB1.DocumentLines
	#Dim iterator As %Iterator.Array          = downPaymentItemsSAP.%GetIterator()
	//
	While iterator.%GetNext(.key,.value)
	{
		Set itemSAP           = {}
		Set itemSAP.ItemCode  = value.ItemCode
		Set itemSAP.Quantity  = value.Quantity
		Set itemSAP.Usage     = value.Usage
		Set itemSAP.UnitPrice = value.UnitPrice
		Set itemSAP.BaseType  = 203
		Set itemSAP.BaseEntry = value.DocEntry
		Set itemSAP.Currency  = "R$"
		//
		Do documentLines.%Push(itemSAP)
	}
	Return documentLines
}

}