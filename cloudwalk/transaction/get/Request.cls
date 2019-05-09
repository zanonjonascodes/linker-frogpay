Class cloudwalk.transaction.get.Request Extends linker.bo.restcall.get.Request
{

Parameter RESPONSECLASSNAME As %String = "cloudwalk.transaction.get.Response";

Method SetHeaderToken(pInstanceId As %String)
{
	Set ..RestRequestVO.URL = ..RestRequestVO.URL _ ##Class(utils.HttpBuilder).CloudWalktokenRequest(..RestRequestVO.InstanceId)
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
