Class skipper.message.transaction.get.Response Extends linker.bo.restcall.get.Response
{

Method DoSpecifAction(pArgs...)
{
	Try
	{
		#Dim statusCode As %Status                              = $System.Status.OK()
		#Dim exception As %Exception.General                    = ""
		#Dim request As skipper.message.transaction.get.Request = pArgs(1)
		#Dim serviceId As %String                               = request.RestRequestVO.ServiceId
		#Dim service As linker.data.config.Services             = ##Class(linker.data.config.Services).%OpenId(serviceId)
		//
		Do service.Parameters.SetAt($ZDate(+$Horolog - 1, 3), 1)
		Do service.Parameters.SetAt($ZDate(+$Horolog - 1, 3), 2)
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
<Type>%Storage.Persistent</Type>
}

}
