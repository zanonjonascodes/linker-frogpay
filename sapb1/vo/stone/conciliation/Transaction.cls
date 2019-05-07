/// Criado a partir de: /home/linux/stone.xsd
Class sapb1.vo.stone.conciliation.Transaction Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock, SqlTableName = _Transaction ]
{

Parameter XMLNAME = "Transaction";

Parameter XMLSEQUENCE = 1;

Property Events As sapb1.vo.stone.conciliation.Events(XMLNAME = "Events");

Property AcquirerTransactionKey As %String(MAXLEN = "", XMLNAME = "AcquirerTransactionKey");

Property InitiatorTransactionKey As %String(MAXLEN = "", XMLNAME = "InitiatorTransactionKey");

Property AuthorizationDateTime As %String(MAXLEN = "", XMLNAME = "AuthorizationDateTime");

Property CaptureLocalDateTime As %String(MAXLEN = "", XMLNAME = "CaptureLocalDateTime");

Property International As %String(MAXLEN = "", XMLNAME = "International");

Property AccountType As %String(MAXLEN = "", XMLNAME = "AccountType");

Property InstallmentType As %String(MAXLEN = "", XMLNAME = "InstallmentType");

Property NumberOfInstallments As %String(MAXLEN = "", XMLNAME = "NumberOfInstallments");

Property AuthorizedAmount As %String(MAXLEN = "", XMLNAME = "AuthorizedAmount");

Property CapturedAmount As %String(MAXLEN = "", XMLNAME = "CapturedAmount");

Property AuthorizationCurrencyCode As %String(MAXLEN = "", XMLNAME = "AuthorizationCurrencyCode");

Property IssuerAuthorizationCode As %String(MAXLEN = "", XMLNAME = "IssuerAuthorizationCode");

Property BrandId As %String(MAXLEN = "", XMLNAME = "BrandId");

Property CardNumber As %String(MAXLEN = "", XMLNAME = "CardNumber");

Property Poi As sapb1.vo.stone.conciliation.Poi(XMLNAME = "Poi");

Property EntryMode As %String(MAXLEN = "", XMLNAME = "EntryMode");

Property Cancellations As sapb1.vo.stone.conciliation.Cancellation(XMLNAME = "Cancellations", XMLPROJECTION = "WRAPPED");

Property Installments As list Of sapb1.vo.stone.conciliation.Installment(XMLITEMNAME = "Installment", XMLNAME = "Installments", XMLPROJECTION = "COLLECTION");

Storage Default
{
<Data name="TransactionState">
<Value name="1">
<Value>Events</Value>
</Value>
<Value name="2">
<Value>AcquirerTransactionKey</Value>
</Value>
<Value name="3">
<Value>InitiatorTransactionKey</Value>
</Value>
<Value name="4">
<Value>AuthorizationDateTime</Value>
</Value>
<Value name="5">
<Value>CaptureLocalDateTime</Value>
</Value>
<Value name="6">
<Value>International</Value>
</Value>
<Value name="7">
<Value>AccountType</Value>
</Value>
<Value name="8">
<Value>InstallmentType</Value>
</Value>
<Value name="9">
<Value>NumberOfInstallments</Value>
</Value>
<Value name="10">
<Value>AuthorizedAmount</Value>
</Value>
<Value name="11">
<Value>CapturedAmount</Value>
</Value>
<Value name="12">
<Value>AuthorizationCurrencyCode</Value>
</Value>
<Value name="13">
<Value>IssuerAuthorizationCode</Value>
</Value>
<Value name="14">
<Value>BrandId</Value>
</Value>
<Value name="15">
<Value>CardNumber</Value>
</Value>
<Value name="16">
<Value>Poi</Value>
</Value>
<Value name="17">
<Value>EntryMode</Value>
</Value>
<Value name="18">
<Value>Cancellations</Value>
</Value>
<Value name="19">
<Value>Installments</Value>
</Value>
</Data>
<State>TransactionState</State>
<StreamLocation>^sapb1.vo.stone6F1A.TransactionS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
