Class linker.rest.RestCall Extends EnsLib.REST.Operation
{
Property HttpResponse As %Net.HttpResponse;

Property HttpRequest As %Net.HttpRequest;

Property URL As %String;

Method Post(restRequestVO As linker.vo.rest.RestRequest) As linker.vo.rest.RestResponse
{
	Try
	{
		Set statusCode = $System.Status.OK()
		Set ..URL      = restRequestVO.URL
		//
		Do ..SetRequestHeader(restRequestVO.HttpHeaderArray)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ##class(linker.vo.rest.RestResponse).%New()
		//
		Do ..CallRestURL("POST", restRequestVO, restResponseVO)
	}
	Catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}
	
	Return restResponseVO
}

Method Get(restRequestVO As linker.vo.rest.RestRequest) As linker.vo.rest.RestResponse
{
	Try
	{
		Set statusCode = $System.Status.OK()
		Set ..URL      = restRequestVO.URL
		//
		Do ..SetRequestHeader(restRequestVO.HttpHeaderArray)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ##class(linker.vo.rest.RestResponse).%New()
		//
		Do ..CallRestURL("GET", restRequestVO, restResponseVO )
	}
	Catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}
	Return restResponseVO
}

Method Put(restRequestVO As linker.vo.rest.RestRequest) As linker.vo.rest.RestResponse
{
	Try
	{
		Set statusCode = $System.Status.OK()
		Set ..URL      = restRequestVO.URL
		Do ..SetRequestHeader(restRequestVO.HttpHeaderArray)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ##class(linker.vo.rest.RestResponse).%New()
		//
		Do ..CallRestURL("PUT", restRequestVO, restResponseVO)
	}
	Catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}
	Return restResponseVO
}

Method Delete(restRequestVO As linker.vo.rest.RestRequest) As linker.vo.rest.RestResponse
{
	Try 
	{		
		Set statusCode = $System.Status.OK()			
		Set ..URL      = restRequestVO.URL
		//
		Do ..SetRequestHeader(restRequestVO.HttpHeaderArray)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ##class(linker.vo.rest.RestResponse).%New()
		//
		Set restResponseVO.Status = ..CallRestURL("DELETE", restRequestVO, restResponseVO)
	}
	Catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}		
	Return restResponseVO
}

Method Patch(restRequestVO As linker.vo.rest.RestRequest) As linker.vo.rest.RestResponse
{
	Try 
	{		
		Set statusCode = $System.Status.OK()			
		Set ..URL = restRequestVO.URL
		//
		Do ..SetRequestHeader(restRequestVO.HttpHeaderArray)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ##class(linker.vo.rest.RestResponse).%New()
		//
		Do ..CallRestURL("PATCH", restRequestVO, restResponseVO)
	}
	Catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}		
	Return restResponseVO
}

Method CallRestURL(httpMethod As %String, pHTTPRequestVO As linker.vo.rest.RestRequest, pHTTPResponseVO As linker.vo.rest.RestResponse) As %Status [Private]
{
	Try
	{
		#Dim statusCode As %Status  = $System.Status.OK()
		#Dim httpRequest As %String = pHTTPRequestVO.HttpRequestBody
		//Set httpRequestBody(1) = ##Class(utils.FunctionSet).EscapeJSON(httpRequestBody(1))
		Set statusCode                       = ..Adapter.SendFormDataArray(.httpResponse, httpMethod, ..HttpRequest , "", .httpRequestBody, ..URL)
		Set ..HttpResponse                   = httpResponse
		Set pHTTPResponseVO.HttpResponseBody = ..GetHttpResponseBodyData()
		Set pHTTPResponseVO.HttpStatusCode   = ..HttpResponse.StatusCode
		Set pHTTPResponseVO.Status           = statusCode
		//
		If ($System.Status.IsError(statusCode))
		{
			#Dim errorMessage As %String = $System.Status.GetErrorText(statusCode)
			//
			Do ##Class(linker.data.Repository).SetStatus(pHTTPRequesstVO.RepositoryId, "Error", errorMessage)
			//
			Set statusCode = $System.Status.OK()
		}
		If (..HttpResponse.StatusCode > 200)
		{
			Do ##Class(linker.data.Repository).SetStatus(pHTTPRequesstVO.RepositoryId, "Error", pHTTPResponseVO.HttpResponseBody)
		}
	}
	Catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText  = $System.Status.GetErrorText(statusCode)
	}
	Return statusCode
}

Method GetHttpResponseBodyData() As %String [Private]
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

Method SetRequestHeader(headerArray As %ArrayOfDataTypes) [Private]
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

}