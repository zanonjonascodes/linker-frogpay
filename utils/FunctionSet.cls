Class utils.FunctionSet Extends Ens.Rule.FunctionSet
{

ClassMethod GetResourcePathByServiceNameInstance(instance As %Integer, serviceName As %String = "Login") As %String [Final]
{
	#Dim spContext As %ProcedureContext = ""
	//
	Set spContext = ##Class(%SQL.Statement).%ExecDirect(,"CALL linker_data_config.Services_GetResourcePathByServiceNameInstance(?,?) ", instance, serviceName)
	//	
	If (spContext.%Next())
	{
		Set protocol = $Select(spContext.%Get("HttpsEnabled"):"https",1:"http") 
		Set port = spContext.%Get("Port")
		Set host = spContext.%Get("Host")
		Set resourcePath = spContext.%Get("ResourcePath")
		//
		Return protocol _ "://" _ host _ ":" _ port _ resourcePath
	}
	Return ""
}

ClassMethod BuildRestUrlParameters(pResourcePath As %String,  pParameters As %String) As %String [Final]
{
	#Dim index As %Integer    = 1
	#Dim resourcePath         = pResourcePath
	#Dim parameter As %String = ""
	//
	For index = 1 : 1 : $Length(pParameters, ",")
	{
		Set parameter    = $Piece(pParameters, ",", index)
		Set resourcePath = $Replace(resourcePath, "*", parameter, 1, 1)
	}
	If ($Find(resourcePath,  "?"))
	{
		Set resourcePath = $Piece(resourcePath, "?", 1) _ "?" _ ##Class(%CSP.Page).EscapeURL($Piece(resourcePath, "?", 2))
	}
	Return resourcePath
}

ClassMethod SetServicePoolingLastModifiedDate(serviceId As %String, lastModifiedDate As %String) As %Status [Final]
{
	#Dim service As linker.data.config.Services = ##Class(linker.data.config.Services).%OpenId(serviceId)
	Do service.Parameters.SetAt(lastModifiedDate, 1)
	
	Return service.%Save()
}

ClassMethod AssingJsonNullIfEmpty(pObject As %DynamicObject, pPropertyName As %String, pValue As %String)
{
	If (pValue = "")
	{
		Do pObject.%Set(pPropertyName, pValue, "null")
	}
	Else
	{
		Do pObject.%Set(pPropertyName, pValue)
	}
}

ClassMethod EscapeJSON(pValue As %String) As %String
{
	Return $Translate(pValue, "È…Í ÌÕÁ„√·¡˙Ù‘Û”","eeeeiicaAaAuoOoo")
}

ClassMethod MD5Hash(pValue As %String) As %String
{
	#Dim binHash As %String    = $System.Encryption.MD5Hash(text)
	#Dim hexHash As %String    = ""
	#Dim indexChar As %Integer = 0
	//
	For indexChar = 1 : 1 : $Length(binHash)
	{
		Set hexChar = $ZHex($Ascii($Extract(binHash, indexChar)))
	}
	Return hexChar
}

}