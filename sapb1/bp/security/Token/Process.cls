/// 
Class sapb1.bp.security.Token.Process Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='sapb1.bp.security.Token.Request' response='sapb1.bp.security.Token.Response' height='2000' width='2000' >
<context>
<property name='IsValidToken' type='%Boolean' instantiate='0' />
<property name='LastStatus' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='NewToken' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
</context>
<sequence xend='201' yend='1070' >
<call name='Call IsTokenValid' target='Token Manager' async='0' xpos='200' ypos='250' >
<request type='linker.bo.tokenmanager.isvalidtoken.Request' >
<assign property="callrequest.InstanceId" value="request.InstanceId" action="set" />
</request>
<response type='linker.bo.tokenmanager.isvalidtoken.Response' >
<assign property="context.IsValidToken" value="callresponse.IsTokenValid" action="set" />
</response>
</call>
<if name='Is Token Valid?' condition='context.IsValidToken' xpos='200' ypos='350' xend='200' yend='800' >
<annotation><![CDATA[Checks if token from Token Table is is still valid.]]></annotation>
<false>
<call name='Token State To UPDATING' target='Token Manager' async='0' xpos='335' ypos='500' >
<request type='linker.bo.tokenmanager.settokenstatetoupdating.Request' >
<assign property="callrequest.InstanceId" value="request.InstanceId" action="set" />
</request>
<response type='linker.bo.tokenmanager.settokenstatetoupdating.Response' >
<assign property="context.LastStatus" value="callresponse.Status" action="set" />
</response>
</call>
<call name='Get New Token Value' target='SAPB1 Login' async='0' xpos='335' ypos='600' >
<request type='sapb1.bo.security.login.Request' >
<assign property="callrequest.InstanceId" value="request.InstanceId" action="set" />
<assign property="callrequest.Url" value="request.Url" action="set" />
</request>
<response type='sapb1.bo.security.login.Response' >
<assign property="context.NewToken" value="callresponse.Token" action="set" />
</response>
</call>
<call name='Update Token Value' target='Token Manager' async='0' xpos='335' ypos='700' >
<request type='linker.bo.tokenmanager.updatetokenvalue.Request' >
<assign property="callrequest.InstanceId" value="request.InstanceId" action="set" />
<assign property="callrequest.Token" value="context.NewToken" action="set" />
</request>
<response type='linker.bo.tokenmanager.updatetokenvalue.Response' >
<assign property="callresponse.Status" value="context.LastStatus" action="set" />
</response>
</call>
</false>
</if>
<call name='Get Token' target='Token Manager' async='0' xpos='200' ypos='900' >
<request type='linker.bo.tokenmanager.gettoken.Request' >
<assign property="callrequest.InstanceId" value="request.InstanceId" action="set" />
</request>
<response type='linker.bo.tokenmanager.gettoken.Response' >
<assign property="response.Token" value="callresponse.Token" action="set" />
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
