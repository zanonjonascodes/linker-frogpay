Class sapb1.vo.incomingpayment.PaymentInvoices Extends %SerialObject
{

Property LineNum As %Integer;

Property DocEntry As %Integer;

Property SumApplied As %Integer;

Property AppliedFC As %Integer;

Property DocRate As %Integer;

Property DocLine As %Integer;

Property InvoiceType As %String(MAXLEN = "");

Property DiscountPercent As %Integer;

Property PaidSum As %Integer;

Property InstallmentId As %Integer;

Property WitholdingTaxApplied As %Integer;

Property WitholdingTaxAppliedFC As %Integer;

Property WitholdingTaxAppliedSC As %Integer;

Property LinkDate As %String(MAXLEN = "");

Property DistributionRule As %String(MAXLEN = "");

Property DistributionRule2 As %String(MAXLEN = "");

Property DistributionRule3 As %String(MAXLEN = "");

Property DistributionRule4 As %String(MAXLEN = "");

Property DistributionRule5 As %String(MAXLEN = "");

Property TotalDiscount As %Integer;

Property TotalDiscountF As %Integer;

Property TotalDiscountSC As %Integer;

/* 
                    "LineNum": 0,
                    "DocEntry": 11,
                    "SumApplied": 9900,
                    "AppliedFC": 0,
                    "AppliedSys": 9900,
                    "DocRate": 0,
                    "DocLine": 0,
                    "InvoiceType": "it_DownPayment",
                    "DiscountPercent": 0,
                    "PaidSum": 0,
                    "InstallmentId": 1,
                    "WitholdingTaxApplied": 0,
                    "WitholdingTaxAppliedFC": 0,
                    "WitholdingTaxAppliedSC": 0,
                    "LinkDate": null,
                    "DistributionRule": null,
                    "DistributionRule2": null,
                    "DistributionRule3": null,
                    "DistributionRule4": null,
                    "DistributionRule5": null,
                    "TotalDiscount": 0,
                    "CTotalDiscountF": 0,
                    "TotalDiscountSC": 0
 */
Storage Default
{
<Data name="PaymentInvoicesState">
<Value name="1">
<Value>LineNum</Value>
</Value>
<Value name="2">
<Value>DocEntry</Value>
</Value>
<Value name="3">
<Value>SumApplied</Value>
</Value>
<Value name="4">
<Value>AppliedFC</Value>
</Value>
<Value name="5">
<Value>DocRate</Value>
</Value>
<Value name="6">
<Value>DocLine</Value>
</Value>
<Value name="7">
<Value>InvoiceType</Value>
</Value>
<Value name="8">
<Value>DiscountPercent</Value>
</Value>
<Value name="9">
<Value>PaidSum</Value>
</Value>
<Value name="10">
<Value>InstallmentId</Value>
</Value>
<Value name="11">
<Value>WitholdingTaxApplied</Value>
</Value>
<Value name="12">
<Value>WitholdingTaxAppliedFC</Value>
</Value>
<Value name="13">
<Value>WitholdingTaxAppliedSC</Value>
</Value>
<Value name="14">
<Value>LinkDate</Value>
</Value>
<Value name="15">
<Value>DistributionRule</Value>
</Value>
<Value name="16">
<Value>DistributionRule2</Value>
</Value>
<Value name="17">
<Value>DistributionRule3</Value>
</Value>
<Value name="18">
<Value>DistributionRule4</Value>
</Value>
<Value name="19">
<Value>DistributionRule5</Value>
</Value>
<Value name="20">
<Value>TotalDiscount</Value>
</Value>
<Value name="21">
<Value>TotalDiscountF</Value>
</Value>
<Value name="22">
<Value>TotalDiscountSC</Value>
</Value>
</Data>
<State>PaymentInvoicesState</State>
<StreamLocation>^sapb1.vo.i6098.PaymentInvo4736S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}

