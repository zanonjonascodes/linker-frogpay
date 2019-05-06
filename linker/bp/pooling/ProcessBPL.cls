/// 
Class linker.bp.pooling.ProcessBPL Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='linker.bp.pooling.Request' height='2000' width='2000' >
<context>
<property name='LoginURL' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='250' />
</parameters>
</property>
<property name='Token' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='ServiceRequest' type='linker.bo.restcall.genericoperation.Request' instantiate='0' />
<property name='JSONString' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='NextURL' type='%String' initialexpression='""' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='250' />
</parameters>
</property>
</context>
<sequence xend='200' yend='900' >
<switch name='Source Login' xpos='200' ypos='250' xend='200' yend='600' >
<case condition='request.Type = "OCC"' name='OCC' >
<assign name="Login URL" property="context.LoginURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(request.InstanceId)" action="set" xpos='335' ypos='400' />
<call name='Login OCC' target='OCC Get Token' async='0' xpos='335' ypos='500' >
<request type='occ.bp.security.Token.Request' >
<assign property="callrequest.InstanceId" value="request.InstanceId" action="set" />
<assign property="callrequest.Url" value="context.LoginURL" action="set" />
</request>
<response type='occ.bp.security.Token.Response' >
<assign property="context.Token" value="callresponse.Token" action="set" />
</response>
</call>
</case>
<case condition='request.Type = "SAPB1"' name='SAPB1' >
<assign name="Login URL" property="context.LoginURL" value="##Class(utils.FunctionSet).GetResourcePathByServiceNameInstance(request.InstanceId)" action="set" xpos='605' ypos='400' />
<call name='Login SAPB1' target='SAPB1 Get Token' async='0' xpos='605' ypos='500' >
<request type='sapb1.bp.security.Token.Request' >
<assign property="callrequest.InstanceId" value="request.InstanceId" action="set" />
<assign property="callrequest.Url" value="context.LoginURL" action="set" />
</request>
<response type='sapb1.bp.security.Token.Response' >
<assign property="context.Token" value="callresponse.Token" action="set" />
</response>
</call>
</case>
<default/>
</switch>
<transform name='Create the service request' class='linker.dt.pooling.FromPoolingRequestToCallRequest' source='request' target='context' xpos='200' ypos='700' />
<until name='No Next URL' condition='context.NextURL = ""' xpos='200' ypos='800' xend='200' yend='550' >
<call name='Pooling' target='@request.TargetBusinessHost' async='0' xpos='200' ypos='250' >
<request type='linker.bo.restcall.genericoperation.Request' >
<assign property="callrequest" value="context.ServiceRequest" action="set" />
</request>
<response type='linker.bo.restcall.genericoperation.Response' >
<assign property="context.JSONString" value="callresponse.RestResponseVO.HttpResponseBody" action="set" />
</response>
</call>
<call name='Save Pooling' target='Save Pooling' async='0' xpos='200' ypos='350' >
<request type='linker.bo.pooling.saveinrepository.Request' >
<assign property="callrequest.JSONString" value="context.JSONString" action="set" />
<assign property="callrequest.ResourcePath" value="context.ServiceRequest.RestRequestVO.URL" action="set" />
<assign property="callrequest.ServiceId" value="request.ServiceId" action="set" />
</request>
<response type='linker.bo.pooling.saveinrepository.Response' >
<assign property="context.NextURL" value="callresponse.NextURL" action="set" />
</response>
</call>
<assign name="Next Request" property="context.ServiceRequest.RestRequestVO.URL" value="context.NextURL" action="set" xpos='200' ypos='450' />
</until>
</sequence>
</process>
}

}
