Class linker.bo.tokenmanager.updatetokenvalue.Request Extends Ens.Request
{

Property InstanceId As %String;

Property Token As %String(MAXLEN = "");

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>InstanceId</Value>
</Value>
<Value name="2">
<Value>Token</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
