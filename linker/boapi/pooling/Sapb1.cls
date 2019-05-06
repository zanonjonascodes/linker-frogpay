Class linker.boapi.pooling.Sapb1 Extends linker.boapi.Pooling [ Final ]
{

ClassMethod PreSaveInRepository(pJSONString As %String, pServiceConsumer As linker.data.config.Services, pResourcePath As %String) As %String [ Final ]
{
	Try
	{
		#Dim exception As %Exception.General               = ""
		#Dim statusCode AS %Status                         = $System.Status.OK()
		#Dim items As %DynamicObject                       = ##Class(%DynamicObject).%FromJSON(pJSONString)
		#Dim item As %DynamicObject                        = {}
		#Dim key As %String                                = ""
		#Dim itemsIterator As %Collection.AbstractIterator = items.value.%GetIterator()
		#Dim hasNext As %String                            = "" 
		//
		Try
		{
			Do ..SaveInRepository(itemsIterator, pServiceConsumer)
		}
		Catch (exception)
		{
			#Dim errorMessage As %String = exception.DisplayString()
			///
			$$$LOGERROR("Error save SAPB1 item in the repository: " _ errorMessage)
			//
			Throw exception
		}
		If (items."@odata.nextLink" '= "")
		{
			Set hasNext = $Piece(pResourcePath, "Items?", 1)  _ items."@odata.nextLink"
		}
	}
	Catch (exception)
	{
		Throw exception
	}
	Return hasNext
}

}
