Class occ.bo.inventory.OperationREST Extends linker.rest.RestCall
{

Method CreateInventory(request As occ.bo.inventory.createinventory.Request, Output response As occ.bo.inventory.createinventory.Response) As %Status
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As occ.bo.inventory.createinventory.Response = ##class(occ.bo.inventory.createinventory.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
		#Dim inventory As occ.boapi.Inventory = ##class(occ.boapi.Inventory).%New()
		//
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).OCCBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Post(restRequestVO)
		Set response.RestResponseVO = restResponseVO
		//
	}
	Catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
		Throw e
	}
	Return statusCode
}

Method UpdateInventory(request As occ.bo.inventory.updateinventory.Request, Output response As occ.bo.inventory.updateinventory.Response) As %Status
{
	Try
	{
		Set statusCode = $System.Status.OK()
		//
		#Dim response As occ.bo.inventory.updateinventory.Response = ##class(occ.bo.inventory.updateinventory.Response).%New()
		#Dim restRequestVO As linker.vo.rest.RestRequest = request.RestRequestVO
		#Dim inventory As occ.boapi.Inventory = ##class(occ.boapi.Inventory).%New()
		//
		Set restRequestVO.HttpHeaderArray = ##class(utils.HttpBuilder).OCCBuildTokenRequestHeader(restRequestVO.Token)
		//
		#Dim restResponseVO As linker.vo.rest.RestResponse = ..Put(restRequestVO)
		Set response.RestResponseVO = restResponseVO
		//
	}catch(e)
	{
		Set statusCode = e.AsStatus()
		Set errorText = $System.Status.GetErrorText(statusCode)
		Throw e
	}
	//
	Return statusCode
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="occ.bo.inventory.updateinventory.Request"> 
		<Method>UpdateInventory</Method>
	</MapItem>
	<MapItem MessageType="occ.bo.inventory.createinventory.Request"> 
		<Method>CreateInventory</Method>
	</MapItem>
</MapItems>
}

}
