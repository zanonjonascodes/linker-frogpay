Class occ.bo.security.login.Request Extends Ens.Request
{

Property Url As %String(MAXLEN = "");

Property InstanceId As %String(MAXLEN = "");

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Url</Value>
</Value>
<Value name="2">
<Value>InstanceId</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
