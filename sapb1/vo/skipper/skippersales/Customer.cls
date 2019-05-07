Class sapb1.vo.skipper.skippersales.Customer Extends (%SerialObject,%XML.Adaptor)
{
Property Name As %String(MAXLEN="");

Property Document As sapb1.vo.skipper.skippersales.Document;

Storage Default
{
<Data name="CustomerState">
<Value name="1">
<Value>Name</Value>
</Value>
<Value name="2">
<Value>Document</Value>
</Value>
</Data>
<State>CustomerState</State>
<StreamLocation>^sapb1.vo.skipper5EF3.CustomerS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}