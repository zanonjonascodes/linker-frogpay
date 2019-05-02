Class linker.data.config.Branch Extends %Persistent
{

Property BranchName As %String;

Property Company As linker.data.config.Company;

Storage Default
{
<Data name="BranchDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>BranchName</Value>
</Value>
<Value name="3">
<Value>Company</Value>
</Value>
</Data>
<DataLocation>^linker.data.config.BranchD</DataLocation>
<DefaultData>BranchDefaultData</DefaultData>
<IdLocation>^linker.data.config.BranchD</IdLocation>
<IndexLocation>^linker.data.config.BranchI</IndexLocation>
<StreamLocation>^linker.data.config.BranchS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
