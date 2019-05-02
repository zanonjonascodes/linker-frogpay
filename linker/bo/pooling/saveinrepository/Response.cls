Class linker.bo.pooling.saveinrepository.Response Extends Ens.Response
{

/// URL in case of has to get to more resources from external system.
Property NextURL As %String(MAXLEN=250);

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>NextURL</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}