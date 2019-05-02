Class sapb1.dt.businesspartner.FromProfileToBusinessPartner Extends (Ens.DataTransform, utils.FunctionSet)
{

Parameter IDPREFIX As %String = "OCC_";

ClassMethod Transform(pSource As %RegisteredObject, ByRef pTarget As sapb1.bo.businesspartner.updatebusinesspartner.Request, ByRef Aux) As %Status
{
	Try
	{
		#Dim statusCode As %Status                 = $System.Status.OK()
		#Dim oCCProfile As %DynamicObject          = pSource.OCCProfile
		#Dim newBusinessPartner As %DynamyObject   = {}
		#Dim sapb1BusinessPartner As %DynamyObject = pSource.SAPB1BusinessPartner
		#Dim pTarget  As %DynamyObject             = {}
		#Dim profileId                             = ..#IDPREFIX _ oCCProfile.id
		//
		Set newBusinessPartner."U_ING_COD_OCC" = profileId
		Set newBusinessPartner.CardType        = "cCustomer"
		Set newBusinessPartner.Address         = oCCProfile.shippingAddress.address1
		Set newBusinessPartner.ZipCode         = oCCProfile.shippingAddress.postalCode
		Set newBusinessPartner.MailAddress     = oCCProfile.email
		//
		Set phone                     = $Translate(oCCProfile.shippingAddress.phoneNumber, "()- ", "")
		Set newBusinessPartner.Phone1 = $Extract(phone, 3, *)
		Set newBusinessPartner.Phone2 = $Extract(phone, 1, 2)
		// Required On SAPB1
		If (newBusinessPartner.Phone1 = "")
		{
			Set newBusinessPartner.Phone1 = "912345678"
			Set newBusinessPartner.Phone2 = "99"
		}
		Set newBusinessPartner.City = oCCProfile.shippingAddress.city
		Set newBusinessPartner.Country = oCCProfile.shippingAddress.country
		Set newBusinessPartner.BillToState = oCCProfile.shippingAddress.state
		//
		#Dim bpFiscalTaxId As %DynamicObject = {}
		#Dim operation As %String            = $Select(pSource.BusinessPartnerExists = "404" : "Insert", 1 : "Update")
		//
		If (operation= "Insert")
		{
			Set newBusinessPartner.CardCode = profileId
			//
			Do ..MapDocuments(newBusinessPartner, oCCProfile)
		}
		Do ..PopulateAddresses(newBusinessPartner, oCCProfile)
		//
		Set pTarget               = ##Class(sapb1.bo.businesspartner.updatebusinesspartner.Request).%New()
		Set pTarget.RestRequestVO = ##Class(linker.vo.rest.RestRequest).%New()
		//
		#Dim updateBusinessPartnerURL As %String = ..GetResourcePathByServiceNameInstance(pSource.InstanceId, "SAPB1 Update Profile")
		//
		Set updateBusinessPartnerURL              = ..BuildRestUrlParameters(updateBusinessPartnerURL, profileId)
		Set pTarget.RestRequestVO.URL             = updateBusinessPartnerURL
		Set pTarget.RestRequestVO.HttpRequestBody = newBusinessPartner.%ToJSON()
		Set pTarget.RestRequestVO.HttpHeaderArray = ##Class(utils.HttpBuilder).SAPBuildTokenResetCollecionts(pSource.SAPToken)
		
	}
	Catch (exception)
	{
		Set statusCode = exception.AsStatus()
	}
	Return statusCode
}

ClassMethod MapDocuments(pNewBusinessPartner As %DynamicObject, pOCCProfile As %DynamicObject) [ Private ]
{ 
	#Dim bpFiscalTaxId As %DynamicObject = {}
	//
	Set xDocument = $Translate(pOCCProfile."x_document", ".-/ ", "")
	//
	If (xDocument '= "")
	{
		If ($length(xDocument) = 11) // Pessoa Física
		{
			Do ..AssingJsonNullIfEmpty(bpFiscalTaxId, "TaxId4", xDocument)
			//
			Set pNewBusinessPartner.CardName = pOCCProfile.firstName _ " "_ oCCProfile.lastName
		}
		ElseIf ($length(xDocument) = 14) // Pessoa Jurídica
		{
		 	Set pNewBusinessPartner.CardName = oCCProfile.firstName
		 	//
			Do ..AssingJsonNullIfEmpty(bpFiscalTaxId, "TaxId0", xDocument) // CNPJ
			//
			If (pOCCProfile.lastName '= "") // Inscrição Estadual
			{
				Set bpFiscalTaxId.TaxId1 = xDocument
			}
			Else
			{
				Set bpFiscalTaxId.TaxId1 = "Isento"
			}
		}
		Else // ID Estrangeiro
		{
			Do ..AssingJsonNullIfEmpty(bpFiscalTaxId, "TaxId5", xDocument)
		}
	}
	Else
	{
		Do ..AssingJsonNullIfEmpty(bpFiscalTaxId, "TaxId4", xDocument)
	}
	#Dim profileId                             = ..#IDPREFIX _ pOCCProfile.id
	Set bpFiscalTaxId.Address  = "Ship To"
	Set bpFiscalTaxId.BPCode   = profileId
    Set bpFiscalTaxId.AddrType = "bo_ShipTo"
    Set bpFiscalTaxId.TaxId12  = profileId _ "/" _ "Ship To"
    //
	Set pNewBusinessPartner.BPFiscalTaxIdCollection = [].%Push(bpFiscalTaxId)
}

ClassMethod PopulateAddresses(pNewBusinessPartner As %DynamicObject, pOCCProfile As %DynamicObject) [ Private ]
{
	#Dim bpAddresses As %DynamicArray = []
	#Dim addressType As %String       = "bo_ShipTo"
	#Dim addressName As %String       = "Ship To"
	//
	Set pNewBusinessPartner.BPAddresses = bpAddresses
	//
	Do ..MapAddress(pNewBusinessPartner, pOCCProfile.shippingAddress, addressType, addressName)
	//
	Set addressType = "bo_BillTo"
	Set addressName = "Bill to"
	If (pOCCProfile.billingAddress = "")
	{
		Do ..MapAddress(pNewBusinessPartner, pOCCProfile.shippingAddress, addressType, addressName)
	}
	Else
	{
		Do ..MapAddress(pNewBusinessPartner, pOCCProfile.billingAddress, addressType, addressName)
	}
	/* DO NOT ERASE!!!
	#Dim iterator As %Iterator.Array = pOCCProfile.shippingAddresses.%GetIterator()
	#Dim index As %Integer                = -1
	#Dim occShippAddress As %DynamicArray = []
	//
	Set addressType = "bo_BillTo"
	//
	While (iterator.%GetNext(.index, .occShippAddress))
	{
		Set addressName = "bo_ShipTo" _ "_" _ index
		//
		Do ..MapAddress(pNewBusinessPartner, occShippAddress , addressType, addressName)
	}
	*/
}

ClassMethod MapAddress(pNewBusinessPartner As %DynamicObject, pOCCAddress As %DynamicObject, pTypeAddress As %String, pAddressName As %String) [ Private ]
{
	#Dim sapb1Address As %DynamicObject = {}
	//
	Set sapb1Address.TypeOfAddress      = $Piece(pOCCAddress.address1, " ", 1)    // Tipo Logradouro
	Set sapb1Address.Street             = $Piece(pOCCAddress.address1, " ", 2, *) // Logradouro
	Set sapb1Address.BuildingFloorRoom  = pOCCAddress.address3                    // Complemento
	//Set pSAPB1Address.Block           = pOCCAddress.                            // Bairro
	Set sapb1Address.ZipCode            = pOCCAddress.postalCode
  	Set sapb1Address.City               = pOCCAddress.city
  	Set sapb1Address.County             = pOCCAddress.city
  	Set sapb1Address.Country            = pOCCAddress.country
  	Set sapb1Address.State              = pOCCAddress.state
  	Set sapb1Address.AddressType        = pTypeAddress
  	Set sapb1Address.StreetNo           = pOCCAddress.address2                    // Número
	Set sapb1Address.AddressName        = pAddressName
	
	//
	Do pNewBusinessPartner.BPAddresses.%Push(sapb1Address)
}

ClassMethod AddressExists(pAddressName As %String, pOCCAddress As %String, ByRef pBPAddressesCheck) As %Boolean [ Private ]
{
	#Dim address As %String = ""
	//
	Set address = pOCCAddress.address1 _ pOCCAddress.postalCode _ pOCCAddress.city _ pOCCAddress.country
	Set address = address _ pOCCAddress.state_ pOCCAddress.address1 _ pOCCAddress.address2
	//
	Return $Data(pBPAddressesCheck(..MD5Hash(..EscapeJSON(address))))
}

/// Populate a memory array with SAPB1 Addresses. Use hash key genrated whit address data.
/// Used in case of operation is Update, to check if a address exists in SAPB1.
ClassMethod PopulateBPAddresses(ByRef pBPAddressesCheck, pSAPB1BusinessPartner As %DynamicObject) [ Private ]
{
	#Dim iterator As %Iterator.Array    = pSAPB1BusinessPartner.BPAddresses.%GetIterator()
	#Dim index As %Integer              = ""
	#Dim sapb1Address As %DynamicObject = {}
	#Dim address As %String             = ""
	//
	While (iterator.%GetNext(.index, .sapb1Address))
	{
		Set address = sapb1Address.AddressName _ sapb1Address.TypeOfAddress _ sapb1Address.Street _ sapb1Address.ZipCode _ sapb1Address.City
		Set address = address _ sapb1Address.Country _ sapb1Address.State _ sapb1Address.StreetNo
		//
		Set pBPAddressesCheck(..MD5Hash(..EscapeJSON(address))) = address
	}
}

/// DO NOT ERASE!!!
XData SampleCompleteAddressAndTaxId
{
  <sample>
	<address>
		{
            "AddressName": "Novo Endereço",
            "Street": "Bartolomeu de Gusmão",
            "Block": "Vila São Francisco",
            "ZipCode": "09310680",
            "City": "Mauá",
            "County": "5112",
            "Country": "BR",
            "State": "SP",
            "FederalTaxID": null,
            "TaxCode": null,
            "BuildingFloorRoom": "Apto 32 A",
            "AddressType": "bo_ShipTo",
            "AddressName2": "Endreço 2",
            "AddressName3": "Endereço 3",
            "TypeOfAddress": "Rua",
            "StreetNo": "70",
            "BPCode": "OCC_306756",
            "RowNum": 26,
            "GlobalLocationNumber": null,
            "Nationality": null,
            "TaxOffice": null,
            "GSTIN": null,
            "GstType": null,
            "CreateDate": "2019-04-29",
            "CreateTime": "14:31:12",
            "U_SKILL_indIEDest": null,
            "U_COD_PART": null,
            "U_SKILL_IE": null
        }
    </address>
    <taxId>
    	{
            "Address": "Ship To",
            "CNAECode": 1,
            "TaxId0": "02.162.577/0001-25",
            "TaxId1": "Isento",
            "TaxId2": "",
            "TaxId3": "",
            "TaxId4": "277.630.298-38",
            "TaxId5": "ID Estrangeiro",
            "TaxId6": "",
            "TaxId7": "",
            "TaxId8": "",
            "TaxId9": null,
            "TaxId10": null,
            "TaxId11": null,
            "BPCode": "OCC_306756",
            "AddrType": "bo_ShipTo",
            "TaxId12": "OCC_306756/Novo Endereço",
            "TaxId13": null
        }
    </taxId>
  </sample>
}


}