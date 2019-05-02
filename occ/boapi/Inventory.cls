Class occ.boapi.Inventory Extends %RegisteredObject
{

Method MapProperties(item As %String, pAction As %String = "Create") As %String
{
	try{
		Set statusCode = ##Class(%ZEN.Auxiliary.altJSONProvider).%ConvertJSONToObject(item,, .itemSAP)
		//
		If ($System.Status.IsError(statusCode))
		{
			Throw ##class(%Exception.StatusException).CreateFromStatus(statusCode)
		}
		#Dim inventoryOCC As %DynamyObject = {}
		//
		Set inventoryOCC.stockLevel = itemSAP.ItemWarehouseInfoCollection.GetAt(1).InStock
		//
		If (pAction = "Create")
		{
			Set inventoryOCC.id = itemSAP.ItemCode
		}
		Set inventoryOCCJSON =  inventoryOCC.%ToJSON()
	}catch(e)
	{
		Set statusCode = e.AsStatus()
		Throw e
	}
	Return inventoryOCCJSON
}

}
