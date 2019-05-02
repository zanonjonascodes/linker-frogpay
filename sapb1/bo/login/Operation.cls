Class sapb1.bo.security.Operation Extends (EnsLib.REST.Operation, linker.rest.RestCall)
{

Parameter INVOCATION = "Queue";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Method Login(request As sapb1.bo.security.login.Request, response As sapb1.bo.security.login.Response) As %Status
{	
	Try{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As sapb1.bo.security.login.Response = ##class(sapb1.bo.security.login.Response).%New()		
		#Dim login As sapb1.security.Login = ##class(sapb1.security.Login).%New(request.InstanceId)		
		#Dim restRequestVO As linker.vo.rest.RestRequest = ##class(linker.vo.rest.RestRequest).%New()
		//
		Set restRequestVO.HttpRequestBody = login.BuildRestLoginRequestBody()
		Set restRequestVO.URL = ##class(utils.FunctionSet).GetResourcePathByServiceNameInstance(request.InstanceId, "Login")
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Post(restRequestVO)
		//
		If $System.Status.IsError(restResponseVO.Status )
		{
			Throw ##Class(%Exception.StatusException).CreateFromStatus(restResponseVO.Status)
		}
		Try
		{
			#Dim proxy As %DynamicObject = ##Class(%DynamicObject).%FromJSON(restResponseVO.HttpResponseBody)
		}
		Catch (exception)
		{
			Throw exception
		}
		Set response.Token = proxy.SessionId
		Set response.HttpStatusCode = restResponseVO.HttpStatusCode
		Set response.RawResponseBody = restResponseVO.HttpResponseBody	
	}
	catch(e)
	{	
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)	
	}	
	Return statusCode
}

XData MessageMap
{
<MapItems>
		<MapItem MessageType="sapb1.bo.security.login.Request"> 
			<Method>Login</Method>
		</MapItem>
	</MapItems>
}

}
