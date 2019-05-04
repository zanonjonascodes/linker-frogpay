Class sapb1.vo.phoebus.CloudWalkTrans Extends %SerialObject
{

Property CaptureMethod As %String;

Property NsuReference As %String;

Property TransactionId As %String;

Property Amount As %Integer;

Property MerchantDocument As %String;

Property MerchantName As %String;

Property MerchantId As %String;

Property Acquirer As %String;

Property Type As %String;

Property Nsu As %String;

Property AuthorizationCode As %String;

Property InstallmentQuantity As %String;

Property InstallmentType As %String;

Property StatusReason As %String;

Property PaymentMethod As %String;

Property CardFirstDigits As %String;

Property CardExpirationDate As %String;

Property CardBrand As %String;

Property CardLastDigits As %String;

Property CardHolderName As %String;

Property Status As %String;

Property CwStatus As %String;

Property CwLogicalNumber As %String;

Property CwId As %String;

Property FinishedAt As %String;

Property SerialNumber As %String;

Property TransactionType As %String;

Property StartedAt As %String;

Storage Default
{
<Data name="CloudWalkTransState">
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
<Value>MerchantDocument</Value>
</Value>
<Value name="6">
<Value>MerchantName</Value>
</Value>
<Value name="7">
<Value>MerchantId</Value>
</Value>
<Value name="8">
<Value>Acquirer</Value>
</Value>
<Value name="9">
<Value>Type</Value>
</Value>
<Value name="10">
<Value>Nsu</Value>
</Value>
<Value name="11">
<Value>AuthorizationCode</Value>
</Value>
<Value name="12">
<Value>InstallmentQuantity</Value>
</Value>
<Value name="13">
<Value>InstallmentType</Value>
</Value>
<Value name="14">
<Value>StatusReason</Value>
</Value>
<Value name="15">
<Value>PaymentMethod</Value>
</Value>
<Value name="16">
<Value>CardFirstDigits</Value>
</Value>
<Value name="17">
<Value>CardExpirationDate</Value>
</Value>
<Value name="18">
<Value>CardBrand</Value>
</Value>
<Value name="19">
<Value>CardLastDigits</Value>
</Value>
<Value name="20">
<Value>CardHolderName</Value>
</Value>
<Value name="21">
<Value>Status</Value>
</Value>
<Value name="22">
<Value>CwStatus</Value>
</Value>
<Value name="23">
<Value>CwLogicalNumber</Value>
</Value>
<Value name="24">
<Value>CwId</Value>
</Value>
<Value name="25">
<Value>FinishedAt</Value>
</Value>
<Value name="26">
<Value>SerialNumber</Value>
</Value>
<Value name="27">
<Value>TransactionType</Value>
</Value>
<Value name="28">
<Value>StartedAt</Value>
</Value>
</Data>
<State>CloudWalkTransState</State>
<StreamLocation>^sapb1.vo.phD7EC.CloudWalkTransS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
