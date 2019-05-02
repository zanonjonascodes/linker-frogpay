Class sapb1.boapi.BusinessPartner Extends %RegisteredObject
{

ClassMethod MapProperties(profile As %String, pAction As %String = "Insert") As %String
{
	try
	{
		Set profileOCC = ##Class(%DynamicObject).%FromJSON(profile)
		#Dim businessPartner As %DynamyObject = {}
		//
		Set businessPartner = {}		
		Set businessPartner."U_ING_COD_OCC" = profileOCC.id
		Set businessPartner.CardName = profileOCC.firstName _ " "_ profileOCC.lastName
		Set businessPartner.CardType = "cCustomer"
		//
		Set businessPartner.Address = profileOCC.shippingAddress.address1
		Set businessPartner.ZipCode = profileOCC.shippingAddress.postalCode
		Set businessPartner.MailAddress = profileOCC.email
		Set businessPartner.Phone1 = $Extract(profileOCC.shippingAddress.phoneNumber, 3, *)
		Set businessPartner.Phone2 = $Extract(profileOCC.shippingAddress.phoneNumber, 1, 2)
		Set businessPartner.City = profileOCC.shippingAddress.city
		Set businessPartner.Country = profileOCC.shippingAddress.country
		Set businessPartner.BillToState = profileOCC.shippingAddress.state
		//
		Set bpFiscalTaxId = {}
		//
		If (pAction = "Insert")
		{
			Set businessPartner.CardCode = "OCC_" _ profileOCC.id
		}
		ElseIf (pAction = "Update")
		{
			Do ##Class(utils.FunctionSet).AssingJsonNullIfEmpty(bpFiscalTaxId, "TaxId0", profileOCC."x_document")
			//
			Set businessPartner.BPFiscalTaxIDCollection = [].%Push(bpFiscalTaxId)
		}	
		Set businessPartnerJSON = businessPartner.%ToJSON()
		Set ^zbusinesssPartiner = businessPartnerJSON 
	}
	catch(e)
	{
		Set statusCode = e.AsStatus()
		Throw e
	}
	Return businessPartnerJSON
}

}
