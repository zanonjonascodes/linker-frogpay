Class occ.custom.bo.order.OperationREST Extends linker.rest.RestCall
{

Method CancelOrder(pRequest As occ.custom.bo.order.cancel.Request, pResponse As occ.custom.bo.order.cancel.Response) As %Status
{
	Try
	{
		#Dim exception As %Exception.General = ""
		#Dim statusCode As %Status           = $System.Status.OK()
		//
		#Dim response As occ.custom.bo.order.cancel.Response = ##class(occ.custom.bo.order.cancel.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest     = pRequest.RestRequestVO
		//
		Set restRequestVO.HttpHeaderArray = ##Class(utils.HttpBuilder).OCCCustomBuildTokenRequestHeader(restRequestVO.InstanceId)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Delete(restRequestVO)
		Set pResponse.RestResponseVO = restResponseVO
	}
	Catch(exception)
	{
		Set statusCode = exception.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}
	Return statusCode
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="occ.custom.bo.order.cancel.Request"> 
		<Method>CancelOrder</Method>
	</MapItem>
</MapItems>
}

}
