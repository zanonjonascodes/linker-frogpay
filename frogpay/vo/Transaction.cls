Class frogpay.vo.Transaction Extends (%SerialObject, %XML.Adaptor)
{

Property NSU As %String;

Property BrutoCloudWalk As %Double;

Property DataHoraCloudWalk As %String;

Property BrutoPhoebus As %Double;

Property DataHoraPhoebus As %String;

Property BrutoStone As %Double;

Property DataHoraStone As %String;

Property BrutoSkipper As %Double;

Property DataHoraSkiper As %String;

Property StatusConciliacao As %String(MAXLEN = "");

Storage Default
{
<Data name="TransactionState">
<Value name="1">
<Value>NSU</Value>
</Value>
<Value name="2">
<Value>BrutoCloudWalk</Value>
</Value>
<Value name="3">
<Value>DataHoraCloudWalk</Value>
</Value>
<Value name="4">
<Value>BrutoPhoebus</Value>
</Value>
<Value name="5">
<Value>DataHoraPhoebus</Value>
</Value>
<Value name="6">
<Value>BrutoStone</Value>
</Value>
<Value name="7">
<Value>DataHoraStone</Value>
</Value>
<Value name="8">
<Value>BrutoSkipper</Value>
</Value>
<Value name="9">
<Value>DataHoraSkiper</Value>
</Value>
<Value name="10">
<Value>StatusConciliacao</Value>
</Value>
</Data>
<State>TransactionState</State>
<StreamLocation>^frogpay.vo.TransactionS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
