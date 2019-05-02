Class linker.vo.rest.RestRequest Extends (%SerialObject, %XML.Adaptor)
{

Property InstanceId As %String;

Property ServiceId As %Integer;

Property RepositoryId As %Integer;

Property URL As %String(MAXLEN="");

Property HttpRequestBody As %String(MAXLEN="");

Property HttpHeaderArray As array Of %String(MAXLEN="");

Property Token As %String(MAXLEN="");

Storage Default
{
<Data name="RestRequestState">
<Value name="1">
<Value>InstanceId</Value>
</Value>
<Value name="2">
<Value>ServiceId</Value>
</Value>
<Value name="3">
<Value>URL</Value>
</Value>
<Value name="4">
<Value>HttpRequestBody</Value>
</Value>
<Value name="5">
<Value>HttpHeaderArray</Value>
</Value>
<Value name="6">
<Value>Token</Value>
</Value>
<Value name="7">
<Value>RepositoryId</Value>
</Value>
</Data>
<State>RestRequestState</State>
<StreamLocation>^linker.vo.rest.RestRequestS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
