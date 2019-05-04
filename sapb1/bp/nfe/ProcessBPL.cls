/// 
Class sapb1.bp.nfe.ProcessBPL Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='sapb1.bp.nfe.get.Request' response='sapb1.bp.nfe.get.Response' height='2000' width='2000' >
<context>
<property name='DadosNFE' type='%DynamicObject' instantiate='0' />
<property name='CancelOrderURL' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='UOCCOrderId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='OCCOrderId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='OCCToken' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SAPB1Token' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SAPB1Order' type='%DynamicObject' instantiate='0' />
<property name='OCCOrder' type='%DynamicObject' instantiate='0' />
</context>
<sequence xend='200' yend='1750' >
<assign name="DadosNFE" property="context.DadosNFE" value="##Class(%DynamicObject).%FromJSON(request.RestRequestVO.HttpRequestBody)" action="set" xpos='200' ypos='250' />
<assign name="UOCCOrderId" property="context.UOCCOrderId" value="context.DadosNFE.Orders.CardCode" action="set" xpos='200' ypos='350' />
<assign name="OCCOrderId" property="context.OCCOrderId" value="$Piece(context.UOCCOrderId, &quot;_&quot;, 2)" action="set" xpos='200' ypos='450' />
<flow xpos='200' ypos='550' xend='200' yend='1100' >
<sequence >
<call name='Get SAP Token' target='SAPB1 Get Token' async='0' xpos='200' ypos='700' >
<request type='sapb1.bp.security.Token.Request' >
<assign property="callrequest.InstanceId" value="&quot;SAPB1 Intragroup - KDPNEUS&quot;" action="set" />
<assign property="callrequest.Url" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(&quot;SAPB1 Intragroup - KDPNEUS&quot;, &quot;Login&quot;)" action="set" />
</request>
<response type='sapb1.bp.security.Token.Response' >
<assign property="context.SAPB1Token" value="callresponse.Token" action="set" />
</response>
</call>
<assign name="SAPB1GetOrderURL" property="context.SAPB1GetOrderURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(&quot;SAPB1 Intragroup - KDPNEUS&quot;, &quot;SAPB1 Get Order&quot;)" action="set" xpos='200' ypos='800' />
<assign name="Set OrderId OrderURL" property="context.SAPB1GetOrderURL" value="##Class(utils.FunctionSet).BuildRestUrlParameters(context.SAPB1GetOrderURL, context.UOCCOrderId)" action="set" xpos='200' ypos='900' />
<call name='SAPB1 Get Order' target='SAPB1 Order' async='0' xpos='200' ypos='1000' >
<request type='sapb1.bo.order.getorder.Request' >
<assign property="callrequest.RestRequestVO.Token" value="context.SAPToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="context.SAPB1GetOrderURL" action="set" />
</request>
<response type='sapb1.bo.order.getorder.Response' >
<assign property="context.SAPB1Order" value="##Class(%DynamicObject).%FromJSON(callresponse.RestResponseVO.HttpResponseBody)" action="set" />
</response>
</call>
</sequence>
<sequence >
<call name='Get OCC Token' target='OCC Get Token' async='0' xpos='470' ypos='700' >
<request type='occ.bp.security.Token.Request' >
<assign property="callrequest.InstanceId" value="&quot;OCC Intragroup - KDPNEUS&quot;" action="set" />
<assign property="callrequest.Url" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(&quot;OCC Intragroup - KDPNEUS&quot;, &quot;Login&quot;)" action="set" />
</request>
<response type='occ.bp.security.Token.Response' >
<assign property="context.OCCToken" value="callresponse.Token" action="set" />
</response>
</call>
<assign name="OCCGetOrderURL" property="context.OCCGetOrderURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(&quot;OCC Intragroup - KDPNEUS&quot;, &quot;OCC Get Order&quot;)" action="set" xpos='470' ypos='800' />
<assign name="Set OrderId OrderURL" property="context.OCCGetOrderURL" value="##Class(utils.FunctionSet).BuildRestUrlParameters(context.OCCGetOrderURL, context.OCCOrderId)" action="set" xpos='470' ypos='900' />
<call name='OCC Get Order' target='SAPB1 Order' async='0' xpos='470' ypos='1000' >
<request type='occ.bo.order.getorders.Request' >
<assign property="callrequest.RestRequestVO.Token" value="context.SAPToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="context.SAPB1GetOrderURL" action="set" />
</request>
<response type='occ.bo.order.getorders.Response' >
<assign property="context.OCCOrder" value="##Class(%DynamicObject).%FromJSON(callresponse.RestResponseVO.HttpResponseBody)" action="set" />
</response>
</call>
</sequence>
</flow>
<if name='Update Tracking?' condition='context.DadosNFE."U_SKL25NFE"."U_cdErro" = 100' xpos='200' ypos='1200' xend='200' yend='1650' >
<true>
<call name='OCC Tracking BPL' target='OCC Tracking BPL' async='1' xpos='200' ypos='1350' >
<request type='occ.bp.tracking.Request' >
<assign property="callrequest.NFETripleOne" value="context.DadosNFE" action="set" />
<assign property="callrequest.OCCOrder" value="context.OCCOrder" action="set" />
<assign property="callrequest.SAPB1Order" value="context.SAPB1Order" action="set" />
<assign property="callrequest.OrderState" value="&quot;InvoiceSubmitted&quot;" action="set" />
</request>
<response type='Ens.Response' />
</call>
</true>
<false>
<assign name="CancelOrderURL " property="context.CancelOrderURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(request.InstanceId, &quot;OCC Custom Cancel Order&quot;)" action="set" xpos='470' ypos='1350' />
<assign name="Set OCC OrderId URL" property="context.CancelOrderURL" value="##Class(utils.FunctionSet).BuildRestUrlParameters(context.CancelOrderURL, context.OCCOrderId)" action="set" xpos='470' ypos='1450' />
<call name='SAPB1 Triple One' target='OCC Custom Cancel Order' async='1' xpos='470' ypos='1550' >
<request type='occ.bo.nfe.delete.Request' >
<assign property="callrequest.RestRequestVO.URL" value="context.CancelOrderURL" action="set" />
<assign property="callrequest.RestRequestVO.Token" value="context.OCCToken" action="set" />
</request>
<response type='occ.custom.bo.order.cancel.Response' />
</call>
</false>
</if>
</sequence>
</process>
}

}
