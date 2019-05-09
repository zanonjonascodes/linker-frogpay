Class sapb1.bo.udtphoebustransact.post.Request Extends linker.bo.restcall.post.Request
{

Parameter RESPONSECLASSNAME As %String = "sapb1.bo.udtphoebustransact.post.Response";

Method SetHeaderToken(pToken As %String) As %String
{
	#Dim token As %String = ##Class(linker.data.token.Token).idxInstanceIdOpen(..RestRequestVO.InstanceId)
	Set ..RestRequestVO.HttpHeaderArray = ##Class(utils.HttpBuilder).SAPBuildTokenRequestHeader(token)
	//
	Return ""
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
