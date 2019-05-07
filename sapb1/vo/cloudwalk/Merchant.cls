Class sapb1.vo.cloudwalk.Merchant Extends (%SerialObject,%XML.Adaptor)
{
Property document As %String(MAXLEN="");

Property Name As %String(MAXLEN="");

Property Id As %String(MAXLEN="");


Storage Default
{
<Data name="MerchantState">
<Value name="1">
<Value>document</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Id</Value>
</Value>
</Data>
<State>MerchantState</State>
<StreamLocation>^sapb1.vo.cloudwalk.MerchantS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}