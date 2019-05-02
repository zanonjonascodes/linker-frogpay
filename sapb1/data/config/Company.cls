Class linker.data.config.Company Extends %Persistent
{

Property CompanyName As %String(MAXLEN = "");

Storage Default
{
<Data name="CompanyDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CompanyName</Value>
</Value>
</Data>
<DataLocation>^linker.data.config.CompanyD</DataLocation>
<DefaultData>CompanyDefaultData</DefaultData>
<IdLocation>^linker.data.config.CompanyD</IdLocation>
<IndexLocation>^linker.data.config.CompanyI</IndexLocation>
<StreamLocation>^linker.data.config.CompanyS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
