Class sapb1.security.Login Extends %RegisteredObject
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
		#Dim credentialDAO As sapb1.dao.config.Credentialsapb1 = ##class(sapb1.dao.config.Credentialsapb1).%New()
		#Dim credentialData As sapb1.data.config.Credentialsapb1 = credentialDAO.FindCredentialsapb1ByInstance(..InstanceId)
		
		Set restRequestBody = "{""CompanyDB"": """ _ credentialData.CompanyDB _
						   """, ""UserName"": """ _credentialData.Username_
						   """, ""Password"":  """ _credentialData.Password_"""}"
		Set ^zsapb1Login = restRequestBody
		Return restRequestBody
}

}
