Class frogpay.bo.conciliation.Operation Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER As %String = "Ens.OutboundAdapter";

Method SaveTransaction(pRequest As frogpay.bo.consiliation.save.Request, Output pResponse As Ens.Response) As %Status
{
  Try
  {
  	#Dim statusCode As %Satus                    = $System.Statuss.OK()
  	#Dim exception As %Exception.StatusException = ""
  	//
  	Set pResponse = ##Class(Ens.Response).%New()
  	
  }
  Catch (exception)
  {
  	Set statusCode = exception.AsStatus()
  }
  Return statusCode
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="linker.bo.restcall.get.Request">
	</MapItem>
</MapItems>
}

}
