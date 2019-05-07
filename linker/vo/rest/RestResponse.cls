Class linker.vo.rest.RestResponse Extends (%SerialObject, %XML.Adaptor)
{

Property HttpResponseBody As %String(MAXLEN=""); 

Property HttpResponseStreamBody As %Stream.GlobalCharacter;

Property HttpStatusCode As %String;

Property Status As %Status;

Storage Default
{
<Data name="RestResponseState">
<Value name="1">
<Value>HttpResponseBody</Value>
</Value>
<Value name="2">
<Value>HttpStatusCode</Value>
</Value>
<Value name="3">
<Value>Status</Value>
</Value>
<Value name="4">
<Value>HttpResponseStreamBody</Value>
</Value>
</Data>
<State>RestResponseState</State>
<StreamLocation>^linker.vo.rest.RestResponseS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
