/// Criado a partir de: /home/linux/stone.xsd
Class sapb1.vo.stone.conciliation.Cancellation Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter XMLNAME = "Cancellation";

Parameter XMLSEQUENCE = 1;

Property OperationKey As %String(MAXLEN = "", XMLNAME = "OperationKey");

Property CancellationDateTime As %String(MAXLEN = "", XMLNAME = "CancellationDateTime");

Property ReturnedAmount As %String(MAXLEN = "", XMLNAME = "ReturnedAmount");

Property Billing As sapb1.vo.stone.conciliation.Billing(XMLNAME = "Billing");

Storage Default
{
<Data name="CancellationState">
<Value name="1">
<Value>OperationKey</Value>
</Value>
<Value name="2">
<Value>CancellationDateTime</Value>
</Value>
<Value name="3">
<Value>ReturnedAmount</Value>
</Value>
<Value name="4">
<Value>Billing</Value>
</Value>
</Data>
<State>CancellationState</State>
<StreamLocation>^sapb1.vo.ston6F1A.CancellationS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
