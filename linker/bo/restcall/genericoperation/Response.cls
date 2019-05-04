Class linker.bo.restcall.genericoperation.Response Extends Ens.Response
{

Property RestResponseVO As linker.vo.rest.RestResponse;

/// Subclass responsablity
Method DoSpecifAction(pArgs...)
{
	Return
}

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>RestResponseVO</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}