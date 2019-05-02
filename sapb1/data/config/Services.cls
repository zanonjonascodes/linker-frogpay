Class linker.data.config.Services Extends %Persistent
{

Property ServiceName As %String(MAXLEN=200);

Property ResourcePath As %String(MAXLEN="");

Property Instance As linker.data.config.Instance;

Property Parameters As list of %String;

Property Pooling As %Boolean [InitialExpression = 0];

Property TargetBusinessHost As %String(MAXLEN=250);

Property TargetRequestClassName As %String(MAXLEN="250");

Property Consumer As Services;

Relationship URLS As ServicesURL [Cardinality = Children, Inverse = Service];

Index ServiceNameInstanceIdx On (ServiceName, Instance);

Query GetResourcePathByServiceNameInstance(pInstance As %Integer, pServiceName As %String = "Login") As %SQLQuery [SqlProc]
{
	SELECT Serv.ResourcePath
		  ,Serv.Instance->Host
		  ,Serv.Instance->Port
		  ,Serv.Instance->HttpsEnabled
	FROM linker_data_config.Services AS Serv  
	WHERE Serv.Instance = :pInstance And Serv.ServiceName = :pServiceName
}

Query ListAllPooling() As %SQLQuery [SqlProc]
{
	SELECT Inst.Host
	      ,Inst.HttpsEnabled
	      ,Inst.ID As InstanceId
	      ,$LISTTOSTRING(Serv.Parameters) AS Parameters
	      ,Inst.Port
	      ,Serv.ResourcePath
	      ,Serv.ID AS ServiceId
	      ,Serv.ServiceName
	      ,Serv.TargetBusinessHost
	      ,Serv.TargetRequestClassName
	      ,Inst.Type
	FROM linker_data_config.Instance AS Inst 
    INNER JOIN linker_data_config.Services AS Serv ON Serv.Instance = Inst.ID AND Pooling = 1 
}

Storage Default
{
<Data name="ServicesDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ServiceName</Value>
</Value>
<Value name="3">
<Value>ResourcePath</Value>
</Value>
<Value name="4">
<Value>Instance</Value>
</Value>
<Value name="5">
<Value>Parameters</Value>
</Value>
<Value name="6">
<Value>Pooling</Value>
</Value>
<Value name="7">
<Value>TargetBusinessHost</Value>
</Value>
<Value name="8">
<Value>TargetRequestClassName</Value>
</Value>
<Value name="9">
<Value>Consumer</Value>
</Value>
</Data>
<DataLocation>^linker.data.config.ServicesD</DataLocation>
<DefaultData>ServicesDefaultData</DefaultData>
<IdLocation>^linker.data.config.ServicesD</IdLocation>
<IndexLocation>^linker.data.config.ServicesI</IndexLocation>
<StreamLocation>^linker.data.config.ServicesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
