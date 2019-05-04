Class occ.bo.product.OperationREST Extends linker.rest.RestCall
{

Parameter INVOCATION = "Queue";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Property DeleteProductReourcePath As %String [ InitialExpression = "/ccadmin/v1/products/{id}" ];

Parameter SETTINGS = "DeleteProductReourcePath:OCC";

Method InsertProduct(request As occ.bo.product.insertproduct.Request, response As linker.bo.restcall.genericoperation.Response) As %Status
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As linker.bo.restcall.genericoperation.Response = ##class(linker.bo.restcall.genericoperation.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
		#Dim product As occ.boapi.Product = ##class(occ.boapi.Product).%New()
		//
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).OCCBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Post(restRequestVO)
		Set response                = ##Class(linker.bo.restcall.genericoperation.Response).%New()
		Set response.RestResponseVO = restResponseVO
		//
	}catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}
	Return statusCode
}

Method DeleteProduct(pRequest As occ.bo.product.deleteproduct.Request, pResponse As linker.bo.restcall.genericoperation.Response) As %Status
{
	Try
	{
		#Dim exception As %Exception.General = ""
		#Dim statusCode As %Status           = $System.Status.OK()
		//
		#Dim response As linker.bo.restcall.genericoperation.Response = ##class(linker.bo.restcall.genericoperation.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest              = pRequest.RestRequestVO
		#Dim product As occ.boapi.Product                             = ##class(occ.boapi.Product).%New()
		//
		Set restRequestVO.HttpHeaderArray = ##Class(utils.HttpBuilder).OCCBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Delete(restRequestVO)
		Set pResponse.RestResponseVO = restResponseVO
		//
	}
	Catch(exception)
	{
		Set statusCode = exception.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}
	Return statusCode
}

/// https://ccadmin-test-zbxa.oracleoutsourcing.com/ccadmin/v1/products/{id}
Method ExistsProduct(pRequest As occ.bo.product.existsproduct.Request, Output pResponse As occ.bo.product.existsproduct.Response) As %Status
{
	Try
	{
		#Dim exception As %Exception.General = ""
		#Dim statusCode As %Status           = $System.Status.OK()
		//		
		#Dim restRequestVO As linker.vo.rest.RestRequest = pRequest.RestRequestVO
		#Dim product As occ.boapi.Product                = ##class(occ.boapi.Product).%New()
		//
		Set pResponse                     = ##Class(occ.bo.product.existsproduct.Response).%New()
		Set restRequestVO.HttpHeaderArray = ##Class(utils.HttpBuilder).OCCBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Get(restRequestVO)
		//		
		Set pResponse.RestResponseVO = restResponseVO
	}
	Catch(exception)
	{
		Set statusCode = exception.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}
	Return statusCode
}

/// https://ccadmin-test-zbxa.oracleoutsourcing.com/ccadmin/v1/products/{id}
Method UpdateProduct(pRequest As occ.bo.product.updateproduct.Request, Output pResponse As occ.bo.product.updateproduct.Response) As %Status
{
	Try
	{
		#Dim exception As %Exception.General = ""
		#Dim statusCode As %Status           = $System.Status.OK()
		//		
		#Dim restRequestVO As linker.vo.rest.RestRequest = pRequest.RestRequestVO
		#Dim product As occ.boapi.Product                = ##class(occ.boapi.Product).%New()
		//
		Set pResponse                     = ##Class(occ.bo.product.existsproduct.Response).%New()
		Set restRequestVO.HttpHeaderArray = ##Class(utils.HttpBuilder).OCCBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Put(restRequestVO)
		//		
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
	<MapItem MessageType="occ.bo.product.insertproduct.Request"> 
		<Method>InsertProduct</Method>
	</MapItem>
	<MapItem MessageType="occ.bo.product.deleteproduct.Request"> 
		<Method>DeleteProduct</Method>
	</MapItem>
	<MapItem MessageType="occ.bo.product.existsproduct.Request"> 
		<Method>ExistsProduct</Method>
	</MapItem>
	<MapItem MessageType="occ.bo.product.updateproduct.Request"> 
		<Method>UpdateProduct</Method>
	</MapItem>
</MapItems>
}

}
