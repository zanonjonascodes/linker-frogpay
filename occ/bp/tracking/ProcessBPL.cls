/// 
Class occ.bp.tracking.ProcessBPL Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='occ.bp.tracking.Request' response='occ.bp.tracking.Response' height='2000' width='2000' >
<context>
<property name='OCCToken' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='OCCOrder' type='%DynamicObject' instantiate='0' />
<property name='OrderState' type='%String' instantiate='0' />
<property name='SAPB1Order' type='%DynamicObject' instantiate='0' />
<property name='OCCUpdateTrakingRequest' type='occ.bo.order.updateorders.Request' instantiate='0' />
<property name='UpdateOrderURL' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
</context>
<sequence xend='200' yend='750' >
<call name='Get OCC Token' target='OCC Get Token' async='0' xpos='200' ypos='250' >
<request type='occ.bp.security.Token.Request' >
<assign property="callrequest.InstanceId" value="request.InstanceId" action="set" />
<assign property="callrequest.Url" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(request.InstanceId, &quot;Login&quot;)" action="set" />
</request>
<response type='occ.bp.security.Token.Response' >
<assign property="context.OCCToken" value="callresponse.Token" action="set" />
</response>
</call>
<transform name='FromOrderStateToTracking' class='occ.dt.order.FromOrderStateToTraking' source='request' target='context.OCCUpdateTrakingRequest' xpos='200' ypos='350' />
<assign name="Update Order URL" property="context.UpdateOrderURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(request.InstanceId, &quot;OCC Update Traking&quot;)" action="set" xpos='200' ypos='450' />
<assign name="OCC OrderId" property="context.UpdateOrderURL" value="##Class(utils.FunctionSet).BuildRestUrlParameters(context.UpdateOrderURL, request.OCCOrder.id)" action="set" xpos='200' ypos='550' />
<call name='Update Tracking' target='OCC Orders' async='0' xpos='200' ypos='650' >
<request type='occ.bo.order.updateorders.Request' >
<assign property="callrequest" value="context.OCCUpdateTrakingRequest" action="set" />
<assign property="callrequest.RestRequestVO.URL" value="context.UpdateOrderURL" action="set" />
<assign property="callrequest.RestRequestVO.Token" value="context.OCCToken" action="set" />
</request>
<response type='occ.bo.order.updateorders.Response' >
<assign property="response.RestResponseVO.HttpResponseBody" value="callresponse.RestResponseVO.HttpResponseBody" action="set" />
<assign property="callresponse.RestResponseVO.HttpStatusCode" value="callresponse.RestResponseVO.HttpStatusCode" action="set" />
<assign property="callresponse.RestResponseVO.Status" value="callresponse.RestResponseVO.Status" action="set" />
</response>
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
