Class linker.data.token.Token Extends %Persistent
{

Property InstanceId As %String;

Property Token As %String(MAXLEN = "");

Property TokenTimeoutMinutes As %String;

Property State As %String;

Property RetrievedTimeStamp As %TimeStamp;

Index idxInstanceId On InstanceId [ Unique ];

Storage Default
{
<Data name="TokenDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>InstanceId</Value>
</Value>
<Value name="3">
<Value>Token</Value>
</Value>
<Value name="4">
<Value>TokenTimeoutMinutes</Value>
</Value>
<Value name="5">
<Value>State</Value>
</Value>
<Value name="6">
<Value>RetrievedTimeStamp</Value>
</Value>
</Data>
<DataLocation>^linker.data.token.TokenD</DataLocation>
<DefaultData>TokenDefaultData</DefaultData>
<IdLocation>^linker.data.token.TokenD</IdLocation>
<IndexLocation>^linker.data.token.TokenI</IndexLocation>
<StreamLocation>^linker.data.token.TokenS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
