Class linker.dt.cloudwalk.FromCloudWalkTransToVO Extends Ens.DataTransformDTL [ DependsOn = (%DynamicObject, linker.bp.cloudwalk.transaction.Request) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='%DynamicObject' targetClass='linker.bp.cloudwalk.transaction.Request' create='new' language='objectscript' >
<assign value='source.transaction.parsed."capture_method"' property='target.CloudWalkTrans.Parsed.CaptureMethod' action='set' />
<assign value='source.transaction.parsed."nsu_reference"' property='target.CloudWalkTrans.Parsed.NsuReference' action='set' />
<assign value='source.transaction.parsed."transaction_id"' property='target.CloudWalkTrans.Parsed.TransactionId' action='set' />
<assign value='source.transaction.parsed.amount' property='target.CloudWalkTrans.Parsed.Amount' action='set' />
<assign value='source.transaction.parsed.type' property='target.CloudWalkTrans.Parsed.Type' action='set' />
<assign value='source.transaction.parsed.merchant.document' property='target.CloudWalkTrans.Parsed.Merchant.document' action='set' />
<assign value='source.transaction.parsed.merchant.name' property='target.CloudWalkTrans.Parsed.Merchant.Name' action='set' />
<assign value='source.transaction.parsed.nsu' property='target.CloudWalkTrans.Parsed.Nsu' action='set' />
<assign value='source.transaction.parsed."authorization_code"' property='target.CloudWalkTrans.Parsed.AuthorizationCode' action='set' />
<assign value='source.transaction.parsed."status_reason"' property='target.CloudWalkTrans.Parsed.StatusReason' action='set' />
<assign value='source.transaction.parsed."payment_method"' property='target.CloudWalkTrans.Parsed.PaymentMethod' action='set' />
<assign value='source.transaction.parsed.merchant.document.id' property='target.CloudWalkTrans.Parsed.Merchant.Id' action='set' />
<assign value='source.transaction.parsed.installment.quantity' property='target.CloudWalkTrans.Parsed.Installment.Quantity' action='set' />
<assign value='source.transaction.parsed.installment.type' property='target.CloudWalkTrans.Parsed.Installment.Type' action='set' />
<assign value='source.transaction.parsed.card."first_digits"' property='target.CloudWalkTrans.Parsed.Card.FirstDigits' action='set' />
<assign value='source.transaction.parsed.card."expiration_date"' property='target.CloudWalkTrans.Parsed.Card.ExpirationDate' action='set' />
<assign value='source.transaction.parsed.card."brand"' property='target.CloudWalkTrans.Parsed.Card.Brand' action='set' />
<assign value='source.transaction.parsed.card."last_digits"' property='target.CloudWalkTrans.Parsed.Card.LastDigits' action='set' />
<assign value='source.transaction.parsed.card."holder_name"' property='target.CloudWalkTrans.Parsed.Card.HolderName' action='set' />
<assign value='source.transaction.status' property='target.CloudWalkTrans.Status' action='set' />
<assign value='source.transaction."logical_number"' property='target.CloudWalkTrans.LogicalNumber' action='set' />
<assign value='source.transaction.id' property='target.CloudWalkTrans.Id' action='set' />
<assign value='source.transaction."finished_at"' property='target.CloudWalkTrans.FinishedAt' action='set' />
<assign value='source.transaction."serial_number"' property='target.CloudWalkTrans.SerialNumber' action='set' />
<assign value='source.transaction."transaction_type"' property='target.CloudWalkTrans.TransactionType' action='set' />
<assign value='source.transaction."started_at"' property='target.CloudWalkTrans.StartedAt' action='set' />
<assign value='source.transaction.detail' property='target.CloudWalkTrans.Detail' action='set' />
<assign value='source.transaction.parsed.acquirer' property='target.CloudWalkTrans.Parsed.Acquirer' action='set' />
<assign value='source.transaction.parsed.status' property='target.CloudWalkTrans.Parsed.Status' action='set' />
</transform>
}

}