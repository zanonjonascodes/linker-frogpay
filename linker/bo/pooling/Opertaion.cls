Class linker.bo.pooling.Opertaion Extends Ens.BusinessOperation
{

Method SaveInRepository(pRequest As linker.bo.pooling.saveinrepository.Request, Output pResponse As linker.bo.pooling.saveinrepository.Response) As %Status 
{
	Try
	{
		#Dim exception As %Exception.General = ""
		#Dim statusCode As %Status           = $System.Status.OK()
		//
		Set pResponse         = ##Class(linker.bo.pooling.saveinrepository.Response).%New()
		Set pResponse.NextURL = ##Class(linker.boapi.Pooling).ProcessJson(pRequest) 
	}
	Catch (exception)
	{
		Set statusCode = exception.AsStatus()
	}
	Return statusCode
}

Method SetStatusRepository(pRequest As linker.bo.pooling.setstatusrepository.Request, Output pResponse As Ens.Response) As %Status 
{
	Try
	{
		#Dim exception As %Exception.General = ""
		#Dim statusCode As %Status           = $System.Status.OK()
		//
		Do ##Class(linker.data.Repository).SetStatus(pRequest.RepositoryId, pRequest.Status, pRequest.ErrorMessage)
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
	<MapItem MessageType="linker.bo.pooling.saveinrepository.Request"> 
		<Method>SaveInRepository</Method>
	</MapItem>
	<MapItem MessageType="linker.bo.pooling.setstatusrepository.Request"> 
		<Method>SetStatusRepository</Method>
	</MapItem>
</MapItems>
}

}