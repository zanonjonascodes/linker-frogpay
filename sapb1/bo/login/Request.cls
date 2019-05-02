Class sapb1.bo.security.login.Request Extends Ens.Request
{

Property Url As %String;

Property InstanceId As %String;

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
