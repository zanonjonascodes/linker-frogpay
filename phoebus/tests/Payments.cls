Class phoebus.tests.Payments Extends %UnitTest.TestCase
{

Method TestGetPayments()
{
	#Dim request As linker.bo.restcall.get.Request   = ##Class(linker.bo.restcall.get.Request).%New()
	#Dim response As linker.bo.restcall.get.Response = ""
	#Dim token As %String                            = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYmYiOjE1MzQ3MzQwMDAsInN1Yl9hY3F1aXJlcl9zcGVjaWZpY19pZCI6IjEyIiwidHlwZSI6IjQ4OTQ2MTUiLCJleHAiOjE5MTM5NDM1OTksImlhdCI6MTUzNDc3NjI0NX0.0ct1l5ZBVZWr6W4jXXyhXUxXHBbteVpOlbU8MB-lQuY"
	#Dim url As %String                              = "https://phoebus.paystore.com.br/api/api/v1/payments?date=2019-04-25&init_time=00:00:00&finish_time=23:59:59&page_size=100"
	#Dim statusCode As %Status                       = $System.Status.OK()
	//
	Set request.RestRequestVO                 = ##Class(linker.vo.rest.RestRequest).%New()
	Set request.RestRequestVO.HttpHeaderArray = ##Class(utils.HttpBuilder).PhoebusTokenRequestHeader(token)
	Set request.RestRequestVO.URL             = url
	Set statusCode                            = ##Class(EnsLib.Testing.Service).SendTestRequest("Phoebus Get Payments", request, .response, "", 1)
	//
	Do $$$AssertStatusOK(statusCode, "Send Request")
	Do $$$AssertNotTrue((response.RestResponseVO.HttpResponseBody = ""), "Response")
}

/// Run by <B>RunTest</B> once <a href="#OnBeforeAll">before any test methods</a> in the test class are run. Can be used to set up a 
/// test environment that will be later cleaned up by <B>OnAfterAllTests</B>. 
/// <br><br>Example: Setup and Cleanup of an environment: 
/// <pre>
/// Method OnBeforeAllTests() As %Status
/// {
/// 	//do setup stuff here
///  	set ^inputMessage = "input message"
/// 	quit $$$OK
/// }
/// Method OnAfterAllTests() As %Status
/// {
/// 	//do clean up stuff here
/// 	kill ^inputMessage
/// 	quit $$$OK
/// }</pre>
/// 
Method OnBeforeAllTests() As %Status
{
	#Dim statusCode As %Status = $System.Status.OK()
	Return statusCode
}

}
