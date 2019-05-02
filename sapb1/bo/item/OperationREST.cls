Class sapb1.bo.item.OperationREST Extends linker.rest.RestCall
{

Parameter INVOCATION = "Queue";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Method GetItem(request As linker.bo.restcall.genericoperation.Request, response As linker.bo.restcall.genericoperation.Response) As %Status
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As sapb1.bo.item.getitem.Response  = ##class(linker.bo.restcall.genericoperation.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO 
		//
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).SAPBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Get(restRequestVO)
		//
		If $System.Status.IsError(restResponseVO.Status)
		{ 
			Throw ##Class(%Exception.StatusException).CreateFromStatus(restResponseVO.Status)
		}
		//
		Set response.RestResponseVO = restResponseVO
		//
		#Dim items As %DynamicObject = ##Class(%DynamicObject).%FromJSON(response.RestResponseVO.HttpResponseBody)		
		If ($IsObject(items))
		{
			#Dim service As linker.data.config.Services = ##Class(linker.data.config.Services).%OpenId(request.RestRequestVO.ServiceId)
			//
			If ($IsObject(items.value) && (items.value.%Size() > 0))
			{
			   
				#Dim createDate As %String = $Select(items.value.%Get(0).CreateDate '= "" : items.value.%Get(0).CreateDate, 1 : $ZDate(+$Horolog, 3)) 
				#Dim createTime As %String = $Select(items.value.%Get(0).CreateTime '= "" : items.value.%Get(0).CreateTime, 1 : $ZTime($Piece($Horolog, ",", 2)))
				#Dim updateDate As %String = $Select(items.value.%Get(0).UpdateDate '= "" : items.value.%Get(0).UpdateDate, 1 : $ZDate(+$Horolog, 3))
				#Dim updateTime As %String = $Select(items.value.%Get(0).UpdateTime '= "" : items.value.%Get(0).UpdateTime, 1 : $ZTime($Piece($Horolog, ",", 2)))
				//
				Do service.Parameters.SetAt(createDate, 1)
				Do service.Parameters.SetAt(createDate, 2)
				Do service.Parameters.SetAt(createTime, 3)
				Do service.Parameters.SetAt(createDate, 4)
				Do service.Parameters.SetAt(createDate, 5)
				Do service.Parameters.SetAt(createTime, 6)
				Do service.Parameters.SetAt(updateDate, 7)
				Do service.Parameters.SetAt(updateDate, 8)
				Do service.Parameters.SetAt(updateTime, 9)
				Do service.Parameters.SetAt(updateDate, 10)
				Do service.Parameters.SetAt(updateDate, 11)
				Do service.Parameters.SetAt(updateTime, 12)
				//
				Set statusCode = service.%Save()
			}
		}		
	}catch(e)
	{
	//
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
	//
	}
	//
	Return statusCode
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="linker.bo.restcall.genericoperation.Request"> 
		<Method>GetItem</Method>
	</MapItem>
</MapItems>
}
}
