Class sapb1.boapi.Stock Extends %RegisteredObject
{

Method RetrieveStockStreamFromItem(itemStream As %Stream.GlobalCharacter) As %Stream.GlobalCharacter
{

	Set statusCode = ##Class(%ZEN.Auxiliary.altJSONProvider).%ConvertJSONToObject(itemStream, "%DynamicObject", .itemSAP)
	//
	if ($System.Status.IsError(statusCode)){
		Throw ##class(%Exception.StatusException).CreateFromStatus(statusCode)	
	}

	Set itemWarehouseInfoCollection =  itemSAP.ItemWarehouseInfoCollection
	
	Set stockString = itemWarehouseInfoCollection.%ToJson()
	
	Set stockStream = ##class(%Stream.GlobalCharacter).%New()
	
	Do stockStream.Write(stockString)
	
	return stockStream
	
}

}
