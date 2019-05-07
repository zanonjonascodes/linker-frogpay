/// 
Class linker.bp.phoebus.transactions.ProcessBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='linker.bp.frogpay.transactions.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='TransactionVO' type='%RegisteredObject' instantiate='0' />
<property name='Service' type='linker.data.config.Services' instantiate='0' />
<property name='TransactionDynamic' type='%DynamicObject' instantiate='0' />
<property name='UdtJson' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SAPToken' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SaveTransactionURL' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
</context>
<sequence xend='200' yend='950' >
<assign name="Service" property="context.Service" value="##Class(linker.data.config.Services).%OpenId(request.RestRequestVO.ServiceId)" action="set" xpos='200' ypos='250' />
<assign name="Transaction Dynamic" property="context.TransactionDynamic" value="##Class(%DynamicObject).%FromJSON(request.RestRequestVO.HttpRequestBody)" action="set" xpos='200' ypos='350' />
<call name='Get SAP Token' target='SAPB1 Get Token' async='0' xpos='200' ypos='450' >
<request type='sapb1.bp.security.Token.Request' >
<assign property="callrequest.InstanceId" value="request.RestRequestVO.InstanceId" action="set" />
<assign property="callrequest.Url" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(request.RestRequestVO.InstanceId, &quot;Login&quot;)" action="set" />
</request>
<response type='sapb1.bp.security.Token.Response' >
<assign property="context.SAPToken" value="callresponse.Token" action="set" />
</response>
</call>
<transform name='From Phoebus to VO' class='linker.dt.phoebus.FromPhoebusPaymentsToPhoebusTransactDTL' source='context.TransactionDynamic' target='context.TransactionVO' xpos='200' ypos='550' />
<transform name='From Phoebus VO to UDT' class='linker.dt.phoebus.FromPhoebusPaymentsToPhoebusTransactDTL' source='context.TransactionVO' target='context.UdtJson' xpos='200' ypos='650' />
<assign name="Save Transaction URL" property="context.SaveTransactionURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(context.Service.Instance.%Id(), context.Service.ServiceName)" action="set" xpos='200' ypos='750' />
<call name='Save Phoebus UDT' target='SAPB1 UDT Phoebus Transaction' async='1' xpos='200' ypos='850' >
<request type='sapb1.bo.udtphoebustransact.post.Request' >
<assign property="callrequest.RestRequestVO.HttpRequestBody" value="context.UdtJson" action="set" />
<assign property="callrequest.RestRequestVO.InstanceId" value="request.RestRequestVO.InstanceId" action="set" />
<assign property="callrequest.RestRequestVO.ServiceId" value="request.RestRequestVO.ServiceId" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="context.SaveTransactionURL" action="set" />
</request>
<response type='Ens.Response' />
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
