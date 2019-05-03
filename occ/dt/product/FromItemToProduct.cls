Class occ.dt.product.FromItemToProduct Extends (Ens.DataTransform, utils.FunctionSet)
{

ClassMethod Transform(pSource As %RegisteredObject, ByRef pTarget As %RegisteredObject, ByRef Aux) As %Status
{
	Try
	{
		#Dim statusCode As %Status       = $System.Status.OK()
		#Dim itemSAPB1 As %DynamicObject = pSource.SAPB1Item
		#Dim productOCC As %DynamyObject = {}
		#Dim pTarget  As %DynamyObject   = {}
		//
		If '(pSource.ProductExists)
		{
			Set productOCC.properties.id = itemSAPB1.ItemCode
		}
		Set productOCC.productType                = "Pneu"
		Set productOCC.properties                 = {}
		Set productOCC.properties.displayName     = itemSAPB1.ItemName
		Set productOCC.properties.description     = itemSAPB1.ItemName
		Set productOCC.properties.longDescription = itemSAPB1.ItemName
		Set productOCC.properties.length          = itemSAPB1.SalesUnitLength
	    Set productOCC.properties.width           = itemSAPB1.SalesUnitWidth
	    Set productOCC.properties.height          = itemSAPB1.SalesUnitHeight
	    Set productOCC.properties.weight          = itemSAPB1.SalesUnitWe
	    //
	    Set productOCC.properties."x_adernciaTraction"      = itemSAPB1."U_Aderencia"
		Set productOCC.properties."x_altura"                = itemSAPB1."U_Altura"
		Set productOCC.properties."x_aro"                   = itemSAPB1."U_Aro"
		Set productOCC.properties."x_durabilidadeTreadwear" = itemSAPB1."U_Durab"
		Set productOCC.properties."x_ndiceDeCarga"          = itemSAPB1."U_Ind_Carga"
		Set productOCC.properties."x_ndiceDeVelocidade"     = itemSAPB1."U_Ind_Veloc"
		Set productOCC.properties."x_inmetro"               = itemSAPB1."U_Inmetro"
		Set productOCC.properties."x_largura"               = itemSAPB1."U_Largura"
		Set productOCC.properties."x_lateral"               = itemSAPB1."U_Lateral"
		Set productOCC.properties."x_temperaturaTraction"   = itemSAPB1."U_Temperatura"
		Set productOCC.properties."x_tipoDeConstruo"        = itemSAPB1."U_Tip_Constru"
		Set productOCC.properties."x_tipoDeDesenho"         = itemSAPB1."U_Tip_Desenho"
	    //
		Do ##Class(utils.FunctionSet).AssingJsonNullIfEmpty(productOCC.properties, "taxCode", "")
 		//
 		Set productOCC.properties.listPrice = itemSAPB1.ItemPrices.%Get(0).Price
 		Set productOCCJSON                  = productOCC.%ToJSON()
		Set pTarget                         = productOCCJSON
 	}
	Catch (exception)
	{
		Set statusCode = exception.AsStatus()
		$$$LOGSTATUS(statusCode)
	}
	Return statusCode
}

}
