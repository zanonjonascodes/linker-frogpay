Class linker.boapi.pooling.Phoebus Extends linker.boapi.Pooling [ Final ]
{

ClassMethod PreSaveInRepository(pJSONString As %String, pService As linker.data.config.Services, pResourcePath As %String) As %String [ Final ]
{
	Try
	{
		#Dim exception As %Exception.General                  = ""
		#Dim statusCode AS %Status                            = $System.Status.OK()
		#Dim payments As %DynamicObject                       = ##Class(%DynamicObject).%FromJSON(pJSONString)
		#Dim payment As %DynamicObject                        = {}
		#Dim key As %String                                   = ""
		#Dim paymentsIterator As %Collection.AbstractIterator = payments.content.%GetIterator()
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
			$$$LOGERROR("Error save Phoebus payment in the repository: " _ errorMessage)
			//
			Throw exception
		}
		#Dim totalPages As %Integer = payments."total_pages"
		#Dim page As %Integer       = payments.page
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
