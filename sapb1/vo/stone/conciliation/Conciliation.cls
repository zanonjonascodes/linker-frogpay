/// 
Class sapb1.vo.stone.conciliation.Conciliation Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter XMLNAME = "Conciliation";

Parameter XMLSEQUENCE = 1;

Property Header As sapb1.vo.stone.conciliation.Header(XMLNAME = "Header");

Property FinancialTransactions As list Of sapb1.vo.stone.conciliation.Transaction(XMLITEMNAME = "Transaction", XMLNAME = "FinancialTransactions", XMLPROJECTION = "COLLECTION");

Property FinancialEvents As %String(MAXLEN = "", XMLNAME = "FinancialEvents");

Property FinancialTransactionsAccounts As %String(MAXLEN = "", XMLNAME = "FinancialTransactionsAccounts");

Property FinancialEventAccounts As %String(MAXLEN = "", XMLNAME = "FinancialEventAccounts");

Property Payments As %String(MAXLEN = "", XMLNAME = "Payments");

Property Trailer As sapb1.vo.stone.conciliation.Trailer(XMLNAME = "Trailer");

Storage Default
{
<Data name="ConciliationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Header</Value>
</Value>
<Value name="3">
<Value>FinancialTransactions</Value>
</Value>
<Value name="4">
<Value>FinancialEvents</Value>
</Value>
<Value name="5">
<Value>FinancialTransactionsAccounts</Value>
</Value>
<Value name="6">
<Value>FinancialEventAccounts</Value>
</Value>
<Value name="7">
<Value>Payments</Value>
</Value>
<Value name="8">
<Value>Trailer</Value>
</Value>
</Data>
<Data name="ConciliationState">
<Value name="1">
<Value>Header</Value>
</Value>
<Value name="2">
<Value>FinancialTransactions</Value>
</Value>
<Value name="3">
<Value>FinancialEvents</Value>
</Value>
<Value name="4">
<Value>FinancialTransactionsAccounts</Value>
</Value>
<Value name="5">
<Value>FinancialEventAccounts</Value>
</Value>
<Value name="6">
<Value>Payments</Value>
</Value>
<Value name="7">
<Value>Trailer</Value>
</Value>
</Data>
<DataLocation>^sapb1.vo.ston6F1A.ConciliationD</DataLocation>
<DefaultData>ConciliationDefaultData</DefaultData>
<IdLocation>^sapb1.vo.ston6F1A.ConciliationD</IdLocation>
<IndexLocation>^sapb1.vo.ston6F1A.ConciliationI</IndexLocation>
<State>ConciliationState</State>
<StreamLocation>^sapb1.vo.ston6F1A.ConciliationS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
