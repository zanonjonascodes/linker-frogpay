/// <p>
///   <b>2019-04-08 - Cristiano Jose da Silva</b><br>
///   Class to store all JSON to be processed
/// </p>
Class linker.data.Repository Extends (%Persistent, %XML.Adaptor)
{

/// Store entire JSON string to be processed
Property JSONString As %String(MAXLEN = "");

/// Reference to the service (is not a business service) configurarion.
Property Service As linker.data.config.Services;

/// IRIS SessionID used to trace message
Property SessionId As %Integer;

/// Control status
Property Status As %String(VALUELIST = ",1,2,3,4,5", DISPLAYLIST=",Created,Processing,Processed,Discarded,Error") [InitialExpression = 1 ];

/// Timestamp of creation
Property TimeCreated As %TimeStamp [ InitialExpression = {##Class(%UTC).NowLocal()}];

/// Timestamp of end of process
Property TimeProcessed As %TimeStamp;

Property ErrorMessage As %String(MAXLEN="");

/// Times to retry to reprocess a a error processing
Property RetryTimes As %Integer;

Index Extent [ Extent, Type = bitmap ];

Index TimeCreated On TimeCreated;

Index StatusIdx On Status [ Type = bitmap];

Index ServiceIdx On Service;

/// Create a new entry to be processed
ClassMethod CreateEntry(pJSONString As %String, pService As linker.data.config.Services)
{
	Try
	{
		#Dim exception As %Exception.General = ""
		#Dim statusCode As %Status           = $System.Status.OK()
		#Dim entry As Repository             = ..%New()
		//
		Set entry.JSONString = pJSONString
		Set entry.Service    = pService
		//
		Set statusCode = entry.%Save()
		//
		If ($System.Status.IsError(statusCode))
		{
			Throw ##Class(%Exception.StatusException).CreateFromStatus(statusCode)
		}
	}
	Catch(exception)
	{
		Throw exception
	}
}

ClassMethod SetStatus(pRepositoryId As %Integer, pStatus As %String, pErrorMessage As %String)
{
	Try
	{
		#Dim exception As %Exception.General = ""
		#Dim statusCode As %Status           = $System.Status.OK()
		#Dim entry As Repository             = ..%OpenId(pRepositoryId)
		//
		Set entry.ErrorMessage = ErrorMessage
		Set entry.Service      = pService
		Set entry.Status       = entry.StatusDisplayToLogical(pStatus)
		Set entry.RetryTimes   = $Increment(entry.RetryTimes)
		Set statusCode         = entry.%Save()
		//
		If ($System.Status.IsError(statusCode))
		{
			Throw ##Class(%Exception.StatusException).CreateFromStatus(statusCode)
		}
	}
	Catch(exception)
	{
		Throw exception
	}
}

Query ListByServiceNameInstanceId(pServiceName As %String, pInstanceId As %String, pRetryTimes As %Integer) As %SQLQuery(SELECTMODE = "ODBC") [SQLProc]
{
	SELECT Id
	      ,Service->Id As ServiceId
	      ,Service->Instance->Id AS InstanceId
	      ,JSONString
	      ,Service->TargetBusinessHost
	      ,Service->TargetRequestClassName
	FROM linker_data.Repository
	WHERE (((Service->ServiceName = :pServiceName) AND 
	      (Service->Instance = :pInstanceId)) AND 
	      (%EXTERNAL(Status) = 'Created') OR 
	      ((%EXTERNAL(Status) = 'Error') AND (RetryTimes < :pRetryTimes)))
}

Storage Default
{
<Data name="RepositoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>JSONString</Value>
</Value>
<Value name="3">
<Value>Service</Value>
</Value>
<Value name="4">
<Value>SessionId</Value>
</Value>
<Value name="5">
<Value>Status</Value>
</Value>
<Value name="6">
<Value>TimeCreated</Value>
</Value>
<Value name="7">
<Value>TimeProcessed</Value>
</Value>
<Value name="8">
<Value>ErrorMessage</Value>
</Value>
<Value name="9">
<Value>RetryTimes</Value>
</Value>
</Data>
<DataLocation>^linker.data.RepositoryD</DataLocation>
<DefaultData>RepositoryDefaultData</DefaultData>
<IdLocation>^linker.data.RepositoryD</IdLocation>
<IndexLocation>^linker.data.RepositoryI</IndexLocation>
<StreamLocation>^linker.data.RepositoryS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}