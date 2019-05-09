Class frogpay.bo.conciliation.save.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME As %String = "Ens.Response";

Property Transaction As frogpay.vo.Transaction;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Transaction</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
