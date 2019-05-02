Class linker.data.config.Instance Extends %Persistent
{

Property Name As %String(MAXLEN=250) [Required];

Property Host As %String;

Property Port As %String;

Property HttpsEnabled As %String;

Property Type As %String;

Index TypeIdx On Type;

Index NameIdx On Name [Unique, IdKey, PrimaryKey];


Storage Default
{
<Data name="InstanceDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Host</Value>
</Value>
<Value name="3">
<Value>Port</Value>
</Value>
<Value name="4">
<Value>HttpsEnabled</Value>
</Value>
<Value name="5">
<Value>Type</Value>
</Value>
</Data>
<DataLocation>^linker.data.config.InstanceD</DataLocation>
<DefaultData>InstanceDefaultData</DefaultData>
<IdLocation>^linker.data.config.InstanceD</IdLocation>
<IndexLocation>^linker.data.config.InstanceI</IndexLocation>
<StreamLocation>^linker.data.config.InstanceS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
