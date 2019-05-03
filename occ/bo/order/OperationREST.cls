/// <p>
///  <b>2019-04-04 - Cristiano Jose da Silva</b><br>
///  Get Orders from Oracle Commerce Cloud.
/// </p>
Class occ.bo.order.OperationREST Extends linker.rest.RestCall
{

/// <p>
///  <a href="https://docs.oracle.com/en/cloud/saas/commerce-cloud/cxocc/op-ccadmin-v1-orders-get.html">
///    /ccadmin/v1/orders?q=lastModifiedDate > date("*") & sort=lastModifiedDate:desc
///  </a>
Method GetOrders(pRequest As occ.bo.order.getorders.Request, Output pResponse As occ.bo.order.getorders.Response) As %Status
{
	Try
	{
		#Dim statusCode As %Status                       = $System.Status.OK()
		#Dim exception As %Exception.General             = ""
		#Dim restRequestVO As linker.vo.rest.RestRequest = pRequest.RestRequestVO
		//
		Set pResponse                     = ##Class(occ.bo.order.getorders.Response).%New()
		Set restRequestVO.HttpHeaderArray = ##Class(utils.HttpBuilder).OCCBuildTokenRequestHeader(restRequestVO.Token)
		Set pResponse.RestResponseVO      = ..Get(restRequestVO)
		Set statusCode                    = pResponse.RestResponseVO.Status
		//
		If ($System.Status.IsError(statusCode))
		{
			Return statusCode
		}
		#Dim orders As %DynamicObject = ##Class(%DynamicObject).%FromJSON(pResponse.RestResponseVO.HttpResponseBody)
		//
		Set itemLastModifiedDate = orders.items.%Get(0).lastModifiedDate
		Set statusCode           = ##class(utils.FunctionSet).SetServicePoolingLastModifiedDate(pRequest.RestRequestVO.ServiceId, itemLastModifiedDate)
		//
		If ($System.Status.IsError(statusCode))
		{
			Return statusCode
		}
	}
	Catch (exception)
	{
		Set statusCode = exception.AsStatus()
	}
	Return statusCode
}

/// <p>
///  <a href="https://docs.oracle.com/en/cloud/saas/commerce-cloud/cxocc/op-ccadmin-v1-orders-id-put.htmll">
///    /ccadmin/v1/orders/{id}
///  </a>
Method UpdateOrders(pRequest As occ.bo.order.updateorders.Request, Output pResponse As occ.bo.order.updateorders.Response) As %Status
{
	Try
	{
		#Dim statusCode As %Status                       = $System.Status.OK()
		#Dim exception As %Exception.General             = ""
		#Dim restRequestVO As linker.vo.rest.RestRequest = pRequest.RestRequestVO
		//
		Set pResponse                     = ##Class(occ.bo.order.updateorders.Response).%New()
		Set restRequestVO.HttpHeaderArray = ##Class(utils.HttpBuilder).OCCBuildTokenRequestHeader(restRequestVO.Token)
		Set pResponse.RestResponseVO      = ..Put(restRequestVO)
		//Set statusCode                    = pResponse.RestResponseVO.Status
		//
		#Dim orders As %DynamicObject = ##Class(%DynamicObject).%FromJSON(pResponse.RestResponseVO.HttpResponseBody)
		//
		//Set itemLastModifiedDate = orders.items.%Get(0).lastModifiedDate
		//Set statusCode           = ##class(utils.FunctionSet).SetServicePoolingLastModifiedDate(pRequest.RestRequestVO.ServiceId, itemLastModifiedDate)
		//
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
	<MapItem MessageType="occ.bo.order.getorders.Request">
		<Method>GetOrders</Method>
	</MapItem>
		<MapItem MessageType="occ.bo.order.updateorders.Request">
		<Method>UpdateOrders</Method>
	</MapItem>
</MapItems>
}

}
