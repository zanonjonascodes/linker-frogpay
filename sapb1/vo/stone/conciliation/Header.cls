/// Criado a partir de: /home/linux/stone.xsd
Class sapb1.vo.stone.conciliation.Header Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter XMLNAME = "Header";

Parameter XMLSEQUENCE = 1;

Property GenerationDateTime As %String(MAXLEN = "", XMLNAME = "GenerationDateTime");

Property StoneCode As %String(MAXLEN = "", XMLNAME = "StoneCode");

Property LayoutVersion As %String(MAXLEN = "", XMLNAME = "LayoutVersion");

Property FileId As %String(MAXLEN = "", XMLNAME = "FileId");

Property ReferenceDate As %String(MAXLEN = "", XMLNAME = "ReferenceDate");

Storage Default
{
<Data name="HeaderState">
<Value name="1">
<Value>GenerationDateTime</Value>
</Value>
<Value name="2">
<Value>StoneCode</Value>
</Value>
<Value name="3">
<Value>LayoutVersion</Value>
</Value>
<Value name="4">
<Value>FileId</Value>
</Value>
<Value name="5">
<Value>ReferenceDate</Value>
</Value>
</Data>
<State>HeaderState</State>
<StreamLocation>^sapb1.vo.stone.conc6F1A.HeaderS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
