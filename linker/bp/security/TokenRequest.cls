Class linker.bp.security.TokenRequest Extends Ens.Request
{

Property Instance As %Integer [ Required ];

Property URL As %String(MAXLEN = 250) [ Required ];

Storage Default
{
<Data name="TokenRequestDefaultData">
<Subscript>"TokenRequest"</Subscript>
<Value name="1">
<Value>Instance</Value>
</Value>
<Value name="2">
<Value>URL</Value>
</Value>
</Data>
<DefaultData>TokenRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
