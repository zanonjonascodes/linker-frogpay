Class occ.bo.security.Operation Extends (EnsLib.REST.Operation, linker.rest.RestCall)
{

Parameter INVOCATION = "Queue";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Method Login(request As occ.bo.security.login.Request, response As occ.bo.security.login.Response) As %Status
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As occ.bo.security.login.Response = ##class(occ.bo.security.login.Response).%New()
		#Dim login As occ.security.Login = ##class(occ.security.Login).%New(request.InstanceId)
		#Dim restRequestVO As linker.vo.rest.RestRequest = ##class(linker.vo.rest.RestRequest).%New()
		// 
		Set restRequestVO.HttpRequestBody = login.BuildRestLoginRequestBody()
		Set restRequestVO.HttpHeaderArray = login.BuildRequestHeader()
		Set restRequestVO.URL = request.Url
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Post(restRequestVO)
		//
		If $System.Status.IsError(restResponseVO.Status)
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
		Set response.Token = proxy."access_token"
		Set response.HttpStatusCode = restResponseVO.HttpStatusCode
		Set response.RawResponseBody = restResponseVO.HttpResponseBody
	}catch(e){
	
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	
	}
	
	Return statusCode
}

XData MessageMap
{
<MapItems>
		<MapItem MessageType="occ.bo.security.login.Request"> 
			<Method>Login</Method>
		</MapItem>
	</MapItems>
}

}
