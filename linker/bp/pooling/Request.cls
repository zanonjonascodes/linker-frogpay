Class linker.bp.pooling.Request Extends Ens.Request
{

Property Host As %String(MAXLEN = 250) [Required];

Property Port As %Integer [Required];

Property ResourcePath As %String(MAXLEN=250) [Required];

Property HttpsEnabled As %Boolean [InitialExpression = 0];

Property Parameters As %String(MAXLEN="250");

Property ServiceName As %String(MAXLEN=250);

Property ServiceId As %Integer;

Property TargetBusinessHost As %String(MAXLEN=250);

Property Type As %String;

Property InstanceId As %String;

Property TargetRequestClassName As %String(MAXLEN=250);

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Host</Value>
</Value>
<Value name="2">
<Value>Port</Value>
</Value>
<Value name="3">
<Value>ResourcePath</Value>
</Value>
<Value name="4">
<Value>HttpsEnabled</Value>
</Value>
<Value name="5">
<Value>Parameters</Value>
</Value>
<Value name="6">
<Value>ServiceName</Value>
</Value>
<Value name="7">
<Value>ServiceId</Value>
</Value>
<Value name="8">
<Value>TargetBusinessHost</Value>
</Value>
<Value name="9">
<Value>Type</Value>
</Value>
<Value name="10">
<Value>InstanceId</Value>
</Value>
<Value name="11">
<Value>TargetRequestClassName</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}