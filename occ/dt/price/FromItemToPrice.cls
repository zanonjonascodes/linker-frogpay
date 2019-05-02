Class occ.dt.price.FromItemToPrice Extends (Ens.DataTransform, utils.FunctionSet)
{

ClassMethod Transform(pSource As %RegisteredObject, ByRef pTarget As %RegisteredObject, ByRef Aux) As %Status
{
	Try
	{
		#Dim statusCode As %Status        = $System.Status.OK()
		#Dim itemSAPB1 As %DynamicObject = pSource.SAPB1Item
		#Dim product As %DynamyObject = {}
		#Dim pTarget  As %DynamyObject    = {}
		//
		Set product.properties = {}
		Set product.properties.listPrice = itemSAPB1.ItemPrices.%Get(0).Price
		//
		Set productJSON = product.%ToJSON()
		Set pTarget = productJSON 
	}
	Catch (exception)
	{
		Set statusCode = exception.AsStatus()
	}
	Return statusCode
}

}
