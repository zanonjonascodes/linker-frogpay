/// <p>
///  <b>2019-04-04 - Cristiano José a Silva</b>
/// </p>
Class linker.dt.pooling.FromPoolingRequestToCallRequest Extends (Ens.DataTransform, utils.FunctionSet)
{

ClassMethod Transform(pSource As %RegisteredObject, ByRef pTarget As %RegisteredObject, ByRef Aux) As %Status
{
	Try
	{
		#Dim status As %Status                                     = $System.Status.OK()
		#Dim source As linker.bp.pooling.Request                   = pSource
		#Dim target As linker.bo.restcall.genericoperation.Request = "" 
		#Dim context As linker.bp.pooling.ProcessBPL.Context       = pTarget
		#Dim exception As %Exception.General                       = ""
		#Dim requestVO As linker.vo.rest.RestRequest               = ##Class(linker.vo.rest.RestRequest).%New()
		//
		Set requestVO.InstanceId   = source.InstanceId
		Set requestVO.ServiceId    = source.ServiceId
		Set requestVO.URL          = $Select(source.HttpsEnabled : "https", 1 : "http") _ "://" _ source.Host _ ":" _ source.Port 
  		Set requestVO.URL          = requestVO.URL _ ..BuildRestUrlParameters(source.ResourcePath, source.Parameters)
		Set target                 = $ClassMethod(source.TargetRequestClassName, "%New")
		Set target.RestRequestVO   = requestVO
		//
		Do target.SetHeaderToken(source.InstanceId)
		//
		Set context.ServiceRequest = target  
	}
	Catch (exception)
	{
		Set status = exception.AsStatus()
	}
	Return status
}

}
