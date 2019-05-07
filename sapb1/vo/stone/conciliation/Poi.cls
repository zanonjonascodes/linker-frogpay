/// Criado a partir de: /home/linux/stone.xsd
Class sapb1.vo.stone.conciliation.Poi Extends (%SerialObject, %XML.Adaptor) [ ProcedureBlock ]
{

Parameter XMLNAME = "Poi";

Parameter XMLSEQUENCE = 1;

Property PoiType As %String(MAXLEN = "", XMLNAME = "PoiType");

Property SerialNumber As %String(MAXLEN = "", XMLNAME = "SerialNumber");

Storage Default
{
<Data name="PoiState">
<Value name="1">
<Value>PoiType</Value>
</Value>
<Value name="2">
<Value>SerialNumber</Value>
</Value>
</Data>
<State>PoiState</State>
<StreamLocation>^sapb1.vo.stone.concili6F1A.PoiS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
