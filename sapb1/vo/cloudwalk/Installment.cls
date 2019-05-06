Class sapb1.vo.cloudwalk.Installment Extends (%SerialObject,%XML.Adaptor)
{
Property Quantity As %Integer;

Property Type As %String(MAXLEN=""); 

Storage Default
{
<Data name="InstallmentState">
<Value name="1">
<Value>Quantity</Value>
</Value>
<Value name="2">
<Value>Type</Value>
</Value>
</Data>
<State>InstallmentState</State>
<StreamLocation>^sapb1.vo.cloud9F93.InstallmentS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}