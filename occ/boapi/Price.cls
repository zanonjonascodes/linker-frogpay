Class occ.boapi.Price Extends %RegisteredObject
{

Method MapProperties(item As %String) As %String
{
	try{
		Set statusCode = ##Class(%ZEN.Auxiliary.altJSONProvider).%ConvertJSONToObject(item,, .itemSAP)
		//
		If ($System.Status.IsError(statusCode))
		{
			Throw ##class(%Exception.StatusException).CreateFromStatus(statusCode)
		}
		//
		#Dim priceOCC As %DynamyObject = {}
		//
		Set priceOCC.properties = {}
		Set priceOCC.properties.listPrice = itemSAP.ItemPrices.GetAt(1).Price
		//
		Set priceOCCJSON =  priceOCC.%ToJSON()
		//
	}catch(e)
	{
		Set statusCode = e.AsStatus()
		Throw e
	}
	Return priceOCCJSON
}

}
