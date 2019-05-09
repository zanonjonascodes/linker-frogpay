Class phoebus.transaction.get.Request Extends linker.bo.restcall.get.Request
{

Parameter RESPONSECLASSNAME As %String = "phoebus.transaction.get.Response";

Method SetHeaderToken(pToken As %String)
{
	Set ..RestRequestVO.HttpHeaderArray = ##Class(utils.HttpBuilder).PhoebusTokenRequestHeader(..RestRequestVO.InstanceId)
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
