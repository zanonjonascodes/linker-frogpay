Class occ.bp.security.Token.Request Extends Ens.Request
{

Property InstanceId As %String;

Property Url As %String(MAXLEN = "");

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>InstanceId</Value>
</Value>
<Value name="2">
<Value>Url</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
