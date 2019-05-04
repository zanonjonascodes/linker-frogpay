Class linker.dt.phoebus.FromPhoebusTransactToUPhoebusTransactDTL Extends Ens.DataTransformDTL [ DependsOn = (linker.bp.phoebus.payments.Request, %DynamicObject) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='linker.bp.phoebus.payments.Request' targetClass='%DynamicObject' create='new' language='objectscript' >
<assign value='source.Payment.Nsu' property='target.Code' action='set' />
<assign value='source.Nsu' property='target.Name' action='set' />
<assign value='source.Payment.Nsu' property='target."U_nsu"' action='set' />
<assign value='source.Payment.AcquirerNsu' property='target."U_acquirer_nsu"' action='set' />
<assign value='source.Payment.Value' property='target."U_value"' action='set' />
<assign value='source.Payment.RefundedValue' property='target."U_refunded_value"' action='set' />
<assign value='source.Payment.Status' property='target."U_status"' action='set' />
<assign value='source.Payment.Parcels' property='target."U_parcels"' action='set' />
<assign value='source.Payment.Brand' property='target."U_brand"' action='set' />
<assign value='source.Payment.CardNumber' property='target."U_card_number"' action='set' />
<assign value='source.Payment.Aid' property='target."U_aid"' action='set' />
<assign value='source.Payment.StartDate' property='target."U_start_date"' action='set' />
<assign value='source.Payment.FinishDate' property='target."U_finish_date"' action='set' />
<assign value='source.Payment.ConfirmationDate' property='target."U_confrmation_date"' action='set' />
<assign value='source.Payment.PaymentCate' property='target."U_payment_cate"' action='set' />
<assign value='source.Payment.ResponseCode' property='target."U_response_code"' action='set' />
<assign value='source.Payment.AuthorizationnNumber' property='target."U_tuthorization_code"' action='set' />
<assign value='source.Payment.Terminal' property='target."U_terminal"' action='set' />
<assign value='source.Payment.TerminalSerialNumber' property='target."U_terminal_serial_number"' action='set' />
<assign value='source.Payment.TerminalManufacturer' property='target."U_terminal_manufacturer"' action='set' />
<assign value='source.Payment.TerminalModel' property='target."U_terminal_model"' action='set' />
<assign value='source.Payment.TerminalType' property='target."U_terminal_type"' action='set' />
<assign value='source.Payment.Acquirer' property='target."U_acquirer"' action='set' />
<assign value='source.Payment.Merchant' property='target."U_merchant"' action='set' />
<assign value='source.Payment.TefMerchant' property='target."U_tef_merchant"' action='set' />
<assign value='source.Payment.StoneCode' property='target."U_stone_code"' action='set' />
<assign value='source.Payment.MerchantCategoryCode' property='target."U_merchant_category_code"' action='set' />
<assign value='source.Payment.MerchantNationaltype' property='target."U_merchant_national_type"' action='set' />
<assign value='source.Payment.MerchantNationalid' property='target."U_merchant_national_id"' action='set' />
<assign value='source.Payment.ProductName' property='target."U_product_name"' action='set' />
<assign value='source.Payment.ProductId' property='target."U_product_id"' action='set' />
<assign value='source.Payment.CardInputMethod' property='target."U_card_input_method"' action='set' />
<assign value='source.Payment.RequestedPassword' property='target."U_requested_password"' action='set' />
<assign value='source.Payment.Fallback' property='target."U_fallback"' action='set' />
<assign value='source.Payment.Origin' property='target."U_origin"' action='set' />
<assign value='source.Payment.AuthorizationTime' property='target."U_athorization_time"' action='set' />
<assign value='source.Payment.SimCardSerialNumber' property='target."U_sim_card_serial_number"' action='set' />
<assign value='source.Payment.SimCardProvider' property='target."U_sim_card_provider"' action='set' />
<assign value='source.Payment.CardHolder' property='target."U_card_holder"' action='set' />
<assign value='source.Payment.CaptureChannel' property='target."U_capture_chanel"' action='set' />
</transform>
}

}
