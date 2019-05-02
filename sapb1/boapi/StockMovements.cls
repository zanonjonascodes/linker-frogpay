Class sapb1.boapi.StockMovements Extends %RegisteredObject
{

ClassMethod BuildItemCodesJSON(stockMovements As %String) As %String
{
	try
	{
		Set stockMovementsSAP = ##Class(%DynamicObject).%FromJSON(stockMovements)
		//
		#Dim itemCodes As %DynamyObject  = {}
		#Dim itemsArray As %DynamyArray  = []
		#Dim iterator As %Iterator.Array = stockMovementsSAP.value.%GetIterator()
		//
		While iterator.%GetNext(.key,.value)
		{
			Set itemSAP = {}
			Set itemSAP.ItemCode = value.DocumentLines.%Get(0).ItemCode
			//
			Set itemControl(itemSAP.ItemCode) = itemSAP	
		}
		Set key = $Order(itemControl(""),1)
		//
		while key '= ""
		{
			Do itemsArray.%Push(itemControl(key))
			Set key = $Order(itemControl(key),1)
		}
		Set itemCodes.value = itemsArray
		Set itemCodesJSON   = itemCodes.%ToJSON()
	}
	catch(e)
	{
		Set statusCode = e.AsStatus()
		Throw e
	}
	Return itemCodesJSON
}
}