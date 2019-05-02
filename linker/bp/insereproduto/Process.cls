/// 
Class linker.bp.insertproduct.Process Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='linker.bp.insertproduct.Request' response='linker.bp.insertproduct.Response' height='2000' width='2000' >
<context>
<property name='SAPToken' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='OCCToken' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SAPB1Item' type='%DynamicObject' instantiate='0' />
<property name='ProductCreated' type='%Boolean' initialexpression='0' instantiate='0' />
<property name='ProductExists' type='%Boolean' instantiate='0' />
<property name='SAPB1ItemJSON' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SAPB1ItemCode' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='ProductOCCJSON' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SkuOCCJSON' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='InventoryOCCJSON' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1000' >
<scope name='Create Product' xpos='200' ypos='250' xend='200' yend='900' >
<assign name="SAPB1Item" property="context.SAPB1Item" value="##Class(%DynamicObject).%FromJSON(request.RestRequestVO.HttpRequestBody)" action="set" xpos='200' ypos='350' />
<assign name="SAPB1ItemCode" property="context.SAPB1ItemCode" value="context.SAPB1Item.ItemCode" action="set" xpos='200' ypos='450' />
<call name='Get OCC Token' target='OCC Get Token' async='0' xpos='200' ypos='550' >
<request type='occ.bp.security.Token.Request' >
<assign property="callrequest.InstanceId" value="request.RestRequestVO.InstanceId" action="set" />
<assign property="callrequest.Url" value="&quot;https://ccadmin-test-zbxa.oracleoutsourcing.com/ccadmin/v1/login&quot;" action="set" />
</request>
<response type='occ.bp.security.Token.Response' >
<assign property="context.OCCToken" value="callresponse.Token" action="set" />
</response>
</call>
<sequence name='Product Flow' xpos='200' ypos='650' xend='200' yend='1750' >
<call name='Get Product' target='OCC Insert Product' async='0' xpos='200' ypos='250' >
<request type='occ.bo.product.existsproduct.Request' >
<assign property="callrequest.RestRequestVO.Token" value="context.OCCToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="&quot;https://ccadmin-test-zbxa.oracleoutsourcing.com/ccadmin/v1/products/&quot; _ context.SAPB1ItemCode" action="set" />
</request>
<response type='occ.bo.product.existsproduct.Response' >
<assign property="context.ProductExists" value="(callresponse.RestResponseVO.HttpStatusCode = &quot;200&quot;)" action="set" />
</response>
</call>
<if name='Is From Stock Movements?' condition='(context.SAPB1Item.ItemName = "")' xpos='200' ypos='350' xend='200' yend='700' >
<true>
<call name='Get SAP Token' target='SAPB1 Get Token' async='0' xpos='335' ypos='500' >
<request type='sapb1.bp.security.Token.Request' >
<assign property="callrequest.InstanceId" value="&quot;SAPB1 Intragroup - KDPNEUS&quot;" action="set" />
<assign property="callrequest.Url" value="&quot;https://10.10.139.12:50000/b1s/v1/Login&quot;" action="set" />
</request>
<response type='sapb1.bp.security.Token.Response' >
<assign property="context.SAPToken" value="callresponse.Token" action="set" />
</response>
</call>
<call name='Get SAPB1 Item' target='SAPB1 Item' async='0' xpos='335' ypos='600' >
<request type='linker.bo.restcall.genericoperation.Request' >
<assign property="callrequest.RestRequestVO.Token" value="context.SAPToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="&quot;https://10.10.139.12:50000/b1s/v1/Items('&quot; _ context.SAPB1ItemCode _ &quot;')&quot;" action="set" />
</request>
<response type='linker.bo.restcall.genericoperation.Response' >
<assign property="context.SAPB1Item" value="##Class(%DynamicObject).%FromJSON(callresponse.RestResponseVO.HttpResponseBody)" action="set" />
</response>
</call>
</true>
</if>
<transform name='FromItemToProduct' class='occ.dt.product.FromItemToProduct' source='context' target='context.ProductOCCJSON' xpos='200' ypos='800' />
<transform name='FromItemToSKU' class='occ.dt.sku.FromItemToSKU' source='context' target='context.SkuOCCJSON' xpos='200' ypos='900' />
<transform name='FromItemToInventory' class='occ.dt.inventory.FromItemToInventory' source='context' target='context.InventoryOCCJSON' xpos='200' ypos='1000' />
<if name='Product Exists?' condition='context.ProductExists' xpos='200' ypos='1100' xend='200' yend='1650' >
<true>
<call name='OCC Update Product' target='OCC Insert Product' async='0' xpos='200' ypos='1250' >
<request type='occ.bo.product.updateproduct.Request' >
<assign property="callrequest.RestRequestVO.Token" value="context.OCCToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="&quot;https://ccadmin-test-zbxa.oracleoutsourcing.com/ccadmin/v1/products/&quot; _ context.SAPB1ItemCode" action="set" />
<assign property="callrequest.RestRequestVO.HttpRequestBody" value="context.ProductOCCJSON" action="set" />
</request>
<response type='occ.bo.product.updateproduct.Response' >
<assign property="response.Status" value="callresponse.RestResponseVO.Status" action="set" />
</response>
</call>
<call name='OCC Update Inventory' target='OCC Create Inventory' async='0' xpos='200' ypos='1350' >
<request type='occ.bo.inventory.updateinventory.Request' >
<assign property="callrequest.RestRequestVO.HttpRequestBody" value="context.InventoryOCCJSON" action="set" />
<assign property="callrequest.RestRequestVO.Token" value="context.OCCToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="&quot;https://ccadmin-test-zbxa.oracleoutsourcing.com/ccadmin/v1/inventories/&quot;_ context.SAPB1ItemCode" action="set" />
</request>
<response type='occ.bo.product.insertproduct.Response' />
</call>
</true>
<false>
<assign name="Product Created" property="context.ProductCreated" value="1" action="set" xpos='470' ypos='1250' />
<call name='Insert OCC Product' target='OCC Insert Product' async='0' xpos='470' ypos='1350' >
<request type='occ.bo.product.insertproduct.Request' >
<assign property="callrequest.RestRequestVO.HttpRequestBody" value="context.ProductOCCJSON" action="set" />
<assign property="callrequest.RestRequestVO.Token" value="context.OCCToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="&quot;https://ccadmin-test-zbxa.oracleoutsourcing.com/ccadmin/v1/products&quot;" action="set" />
</request>
<response type='occ.bo.product.insertproduct.Response' />
</call>
<call name='OCC Create SKU' target='OCC Create SKU' async='0' xpos='470' ypos='1450' >
<request type='occ.bo.sku.createsku.Request' >
<assign property="callrequest.RestRequestVO.HttpRequestBody" value="context.SkuOCCJSON" action="set" />
<assign property="callrequest.RestRequestVO.Token" value="context.OCCToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="&quot;https://ccadmin-test-zbxa.oracleoutsourcing.com/ccadmin/v1/skus&quot;" action="set" />
</request>
<response type='occ.bo.product.insertproduct.Response' />
</call>
<call name='OCC Create Inventory' target='OCC Create Inventory' async='0' xpos='470' ypos='1550' >
<request type='occ.bo.inventory.createinventory.Request' >
<assign property="callrequest.RestRequestVO.HttpRequestBody" value="context.InventoryOCCJSON" action="set" />
<assign property="callrequest.RestRequestVO.Token" value="context.OCCToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="&quot;https://ccadmin-test-zbxa.oracleoutsourcing.com/ccadmin/v1/inventories&quot;" action="set" />
</request>
<response type='occ.bo.product.insertproduct.Response' />
</call>
</false>
</if>
</sequence>
<faulthandlers>
<catchall xpos='200' ypos='750' xend='200' yend='650' >
<if name='Product Created?' condition='context.ProductCreated' xpos='200' ypos='150' xend='335' yend='400' >
<true>
<call name='Delete Product' target='OCC Insert Product' async='1' xpos='335' ypos='300' >
<request type='occ.bo.product.deleteproduct.Request' >
<assign property="callrequest.RestRequestVO.Token" value="context.OCCToken" action="set" />
<assign property="callrequest.RestRequestVO.HttpRequestBody" value="callrequest.RestRequestVO.HttpRequestBody" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="&quot;https://ccadmin-test-zbxa.oracleoutsourcing.com/ccadmin/v1/products/&quot; _ context.SAPB1Item.ItemCode" action="set" />
</request>
<response type='Ens.Response' />
</call>
</true>
</if>
</catchall>
</faulthandlers>
</scope>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
