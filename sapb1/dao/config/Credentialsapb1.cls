Class sapb1.dao.config.Credentialsapb1 Extends %RegisteredObject
{

Method FindCredentialsapb1ByInstance(instanceId As %String) As sapb1.data.config.Credentialsapb1
{
	
	
		
		#Dim credentialData As sapb1.data.config.Credentialsapb1 = ##class(sapb1.data.config.Credentialsapb1).InstanceIdIdxOpen(instanceId)
		If ($IsObject(credentialData)){	
				return credentialData
			} Else{
				Throw ##class(%Exception.General).%New("CredentialNotFoundException",, $ClassName(),
											   "| Class: " _ $ClassName() _ " | Error message: ""Credential not found.""")
			}
}

}
