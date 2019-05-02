Class occ.bo.profile.OperationREST Extends linker.rest.RestCall
{

Method GetProfile(pRequest As occ.bo.profile.getprofile.Request, Output pResponse As occ.bo.profile.getprofile.Response) As %Status
{
	Try
	{

		#Dim statusCode As %Status = $System.Status.OK()
		//
		#Dim pResponse As occ.bo.profile.getprofile.Response = ##class(occ.bo.profile.getprofile.Response).%New()
		#Dim exception As %Exception.General = ""
		#Dim restRequestVO As linker.vo.rest.RestRequest = pRequest.RestRequestVO
		//
		Set restRequestVO.HttpHeaderArray = ##Class(utils.HttpBuilder).OCCBuildTokenRequestHeader(restRequestVO.Token)
		Set pResponse.RestResponseVO = ..Get(restRequestVO)
		Set statusCode = pResponse.RestResponseVO.Status
		//
		#Dim profile As %DynamicObject = ##Class(%DynamicObject).%FromJSON(pResponse.RestResponseVO.HttpResponseBody)
	}
	Catch (exception)
	{
		Set statusCode = exception.AsStatus()
	}
	Return statusCode
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="occ.bo.profile.getprofile.Request">
		<Method>GetProfile</Method>
	</MapItem>
</MapItems>
}


}