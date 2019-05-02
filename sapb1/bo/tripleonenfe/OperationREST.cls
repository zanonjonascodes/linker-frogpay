Class sapb1.bo.tripleonenfe.OperationREST Extends linker.rest.RestCall
{

Method GetNFETripleOne(request As sapb1.bo.tripleonenfe.get.Request, response As sapb1.bo.tripleonenfe.get.Response)
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As sapb1.bo.tripleonenfe.get.Response = ##class(sapb1.bo.tripleonenfe.get.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO		
		//
		Set response.RestResponseVO       = ##Class(linker.vo.rest.RestResponse).%New()
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).SAPBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Get(restRequestVO)
		//
		If $System.Status.IsError(restResponseVO.Status)
		{
			Throw ##Class(%Exception.StatusException).CreateFromStatus(restResponseVO.Status)
		} 
		Set response.RestResponseVO         = restResponseVO
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
	<MapItem MessageType="sapb1.bo.tripleonenfe.get.Request"> 
		<Method>GetNFETripleOne</Method>
	</MapItem>
</MapItems>
}

}
