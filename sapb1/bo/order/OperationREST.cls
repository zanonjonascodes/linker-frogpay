Class sapb1.bo.order.OperationREST Extends linker.rest.RestCall
{

Method CreateOrder(request As sapb1.bo.order.createorder.Request, Output response As sapb1.bo.order.createorder.Response)
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As sapb1.bo.order.createorder.Response = ##class(sapb1.bo.order.createorder.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
		#Dim order As sapb1.boapi.Order = ##class(sapb1.boapi.Order).%New()
		//
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).SAPBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Post(restRequestVO)
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

Method CancelOrder(request As sapb1.bo.order.cancel.Request, Output response As sapb1.bo.order.cancel.Response)
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As sapb1.bo.order.cancel.Response = ##class(sapb1.bo.order.cancel.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
		//
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).SAPBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Post(restRequestVO)
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

Method GetOrder(request As sapb1.bo.order.getorder.Request, Output response As sapb1.bo.order.getorder.Response)
{
	Try
	{
		#Dim statusCode As %Status = $System.Status.OK()
		#Dim response As sapb1.bo.order.geteorder.Response = ##class(sapb1.bo.order.createorder.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
		#Dim order As sapb1.boapi.Order = ##class(sapb1.boapi.Order).%New()
		//
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).SAPBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Get(restRequestVO)
		//
		Set response.RestResponseVO = restResponseVO
	}
	Catch(exception)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}
	Return statusCode
}

Method UpdateOrder(request As sapb1.bo.order.updateorder.Request, Output response As sapb1.bo.order.updateorder.Response)
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As sapb1.bo.order.createorder.Response = ##class(sapb1.bo.order.createorder.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
		#Dim order As sapb1.boapi.Order = ##class(sapb1.boapi.Order).%New()
		//
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).SAPBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Patch(restRequestVO)
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
	<MapItem MessageType="sapb1.bo.order.createorder.Request"> 
		<Method>CreateOrder</Method>
	</MapItem>
	<MapItem MessageType="sapb1.bo.order.getorder.Request"> 
		<Method>GetOrder</Method>
	</MapItem>
	<MapItem MessageType="sapb1.bo.order.cancel.Request"> 
		<Method>CancelOrder</Method>
	</MapItem>s
	<MapItem MessageType="sapb1.bo.order.updateorder.Request"> 
		<Method>UpdateOrder</Method>
	</MapItem>
</MapItems>
}

}
