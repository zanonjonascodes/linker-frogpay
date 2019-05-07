Class linker.bs.pooling.repository.Service Extends Ens.BusinessService
{

Parameter ADAPTER = "Ens.InboundAdapter";

Property Adapter As Ens.InboundAdapter; 

/// Service name used to query repository
Property ServiceName As %String;

/// Instance name used to query repository
Property InstanceId As %String;

Property TargetBusinessHost As %String(MAXLEN="250");

Parameter SETTINGS = "ServiceName:linker,InstanceId:linker,TargetBusinessHost:linker";

/// Check for all Services that has configured to be polled.
Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
	Try
	{
		#Dim exception As %Exception.General = ""
		#Dim statusCode As %Status           = $System.Status.OK()
		#Dim spContext As %ProcedureContext  = ""
		//
		Set spContext = ##Class(%SQL.Statement).%ExecDirect(,"CALL linker_data.Repository_ListByServiceNameInstanceId(?, ?)", ..ServiceName, ..InstanceId)
		//
        While (spContext.%Next(.statusCode))
        {
        	If ($System.Status.IsError(statusCode))
        	{
        		Throw ##Class(%Exception.StatusException).CreateFromStatus(statusCode)
        	}
        	Set request                               = $ClassMethod(spContext.%Get("TargetRequestClassName"), "%New")
        	Set request.RestRequestVO                 = ##Class(linker.vo.rest.RestRequest).%New()
        	Set request.RestRequestVO.HttpRequestBody = spContext.%Get("JSONString")
        	Set request.RestRequestVO.InstanceId      = spContext.%Get("InstanceId")
        	Set request.RestRequestVO.ServiceId       = spContext.%Get("ServiceId")
        	Set request.RestRequestVO.RepositoryId    = spContext.%Get("ID")
        	// 
        	#Dim targetBusinessHost As %String        = $Select(..TargetBusinessHost = "" : spContext.%Get("TargetBusinessHost"), 1 : ..TargetBusinessHost)
        	#Dim repository As linker.data.Repository = ##Class(linker.data.Repository).%OpenId(spContext.%Get("ID")) 
        	//
        	Set repository.Status = 2
        	Set statusCode        = repository.%Save()
        	//
        	If ($System.Status.IsError(statusCode))
        	{        	
        		Throw ##Class(%Exception.StatusException).CreateFromStatus(statusCode)
        	}
        	Set ..%SessionId = "" // force to always create a new session        	
        	Set statusCode   = ..SendRequestAsync(targetBusinessHost, request)
        	//
        	If ($System.Status.IsError(statusCode))
        	{        	
        		Throw ##Class(%Exception.StatusException).CreateFromStatus(statusCode)
        	}
        	Set repository.SessionId = ..%SessionId
        	Set statusCode           = repository.%Save()
        	//
        	If ($System.Status.IsError(statusCode))
        	{        	
        		Throw ##Class(%Exception.StatusException).CreateFromStatus(statusCode)
        	}
        }
	}
	Catch(exception)
	{
		#Dim errorMessage As %String = exception.DisplayString()
		//
		$$$LOGERROR(errorMessage)
		//
		Set statusCode = exception.AsStatus()
	}
	Return statusCode
}


}