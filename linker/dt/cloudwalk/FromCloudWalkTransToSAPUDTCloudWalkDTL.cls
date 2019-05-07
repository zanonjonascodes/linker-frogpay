Class linker.dt.cloudwalk.FromCloudWalkTransToSAPUDTCloudWalkDTL Extends Ens.DataTransformDTL [ DependsOn = (%DynamicObject, linker.bp.cloudwalk.transaction.Request) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='linker.bp.cloudwalk.transaction.Request' targetClass='%DynamicObject' create='new' language='objectscript' >
<assign value='source.CloudWalkTrans.Parsed.CaptureMethod' property='target."U_capture_method"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.NsuReference' property='target."U_nsu_reference"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.TransactionId' property='target."U_transaction_id"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Amount' property='target."U_amount"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Type' property='target."U_type"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Merchant.document' property='target."U_merchant_document"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Merchant.Name' property='target."U_merchant_name"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Nsu' property='target."U_nsu"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.AuthorizationCode' property='target."U_authorization_code"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.StatusReason' property='target."U_status_reason"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.PaymentMethod' property='target."U_payment_method"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Merchant.Id' property='target."U_merchant_id"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Installment.Quantity' property='target."U_installment_quantity"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Installment.Type' property='target."U_installment_type"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Card.FirstDigits' property='target."U_card_first_digits"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Card.ExpirationDate' property='target."U_card_expiration_date"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Card.Brand' property='target."U_card_brand"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Card.LastDigits' property='target."U_card_last_digits"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Card.HolderName' property='target."U_card_holder_name"' action='set' />
<assign value='source.CloudWalkTrans.Status' property='target."U_cw_status"' action='set' />
<assign value='source.CloudWalkTrans.LogicalNumber' property='target."U_cw_logical_number"' action='set' />
<assign value='source.CloudWalkTrans.Id' property='target."U_cw_id"' action='set' />
<assign value='source.CloudWalkTrans.FinishedAt' property='target."U_finished_at"' action='set' />
<assign value='source.CloudWalkTrans.SerialNumber' property='target."U_serial_number"' action='set' />
<assign value='source.CloudWalkTrans.TransactionType' property='target."U_transaction_type"' action='set' />
<assign value='source.CloudWalkTrans.StartedAt' property='target."U_started_at"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Acquirer' property='target."U_acquirer"' action='set' />
<assign value='source.CloudWalkTrans.Parsed.Status' property='target."U_status"' action='set' />
</transform>

}

}
