Class occ.security.Login Extends %RegisteredObject
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

Method BuildRestLoginRequestBody() As %String
{
	
		Set restRequestBody = "grant_type=client_credentials"
						   
		Return restRequestBody
}

Method BuildRequestHeader() As %ArrayOfDataTypes
{
		
		#Dim credentialDAO As occ.dao.config.CredentialOCC = ##class(occ.dao.config.CredentialOCC).%New()
		#Dim credentialData As occ.data.config.CredentialOCC = credentialDAO.FindCredentialOCCByInstance(..InstanceId)
		
		#Dim headerArray As %ArrayOfDataTypes = ##class(%ArrayOfDataTypes).%New()
		
		Do headerArray.SetAt("Bearer " _ credentialData.AppKey,"Authorization")
		Do headerArray.SetAt("application/x-www-form-urlencoded","Content-Type")
		
		Return headerArray
}

}
