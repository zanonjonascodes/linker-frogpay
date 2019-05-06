Class linker.boapi.pooling.Skipper Extends linker.boapi.Pooling [ Final ]
{

ClassMethod PreSaveInRepository(pJSONString As %String, pService As linker.data.config.Services, pResourcePath As %String) As %String [ Final ]
{
	Try
	{
		#Dim exception As %Exception.General               = ""
		#Dim statusCode AS %Status                         = $System.Status.OK()
		#Dim transactions As %DynamicObject                = ##Class(%DynamicObject).%FromJSON(pJSONString)
		#Dim sale As %DynamicObject                        = {}
		#Dim key As %String                                = ""
		#Dim sales As %DynamicObject                       = transactions.sales
		//
		If ('$IsObject(sales))
		{
			Return ""
		}
		break
		#Dim salesIterator As %Collection.AbstractIterator = sales.%GetIterator()
		#Dim hasNext As %String                            = "" 
		//
		Try
		{
			Do ..SaveInRepository(salesIterator, pService)
		}
		Catch (exception)
		{
			#Dim errorMessage As %String = exception.DisplayString()
			//
			$$$LOGERROR("Error save Phoebus payment in the repository: " _ errorMessage)
			//
			Throw exception
		}
		#Dim totalNumberOfRecords As %Integer = transactions.pageInfo.totalNumberOfRecords
		#Dim pageSize As %Integer             = transactions.pageInfo.pageSize
		#Dim page As %Integer                 = transactions.pageInfo.pageNumber
		#Dim totalPages As %Integer           = totalNumberOfRecords / pageSize
		//
		If (page < totalPages)
		{
			Set hasNext = $Piece(pResourcePath, "&page=", 1) _ "&page=" _ (page + 1)
		}
	}
	Catch (exception)
	{
		Throw exception
	}
	Return hasNext
}

}
