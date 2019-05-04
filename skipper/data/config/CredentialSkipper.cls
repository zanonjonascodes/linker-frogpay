Class skipper.data.config.CredentialSkipper Extends %Persistent
{

Property Username As %String;

Property Password As %String;

Property InstanceId As %String;

Index InstanceIdIdx On InstanceId [ Unique ];

Storage Default
{
<Data name="CredentialSkipperDefaultData">
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
<DataLocation>^skipper.da3DC5.CredentialSEA09D</DataLocation>
<DefaultData>CredentialSkipperDefaultData</DefaultData>
<IdLocation>^skipper.da3DC5.CredentialSEA09D</IdLocation>
<IndexLocation>^skipper.da3DC5.CredentialSEA09I</IndexLocation>
<StreamLocation>^skipper.da3DC5.CredentialSEA09S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
