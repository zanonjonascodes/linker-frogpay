Class linker.boapi.pooling.Occ Extends linker.boapi.Pooling [ Final ]
{

ClassMethod PreSaveInRepository(pJSONString As %String, pService As linker.data.config.Services) As %String [ Final ]
{
	Try
	{
		#Dim exception As %Exception.General                = ""
		#Dim statusCode AS %Status                          = $System.Status.OK()
		#Dim orders As %DynamicObject                       = ##Class(%DynamicObject).%FromJSON(pJSONString)
		#Dim order As %DynamicObject                        = {}
		#Dim key As %String                                 = ""
		#Dim ordersIterator As %Collection.AbstractIterator = orders.items.%GetIterator()
		#Dim hasNext As %String                             = "" 
		//
		Try
		{
			Do ..SaveInRepository(ordersIterator, pService)
		}
		Catch (exception)
		{
			#Dim errorMessage As %String = exception.DisplayString()
			//
			$$$LOGERROR("Error save OCC order in the repository: " _ errorMessage)
			//
			Throw exception
		}
		#Dim linkIterator As %Collection.AbstractIterator = orders.links.%GetIterator()
		#Dim linkKey As %String                           = ""
		#Dim link As %DyamicObject                        = ""
		//
		While (ordersIterator.%GetNext(.linkKey, .link))
		{
			If (link.rel = "next")
			{
				Set hasNext = link.href
				//
				Break 
			}
		}
	}
	Catch (exception)
	{
		Throw exception
	}
	Return hasNext
}

}
