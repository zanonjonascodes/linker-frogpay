Class linker.bp.insertproduct.Request Extends Ens.Request
{

Property RestRequestVO As linker.vo.rest.RestRequest;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>RestRequestVO</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
