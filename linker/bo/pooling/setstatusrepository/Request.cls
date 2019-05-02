Class linker.bo.pooling.setstatusrepository.Request Extends Ens.Request
{

Property RepositoryId As %Integer;

Property ErrorMEssage As %String(MAXLEN = "");

Property Status As %String;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>RepositoryId</Value>
</Value>
<Value name="2">
<Value>ErrorMEssage</Value>
</Value>
<Value name="3">
<Value>Status</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
