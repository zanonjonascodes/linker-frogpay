Class frogpay.data.TransactionConciliation Extends %Persistent
{

Property DataHoraIntegracao As %TimeStamp [ InitialExpression = {##Class(%UTC).NowLocal()} ];

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

Index NSUIdx On NSU [ Unique ];

Storage Default
{
<Data name="TransactionConciliationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DataHoraIntegracao</Value>
</Value>
<Value name="3">
<Value>NSU</Value>
</Value>
<Value name="4">
<Value>BrutoCloudWalk</Value>
</Value>
<Value name="5">
<Value>DataHoraCloudWalk</Value>
</Value>
<Value name="6">
<Value>BrutoPhoebus</Value>
</Value>
<Value name="7">
<Value>DataHoraPhoebus</Value>
</Value>
<Value name="8">
<Value>BrutoStone</Value>
</Value>
<Value name="9">
<Value>DataHoraStone</Value>
</Value>
<Value name="10">
<Value>BrutoSkipper</Value>
</Value>
<Value name="11">
<Value>DataHoraSkiper</Value>
</Value>
<Value name="12">
<Value>StatusConciliacao</Value>
</Value>
</Data>
<DataLocation>^frogpay.data.TransactionDFD5D</DataLocation>
<DefaultData>TransactionConciliationDefaultData</DefaultData>
<IdLocation>^frogpay.data.TransactionDFD5D</IdLocation>
<IndexLocation>^frogpay.data.TransactionDFD5I</IndexLocation>
<StreamLocation>^frogpay.data.TransactionDFD5S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
