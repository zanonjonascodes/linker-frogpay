Class occ.dao.config.CredentialOCC Extends %RegisteredObject
{

Method FindCredentialOCCByInstance(instanceId As %String) As occ.data.config.CredentialOCC
{
		#Dim credentialData As occ.data.config.CredentialOCC = ##class(occ.data.config.CredentialOCC).InstanceIdIdxOpen(instanceId)
		If ($IsObject(credentialData)){	
			return credentialData
		} Else{
			Throw ##class(%Exception.General).%New("CredentialNotFoundException",, $ClassName(),
										   "| Class: " _ $ClassName() _ " | Error message: ""Credential not found.""")
		}
}

}
