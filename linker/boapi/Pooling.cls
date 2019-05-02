Include Ensemble

///<p>
///  <b>2019-04-08 - Cristiano Jose da Silva</b>
///</p>
Class linker.boapi.Pooling [Abstract, Final]
{

/// Process JSON according Service Name
ClassMethod ProcessJson(pRequest As linker.bo.pooling.saveinrepository.Request) As %String
{
	Try
	{
		#Dim exception As %Exception.General                = ""
		#Dim statusCode As %Status                          = $System.Status.OK()
		#Dim service As linker.data.config.Services         = ##Class(linker.data.config.Services).%OpenId(pRequest.ServiceId)
		#Dim serviceConsumer As linker.data.config.Services = service.Consumer
		#Dim hasNext AS %String                             = ""
		//
		If ((service.TargetBusinessHost = "SAPB1 Item") || (service.TargetBusinessHost = "SAPB1 Get Stock Movements"))
		{
			Set hasNext = ..ProcessSapb1JsonItems(pRequest.JSONString , serviceConsumer)
			If (hasNext '= "")
			{
				Set hasNext = $Piece(pRequest.ResourcePath, "Items?", 1)  _ hasNext
			}			
		}
		ElseIf (service.TargetBusinessHost = "OCC Orders")
		{
			Set hasNext = ..ProcessOccJsonOrder(pRequest.JSONString , serviceConsumer)
		}
	}
	Catch (exception)
	{
		Throw exception
	}
	Return hasNext
}

/// Read all items from JSON and save in the repository to be processed, return url to the next items or empty otherwise.
ClassMethod ProcessSapb1JsonItems(pJSONString As %String, pService As linker.data.config.Services) As %String [ Private, Final ]
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
			Do ..SaveInRepository(itemsIterator, pService)
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
			Set hasNext = items."@odata.nextLink"
		}
	}
	Catch (exception)
	{
		Throw exception
	}
	Return hasNext
}

/// Read all orders from JSON and save in the repository to be processed, return url to the next items or empty otherwise.
ClassMethod ProcessOccJsonOrder(pJSONString As %String, pService As linker.data.config.Services) As %String [ Private, Final ]
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

ClassMethod SaveInRepository(pObjects As %Collection.AbstractIterator, pService As linker.data.config.Services) [ Final, Private ]
{
	Try
	{
		#Dim exception As %Exception.General = ""
		#Dim object As %DynamicObject        = ""
		While (pObjects.%GetNext(.key, .object))
		{
			Try
			{				
				#Dim jsonString As %String = ""
				//
				If ($IsObject(object))
				{
					Set jsonString = object.%ToJSON()
				}
				Else
				{
					Set jsonString = object
				}
				Do ##Class(linker.data.Repository).CreateEntry(jsonString, pService)
			}
			Catch (exception)
			{
				#Dim errorMessage As %String = exception.DisplayString()
				//
				Throw exception
			}
		}
	}
	Catch (exception)
	{
		Throw exception
	}
}

}