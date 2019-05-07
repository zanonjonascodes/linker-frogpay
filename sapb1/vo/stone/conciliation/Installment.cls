/// Criado a partir de: /home/linux/stone.xsd
Class sapb1.vo.stone.conciliation.Installment Extends (%Persistent, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter XMLNAME = "Installment";

Parameter XMLSEQUENCE = 1;

Property InstallmentNumber As %String(MAXLEN = "", XMLNAME = "InstallmentNumber");

Property GrossAmount As %String(MAXLEN = "", XMLNAME = "GrossAmount");

Property NetAmount As %String(MAXLEN = "", XMLNAME = "NetAmount");

Property PrevisionPaymentDate As %String(MAXLEN = "", XMLNAME = "PrevisionPaymentDate");

Property OriginalPaymentDate As %String(MAXLEN = "", XMLNAME = "OriginalPaymentDate");

Storage Default
{
<Data name="InstallmentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>InstallmentNumber</Value>
</Value>
<Value name="3">
<Value>GrossAmount</Value>
</Value>
<Value name="4">
<Value>NetAmount</Value>
</Value>
<Value name="5">
<Value>PrevisionPaymentDate</Value>
</Value>
<Value name="6">
<Value>OriginalPaymentDate</Value>
</Value>
</Data>
<DataLocation>^sapb1.vo.stone6F1A.InstallmentD</DataLocation>
<DefaultData>InstallmentDefaultData</DefaultData>
<IdLocation>^sapb1.vo.stone6F1A.InstallmentD</IdLocation>
<IndexLocation>^sapb1.vo.stone6F1A.InstallmentI</IndexLocation>
<StreamLocation>^sapb1.vo.stone6F1A.InstallmentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
