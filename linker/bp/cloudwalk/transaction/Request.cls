Class linker.bp.cloudwalk.transaction.Request Extends Ens.Request
{

Property CloudWalkTrans As sapb1.vo.cloudwalk.CloudWalkTrans;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>CloudWalkTrans</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}