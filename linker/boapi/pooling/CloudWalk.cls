Class linker.boapi.pooling.CloudWalk Extends linker.boapi.Pooling [ Final ]
{

ClassMethod PreSaveinRepository(pJSONString As %String, pService As linker.data.config.Services, pResourcePath As %String) As %String [ Final ]
{
	Try
	{
		#Dim exception As %Exception.General                  = ""
		#Dim statusCode AS %Status                            = $System.Status.OK()
		#Dim payments As %DynamicObject                       = ##Class(%DynamicObject).%FromJSON(pJSONString)
		#Dim payment As %DynamicObject                        = {}
		#Dim key As %String                                   = ""
		#Dim paymentsIterator As %Collection.AbstractIterator = payments.transactions.%GetIterator()
		#Dim hasNext As %String                               = "" 
		//
		Try
		{
			Do ..SaveInRepository(paymentsIterator, pService)
		}
		Catch (exception)
		{
			#Dim errorMessage As %String = exception.DisplayString()
			//
			$$$LOGERROR("Error save Cloud Walk payment in the repository: " _ errorMessage)
			//
			Throw exception
		}
		#Dim totalPages As %Integer = payments.pagination."total_pages"
		#Dim page As %Integer       = payments.pagination.page
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
