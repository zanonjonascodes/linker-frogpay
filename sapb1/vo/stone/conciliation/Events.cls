/// Criado a partir de: /home/linux/stone.xsd
Class sapb1.vo.stone.conciliation.Events Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter XMLNAME = "Events";

Parameter XMLSEQUENCE = 1;

Property CancellationCharges As %String(MAXLEN = "", XMLNAME = "CancellationCharges");

Property Cancellations As %String(MAXLEN = "", XMLNAME = "Cancellations");

Property Captures As %String(MAXLEN = "", XMLNAME = "Captures");

Property ChargebackRefunds As %String(MAXLEN = "", XMLNAME = "ChargebackRefunds");

Property Chargebacks As %String(MAXLEN = "", XMLNAME = "Chargebacks");

Property Payments As %String(MAXLEN = "", XMLNAME = "Payments");

Storage Default
{
<Data name="EventsState">
<Value name="1">
<Value>CancellationCharges</Value>
</Value>
<Value name="2">
<Value>Cancellations</Value>
</Value>
<Value name="3">
<Value>Captures</Value>
</Value>
<Value name="4">
<Value>ChargebackRefunds</Value>
</Value>
<Value name="5">
<Value>Chargebacks</Value>
</Value>
<Value name="6">
<Value>Payments</Value>
</Value>
</Data>
<State>EventsState</State>
<StreamLocation>^sapb1.vo.stone.conc6F1A.EventsS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
