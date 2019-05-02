Class linker.bo.tokenmanager.Operation Extends Ens.BusinessOperation
{

Method IsValidToken(request As linker.bo.tokenmanager.isvalidtoken.Request, Output response As linker.bo.tokenmanager.isvalidtoken.Response) As %Status
{
		
		try{
		
			#Dim statusCode = $System.Status.OK()
			
			#Dim tokenManager As linker.token.TokenManager = ##class(linker.token.TokenManager).%New(request.InstanceId)
			#Dim response = ##class(linker.bo.tokenmanager.isvalidtoken.Response).%New()
		
			Set response.IsTokenValid = tokenManager.IsTokenValid()
		
		}
		catch(e){
			Set statusCode = e.AsStatus()
			Set errorMessage = $System.Status.GetErrorText(statusCode)	
		}
		
		Return statusCode
}

Method SetTokenStateToUpdating(request As linker.bo.tokenmanager.settokenstatetoupdating.Request, Output response As linker.bo.tokenmanager.settokenstatetoupdating.Response) As %Status
{
	
		try{
		
			#Dim statusCode As %Status = $System.Status.OK()
			
			#Dim tokenManager As linker.token.TokenManager = ##class(linker.token.TokenManager).%New(request.InstanceId)
			#Dim response = ##class(linker.bo.tokenmanager.settokenstatetoupdating.Response).%New()
		
			Do tokenManager.SetTokenStateToUpdating()
			Set response.Status = statusCode 
					
		}
		catch(e){
			Set statusCode = e.AsStatus()
			Set errorMessage = $System.Status.GetErrorText(statusCode)	
		}
		
		Return statusCode
}

Method UpdateTokenValue(request As linker.bo.tokenmanager.updatetokenvalue.Request, Output response As linker.bo.tokenmanager.updatetokenvalue.Response) As %Status
{
	
		try{
		
			#Dim statusCode As %Status = $System.Status.OK()
			
			#Dim tokenManager As linker.token.TokenManager = ##class(linker.token.TokenManager).%New(request.InstanceId)
			#Dim response = ##class(linker.bo.tokenmanager.updatetokenvalue.Response).%New()
		
			Do tokenManager.UpdateTokenValue(request.Token)
			Set response.Status = statusCode 
					
		}
		catch(e){
			Set statusCode = e.AsStatus()
			Set errorMessage = $System.Status.GetErrorText(statusCode)	
		}
		
		Return statusCode
}

Method GetToken(request As linker.bo.tokenmanager.gettoken.Request, Output response As linker.bo.tokenmanager.gettoken.Response) As %Status
{
	
		try{
		
			#Dim statusCode As %Status = $System.Status.OK()
			
			#Dim tokenManager As linker.token.TokenManager = ##class(linker.token.TokenManager).%New(request.InstanceId)
			#Dim response = ##class(linker.bo.tokenmanager.gettoken.Response).%New()
		
			Set response.Token = tokenManager.GetToken()  
					
		}
		catch(e){
			Set statusCode = e.AsStatus()
			Set errorMessage = $System.Status.GetErrorText(statusCode)	
		}
		
		Return statusCode
}

Method ReleaseToken(request As linker.bo.tokenmanager.releasetoken.Request, Output response As linker.bo.tokenmanager.releasetoken.Response) As %Status
{
	
		try{
		
			#Dim statusCode As %Status = $System.Status.OK()
			
			#Dim tokenManager As linker.token.TokenManager = ##class(linker.token.TokenManager).%New(request.InstanceId)
			#Dim response = ##class(linker.bo.tokenmanager.releasetoken.Response).%New()
		
			Do tokenManager.ReleaseToken()
			Set response.Status = statusCode 
					
		}
		catch(e){
			Set statusCode = e.AsStatus()
			Set errorMessage = $System.Status.GetErrorText(statusCode)	
		}
		
		Return statusCode
}

XData MessageMap
{
<MapItems>
		<MapItem MessageType="linker.bo.tokenmanager.isvalidtoken.Request"> 
			<Method>IsValidToken</Method>
		</MapItem>
		<MapItem MessageType="linker.bo.tokenmanager.settokenstatetoupdating.Request"> 
			<Method>SetTokenStateToUpdating</Method>
		</MapItem>
		<MapItem MessageType="linker.bo.tokenmanager.updatetokenvalue.Request"> 
			<Method>UpdateTokenValue</Method>
		</MapItem>
		<MapItem MessageType="linker.bo.tokenmanager.gettoken.Request"> 
			<Method>GetToken</Method>
		</MapItem>
		<MapItem MessageType="linker.bo.tokenmanager.releasetoken.Request"> 
			<Method>ReleaseToken</Method>
		</MapItem>
	</MapItems>
}

}
