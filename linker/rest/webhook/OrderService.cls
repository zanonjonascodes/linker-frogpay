Class linker.rest.webhook.OrderService Extends %CSP.REST
{

Parameter CONTENTTYPE As %String = "application/json";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
  <Route Url="/order" Method="POST" Call="SaveOrder" Cors="true" />
 </Routes>
}

ClassMethod SaveOrder() As %Status
{
	Try
	{
		#Dim statusCode As %Status      = $System.Status.OK()
		#Dim order As %DynamicObject    = {}.%FromJSON(%request.Content)
		#Dim newOrder As %DynamicObject = {}
		//
		Set newOrder.items = []
		//
		Do newOrder.items.%Push(order.order.%ToJSON())
		//
		#Dim request As linker.bo.pooling.saveinrepository.Request = ##Class(linker.bo.pooling.saveinrepository.Request).%New()
		//
		Set request.JSONString = newOrder.%ToJSON()
		Set request.ServiceId  = 2
		//
		Do ##Class(linker.boapi.Pooling).ProcessJson(request)
	}
	Catch (exception)
	{
		Set srtatusCode = exception.AsStatus()
	}
	Return statusCode
}

}
