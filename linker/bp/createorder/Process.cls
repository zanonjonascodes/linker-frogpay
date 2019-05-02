/// 
Class linker.bp.createorder.Process Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='linker.bp.insertproduct.Request' response='linker.bp.insertproduct.Response' height='2600' width='2000' >
<context>
<property name='SAPToken' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='OCCOrder' type='%DynamicObject' instantiate='0' />
<property name='BusinessPartnerExists' type='%String' initialexpression='0' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='OCCToken' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='OCCProfile' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SAPB1Order' type='%DynamicObject' instantiate='0' />
<property name='OrderOperation' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='SAPB1GetOrderURL' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SAPB1OrderJSON' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='BPLIDAssignedToInvoice' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='SAPB1UDTBranchURL' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SAPB1CancelOrderURL' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SAPB1CreditNoteURL' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='DownPayment' type='%DynamicObject' instantiate='0' />
<property name='GetDownPaymentURL' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SAPB1CreditNoteJSON' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SAPB1BusinessPartnerJSON' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SAPB1OrderJSONFromGet' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='DocEntry' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='UpdateTrackingResponse' type='occ.bp.tracking.Response' instantiate='0' />
<property name='SAPB1BusinessPartner' type='%DynamicObject' instantiate='0' />
<property name='SAPB1BusinessPartnerRequest' type='sapb1.bo.businesspartner.updatebusinesspartner.Request' instantiate='0' />
<property name='InstanceId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='250' />
</parameters>
</property>
</context>
<sequence xend='200' yend='1500' >
<scope name='Create Product' xpos='200' ypos='250' xend='200' yend='1400' >
<assign name="OCCOrder Dynamic Object" property="context.OCCOrder" value="##Class(%DynamicObject).%FromJSON(request.RestRequestVO.HttpRequestBody)" action="set" xpos='200' ypos='350' />
<flow xpos='200' ypos='450' xend='200' yend='700' >
<sequence >
<call name='Get SAP Token' target='SAPB1 Get Token' async='0' xpos='200' ypos='600' >
<request type='sapb1.bp.security.Token.Request' >
<assign property="callrequest.InstanceId" value="request.RestRequestVO.InstanceId" action="set" />
<assign property="callrequest.Url" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(request.RestRequestVO.InstanceId, &quot;Login&quot;)" action="set" />
</request>
<response type='sapb1.bp.security.Token.Response' >
<assign property="context.SAPToken" value="callresponse.Token" action="set" />
</response>
</call>
</sequence>
<sequence >
<call name='Get OCC Token' target='OCC Get Token' async='0' xpos='470' ypos='600' >
<request type='occ.bp.security.Token.Request' >
<assign property="callrequest.InstanceId" value="&quot;OCC Intragroup - KDPNEUS&quot;" action="set" />
<assign property="callrequest.Url" value="&quot;https://ccadmin-test-zbxa.oracleoutsourcing.com/ccadmin/v1/login&quot;" action="set" />
</request>
<response type='occ.bp.security.Token.Response' >
<assign property="context.OCCToken" value="callresponse.Token" action="set" />
</response>
</call>
</sequence>
</flow>
<sequence name='SAPB1 Get Order' xpos='200' ypos='800' xend='200' yend='650' >
<assign name="SAPB1GetOrderURL" property="context.SAPB1GetOrderURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(&quot;SAPB1 Intragroup - KDPNEUS&quot;, &quot;SAPB1 Get Order&quot;)" action="set" xpos='200' ypos='250' />
<assign name="Set OrderId OrderURL" property="context.SAPB1GetOrderURL" value="##Class(utils.FunctionSet).BuildRestUrlParameters(context.SAPB1GetOrderURL, context.OCCOrder.id)" action="set" xpos='200' ypos='350' />
<call name='SAPB1 Get Order' target='SAPB1 Order' async='0' xpos='200' ypos='450' >
<request type='sapb1.bo.order.getorder.Request' >
<assign property="callrequest.RestRequestVO.Token" value="context.SAPToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="context.SAPB1GetOrderURL" action="set" />
</request>
<response type='sapb1.bo.order.getorder.Response' >
<assign property="context.SAPB1Order" value="##Class(%DynamicObject).%FromJSON(callresponse.RestResponseVO.HttpResponseBody)" action="set" />
<assign property="context.SAPB1OrderJSONFromGet" value="callresponse.RestResponseVO.HttpResponseBody" action="set" />
</response>
</call>
<assign name="OrderOperation" property="context.OrderOperation" value="$Select(context.SAPB1Order.value.%Size() = 0 : &quot;Insert&quot;, 1 : &quot;Update&quot;)" action="set" xpos='200' ypos='550' />
</sequence>
<if name='Cancel Order?' condition='context.OCCOrder.state = "REMOVED"' xpos='200' ypos='900' xend='200' yend='1150' >
<true>
<sequence name='Cancel Order' xpos='470' ypos='1050' xend='200' yend='1300' >
<assign name="SAPB1CancelOrderURL" property="context.SAPB1CancelOrderURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(&quot;SAPB1 Intragroup - KDPNEUS&quot;, &quot;SAPB1 Cancel Order&quot;)" action="set" xpos='200' ypos='250' />
<assign name="DocEntry" property="context.DocEntry" value="context.SAPB1Order.value.%Get(0).DocEntry" action="set" xpos='200' ypos='350' />
<assign name="Set Id SAPB1CancelOrderURL" property="context.SAPB1CancelOrderURL" value="##Class(utils.FunctionSet).BuildRestUrlParameters(context.SAPB1CancelOrderURL, context.DocEntry)" action="set" xpos='200' ypos='450' />
<call name='SAPB1 Cancel Order' target='SAPB1 Order' async='0' xpos='200' ypos='550' >
<request type='sapb1.bo.order.cancel.Request' >
<assign property="callrequest.RestRequestVO.Token" value="context.SAPToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="context.SAPB1CancelOrderURL" action="set" />
</request>
<response type='Ens.Response' />
</call>
<sequence name='Get DownPayment' xpos='200' ypos='650' xend='200' yend='550' >
<assign name="Get DownPayment URL" property="context.GetDownPaymentURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(&quot;SAPB1 Intragroup - KDPNEUS&quot;, &quot;SAPB1 Get Down Payments&quot;)" action="set" xpos='200' ypos='250' />
<assign name="Set Parameter" property="context.GetDownPaymentURL" value="##Class(utils.FunctionSet).BuildRestUrlParameters(context.GetDownPaymentURL, context.DocEntry)" action="set" xpos='200' ypos='350' />
<call name='Get DownPayment' target='SAPB1 DownPayment' async='0' xpos='200' ypos='450' >
<request type='sapb1.bo.downpayment.getdownpayment.Request' >
<assign property="callrequest.RestRequestVO.Token" value="context.SAPToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="context.GetDownPaymentURL" action="set" />
</request>
<response type='sapb1.bo.downpayment.getdownpayment.Response' >
<assign property="context.DownPayment" value="##Class(%DynamicObject).%FromJSON(callresponse.RestResponseVO.HttpResponseBody)" action="set" />
</response>
</call>
</sequence>
<if name='DowPayment Exists?' condition='context.DownPayment.value.%Size() &amp;&amp; context.DownPayment.value.%Get(0).DocumentStatus = "bost_Open"' xpos='200' ypos='750' xend='200' yend='1200' >
<true>
<assign name="SAPB1CreditNoteURL" property="context.SAPB1CreditNoteURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(&quot;SAPB1 Intragroup - KDPNEUS&quot;, &quot;SAPB1 Create Credit Note&quot;)" action="set" xpos='335' ypos='900' />
<transform name='FromDownPaymentToCreditNote' class='sapb1.dt.creditnote.FromDownPaymentToCreditNote' source='context.DownPayment.value.%Get(0)' target='context.SAPB1CreditNoteJSON' xpos='335' ypos='1000' />
<call name='SABPB1 Credit Note' target='SABPB1 Credit Note' async='1' xpos='335' ypos='1100' >
<request type='sapb1.bo.creditnote.create.Request' >
<assign property="callrequest.RestRequestVO.Token" value="context.SAPToken" action="set" />
<assign property="callrequest.RestRequestVO.HttpRequestBody" value="context.SAPB1CreditNoteJSON" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="context.SAPB1CreditNoteURL" action="set" />
</request>
<response type='Ens.Response' />
</call>
</true>
</if>
</sequence>
</true>
<false>
<sequence name='Create / Update Order' xpos='200' ypos='1050' xend='200' yend='1900' >
<sequence name='SAPB1 Business Partner' xpos='200' ypos='250' xend='200' yend='1000' >
<call name='SAPB1 ExistsBusinessPartner' target='SAPB1 Business Partner' async='0' xpos='200' ypos='250' >
<request type='sapb1.bo.businesspartner.existsbusinesspartner.Request' >
<assign property="callrequest.RestRequestVO.URL" value="&quot;https://10.10.139.12:50000/b1s/v1/BusinessPartners('OCC_&quot; _ context.OCCOrder.profileId _&quot;')&quot;" action="set" />
<assign property="callrequest.RestRequestVO.Token" value="context.SAPToken" action="set" />
<assign property="context.InstanceId" value="request.RestRequestVO.InstanceId" action="set" />
</request>
<response type='sapb1.bo.businesspartner.existsbusinesspartner.Response' >
<assign property="context.BusinessPartnerExists" value="callresponse.RestResponseVO.HttpStatusCode" action="set" />
<assign property="context.SAPB1BusinessPartner" value="##Class(%DynamicObject).%FromJSON(callresponse.RestResponseVO.HttpResponseBody)" action="set" />
</response>
</call>
<call name='OCC Get Profile' target='OCC Get Profile' async='0' xpos='200' ypos='350' >
<request type='occ.bo.profile.getprofile.Request' >
<assign property="callrequest.RestRequestVO.Token" value="context.OCCToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="&quot;https://ccadmin-test-zbxa.oracleoutsourcing.com/ccadmin/v1/profiles/&quot; _ context.OCCOrder.profileId" action="set" />
</request>
<response type='occ.bo.profile.getprofile.Response' >
<assign property="context.OCCProfile" value="##Class(%DynamicObject).%FromJSON(callresponse.RestResponseVO.HttpResponseBody)" action="set" />
<assign property="context.OCCProfile.shippingAddress" value="context.OCCOrder.shippingGroups.%Get(0).shippingAddress" action="set" />
</response>
</call>
<transform name='FromProfileToBusinessPartner' class='sapb1.dt.businesspartner.FromProfileToBusinessPartner' source='context' target='context.SAPB1BusinessPartnerRequest' xpos='200' ypos='450' />
<code xpos='200' ypos='550' >
<![CDATA[   $$$LOGINFO(context.SAPB1BusinessPartnerJSON)]]>
</code>
<if name='Business Partner Exists?' condition='context.BusinessPartnerExists = "200"' xpos='200' ypos='650' xend='200' yend='900' >
<annotation><![CDATA[Checks if HTTP status code from SAP ExistsBusinessPartner = 200(OK)]]></annotation>
<true>
<call name='Update Business Partner' target='SAPB1 Business Partner' async='0' xpos='470' ypos='800' >
<request type='sapb1.bo.businesspartner.updatebusinesspartner.Request' >
<assign property="callrequest" value="context.SAPB1BusinessPartnerRequest" action="set" />
</request>
<response type='sapb1.bo.businesspartner.updatebusinesspartner.Response' />
</call>
</true>
<false>
<call name='Create Business Partner' target='SAPB1 Business Partner' async='0' xpos='200' ypos='800' >
<request type='sapb1.bo.businesspartner.insertbusinesspartner.Request' >
<assign property="callrequest.RestRequestVO.URL" value="&quot;https://10.10.139.12:50000/b1s/v1/BusinessPartners&quot;" action="set" />
<assign property="callrequest.RestRequestVO.Token" value="context.SAPToken" action="set" />
<assign property="callrequest.RestRequestVO.HttpRequestBody" value="context.SAPB1BusinessPartnerJSON" action="set" />
</request>
<response type='sapb1.bo.businesspartner.insertbusinesspartner.Response' />
</call>
</false>
</if>
</sequence>
<if name='OCCOrder Outside SP' condition='context.OCCOrder.shippingGroups.%Get(0).shippingAddress.state &apos;= "SP"' xpos='200' ypos='350' xend='200' yend='800' >
<true>
<assign name="SAPB1UDTBranch" property="context.SAPB1UDTBranchURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(&quot;SAPB1 Intragroup - KDPNEUS&quot;, &quot;SAPB1 Get UDT Branch&quot;)" action="set" xpos='335' ypos='500' />
<assign name="Set Date SAPB1UDTBranch" property="context.SAPB1UDTBranchURL" value="##Class(utils.FunctionSet).BuildRestUrlParameters(context.SAPB1UDTBranchURL, context.OCCOrder.submittedDate _ &quot;,&quot;_ context.OCCOrder.submittedDate)" action="set" xpos='335' ypos='600' />
<call name='SAPB1 UDT Branch' target='SAPB1 UDT Branch' async='0' xpos='335' ypos='700' >
<request type='sapb1.bo.udtbranch.get.Request' >
<assign property="callrequest.RestRequestVO.URL" value="context.SAPB1UDTBranchURL" action="set" />
<assign property="callrequest.RestRequestVO.Token" value="context.SAPToken" action="set" />
</request>
<response type='sapb1.bo.udtbranch.get.Response' >
<assign property="context.BPLIDAssignedToInvoice" value="##Class(%DynamicObject).%FromJSON(callresponse.RestResponseVO.HttpResponseBody).value.%Get(0).Code" action="set" />
</response>
</call>
</true>
</if>
<transform name='FromOCCToSAPB1' class='linker.dt.order.FromOCCToSAPB1' source='context' target='context.SAPB1OrderJSON' xpos='200' ypos='900' />
<if name='SAPB1Order Exists?' condition='context.OrderOperation = "Update"' xpos='200' ypos='1000' xend='200' yend='1450' >
<true>
<call name='SAPB1 Update Order' target='SAPB1 Order' async='0' xpos='200' ypos='1150' >
<request type='sapb1.bo.order.updateorder.Request' >
<assign property="callrequest.RestRequestVO.HttpRequestBody" value="context.SAPB1OrderJSON" action="set" />
<assign property="callrequest.RestRequestVO.Token" value="context.SAPToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="&quot;https://10.10.139.12:50000/b1s/v2/Orders(&quot;_context.DocEntry_ &quot;)&quot;" action="set" />
</request>
<response type='sapb1.bo.order.updateorder.Response' />
</call>
</true>
<false>
<call name='SAPB1 Create Order' target='SAPB1 Order' async='0' xpos='470' ypos='1150' >
<request type='sapb1.bo.order.createorder.Request' >
<assign property="callrequest.RestRequestVO.HttpRequestBody" value="context.SAPB1OrderJSON" action="set" />
<assign property="callrequest.RestRequestVO.Token" value="context.SAPToken" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="&quot;https://10.10.139.12:50000/b1s/v2/Orders&quot;" action="set" />
</request>
<response type='sapb1.bo.order.createorder.Response' >
<assign property="context.SAPB1OrderJSON" value="callresponse.RestResponseVO.HttpResponseBody" action="set" />
<assign property="context.SAPB1OrderJSONFromGet" value="callresponse.RestResponseVO.HttpResponseBody" action="set" />
</response>
</call>
<code name='Insert value' xpos='470' ypos='1250' >
<![CDATA[  Set dynObj       = {}
  Set dynObj.value = []
  Set order        = {}.%FromJSON(context.SAPB1OrderJSON)
  $$$LOGINFO(context.SAPB1OrderJSON)
  //
  Do dynObj.value.%Push(order)
  //
  Set context.SAPB1OrderJSONFromGet = dynObj.%ToJSON()]]>
