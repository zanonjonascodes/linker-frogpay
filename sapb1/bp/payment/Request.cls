Class sapb1.bp.payment.Request Extends Ens.Request
{

Property SAPB1Order As %String(MAXLEN = "");

Property OCCOrder As %String(MAXLEN = "");

Property InstanceId As %String;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>SAPB1Order</Value>
</Value>
<Value name="2">
<Value>OCCOrder</Value>
</Value>
<Value name="3">
<Value>InstanceId</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}