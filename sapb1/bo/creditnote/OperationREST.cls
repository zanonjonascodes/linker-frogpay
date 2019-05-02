Class sapb1.bo.creditnote.OperationREST Extends linker.rest.RestCall
{

Method CreateCreditNote(request As sapb1.bo.creditnote.create.Request, Output response As sapb1.bo.creditnote.create.Response)
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As sapb1.bo.creditnote.create.Response = ##class(sapb1.bo.creditnote.create.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
		//
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).SAPBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Post(restRequestVO)
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
	<MapItem MessageType="sapb1.bo.creditnote.create.Request"> 
		<Method>CreateCreditNote</Method>
	</MapItem>
</MapItems>
}

}