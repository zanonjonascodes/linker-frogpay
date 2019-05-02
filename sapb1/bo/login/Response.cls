Class sapb1.bo.security.login.Response Extends Ens.Response
{

Property Token As %String(MAXLEN = "");

Property RawResponseBody As %String(MAXLEN="");

Property HttpStatusCode As %String(MAXLEN = "");

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>Token</Value>
</Value>
<Value name="2">
<Value>RawResponseBody</Value>
</Value>
<Value name="3">
<Value>HttpStatusCode</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
