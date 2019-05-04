Class linker.vo.rest.RestRequest Extends (%SerialObject, %XML.Adaptor)
{

Property URL As %String(MAXLEN="");

Property HttpRequestBody As %String(MAXLEN="");

Property HttpHeaderArray As array Of %String(MAXLEN="");

Property ServiceId As %String;

Property InstanceId As %String;

Storage Default
{
<Data name="RestRequestState">
<Value name="1">
<Value>URL</Value>
</Value>
<Value name="2">
<Value>HttpRequestBody</Value>
</Value>
<Value name="3">
<Value>HttpHeaderArray</Value>
</Value>
<Value name="4">
<Value>ServiceId</Value>
</Value>
<Value name="5">
<Value>InstanceId</Value>
</Value>
</Data>
<State>RestRequestState</State>
<StreamLocation>^linker.vo.rest.RestRequestS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
