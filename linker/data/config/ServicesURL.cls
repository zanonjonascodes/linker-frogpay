Class linker.data.config.ServicesURL Extends %Persistent
{

Property BaseURL As %String;

Property ParametersURL As list Of %String;

Relationship Service As Services [ Cardinality = parent, Inverse = URLS ];

Storage Default
{
<Data name="ServicesURLDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>BaseURL</Value>
</Value>
<Value name="3">
<Value>ParametersURL</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("URLS")</DataLocation>
<DefaultData>ServicesURLDefaultData</DefaultData>
<IdLocation>^linker.data.config.ServicesC("URLS")</IdLocation>
<IndexLocation>^linker.data.co64B8.ServicesURLI</IndexLocation>
<StreamLocation>^linker.data.co64B8.ServicesURLS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
