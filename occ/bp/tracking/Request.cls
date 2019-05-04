Class occ.bp.tracking.Request Extends Ens.Request
{

Property InstanceId As %String;

Property OCCOrder As %DynamicObject;

Property SAPB1Order As %DynamicObject;

Property NFETripleOne As %DynamicObject;

Property OrderState As %String;

Storage Default
{
<Data name="NFETripleOne">
<Attribute>NFETripleOne</Attribute>
<Structure>node</Structure>
<Subscript>"occ.bp.tracking.Request.NFETripleOne"</Subscript>
</Data>
<Data name="OCCOrder">
<Attribute>OCCOrder</Attribute>
<Structure>node</Structure>
<Subscript>"occ.bp.tracking.Request.OCCOrder"</Subscript>
</Data>
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>InstanceId</Value>
</Value>
<Value name="2">
<Value>OrderState</Value>
</Value>
</Data>
<Data name="SAPB1Order">
<Attribute>SAPB1Order</Attribute>
<Structure>node</Structure>
<Subscript>"occ.bp.tracking.Request.SAPB1Order"</Subscript>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
