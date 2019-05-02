Class occ.dt.inventory.FromItemToInventory Extends (Ens.DataTransform, utils.FunctionSet)
{

ClassMethod Transform(pSource As %RegisteredObject, ByRef pTarget As %RegisteredObject, ByRef Aux) As %Status
{
	Try
	{
		#Dim statusCode As %Status        = $System.Status.OK()
		#Dim itemSAPB1 As %DynamicObject = pSource.SAPB1Item
		#Dim inventory As %DynamyObject = {}
		#Dim pTarget  As %DynamyObject    = {}
		//
		Set inStock              = itemSAPB1.ItemWarehouseInfoCollection.%Get(0).InStock
		Set commited             = itemSAPB1.ItemWarehouseInfoCollection.%Get(0).Committed
		Set inventory.stockLevel = inStock - commited
		//
		if '(pSource.ProductExists)
		{
			Set inventory.id = itemSAPB1.ItemCode
		}
		//
		Set inventoryJSON = inventory.%ToJSON()
		Set pTarget = inventoryJSON 
	}
	Catch (exception)
	{
		Set statusCode = exception.AsStatus()
		$$$LOGSTATUS(statusCode)
	}
	Return statusCode
}

}
