Class phoebus.message.payment.get.Request Extends linker.bo.restcall.get.Request
{

Parameter RESPONSECLASSNAME As %String = "phoebus.message.payment.get.Response";

Method SetHeaderToken(pToken As %String)
{
	Set ..RestRequestVO.HttpHeaderArray = ##Class(utils.HttpBuilder).PhoebusTokenRequestHeader(..RestRequestVO.InstanceId)
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
