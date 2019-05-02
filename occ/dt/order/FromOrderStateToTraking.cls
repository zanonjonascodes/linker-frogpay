Class occ.dt.order.FromOrderStateToTraking Extends (Ens.DataTransform, utils.FunctionSet)
{

ClassMethod Transform(pSource As occ.bp.tracking.Request, ByRef pTarget As occ.bo.order.updateorders.Request, ByRef pAux) As %Status
{
	Try
	{
		#Dim exception As %Exception.General              = ""		
		#Dim statusCode As %Status                        = $System.Status.OK()
		#Dim target As occ.bo.order.updateorders.Request  = ##Class(occ.bo.order.updateorders.Request).%New() 		
		#Dim restRequestVO As linker.vo.rest.RestRequest  = ##Class(linker.vo.rest.RestRequest).%New()		
		#Dim occOrder As %DynamicObject                   = pSource.OCCOrder
		#Dim tracking As %DynamicObject                   = {}
		#Dim trackingInfo As %DynamicArray                = []
		#Dim trackingObj As %DynamicObject                = {}
		#Dim sapb1Order As %DynamicObject                 = pSource.SAPB1Order
		#Dim trackingURL As %String                       = ..GetResourcePathByServiceNameInstance("OCC Intragroup - KDPNEUS", "OCC Update Traking")		
		#Dim trackingArray As %DynamicArray               = []
		//
		If (occOrder."x_dataInvoiceShipping" '= "")
		{
			Set dataInvoincingShipping = $ZConvert(occOrder."x_dataInvoiceShipping", "I", "JSON")
			Set trackingArray          = {}.%FromJSON(dataInvoincingShipping)
		}
		If (pSource.OrderState = "Created")
		{
			Set tracking.links         = {}
			Set tracking.links.nfeLink = "https://aguardandodefinicao.com.br"
			Set tracking.id            = pSource.OCCOrder.id
			Set tracking.description   = "Nota Fiscal SAPB1"
			Set trackingObj.id         = 1
		}
		ElseIf (pSource.OrderState = "Paid")
		{
			Set trackingObj.id = 2
		}
		ElseIf (pSource.OrderState = "InvoiceSubmitted")
		{
			Set trackingObj.id = 3
			Set trackingObj.customProperties            = {}
			Set trackingObj."invoice_accessKey"         = pSource.NFETripleOne."U_SKL25NFE"."U_Chave_Acesso"
			Set trackingObj."invoice_series"            = pSource.NFETripleOne.Invoices.SeriesString
			Set trackingObj."invoice_number"            = pSource.NFETripleOne.Invoices.SequenceSerial
			Set trackingObj."invoice_date"              = pSource.NFETripleOne.Invoices."U_SKILL_DtSaida" _ "T" _ pSource.NFETripleOne.Invoices."U_SKILL_HrSaida" _ "Z" 
			Set trackingObj."invoice_cfop"              = pSource.NFETripleOne.Invoices."Invoices/DocumentLines".CFOPCode
			Set trackingObj."invoice_companyStateTaxId" = ""
			Set trackingObj."invoice_observation"       = pSource.OCCOrder.Id
			Set trackingObj."invoice_linkNfe"           = "https://aguardandodefinicao.com.br"
		}
		ElseIf (pSource.OrderState = "Shiping")
		{
 			Set trackingObj.id                                       = 4
			Set trackingObj.customProperties                         = {}
			Set trackingObj.customProperties."track_url"             = ""
			Set trackingObj.customProperties."track_number"          = ""
			Set trackingObj.customProperties."track_carrier"         = ""
			Set trackingObj.customProperties."track_carrierDocument" = ""
			Set trackingObj.customProperties."track_date"            = ""
			Set trackingObj.customProperties."track_estimateDate"    = ""
			Set trackingObj.customProperties."track_shippedDate"     = ""
		}
		ElseIf (pSource.OrderState = "Delivered")
		{
			Set trackingObj.id                                     = 5
			Set trackingObj.customProperties                       = {} 
			Set trackingObj.customProperties."track_deliveredDate" = ""
		}
		Set tracking.trackingInfo = trackingInfo
		Set trackingObj.displayName          = ..Lookup("OCC_STATE_TO_TRACKING", pSource.OrderState)
		Set trackingObj.date                 = $ZDate(+$Horolog, 3)
		//
		Do trackingArray.%Push(tracking)
		Do trackingInfo.%Push(trackingObj)
		Do trackingObj.%Set("actived", 1, "boolean")
		//
		Set occOrder."x_dataInvoiceShipping" = trackingArray.%ToJSON()
    	Set restRequestVO.InstanceId         = pSource.InstanceId
  		Set restRequestVO.URL                = ..BuildRestUrlParameters(trackingURL, pSource.OCCOrder.Id)
  		Set restRequestVO.HttpRequestBody    = occOrder.%ToJSON()
  		Set pTarget                          = ##Class(occ.bo.order.updateorders.Request).%New()
  		Set pTarget.RestRequestVO            = restRequestVO
  		//Write trackingArray.%ToJSON(), !
		//Write $ZConvert(trackingArray.%ToJSON(), "O", "JSON"), !
		//Write occOrder."x_dataInvoiceShipping"
	}
	Catch (exception)
	{
		Set statusCode = exception.AsStatus()
	}
	Return statusCode
}

}