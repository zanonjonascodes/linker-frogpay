Class sapb1.vo.cloudwalk.Parsed Extends (%SerialObject,%XML.Adaptor)
{

Property CaptureMethod As %String(MAXLEN="");

Property NsuReference As %String(MAXLEN="");

Property TransactionId As %String(MAXLEN="");

Property Amount As %Double;

Property Acquirer As %String(MAXLEN="");

Property Type As %String(MAXLEN="");

Property Nsu As %String(MAXLEN="");

Property AuthorizationCode As %String(MAXLEN="");

Property StatusReason As %String(MAXLEN="");

Property PaymentMethod As %String(MAXLEN="");

Property Metadata As sapb1.vo.cloudwalk.Metadata;

Property Merchant As sapb1.vo.cloudwalk.Merchant;

Property Installment As sapb1.vo.cloudwalk.Installment;

Property Card As sapb1.vo.cloudwalk.Card;

Property Status As %String(MAXLEN="");

Storage Default
{
<Data name="ParsedState">
<Value name="1">
<Value>CaptureMethod</Value>
</Value>
<Value name="2">
<Value>NsuReference</Value>
</Value>
<Value name="3">
<Value>TransactionId</Value>
</Value>
<Value name="4">
<Value>Amount</Value>
</Value>
<Value name="5">
<Value>Acquirer</Value>
</Value>
<Value name="6">
<Value>Type</Value>
</Value>
<Value name="7">
<Value>Nsu</Value>
</Value>
<Value name="8">
<Value>AuthorizationCode</Value>
</Value>
<Value name="9">
<Value>StatusReason</Value>
</Value>
<Value name="10">
<Value>PaymentMethod</Value>
</Value>
<Value name="11">
<Value>Metadata</Value>
</Value>
<Value name="12">
<Value>Merchant</Value>
</Value>
<Value name="13">
<Value>Installment</Value>
</Value>
<Value name="14">
<Value>Card</Value>
</Value>
<Value name="15">
<Value>Status</Value>
</Value>
</Data>
<State>ParsedState</State>
<StreamLocation>^sapb1.vo.cloudwalk.ParsedS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}