Class linker.bo.restcall.genericoperation.Request Extends Ens.Request
{

Property RestRequestVO As linker.vo.rest.RestRequest;

/// Subclass responsablity
Method SetHeaderToken(pToken As %String)
{
	Return
}

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>RestRequestVO</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
