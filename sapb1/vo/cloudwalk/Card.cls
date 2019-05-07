Class sapb1.vo.cloudwalk.Card Extends (%SerialObject,%XML.Adaptor)
{

Property FirstDigits As %String(MAXLEN="");

Property ExpirationDate As %String(MAXLEN="");

Property Brand As %String(MAXLEN="");

Property LastDigits As %String(MAXLEN="");

Property HolderName As %String(MAXLEN="");

Storage Default
{
<Data name="CardState">
<Value name="1">
<Value>FirstDigits</Value>
</Value>
<Value name="2">
<Value>ExpirationDate</Value>
</Value>
<Value name="3">
<Value>Brand</Value>
</Value>
<Value name="4">
<Value>LastDigits</Value>
</Value>
<Value name="5">
<Value>HolderName</Value>
</Value>
</Data>
<State>CardState</State>
<StreamLocation>^sapb1.vo.cloudwalk.CardS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}