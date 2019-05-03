Class linker.Production Extends Ens.Production
{

Property RetryTimes As %Integer [ InitialExpression = 3 ];

Parameter SETTINGS = "RetryTimes:LINKER";

XData ProductionDefinition
{
<Production Name="linker.Production" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Token Manager" Category="Linker,Security" ClassName="linker.bo.tokenmanager.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="SAPB1 Get Token" Category="" ClassName="sapb1.bp.security.Token.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="SAPB1 Login" Category="" ClassName="sapb1.bo.security.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="Phoebus Get Payments" Category="" ClassName="linker.bo.restcall.OperationREST" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
</Production>
}

}
