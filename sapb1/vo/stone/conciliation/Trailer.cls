/// Criado a partir de: /home/linux/stone.xsd
Class sapb1.vo.stone.conciliation.Trailer Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter XMLNAME = "Trailer";

Parameter XMLSEQUENCE = 1;

Property CapturedTransactionsQuantity As %String(MAXLEN = "", XMLNAME = "CapturedTransactionsQuantity");

Property CanceledTransactionsQuantity As %String(MAXLEN = "", XMLNAME = "CanceledTransactionsQuantity");

Property PaidInstallmentsQuantity As %String(MAXLEN = "", XMLNAME = "PaidInstallmentsQuantity");

Property ChargedCancellationsQuantity As %String(MAXLEN = "", XMLNAME = "ChargedCancellationsQuantity");

Property ChargebacksQuantity As %String(MAXLEN = "", XMLNAME = "ChargebacksQuantity");

Property ChargebacksRefundQuantity As %String(MAXLEN = "", XMLNAME = "ChargebacksRefundQuantity");

Property ChargedChargebacksQuantity As %String(MAXLEN = "", XMLNAME = "ChargedChargebacksQuantity");

Property PaidChargebacksRefundQuantity As %String(MAXLEN = "", XMLNAME = "PaidChargebacksRefundQuantity");

Property PaidEventsQuantity As %String(MAXLEN = "", XMLNAME = "PaidEventsQuantity");

Property ChargedEventsQuantity As %String(MAXLEN = "", XMLNAME = "ChargedEventsQuantity");

Storage Default
{
<Data name="TrailerState">
<Value name="1">
<Value>CapturedTransactionsQuantity</Value>
</Value>
<Value name="2">
<Value>CanceledTransactionsQuantity</Value>
</Value>
<Value name="3">
<Value>PaidInstallmentsQuantity</Value>
</Value>
<Value name="4">
<Value>ChargedCancellationsQuantity</Value>
</Value>
<Value name="5">
<Value>ChargebacksQuantity</Value>
</Value>
<Value name="6">
<Value>ChargebacksRefundQuantity</Value>
</Value>
<Value name="7">
<Value>ChargedChargebacksQuantity</Value>
</Value>
<Value name="8">
<Value>PaidChargebacksRefundQuantity</Value>
</Value>
<Value name="9">
<Value>PaidEventsQuantity</Value>
</Value>
<Value name="10">
<Value>ChargedEventsQuantity</Value>
</Value>
</Data>
<State>TrailerState</State>
<StreamLocation>^sapb1.vo.stone.con6F1A.TrailerS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
