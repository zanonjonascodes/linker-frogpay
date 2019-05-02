Class occ.boapi.Product Extends %RegisteredObject
{

Method MapProperties(item As %String) As %String
{
	try
	{
		Set statusCode = ##Class(%ZEN.Auxiliary.altJSONProvider).%ConvertJSONToObject(item,, .itemSAP)
		//		
		If ($System.Status.IsError(statusCode))
		{
			Throw ##class(%Exception.StatusException).CreateFromStatus(statusCode)
		}
		//
		#Dim produtoOCC As %DynamyObject = {}
		//
		Set produtoOCC.properties = {}
		Set produtoOCC.properties.displayName = itemSAP.ItemName
		Set produtoOCC.properties.description = itemSAP.ItemName
		Set produtoOCC.properties.longDescription = itemSAP.ItemName
		Set produtoOCC.properties.id = itemSAP.ItemCode
		Set produtoOCC.properties.taxCode = "null"
 		Set produtoOCC.properties.listPrice = itemSAP.ItemPrices.GetAt(1).Price
 		//
		Set produtoOCCJSON =  produtoOCC.%ToJSON()
		//
		}catch(e)
		{
			Set statusCode = e.AsStatus()
			Throw e
		  
		}
		Return produtoOCCJSON
}

}
