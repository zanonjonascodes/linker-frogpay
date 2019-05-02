Class utils.HttpBuilder Extends %RegisteredObject
{

ClassMethod OCCBuildTokenRequestHeader(token As %String) As %ArrayOfDataTypes
{
	#Dim headerArray As %ArrayOfDataTypes = ##class(%ArrayOfDataTypes).%New()
	//
	Do headerArray.SetAt("Bearer "_token ,"Authorization")
	Do headerArray.SetAt("application/json","Content-Type")
	Do headerArray.SetAt("pt_BR","x-ccasset-language")
	//
	Return headerArray
}

ClassMethod SAPBuildTokenRequestHeader(token As %String) As %ArrayOfDataTypes
{
	#Dim headerArray As %ArrayOfDataTypes = ##class(%ArrayOfDataTypes).%New()
	//
	Do headerArray.SetAt("B1SESSION="_token_";ROUTEID=.node0","Cookie")
	Do headerArray.SetAt("application/json","Content-Type")
	//			   
	Return headerArray
}

ClassMethod OCCCustomBuildTokenRequestHeader(pInstanceId As %String)
{
	#Dim headerArray As %ArrayOfDataTypes = ##class(%ArrayOfDataTypes).%New()
	#Dim credentialData As occ.custom.data.config.CredentialOCCCustom = ##Class(occ.custom.data.config.CredentialOCCCustom).InstanceIdIdxOpen(pInstanceId)
	//
	If ($IsObject(credentialData))
	{	
		Return credentialData
	} 
	Else
	{
		Throw ##class(%Exception.General).%New("CredentialNotFoundException",, $ClassName(),
									   "| Class: " _ $ClassName() _ " | Error message: ""Credential not found.""")
	}
	#Dim token As %String = $System.Encryption.Base64Encode(credentialData.Username _ ":" _ credentialData.Password)
	//
	Do headerArray.SetAt("Bearer "_token ,"Authorization")
	Do headerArray.SetAt("application/json","Content-Type")
}

ClassMethod SAPBuildTokenResetCollecionts(pToken As %String) As %ArrayOfObjects
{
	#Dim headerArray As %ArrayOfDataTypes = ..SAPBuildTokenRequestHeader(pToken)
	//
	Do headerArray.SetAt("true", "B1S-ReplaceCollectionsOnPatch")
	//
	Return headerArray
}

}
