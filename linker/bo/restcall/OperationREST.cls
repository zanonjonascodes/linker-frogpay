Class linker.bo.restcall.OperationREST Extends EnsLib.REST.Operation
{

Property HttpResponse As %Net.HttpResponse;

Property HttpRequest As %Net.HttpRequest;

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Property URL As %String;

Method Post(pRequest As linker.bo.restcall.post.Request, Output pResponse As linker.bo.restcall.post.Response) As %Status
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		Do ..CallRestURL("POST", pRequest, .pResponse)
	}
	Catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}
	Return statusCode
}

Method Get(pRequest As linker.bo.restcall.get.Request, Output pResponse As linker.bo.restcall.get.Response) As %Status
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		Do ..CallRestURL("GET", pRequest, .pResponse)
	}
	Catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText  = $System.Status.GetErrorText(statusCode)
	}
	Return statusCode
}

Method Put(pRequest As linker.bo.restcall.put.Request, Output pResponse As linker.bo.restcall.put.Response) As %Status
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		Do ..CallRestURL("PUT", pRequest, .pResponse)
	}
	Catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}
	Return statusCode
}

Method Delete(pRequest As linker.bo.restcall.delete.Request, Output pResponse As linker.bo.restcall.delete.Response) As %Status
{
	Try 
	{		
		Set statusCode = $System.Status.OK()			
		//
		Do ..CallRestURL("DELETE", pRequest, .pResponse)
	}
	Catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}		
	Return restResponseVO
}

Method Patch(pRequest As linker.bo.restcall.patch.Request, Output pResponse As linker.bo.restcall.patch.Response) As %Status
{
	Try 
	{		
		Set statusCode = $System.Status.OK()			
		//
		Do ..CallRestURL("PATCH", pRequest, .pResponse)
	}
	Catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}		
	Return restResponseVO
}

Method CallRestURL(httpMethod As %String, pRequest As linker.bo.restcall.genericoperation.Request, Output pResponse As linker.bo.restcall.genericoperation.Response) As %Status [ Private ]
{
	Try
	{
		#Dim statusCode As %Status                         = $System.Status.OK()
		#Dim httpRequestVO As %String                      = pRequest.RestRequestVO
		#Dim httpResponseVO As linker.vo.rest.RestResponse = ##Class(linker.vo.rest.RestResponse).%New()
		#Dim jsonResponse As %String                       = ""
		//
		Set ..URL      = httpRequestVO.URL
		//
		Do ..SetRequestHeader(httpRequestVO.HttpHeaderArray)
		//
		Set statusCode     = ..Adapter.SendFormDataArray(.httpResponse, httpMethod, ..HttpRequest , "", .httpRequestVO, ..URL)
		Set ..HttpResponse = httpResponse
		Set jsonResponse   = ..GetHttpResponseBodyData()
		//
		If (jsonResponse '= "")
		{
			Set httpResponseVO.HttpResponseBody = jsonResponse
		}
		Set httpResponseVO.HttpStatusCode = ..HttpResponse.StatusCode
		Set httpResponseVO.Status         = statusCode
		//
		Do pRequest.NewResponse(.pResponse)
		//
		Set pResponse.RestResponseVO = httpResponseVO
		//
		If ($System.Status.IsError(statusCode))
		{
			#Dim errorMessage As %String = $System.Status.GetErrorText(statusCode)
			//
			Do ##Class(linker.data.Repository).SetStatus(httpRequestVO.RepositoryId, "Error", errorMessage)
			//
			Set statusCode = $System.Status.OK()
		}
		If (..HttpResponse.StatusCode > 200)
		{
			Do ##Class(linker.data.Repository).SetStatus(httpRequestVO.RepositoryId, "Error", httpRequestVO.HttpResponseBody)
		}
		Else
		{
			#Dim callbackClassName As %RawString  = pRequest.RestRequestVO.CallBackClassName
			#Dim callBackMethodName As %RawString = pRequest.RestRequestVO.CallBackMethodName
			//
			If ((callBackClassName '= "") && (callBackMethodName '= ""))
			{
				Do $ClassMethod(callbackClassName, callBackMethodName, httpRequestVO, httpResponseVO)
				//
				Set pResponse.RestResponseVO = httpResponseVO
			}
		}
	}
	Catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText  = $System.Status.GetErrorText(statusCode)
	}
	Return statusCode
}

Method GetHttpResponseBodyData() As %String [ Private ]
{
	Set httpResponseBody = ""
	//		
	If ($IsObject(..HttpResponse.Data))
	{
		While ('..HttpResponse.Data.AtEnd) 
		{
			Set httpResponseBody = httpResponseBody _ ..HttpResponse.Data.Read()
		}
	}
	Return httpResponseBody
}

Method SetRequestHeader(headerArray As %ArrayOfDataTypes) [ Private ]
{
	Set ..HttpRequest                = ##class(%Net.HttpRequest).%New()
	Set ..HttpRequest.ContentCharset = "UTF-8"
	Set ..HttpRequest.ContentType    = "application/json"
	//
	For 
	{
		Set value = headerArray.GetNext(.header) 
		//
		Quit:(header = "")
		//
		Do ..HttpRequest.SetHeader(header,value)	
	}
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="linker.bo.restcall.get.Request"> 
		<Method>Get</Method>
	</MapItem>
	<MapItem MessageType="linker.bo.restcall.post.Request"> 
		<Method>Post</Method>
	</MapItem>
	<MapItem MessageType="linker.bo.restcall.put.Request"> 
		<Method>Put</Method>
	</MapItem>
	<MapItem MessageType="linker.bo.restcall.patch.Request"> 
		<Method>Patch</Method>
	</MapItem>
	<MapItem MessageType="linker.bo.restcall.delete.Request"> 
		<Method>Delete</Method>
	</MapItem>
</MapItems>
}

}
