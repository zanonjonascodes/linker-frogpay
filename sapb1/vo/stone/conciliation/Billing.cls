/// Criado a partir de: /home/linux/stone.xsd
Class sapb1.vo.stone.conciliation.Billing Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter XMLNAME = "Billing";

Parameter XMLSEQUENCE = 1;

Property ChargedAmount As %String(MAXLEN = "", XMLNAME = "ChargedAmount");

Property PrevisionChargeDate As %String(MAXLEN = "", XMLNAME = "PrevisionChargeDate");

Storage Default
{
<Data name="BillingState">
<Value name="1">
<Value>ChargedAmount</Value>
</Value>
<Value name="2">
<Value>PrevisionChargeDate</Value>
</Value>
</Data>
<State>BillingState</State>
<StreamLocation>^sapb1.vo.stone.con6F1A.BillingS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
