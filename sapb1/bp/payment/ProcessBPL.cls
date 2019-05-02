/// 
Class sapb1.bp.payment.ProcessBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='sapb1.bp.payment.Request' response='Ens.Response' height='2450' width='2000' >
<context>
<property name='SAPB1LoginURL' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='250' />
</parameters>
</property>
<property name='SAPB1Token' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='OCCLoginURL' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='250' />
</parameters>
</property>
<property name='OCCToken' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SAPB1Order' type='%DynamicObject' instantiate='0' />
<property name='OCCOrder' type='%DynamicObject' instantiate='0' />
<property name='DonwPaymentDocEntry' type='%String' initialexpression='""' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='DownPayment' type='%DynamicObject' instantiate='0' />
<property name='GetDownPaymentURL' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SAPB1OrderDocEntry' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='IncomingPaymentJSON' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='DownPaymentJSON' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='PaymentType' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='CreateIncomingPaymentURL' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='UpdateTrackingResponse' type='occ.bp.tracking.Response' instantiate='0' />
</context>
<sequence xend='200' yend='2200' >
<flow xpos='200' ypos='250' xend='200' yend='500' >
<sequence >
<sequence name='OCC Login' xpos='200' ypos='400' xend='200' yend='450' disabled="true">
<assign name="OCC Login URL" property="context.LoginURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(request.InstanceId)" action="set" xpos='200' ypos='250' />
<call name='OCC Login' target='OCC Login' async='0' xpos='200' ypos='350' >
<request type='occ.bo.security.login.Request' >
<assign property="callrequest.InstanceId" value="request.RestRequestVO.InstanceId" action="set" />
<assign property="callrequest.Url" value="context.OCCLoginURL" action="set" />
</request>
<response type='occ.bo.security.login.Response' >
<assign property="context.OCCToken" value="callresponse.Token" action="set" />
</response>
</call>
</sequence>
</sequence>
<sequence >
<sequence name='SAPB1 Login' xpos='470' ypos='400' xend='200' yend='450' >
<assign name="SAPB1 Login URL" property="context.SAPB1LoginURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(request.InstanceId)" action="set" xpos='200' ypos='250' />
<call name='SAPB1 Login' target='SAPB1 Get Token' async='0' xpos='200' ypos='350' >
<request type='sapb1.bp.security.Token.Request' >
<assign property="callrequest.InstanceId" value="request.InstanceId" action="set" />
<assign property="callrequest.Url" value="context.SAPB1LoginURL" action="set" />
</request>
<response type='sapb1.bp.security.Token.Response' >
<assign property="context.SAPB1Token" value="callresponse.Token" action="set" />
</response>
</call>
</sequence>
</sequence>
<sequence >
<sequence name='Assing Orders' xpos='740' ypos='400' xend='200' yend='550' >
<assign name="OCCOrder" property="context.OCCOrder" value="##Class(%DynamicObject).%FromJSON(request.OCCOrder)" action="set" xpos='200' ypos='250' />
<assign name="SAPB1Order" property="context.SAPB1Order" value="##Class(%DynamicObject).%FromJSON(request.SAPB1Order)" action="set" xpos='200' ypos='350' />
<assign name="SAPB1OrderDocEntry" property="context.SAPB1OrderDocEntry" value="context.SAPB1Order.value.%Get(0).DocEntry" action="set" xpos='200' ypos='450' />
</sequence>
</sequence>
</flow>
<assign name="Get DownPayment URL" property="context.GetDownPaymentURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(&quot;SAPB1 Intragroup - KDPNEUS&quot;, &quot;SAPB1 Get Down Payments&quot;)" action="set" xpos='200' ypos='600' />
<assign name="Set Parameter" property="context.GetDownPaymentURL" value="##Class(utils.FunctionSet).BuildRestUrlParameters(context.GetDownPaymentURL, context.SAPB1OrderDocEntry)" action="set" xpos='200' ypos='700' />
<call name='Get DownPayment' target='SAPB1 DownPayment' async='0' xpos='200' ypos='800' >
<request type='sapb1.bo.downpayment.getdownpayment.Request' >
<assign property="callrequest.RestRequestVO.Token" value="context.SAPB1Token" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="context.GetDownPaymentURL" action="set" />
</request>
<response type='sapb1.bo.downpayment.getdownpayment.Response' >
<assign property="context.DownPayment" value="##Class(%DynamicObject).%FromJSON(callresponse.RestResponseVO.HttpResponseBody)" action="set" />
</response>
</call>
<if name='DowPayment Exists?' condition='context.DownPayment.value.%Size()' xpos='200' ypos='900' xend='200' yend='1350' >
<true>
<assign name="DownPayment" property="context.DownPayment" value="context.DownPayment.value.%Get(0).DownPayments" action="set" xpos='200' ypos='1050' />
</true>
<false>
<transform name='From Order To Down' class='sapb1.dt.payment.FromOrderToDownPayment' source='context' target='context.DownPaymentJSON' xpos='470' ypos='1050' />
<assign name="Create Down Payment URL" property="context.GetDownPaymentURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(&quot;SAPB1 Intragroup - KDPNEUS&quot;, &quot;SAPB1 Create Down Payments&quot;)" action="set" xpos='470' ypos='1150' />
<call name='Down Payments 1' target='SAPB1 DownPayment' async='0' xpos='470' ypos='1250' >
<annotation><![CDATA[Is the same call of the Down Payment, but the name of call must to be different!]]></annotation>
<request type='sapb1.bo.downpayment.createdownpayment.Request' >
<assign property="callrequest.RestRequestVO.Token" value="context.SAPB1Token" action="set" />
<assign property="callrequest.RestRequestVO.HttpRequestBody" value="context.DownPaymentJSON" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="context.GetDownPaymentURL" action="set" />
</request>
<response type='sapb1.bo.downpayment.createdownpayment.Response' >
<assign property="context.DownPayment" value="##Class(%DynamicObject).%FromJSON(callresponse.RestResponseVO.HttpResponseBody)" action="set" />
</response>
</call>
</false>
</if>
<if name='Payd?' condition='context.OCCOrder.paymentGroups.%Get(0).state = "SETTLED"' xpos='200' ypos='1450' xend='200' yend='2100' >
<true>
<assign name="BillOfExchange/CreditCard" property="context.PaymentType" value="context.OCCOrder.paymentGroups.%Get(0).paymentMethod" action="set" xpos='335' ypos='1600' />
<transform name='From Down To Incommig' class='sapb1.dt.payment.FromDownPaymentToIncomingPayment' source='context' target='context.IncomingPaymentJSON' xpos='335' ypos='1700' />
<assign name="Create Incoming Payment URL" property="context.CreateIncomingPaymentURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(&quot;SAPB1 Intragroup - KDPNEUS&quot;, &quot;SAPB1 Create Incoming Payment&quot;)" action="set" xpos='335' ypos='1800' />
<call name='Incoming Payments' target='SAPB1 IncomingPayment' async='0' xpos='335' ypos='1900' >
<request type='sapb1.bo.incomingpayment.createincomingpayment.Request' >
<assign property="callrequest.RestRequestVO.Token" value="context.SAPB1Token" action="set" />
<assign property="callrequest.RestRequestVO.HttpRequestBody" value="context.IncomingPaymentJSON" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="context.CreateIncomingPaymentURL" action="set" />
</request>
<response type='Ens.Response' />
</call>
<call name='Update Tracking (Paid)' target='OCC Tracking BPL' async='0' xpos='335' ypos='2000' >
<request type='occ.bp.tracking.Request' >
<assign property="callrequest.InstanceId" value="&quot;OCC Intragroup - KDPNEUS&quot;" action="set" />
<assign property="callrequest.OCCOrder" value="context.OCCOrder" action="set" />
<assign property="callrequest.SAPB1Order" value="context.SAPB1Order" action="set" />
<assign property="callrequest.OrderState" value="&quot;Paid&quot;" action="set" />
</request>
<response type='occ.bp.tracking.Response' >
<assign property="context.UpdateTrackingResponse" value="callresponse" action="set" />
</response>
</call>
</true>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
