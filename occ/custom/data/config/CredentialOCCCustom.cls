Class occ.custom.data.config.CredentialOCCCustom Extends %Persistent
{

Property Username As %String;

Property Password As %String;

Property InstanceId As %String;

Index InstanceIdIdx On InstanceId [ Unique ];

Storage Default
{
<Data name="CredentialOCCCustomDefaultData">
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
<Value>InstanceId</Value>
</Value>
</Data>
<DataLocation>^occ.custom3F5A.CredentialOF456D</DataLocation>
<DefaultData>CredentialOCCCustomDefaultData</DefaultData>
<IdLocation>^occ.custom3F5A.CredentialOF456D</IdLocation>
<IndexLocation>^occ.custom3F5A.CredentialOF456I</IndexLocation>
<StreamLocation>^occ.custom3F5A.CredentialOF456S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
