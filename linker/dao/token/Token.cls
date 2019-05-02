Class linker.dao.token.Token Extends %RegisteredObject
{

Method GetTokenByInstanceId(instanceId As %String) As linker.data.token.Token
{
		break
		#Dim tokenData As linker.data.token.Token = ##Class(linker.data.token.Token).idxInstanceIdOpen(instanceId)
		
		If ($IsObject(tokenData)){	
			return tokenData
		} Else{
			Throw ##class(%Exception.General).%New("TokenNotFoundException",, $ClassName(),
										   "| Class: " _ $ClassName() _ " | Error message: ""Token not found.""")
		}
}

Method UpdateTokenValueByInstanceId(instanceId As %String, token As %String)
{
	
		#Dim tokenData As linker.data.token.Token = ##class(linker.data.token.Token).idxInstanceIdOpen(instanceId)
		
		If ($IsObject(tokenData)){	
			
			Set tokenData.Token = token
			Set statusCode = tokenData.%Save()
			
			if ($System.Status.IsError(statusCode)){
				Throw ##Class(%Exception.StatusException).CreateFromStatus(statusCode)
			}
			
		} Else{
			Throw ##Class(%Exception.General).%New("TokenNotFoundException",, $ClassName(),
										   "| Class: " _ $ClassName() _ " | Error message: ""Token not found.""")
		}
}

Method UpdateRetrievedDateTimeByInstanceId(instanceId As %String)
{
		
		#Dim tokenData As linker.data.token.Token = ##class(linker.data.token.Token).idxInstanceIdOpen(instanceId)
		
		If ($IsObject(tokenData)){	
			
			Set tokenData.RetrievedTimeStamp = ##Class(%Library.UTC).NowLocal()
			Set statusCode = tokenData.%Save()
			
			if ($System.Status.IsError(statusCode)){
				Throw ##Class(%Exception.StatusException).CreateFromStatus(statusCode)
			}
			
		} Else{
			Throw ##Class(%Exception.General).%New("TokenNotFoundException",, $ClassName(),
										   "| Class: " _ $ClassName() _ " | Error message: ""Token not found.""")
		}
}

Method setTokenStateByInstanceId(instanceId As %String, state As %String)
{
	
		#Dim tokenData As linker.data.token.Token = ##class(linker.data.token.Token).idxInstanceIdOpen(instanceId)
		
		If ($IsObject(tokenData)){	
			
			Set tokenData.State = state
			Set statusCode = tokenData.%Save()
			
			if ($System.Status.IsError(statusCode)){
				Throw ##Class(%Exception.StatusException).CreateFromStatus(statusCode)
			}
			
		} Else{
			Throw ##Class(%Exception.General).%New("TokenNotFoundException",, $ClassName(),
										   "| Class: " _ $ClassName() _ " | Error message: ""Token not found.""")
		}
}

}
