Class stone.transaction.get.Request Extends linker.bo.restcall.get.Request
{

Parameter RESPONSECLASSNAME As %String = "stone.transaction.get.Response";

Method SetHeaderToken(pToken As %String)
{
	Set ..RestRequestVO.HttpHeaderArray = ##Class(utils.HttpBuilder).StoneTokenRequestHeader(..RestRequestVO.InstanceId)
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
