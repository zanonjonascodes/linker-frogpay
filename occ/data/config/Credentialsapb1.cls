Class occ.data.config.CredentialOCC Extends %Persistent
{

Property AppKey As %String(MAXLEN = "");

Property InstanceId As %String;

Index InstanceIdIdx On InstanceId [ Unique ];

Storage Default
{
<Data name="CredentialOCCDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>AppKey</Value>
</Value>
<Value name="3">
<Value>InstanceId</Value>
</Value>
</Data>
<DataLocation>^occ.data.config.CredentialOCCD</DataLocation>
<DefaultData>CredentialOCCDefaultData</DefaultData>
<IdLocation>^occ.data.config.CredentialOCCD</IdLocation>
<IndexLocation>^occ.data.config.CredentialOCCI</IndexLocation>
<StreamLocation>^occ.data.config.CredentialOCCS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
