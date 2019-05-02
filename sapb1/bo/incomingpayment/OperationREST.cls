Class sapb1.bo.incomingpayment.OperationREST Extends linker.rest.RestCall
{

Method CreateIncomingPayment(request As sapb1.bo.incomingpayment.createincomingpayment.Request, Output response As sapb1.bo.incomingpayment.createincomingpayment.Response)
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As sapb1.bo.incomingpayment.createincomingpayment.Response = ##class(sapb1.bo.incomingpayment.createincomingpayment.Response).%New()
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

XData MessageMap
{
<MapItems>
	<MapItem MessageType="sapb1.bo.incomingpayment.createincomingpayment.Request"> 
		<Method>CreateIncomingPayment</Method>
	</MapItem>
</MapItems>
}

}
