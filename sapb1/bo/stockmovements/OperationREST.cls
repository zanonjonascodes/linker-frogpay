Class sapb1.bo.stockmovements.OperationREST Extends linker.rest.RestCall
{

Method GetStockMovements(request As sapb1.bo.stockmovements.getstockmovements.Request, response As sapb1.bo.stockmovements.getstockmovements.Response)
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As sapb1.bo.stockmovements.getstockmovements.Response = ##class(sapb1.bo.stockmovements.getstockmovements.Response).%New()
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
		#Dim jsonStockMovements As %String = ##Class(sapb1.boapi.StockMovements).BuildItemCodesJSON(restResponseVO.HttpResponseBody)
		#Dim items As %DynamicObject       = ##Class(%DynamicObject).%FromJSON(restResponseVO.HttpResponseBody)
		If ($IsObject(items))
		{
			#Dim service As linker.data.config.Services = ##Class(linker.data.config.Services).%OpenId(request.RestRequestVO.ServiceId)
			//
			If ($IsObject(items.value) && (items.value.%Size() > 0))
			{
				#Dim updateDate As %String = $Select(items.value.%Get(0).UpdateDate '= "" : items.value.%Get(0).UpdateDate, 1 : $ZDate(+$Horolog, 3))
				#Dim updateTime As %String = $Select(items.value.%Get(0).UpdateTime '= "" : items.value.%Get(0).UpdateTime, 1 : $ZTime($Piece($Horolog, ",", 2)))
				//
				Do service.Parameters.SetAt(updateDate, 1)
				Do service.Parameters.SetAt(updateDate, 2)
				Do service.Parameters.SetAt(updateTime, 3)
				//
				Set statusCode = service.%Save()
			}
		}
		Set restResponseVO.HttpResponseBody = jsonStockMovements 
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
	<MapItem MessageType="sapb1.bo.stockmovements.getstockmovements.Request"> 
		<Method>GetStockMovements</Method>
	</MapItem>
</MapItems>
}
}