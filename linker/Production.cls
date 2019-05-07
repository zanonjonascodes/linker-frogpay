Class linker.Production Extends Ens.Production
{

Property RetryTimes As %Integer [ InitialExpression = 3 ];

Parameter SETTINGS = "RetryTimes:LINKER";

XData ProductionDefinition
{
<Production Name="linker.Production" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Phoebus Get Payments" Category="" ClassName="linker.bo.restcall.OperationREST" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="SAPB1 Login" Category="Security, SAPB1" ClassName="sapb1.bo.security.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="SAPB1 Get Token" Category="SAPB1,Security" ClassName="sapb1.bp.security.Token.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="OCC Login" Category="Security,OCC" ClassName="occ.bo.security.Operation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
  </Item>
  <Item Name="OCC Get Token" Category="" ClassName="occ.bp.security.Token.Process" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="SAPB1 Item" Category="SAPB1,Item" ClassName="sapb1.bo.item.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="OCC Insert Product" Category="OCC, Product" ClassName="occ.bo.product.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="Insert Product From Item" Category="Linker,Product,Item" ClassName="linker.bp.insertproduct.Process" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Pooling Service" Category="" ClassName="linker.bs.pooling.Service" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">3000</Setting>
  </Item>
  <Item Name="Pooling Process BPL" Category="" ClassName="linker.bp.pooling.ProcessBPL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="OCC Orders" Category="" ClassName="occ.bo.order.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
  </Item>
  <Item Name="OCC Create SKU" Category="" ClassName="occ.bo.sku.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
  </Item>
  <Item Name="OCC Create Inventory" Category="" ClassName="occ.bo.inventory.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="Save Pooling" Category="" ClassName="linker.bo.pooling.Opertaion" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="SAPB1 Business Partner" Category="" ClassName="sapb1.bo.businesspartner.Operation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="SAPB1 Order" Category="SAPB1, order" ClassName="sapb1.bo.order.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="SAPB1 Create Order BPL" Category="" ClassName="linker.bp.createorder.Process" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
  <Item Name="OCC Get Profile" Category="" ClassName="occ.bo.profile.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="Create Product Service" Category="" ClassName="linker.bs.pooling.repository.Service" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InstanceId">OCC Intragroup - KDPNEUS</Setting>
    <Setting Target="Host" Name="ServiceName">Insert Product From Item</Setting>
    <Setting Target="Adapter" Name="CallInterval">3000</Setting>
  </Item>
  <Item Name="Create Order Service" Category="" ClassName="linker.bs.pooling.repository.Service" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InstanceId">SAPB1 Intragroup - KDPNEUS</Setting>
    <Setting Target="Host" Name="ServiceName">SAPB1 Create Order BPL</Setting>
    <Setting Target="Adapter" Name="CallInterval">3000</Setting>
  </Item>
  <Item Name="SAPB1 Get Stock Movements" Category="" ClassName="sapb1.bo.stockmovements.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="SAPB1 DownPayment" Category="" ClassName="sapb1.bo.downpayment.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="SAPB1 IncomingPayment" Category="" ClassName="sapb1.bo.incomingpayment.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="SAPB1 Payment Process BPL" Category="" ClassName="sapb1.bp.payment.ProcessBPL" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="SAPB1 UDT Branch" Category="" ClassName="sapb1.bo.udtbranch.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
  </Item>
  <Item Name="SABPB1 Credit Note" Category="" ClassName="sapb1.bo.creditnote.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Order Service" Category="" ClassName="linker.bs.pooling.repository.Service" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InstanceId">SAPB1 Intragroup - KDPNEUS</Setting>
    <Setting Target="Host" Name="ServiceName">SAPB1 Create Order BPL</Setting>
    <Setting Target="Adapter" Name="CallInterval">3000</Setting>
  </Item>
  <Item Name="OCC Tracking BPL" Category="" ClassName="occ.bp.tracking.ProcessBPL" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="SAPB1 Credit Note" Category="" ClassName="sapb1.bo.creditnote.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="OCC Custom Cancel Order" Category="" ClassName="occ.custom.bo.order.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="SAPB1 Triple One" Category="" ClassName="sapb1.bo.tripleonenfe.OperationREST" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="SAPB1 NFE BPL" Category="" ClassName="sapb1.bp.nfe.ProcessBPL" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="NFE Service" Category="" ClassName="linker.bs.pooling.repository.Service" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InstanceId">OCC Intragroup - KDPNEUS</Setting>
    <Setting Target="Host" Name="ServiceName">SAPB1 NFE BPL</Setting>
    <Setting Target="Adapter" Name="CallInterval">3000</Setting>
  </Item>
  <Item Name="Pooling Phoebus Get Payments D-1" Category="" ClassName="linker.bs.pooling.Service" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InstanceName">PHOEBUS</Setting>
    <Setting Target="Host" Name="ServiceName">Get Payments D-1</Setting>
    <Setting Target="Adapter" Name="CallInterval">3600000</Setting>
  </Item>
  <Item Name="Cloud Walk Get Payments" Category="" ClassName="linker.bo.restcall.OperationREST" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">Frogpay</Setting>
  </Item>
  <Item Name="Pooling Cloud Walk Get Payments D-1" Category="" ClassName="linker.bs.pooling.Service" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InstanceName">PHOEBUS</Setting>
    <Setting Target="Host" Name="ServiceName">Get Payments D-1</Setting>
    <Setting Target="Adapter" Name="CallInterval">36000</Setting>
  </Item>
  <Item Name="Skipper Get Payments" Category="" ClassName="linker.bo.restcall.OperationREST" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="Pooling Skipper Get Payments D-1 Pago" Category="" ClassName="linker.bs.pooling.Service" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InstanceName">SKIPPER</Setting>
    <Setting Target="Host" Name="ServiceName">Get Paymens D-1 Pago</Setting>
    <Setting Target="Adapter" Name="CallInterval">36000</Setting>
  </Item>
  <Item Name="Pooling Skipper Get Payments D-1 Antecipado" Category="" ClassName="linker.bs.pooling.Service" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InstanceName">SKIPPER</Setting>
    <Setting Target="Host" Name="ServiceName">Get Paymens D-1 Antecipado</Setting>
    <Setting Target="Adapter" Name="CallInterval">36000</Setting>
  </Item>
  <Item Name="SAPB1 UDT Phoebus Transaction" Category="" ClassName="linker.bo.restcall.OperationREST" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="SAPB1 UDT Cloud Walk Transaction" Category="" ClassName="linker.bo.restcall.OperationREST" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
  </Item>
  <Item Name="Phoebus Transactions" Category="" ClassName="linker.bs.pooling.repository.Service" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InstanceId">SAPB1 FROGPAY</Setting>
    <Setting Target="Host" Name="ServiceName">Frog Pay Save Transaction</Setting>
    <Setting Target="Host" Name="TargetBusinessHost"></Setting>
  </Item>
  <Item Name="Frog Pay Save Transaction BPL" Category="" ClassName="linker.bp.frogpay.transactions.ProcessBPL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Token Manager" Category="" ClassName="linker.bo.tokenmanager.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Stone Get Conciliation" Category="" ClassName="linker.bo.restcall.OperationREST" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="SSLCheckServerIdentity">0</Setting>
    <Setting Target="Adapter" Name="SSLConfig">SAPB1</Setting>
    <Setting Target="Adapter" Name="ResponseTimeout">300</Setting>
  </Item>
  <Item Name="Pooling Stone Get Conciliation" Category="" ClassName="linker.bs.pooling.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InstanceName">STONE</Setting>
    <Setting Target="Host" Name="ServiceName">Get Conciliation</Setting>
    <Setting Target="Adapter" Name="CallInterval">36000</Setting>
  </Item>
</Production>
}

}
