Class sapb1.bo.businesspartner.Operation Extends linker.rest.RestCall
{

Method InsertBusinessPartner(request As sapb1.bo.businesspartner.insertbusinesspartner.Request, Output response As sapb1.bo.businesspartner.insertbusinesspartner.Response) As %Status
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As sapb1.bo.businesspartner.insertbusinesspartner.Response = ##class(sapb1.bo.businesspartner.insertbusinesspartner.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
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
// /b1s/v1/BusinessPartners('C00004')?$select=CardCode
Method ExistsBusinessPartner(request As sapb1.bo.businesspartner.existsbusinesspartner.Request, Output response As sapb1.bo.businesspartner.existsbusinesspartner.Response) As %Status
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As sapb1.bo.businesspartner.existsbusinesspartner.Response = ##class(sapb1.bo.businesspartner.existsbusinesspartner.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
		#Dim businessPartner As sapb1.boapi.BusinessPartner = ##class(sapb1.boapi.BusinessPartner).%New()
		//
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).SAPBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Get(restRequestVO)
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

Method UpdateBusinessPartner(request As sapb1.bo.businesspartner.updatebusinesspartner.Request, Output response As sapb1.bo.businesspartner.updatebusinesspartner.Response) As %Status
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As sapb1.bo.businesspartner.insertbusinesspartner.Response = ##class(sapb1.bo.businesspartner.insertbusinesspartner.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
		#Dim businessPartner As sapb1.boapi.BusinessPartner = ##class(sapb1.boapi.BusinessPartner).%New()
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Patch(restRequestVO)
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
	<MapItem MessageType="sapb1.bo.businesspartner.insertbusinesspartner.Request"> 
		<Method>InsertBusinessPartner</Method>
	</MapItem>
	<MapItem MessageType="sapb1.bo.businesspartner.existsbusinesspartner.Request"> 
		<Method>ExistsBusinessPartner</Method>
	</MapItem>
	<MapItem MessageType="sapb1.bo.businesspartner.updatebusinesspartner.Request"> 
		<Method>UpdateBusinessPartner</Method>
	</MapItem>
</MapItems>
}

}
