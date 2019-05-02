Class linker.bs.pooling.Service Extends Ens.BusinessService
{

Parameter ADAPTER = "Ens.InboundAdapter";

/// Check for all Services that has configured to be polled.
Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
	Try
	{
		#Dim exception As %Exception.General = ""
		#Dim statusCode As %Status           = $System.Status.OK()
		#Dim spContext As %ProcedureContext  = ""
		//
		Set spContext = ##Class(%SQL.Statement).%ExecDirect(,"CALL linker_data_config.Services_ListAllPooling() ")
		//
        While (spContext.%Next(.statusCode))
        {
        	If ($System.Status.IsError(statusCode))
        	{
        		Throw ##Class(%Exception.StatusException).CreateFromStatus(statusCode)
        	}
        	//
        	#Dim request As linker.bp.pooling.Request   = ##Class(linker.bp.pooling.Request).%New()
        	//
        	Set request.Host                   = spContext.%Get("Host")
        	Set request.HttpsEnabled           = spContext.%Get("HttpsEnabled")
        	Set request.InstanceId             = spContext.%Get("InstanceId")
        	Set request.Parameters             = spContext.%Get("Parameters")
        	Set request.Port                   = spContext.%Get("Port")
        	Set request.ResourcePath           = spContext.%Get("ResourcePath")
        	Set request.ServiceId              = spContext.%Get("ServiceId")
        	Set request.ServiceName            = spContext.%Get("ServiceName")
        	Set request.TargetBusinessHost     = spContext.%Get("TargetBusinessHost")
        	Set request.TargetRequestClassName = spContext.%Get("TargetRequestClassName")
        	Set request.Type                   = spContext.%Get("Type")      
        	Set ..%SessionId                   = "" // force to always create a new session
        	Set statusCode                     = ..SendRequestAsync("Pooling Process BPL", request)
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
