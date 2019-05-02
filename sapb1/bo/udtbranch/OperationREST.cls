Class sapb1.bo.udtbranch.OperationREST extends linker.rest.RestCall
{

Method GetUdtBranch(request As sapb1.bo.udtbranch.get.Request, Output response As sapb1.bo.udtbranch.get.Response)
{
	Try
	{
		#Dim statusCode As %Status = $System.Status.OK()
		#Dim response As sapb1.bo.udtbranch.get.Response = ##class(sapb1.bo.udtbranch.get.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
		//
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).SAPBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Get(restRequestVO)
		//
		Set response.RestResponseVO = restResponseVO
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
	<MapItem MessageType="sapb1.bo.udtbranch.get.Request"> 
		<Method>GetUdtBranch</Method>
	</MapItem>
</MapItems>
}

}