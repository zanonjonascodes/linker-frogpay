Class occ.dt.sku.FromItemToSKU Extends (Ens.DataTransform, utils.FunctionSet)
{

ClassMethod Transform(pSource As %RegisteredObject, ByRef pTarget As %RegisteredObject, ByRef Aux) As %Status
{
	Try
	{
		#Dim statusCode As %Status        = $System.Status.OK()
		#Dim itemSAPB1 As %DynamicObject = pSource.SAPB1Item
		#Dim skuOCC As %DynamyObject = {}
		#Dim pTarget  As %DynamyObject = {}
		//
		Set skuOCC = {}
		if '(pSource.ProductExists)
		{
			Set skuOCC.id = itemSAPB1.ItemCode
		}
		//
		Set skuOCC.displayName = itemSAPB1.ItemName
		Set skuOCC.productId = itemSAPB1.ItemCode 
 		
 		Set skuOCCJSON = skuOCC.%ToJSON()
		Set pTarget = skuOCCJSON 
 	}
	Catch (exception)
	{
		Set statusCode = exception.AsStatus()
		$$$LOGSTATUS(statusCode)
	}
	Return statusCode
}

}
