Class occ.boapi.Sku Extends %RegisteredObject
{

ClassMethod MapProperties(item As %String) As %String
{
	Try
	{
		Set itemSAP = ##Class(%DynamicObject).%FromJSON(item)
		//	
		#Dim skuOCC As %DynamyObject = {}
		//
		Set skuOCC             = {}
		Set skuOCC.id          = itemSAP.ItemCode
		Set skuOCC.displayName = itemSAP.ItemName
		Set skuOCC.productId   = itemSAP.ItemCode 
		//
		Set skuOCCJSON =  skuOCC.%ToJSON()
		Set ^zsku = skuOCCJSON 
	}
	Catch(e)
	{
		Set statusCode = e.AsStatus()
		Throw e
	}
	Return skuOCCJSON
}

}
