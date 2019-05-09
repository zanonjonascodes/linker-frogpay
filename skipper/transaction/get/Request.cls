Class skipper.transaction.get.Request Extends linker.bo.restcall.get.Request
{

Parameter RESPONSECLASSNAME As %String = "skipper.transaction.get.Response";

Method SetHeaderToken(pInstanceId As %String)
{
	Set ..RestRequestVO.HttpHeaderArray = ##Class(utils.HttpBuilder).SkipperTokenRequestHeader(..RestRequestVO.InstanceId)
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
