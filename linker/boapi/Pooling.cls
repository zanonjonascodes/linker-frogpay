Include Ensemble

/// <p>
///  <b>2019-04-08 - Cristiano Jose da Silva</b>
/// </p>
Class linker.boapi.Pooling [ Abstract ]
{

ClassMethod ProcessJson(pRequest As linker.bo.pooling.saveinrepository.Request) As %String [ Final ]
{
	Try
	{
		#Dim exception As %Exception.General                = ""
		#Dim statusCode As %Status                          = $System.Status.OK()
		#Dim service As linker.data.config.Services         = ##Class(linker.data.config.Services).%OpenId(pRequest.ServiceId)
		#Dim serviceConsumer As linker.data.config.Services = service.Consumer
		#Dim hasNext As %String                             = ""
		#Dim classname As %RawString                        = ##Class(utils.FunctionSet).Lookup("REPOSITORY_PROCESS_JSON", service.TargetBusinessHost)
		//
		Set hasNext = $ClassMethod(classname, "PreSaveInRepository", pRequest.JSONString , serviceConsumer, service.ResourcePath)
	}
	Catch (exception)
	{
		Throw exception
	}
	Return hasNext
}

ClassMethod PreSaveInRepository(pJSONString As %String, pServiceConsumer As linker.data.config.Services, pResourcePath As %String) As %String [ Abstract, Private ]
{
}

ClassMethod SaveInRepository(pObjects As %Collection.AbstractIterator, pServiceConsumer As linker.data.config.Services) [ Final, Private ]
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
				Do ##Class(linker.data.Repository).CreateEntry(jsonString, pServiceConsumer)
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
