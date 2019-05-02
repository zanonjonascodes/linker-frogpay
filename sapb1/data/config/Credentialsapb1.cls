Class sapb1.data.config.Credentialsapb1 Extends %Persistent
{

Property Username As %String;

Property Password As %String;

Property CompanyDB As %String;

Property InstanceId As %String;

Index InstanceIdIdx On InstanceId [ Unique ];

Storage Default
{
<Data name="Credentialsapb1DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Username</Value>
</Value>
<Value name="3">
<Value>Password</Value>
</Value>
<Value name="4">
<Value>CompanyDB</Value>
</Value>
<Value name="5">
<Value>InstanceId</Value>
</Value>
</Data>
<DataLocation>^sapb1.data75AD.Credentials9D1BD</DataLocation>
<DefaultData>Credentialsapb1DefaultData</DefaultData>
<IdLocation>^sapb1.data75AD.Credentials9D1BD</IdLocation>
<IndexLocation>^sapb1.data75AD.Credentials9D1BI</IndexLocation>
<StreamLocation>^sapb1.data75AD.Credentials9D1BS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
