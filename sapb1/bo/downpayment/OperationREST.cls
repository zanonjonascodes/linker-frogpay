Class sapb1.bo.downpayment.OperationREST Extends linker.rest.RestCall
{

Method CreateDownPayment(request As sapb1.bo.downpayment.createdownpayment.Request, Output response As sapb1.bo.downpayment.createdownpayment.Response)
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As sapb1.bo.downpayment.createdownpayment.Response = ##class(sapb1.bo.downpayment.createdownpayment.Response).%New()
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

Method GetDownPayment(request As sapb1.bo.downpayment.getdownpayment.Request, Output response As sapb1.bo.downpayment.getdownpayment.Response)
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As sapb1.bo.downpayment.getdownpayment.Response = ##class(sapb1.bo.downpayment.getdownpayment.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
		//
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).SAPBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Get(restRequestVO)
		Set response.RestResponseVO = restResponseVO
		#Dim items As %DynamicObject       = ##Class(%DynamicObject).%FromJSON(restResponseVO.HttpResponseBody)
		//
		If ($IsObject(items))
		{
			#Dim service As linker.data.config.Services = ##Class(linker.data.config.Services).%OpenId(request.RestRequestVO.ServiceId)
			//
			If ($IsObject(items.value) && (items.value.%Size() > 0))
			{
				#Dim updateDate As %String = $Select(items.value.%Get(0).UpdateDate '= "" : items.value.%Get(0).Invoices.UpdateDate, 1 : $ZDate(+$Horolog, 3))
				#Dim updateTime As %String = $Select(items.value.%Get(0).UpdateTime '= "" : items.value.%Get(0).Invoices.UpdateTime, 1 : $ZTime($Piece($Horolog, ",", 2)))
				//
				Do service.Parameters.SetAt(updateDate, 1)
				Do service.Parameters.SetAt(updateDate, 2)
				Do service.Parameters.SetAt(updateTime, 3)
				//
				Set statusCode = service.%Save()
			}
		}
	}catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	}
	Return statusCode
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="sapb1.bo.downpayment.createdownpayment.Request"> 
		<Method>CreateDownPayment</Method>
	</MapItem>
	<MapItem MessageType="sapb1.bo.downpayment.getdownpayment.Request"> 
		<Method>GetDownPayment</Method>
	</MapItem>
</MapItems>
}

}
