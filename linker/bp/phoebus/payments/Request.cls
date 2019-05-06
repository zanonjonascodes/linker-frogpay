Class linker.bp.phoebus.payments.Request Extends Ens.Request
{

Property Payment As sapb1.vo.phoebus.PhoebusTransact;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Payment</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
