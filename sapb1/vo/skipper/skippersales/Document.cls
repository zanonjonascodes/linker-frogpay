Class sapb1.vo.skipper.skippersales.Document Extends (%SerialObject,%XML.Adaptor)
{

Property Number As %String(MAXLEN="");

Property Type As %String(MAXLEN="");

Storage Default
{
<Data name="DocumentState">
<Value name="1">
<Value>Number</Value>
</Value>
<Value name="2">
<Value>Type</Value>
</Value>
</Data>
<State>DocumentState</State>
<StreamLocation>^sapb1.vo.skipper5EF3.DocumentS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}