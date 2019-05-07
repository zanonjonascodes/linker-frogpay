Class stone.message.conciliation.get.Response Extends linker.bo.restcall.get.Response
{

Method DoSpecifAction(pArgs...)
{
	Try
	{
		#Dim statusCode As %Status                          = $System.Status.OK()
		#Dim exception As %Exception.General                = ""
		#Dim request As stone.conciliation.get.Request      = pArgs(1)
		#Dim serviceId As %String                           = request.RestRequestVO.ServiceId
		#Dim service As linker.data.config.Services         = ##Class(linker.data.config.Services).%OpenId(serviceId)
		//
		Do service.Parameters.SetAt($ZDate(+$Horolog - 1, 8), 1)
		//
		Set statusCode = service.%Save()
		//
		If ($System.Status.IsError(statusCode))
		{
			Throw ##Class(%Exception.StatusException).CreateFromStatus(statusCode)
		}
	}
	Catch (exception)
	{
		Throw exception
	}
}

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>Conciliation</Value>
</Value>
<Value name="2">
<Value>RestResponseVO</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
