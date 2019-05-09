Class frogpay.data.TransactionConciliation Extends %Persistent
{

Property DataHora As %String;
Property BrutoCloudWalk As %Double;
Property BrutoPhoebus As %Double;
Property BrutoStone As %Double;
Property BrutoSkipper As %Double;
Property StatusConciliacao As %String(MAXLEN="");

Storage Default
{
<Data name="TransactionConciliationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DataHora</Value>
</Value>
<Value name="3">
<Value>BrutoCloudWalk</Value>
</Value>
<Value name="4">
<Value>BrutoPhoebus</Value>
</Value>
<Value name="5">
<Value>BrutoStone</Value>
</Value>
<Value name="6">
<Value>BrutoSkipper</Value>
</Value>
<Value name="7">
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