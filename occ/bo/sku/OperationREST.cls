Class occ.bo.sku.OperationREST Extends (EnsLib.REST.Operation, linker.rest.RestCall)
{

Method CreateSku(request As occ.bo.sku.createsku.Request, Output response As occ.bo.sku.createsku.Response) As %Status
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As linker.bo.restcall.genericoperation.Response = ##class(linker.bo.restcall.genericoperation.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
		#Dim sku As occ.boapi.Sku = ##class(occ.boapi.Sku).%New() 
		//
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).OCCBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Post(restRequestVO)
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
	<MapItem MessageType="occ.bo.sku.createsku.Request"> 
		<Method>CreateSku</Method>
	</MapItem>
</MapItems>
}

}
