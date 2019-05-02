Class occ.bo.price.OperationREST Extends linker.rest.RestCall
{

Method UpdatePrice(request As linker.bo.restcall.genericoperation.Request, Output response As linker.bo.restcall.genericoperation.Response) As %Status
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As linker.bo.restcall.genericoperation.Response = ##class(linker.bo.restcall.genericoperation.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
		#Dim price As occ.boapi.Price = ##class(occ.boapi.Price).%New()
		//
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).OCCBuildTokenRequestHeader(token)
		Set restRequestVO.HttpRequestBody = price.MapProperties(restRequestVO.HttpRequestBody)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Put(restRequestVO)
		If $System.Status.IsError(restResponseVO.Status)
		{
			Throw ##Class(%Exception.StatusException).CreateFromStatus(restResponseVO.Status)
		}
		//
		Set response.RestResponseVO = restResponseVO
		//
	}catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}
	//
	Return statusCode
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="linker.bo.restcall.genericoperation.Request"> 
		<Method>UpdatePrice</Method>
	</MapItem>
</MapItems>
}

}
