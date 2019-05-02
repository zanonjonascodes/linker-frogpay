Class linker.bo.pooling.saveinrepository.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "linker.bo.pooling.saveinrepository.Response"; 

Property JSONString As %String(MAXLEN = "");

Property ServiceId As %Integer;

Property ResourcePath As %String(MAXLEN = 250);

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>JSONString</Value>
</Value>
<Value name="2">
<Value>ServiceId</Value>
</Value>
<Value name="3">
<Value>ResourcePath</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}