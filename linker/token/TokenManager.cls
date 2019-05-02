Class linker.token.TokenManager Extends %RegisteredObject
{

Property InstanceId As %String;

Method %OnNew(instanceId As %String) As %Status
{
		
		Set statusCode = $System.Status.OK()
		Set errorMessage =  "| Class: " _ $ClassName() _ " | Error message: ""Required parameter not specified in object creation."""
		Set exceptionName = "RequiredParameterNotSpecifiedException"
		
		If '($Data(instanceId)){
		
			Throw ##class(%Exception.General).%New(exceptionName,, $ClassName(), errorMessage)
		
		}Elseif (instanceId = ""){
		
			Throw ##class(%Exception.General).%New(exceptionName,, $ClassName(),errorMessage)
		
		}
		 
	    Set ..InstanceId = instanceId    
	    
	    Return statusCode
}

Method IsTokenValid() As %Boolean
{

		#Dim tokenDAO As linker.dao.token.Token = ##class(linker.dao.token.Token).%New()
		#Dim tokenData As linker.data.token.Token = tokenDAO.GetTokenByInstanceId(..InstanceId)
		#Dim now As %TimeStamp = ##Class(%Library.UTC).NowLocal()
				
		#Dim validMinutesRemaining As %Integer = $SYSTEM.SQL.DATEDIFF("minute", tokenData.RetrievedTimeStamp, now)
		
		if (tokenData.RetrievedTimeStamp = ""){
			Return 0
		}
		
		If (tokenData.TokenTimeoutMinutes > validMinutesRemaining){
			Return 1 
		}
		
		Return 0
}

Method UpdateTokenValue(token As %String)
{
	
		Try{
		
			#Dim tokenDAO As linker.dao.token.Token = ##class(linker.dao.token.Token).%New()
			Do tokenDAO.UpdateTokenValueByInstanceId(..InstanceId, token)
			Do tokenDAO.UpdateRetrievedDateTimeByInstanceId(..InstanceId)
			
			Do ##class(linker.token.Locksmith).ReleaseExclusiveLockToken(..InstanceId)
			
		}
		Catch(e){
			
			Do ##class(linker.token.Locksmith).ReleaseExclusiveLockToken(..InstanceId)
			
			Set statusCode = e.AsStatus()
			Set errorMessage = $System.Status.GetErrorText(statusCode)
			
			Do ..SetTokenStateToError()
			
			Throw ##class(%Exception.StatusException).CreateFromStatus(statusCode)
		}
}

Method GetToken() As %String
{
		Try{
		
			Do ##class(linker.token.Locksmith).SetSharedLockToken(..InstanceId)
			
			#Dim tokenDAO As linker.dao.token.Token = ##class(linker.dao.token.Token).%New()
			#Dim tokenData As linker.data.token.Token = tokenDAO.GetTokenByInstanceId(..InstanceId)
			
			Do tokenDAO.setTokenStateByInstanceId(..InstanceId,"INUSE")
			
		}
		Catch(e){
			
			Do ##class(linker.token.Locksmith).ReleaseSharedLockToken(..InstanceId)
			
			Set statusCode = e.AsStatus()
			Set errorMessage = $System.Status.GetErrorText(statusCode)
			
			Do ..SetTokenStateToError()
			
			Throw ##class(%Exception.StatusException).CreateFromStatus(statusCode)
		}		
		
		Return tokenData.Token
}

Method SetTokenStateToUpdating()
{
	
		Try{
	
		#Dim tokenDAO As linker.dao.token.Token = ##class(linker.dao.token.Token).%New()
		
		Do ##class(linker.token.Locksmith).SetExclusiveLockToken(..InstanceId)
		
		Do tokenDAO.setTokenStateByInstanceId(..InstanceId,"UPDATING")
		
		}
		Catch(e){
			
			Do ##class(linker.token.Locksmith).ReleaseExclusiveLockToken(..InstanceId)
			
			Set statusCode = e.AsStatus()
			Set errorMessage = $System.Status.GetErrorText(statusCode)
			
			Do ..SetTokenStateToError()
			
			Throw ##class(%Exception.StatusException).CreateFromStatus(statusCode)
		}
}

Method ReleaseToken()
{
	
		Try{
	
		#Dim tokenDAO As linker.dao.token.Token = ##class(linker.dao.token.Token).%New()
		
		Do ##class(linker.token.Locksmith).ReleaseSharedLockToken(..InstanceId)
		
		Do tokenDAO.setTokenStateByInstanceId(..InstanceId,"FREE")
		
		}
		Catch(e){

			Set statusCode = e.AsStatus()
			Set errorMessage = $System.Status.GetErrorText(statusCode)
			
			Do ..SetTokenStateToError()
			
			Throw ##class(%Exception.StatusException).CreateFromStatus(statusCode)
		}
}

Method SetTokenStateToError()
{
	
		#Dim tokenDAO As linker.dao.token.Token = ##class(linker.dao.token.Token).%New()
		
		Do tokenDAO.setTokenStateByInstanceId(..InstanceId,"ERROR")
}

}
