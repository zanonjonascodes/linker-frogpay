Class sapb1.vo.cloudwalk.CloudWalkTrans Extends (%SerialObject,%XML.Adaptor)
{

Property Parsed As sapb1.vo.cloudwalk.Parsed;

Property Status As %String(MAXLEN="");

Property LogicalNumber As %String(MAXLEN="");

Property Id As %String(MAXLEN="");

Property FinishedAt As %String(MAXLEN="");

Property SerialNumber As %String(MAXLEN="");

Property TransactionType As %String(MAXLEN="");

Property StartedAt As %String(MAXLEN="");

Property Detail As %String(MAXLEN="");


Storage Default
{
<Data name="CloudWalkTransState">
<Value name="1">
<Value>Parsed</Value>
</Value>
<Value name="2">
<Value>Status</Value>
</Value>
<Value name="3">
<Value>LogicalNumber</Value>
</Value>
<Value name="4">
<Value>Id</Value>
</Value>
<Value name="5">
<Value>FinishedAt</Value>
</Value>
<Value name="6">
<Value>SerialNumber</Value>
</Value>
<Value name="7">
<Value>TransactionType</Value>
</Value>
<Value name="8">
<Value>StartedAt</Value>
</Value>
<Value name="9">
<Value>Detail</Value>
</Value>
</Data>
<State>CloudWalkTransState</State>
<StreamLocation>^sapb1.vo.cl9F93.CloudWalkTransS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
