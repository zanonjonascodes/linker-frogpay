Class cloudwalk.message.payment.get.Request Extends linker.bo.restcall.get.Request
{

Parameter RESPONSECLASSNAME As %String = "cloudwalk.message.payment.get.Response";

Method SetHeaderToken(pInstanceId As %String)
{
	Set ..RestRequestVO.URL = ..RestRequestVO.URL _ ##Class(utils.HttpBuilder).CloudWalktokenRequest(..RestRequestVO.InstanceId)
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
