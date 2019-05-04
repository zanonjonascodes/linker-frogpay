Class linker.dt.phoebus.FromPhoebusPaymentsToPhoebusTransactDTL Extends Ens.DataTransformDTL [ DependsOn = (%DynamicObject, linker.bp.phoebus.payments.Request) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='%DynamicObject' targetClass='linker.bp.phoebus.payments.Request' create='new' language='objectscript' >
<assign value='source.nsu' property='target.Payment.Nsu' action='set' />
<assign value='source."acquirer_nsu"' property='target.Payment.AcquirerNsu' action='set' />
<assign value='source.value' property='target.Payment.Value' action='set' />
<assign value='source."refunded_value"' property='target.Payment.RefundedValue' action='set' />
<assign value='source.status' property='target.Payment.Status' action='set' />
<assign value='source.parcels' property='target.Payment.Parcels' action='set' />
<assign value='source.brand' property='target.Payment.Brand' action='set' />
<assign value='source."card_number"' property='target.Payment.CardNumber' action='set' />
<assign value='source.aid' property='target.Payment.Aid' action='set' />
<assign value='source."start_date"' property='target.Payment.StartDate' action='set' />
<assign value='source."finish_date"' property='target.Payment.FinishDate' action='set' />
<assign value='source."confrmation_date"' property='target.Payment.ConfirmationDate' action='set' />
<assign value='source."payment_cate"' property='target.Payment.PaymentCate' action='set' />
<assign value='source."response_code"' property='target.Payment.ResponseCode' action='set' />
<assign value='source."tuthorization_code"' property='target.Payment.AuthorizationnNumber' action='set' />
<assign value='source.terminal' property='target.Payment.Terminal' action='set' />
<assign value='source."terminal_serial_number"' property='target.Payment.TerminalSerialNumber' action='set' />
<assign value='source."terminal_manufacturer"' property='target.Payment.TerminalManufacturer' action='set' />
<assign value='source."terminal_model"' property='target.Payment.TerminalModel' action='set' />
<assign value='source."terminal_type"' property='target.Payment.TerminalType' action='set' />
<assign value='source.acquirer' property='target.Payment.Acquirer' action='set' />
<assign value='source.merchant' property='target.Payment.Merchant' action='set' />
<assign value='source."tef_merchant"' property='target.Payment.TefMerchant' action='set' />
<assign value='source."stone_code"' property='target.Payment.StoneCode' action='set' />
<assign value='source."merchant_category_code"' property='target.Payment.MerchantCategoryCode' action='set' />
<assign value='source."merchant_national_type"' property='target.Payment.MerchantNationaltype' action='set' />
<assign value='source."merchant_national_id"' property='target.Payment.MerchantNationalid' action='set' />
<assign value='source."product_name"' property='target.Payment.ProductName' action='set' />
<assign value='source."product_id"' property='target.Payment.ProductId' action='set' />
<assign value='source."card_input_method"' property='target.Payment.CardInputMethod' action='set' />
<assign value='source."requested_password"' property='target.Payment.RequestedPassword' action='set' />
<assign value='source.fallback' property='target.Payment.Fallback' action='set' />
<assign value='source.origin' property='target.Payment.Origin' action='set' />
<assign value='source."athorization_time"' property='target.Payment.AuthorizationTime' action='set' />
<assign value='source."sim_card_serial_number"' property='target.Payment.SimCardSerialNumber' action='set' />
<assign value='source."sim_card_provider"' property='target.Payment.SimCardProvider' action='set' />
<assign value='source."card_holder"' property='target.Payment.CardHolder' action='set' />
<assign value='source."capture_chanel"' property='target.Payment.CaptureChannel' action='set' />
</transform>
}

}
