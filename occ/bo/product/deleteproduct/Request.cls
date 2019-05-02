Class occ.bo.product.deleteproduct.Request Extends linker.bo.restcall.genericoperation.Request
{

Property ProductId As %String;

Storage Default
{
<Data name="RequestDefaultData1">
<Subscript>"Request1"</Subscript>
<Value name="1">
<Value>ProductId</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData1</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
