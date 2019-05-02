Class sapb1.bp.item.Request Extends Ens.Request
{

Property ItemId As %String;

Property Url As %String;

Property InstanceId As %String;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>ItemId</Value>
</Value>
<Value name="2">
<Value>Url</Value>
</Value>
<Value name="3">
<Value>InstanceId</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