</code>
<call name='Update Tracking (Create)' target='OCC Tracking BPL' async='0' xpos='470' ypos='1350' >
<request type='occ.bp.tracking.Request' >
<assign property="callrequest.InstanceId" value="&quot;OCC Intragroup - KDPNEUS&quot;" action="set" />
<assign property="callrequest.OCCOrder" value="context.OCCOrder" action="set" />
<assign property="callrequest.SAPB1Order" value="context.SAPB1Order" action="set" />
<assign property="callrequest.OrderState" value="&quot;Created&quot;" action="set" />
</request>
<response type='occ.bp.tracking.Response' >
<assign property="context.UpdateTrackingResponse" value="callresponse" action="set" />
</response>
</call>
</false>
</if>
<if name='Retirar na Loja KD Pneus' condition='context.OCCOrder.shippingGroups.%Get(0).shippingMethod = "Retirar na Loja KD Pneus"' xpos='200' ypos='1550' xend='200' yend='1800' >
<false>
<call name='SAPB1 Payment Process BPL' target='SAPB1 Payment Process BPL' async='1' xpos='335' ypos='1700' >
<request type='sapb1.bp.payment.Request' >
<assign property="callrequest.SAPB1Order" value="context.SAPB1OrderJSONFromGet" action="set" />
<assign property="callrequest.OCCOrder" value="request.RestRequestVO.HttpRequestBody" action="set" />
<assign property="callrequest.InstanceId" value="&quot;SAPB1 Intragroup - KDPNEUS&quot;" action="set" />
</request>
<response type='Ens.Response' />
</call>
</false>
</if>
</sequence>
</false>
</if>
<faulthandlers>
<catchall xpos='200' ypos='1250' xend='200' yend='350' >
<code name='LogError' xpos='200' ypos='250' >
<![CDATA[  $$$LOGERROR("%LastError " _ $System.Status.GetErrorCodes(..%Context.%LastError) _ " : "_ $System.Status.GetOneStatusText(..%Context.%LastError))]]>
</code>
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
