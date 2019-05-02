Class linker.token.Locksmith Extends %RegisteredObject
{

ClassMethod ReleaseSharedLockToken(instanceId As %String)
{
	
		//Do ..InitGlobalLockVar(instanceId)
		Lock -^InstanceTokenLockControl(instanceId)#"S"
}

ClassMethod ReleaseExclusiveLockToken(instanceId As %String)
{
	
		//Do ..InitGlobalLockVar(instanceId)
		Lock -^InstanceTokenLockControl(instanceId)#"E"
}

ClassMethod SetSharedLockToken(instanceId As %String) As %String
{
	
		//Do ..InitGlobalLockVar(instanceId)
		Lock +^InstanceTokenLockControl(instanceId)#"S"
}

ClassMethod SetExclusiveLockToken(instanceId As %String) As %String
{
		
		//Do ..InitGlobalLockVar(instanceId)
		Lock +^InstanceTokenLockControl(instanceId)#"E"
}

ClassMethod InitGlobalLockVar(instanceId) [ Private ]
{
	
		Set statusCode = $System.Status.OK()
		Set errorMessage =  "| Class: " _ $ClassName() _ " | Error message: ""Required parameter not specified in object creation."""
		Set exceptionName = "RequiredParameterNotSpecifiedException"
		
		If '($Data(instanceId)){
		
			Throw ##class(%Exception.General).%New(exceptionName,, $ClassName(), errorMessage)
		
		}Elseif (instanceId = ""){
		
			Throw ##class(%Exception.General).%New(exceptionName,, $ClassName(),errorMessage)
		
		}
	
		Set ^InstanceTokenLockControl(instanceId) = ""
}

}
