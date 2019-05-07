Class sapb1.vo.incomingpayment.IncomingPayment Extends %Persistent
{

// Declaracao de atributos
Property DocNum As %Integer;

Property DocType As %String(MAXLEN = "");

Property HandWritten As %String(MAXLEN = "");

Property Printed As %String(MAXLEN = "");

Property DocDate As %Date;

Property CardCode As %String(MAXLEN = "");

Property CardName As %String(MAXLEN = "");

Property Address As %String(MAXLEN = "");

Property CashAccount As %String(MAXLEN = "");

Property DocCurrency As %String(MAXLEN = "");

Property CashSum As %Integer;

Property CheckAccount As %String(MAXLEN = "");

Property TransferAccount As %String(MAXLEN = "");

Property TransferSum As %Integer;

Property TransferDate As %String(MAXLEN = "");

Property TransferReference As %String(MAXLEN = "");

Property LocalCurrency As %String(MAXLEN = "");

Property DocRate As %Integer;

Property Reference1 As %String(MAXLEN = "");

Property Reference2 As %String(MAXLEN = "");

Property CounterReference As %String(MAXLEN = "");

Property Remarks As %String(MAXLEN = "");

Property JournalRemarks As %String(MAXLEN = "");

Property SplitTransaction As %String(MAXLEN = "");

Property ContactPersonCode As %Integer;

Property ApplyVAT As %String(MAXLEN = "");

Property TaxDate As %String(MAXLEN = "");

Property Series As %Integer;

Property BankCode As %String(MAXLEN = "");

Property BankAccount As %String(MAXLEN = "");

Property DiscountPercent As %Integer;

Property ProjectCode As %String(MAXLEN = "");

Property CurrencyIsLocal As %String(MAXLEN = "");

Property DeductionPercent As %Integer;

Property DeductionSum As %Integer;

Property CashSumFC As %Integer;

Property CashSumSys As %Integer;

Property BoeAccount As %String(MAXLEN = "");

Property BillOfExchangeAmount As %Integer;

Property BillofExchangeStatus As %String(MAXLEN = "");

Property BillOfExchangeAmountFC As %Integer;

Property BillOfExchangeAmountSC As %Integer;

Property BillOfExchangeAgent As %String(MAXLEN = "");

Property WTCode As %String(MAXLEN = "");

Property WTAmount As %Integer;

Property WTAmountFC As %Integer;

Property WTAmountSC As %Integer;

Property WTAccount As %String(MAXLEN = "");

Property WTTaxableAmount As %Integer;

Property Proforma As %String(MAXLEN = "");

Property PayToBankCode As %String(MAXLEN = "");

Property PayToBankBranch As %String(MAXLEN = "");

Property PayToBankAccountNo As %String(MAXLEN = "");

Property PayToCode As %String(MAXLEN = "");

Property PayToBankCountry As %String(MAXLEN = "");

Property IsPayToBank As %String(MAXLEN = "");

Property DocEntry As %Integer;

Property PaymentPriority As %String(MAXLEN = "");

Property TaxGroup As %String(MAXLEN = "");

Property BankChargeAmount As %Integer;

Property BankChargeAmountInFC As %Integer;

Property BankChargeAmountInSC As %Integer;

Property UnderOverpaymentdifference As %Integer;

Property UnderOverpaymentdiffSC As %Integer;

Property WtBaseSum As %Integer;

Property WtBaseSumFC As %Integer;

Property WtBaseSumSC As %Integer;

Property VatDate As %String(MAXLEN = "");

Property TransactionCode As %String(MAXLEN = "");

Property PaymentType As %String(MAXLEN = "");

Property TransferRealAmount As %Integer;

Property DocObjectCode As %String(MAXLEN = "");

Property DocTypte As %String(MAXLEN = "");

Property DueDate As %Date;

Property LocationCode As %String(MAXLEN = "");

Property Cancelled As %String(MAXLEN = "");

Property ControlAccount As %String(MAXLEN = "");

Property UnderOverpaymentdiffFC As %Integer;

Property AuthorizationStatus As %String(MAXLEN = "");

Property BPLID As %Integer;

Property BPLName As %String(MAXLEN = "");

Property VATRegNum As %String(MAXLEN = "");

Property BlanketAgreement As %String(MAXLEN = "");

Property PaymentByWTCertif As %String(MAXLEN = "");

Property PaymentChecks As list Of sapb1.vo.incomingpayment.PaymentChecks;

Property PaymentInvoices As list Of sapb1.vo.incomingpayment.PaymentInvoices;

Property PaymentCreditCards As list Of sapb1.vo.incomingpayment.PaymentCreditCards;

Property PaymentAccounts As list Of sapb1.vo.incomingpayment.PaymentAccounts;

Property BillOfExchange As list Of sapb1.vo.incomingpayment.BillOfExchange;

Property WithholdingTaxCertificatesCollection As list Of sapb1.vo.incomingpayment.WithholdingTaxCertificatesCollection;

Property ElectronicProtocols As list Of sapb1.vo.incomingpayment.ElectronicProtocols;

Property CashFlowAssignments As list Of sapb1.vo.incomingpayment.CashFlowAssignments;

Property PaymentsApprovalRequests As list Of sapb1.vo.incomingpayment.PaymentsApprovalRequests;

Property WithholdingTaxDataWTXCollection As list Of sapb1.vo.incomingpayment.WithholdingTaxDataWTXCollection;

Storage Default
{
<Data name="IncomingPaymentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DocNum</Value>
</Value>
<Value name="3">
<Value>DocType</Value>
</Value>
<Value name="4">
<Value>HandWritten</Value>
</Value>
<Value name="5">
<Value>Printed</Value>
</Value>
<Value name="6">
<Value>DocDate</Value>
</Value>
<Value name="7">
<Value>CardCode</Value>
</Value>
<Value name="8">
<Value>CardName</Value>
</Value>
<Value name="9">
<Value>Address</Value>
</Value>
<Value name="10">
<Value>CashAccount</Value>
</Value>
<Value name="11">
<Value>DocCurrency</Value>
</Value>
<Value name="12">
<Value>CashSum</Value>
</Value>
<Value name="13">
<Value>CheckAccount</Value>
</Value>
<Value name="14">
<Value>TransferAccount</Value>
</Value>
<Value name="15">
<Value>TransferSum</Value>
</Value>
<Value name="16">
<Value>TransferDate</Value>
</Value>
<Value name="17">
<Value>TransferReference</Value>
</Value>
<Value name="18">
<Value>LocalCurrency</Value>
</Value>
<Value name="19">
<Value>DocRate</Value>
</Value>
<Value name="20">
<Value>Reference1</Value>
</Value>
<Value name="21">
<Value>Reference2</Value>
</Value>
<Value name="22">
<Value>CounterReference</Value>
</Value>
<Value name="23">
<Value>Remarks</Value>
</Value>
<Value name="24">
<Value>JournalRemarks</Value>
</Value>
<Value name="25">
<Value>SplitTransaction</Value>
</Value>
<Value name="26">
<Value>ContactPersonCode</Value>
</Value>
<Value name="27">
<Value>ApplyVAT</Value>
</Value>
<Value name="28">
<Value>TaxDate</Value>
</Value>
<Value name="29">
<Value>Series</Value>
</Value>
<Value name="30">
<Value>BankCode</Value>
</Value>
<Value name="31">
<Value>BankAccount</Value>
</Value>
<Value name="32">
<Value>DiscountPercent</Value>
</Value>
<Value name="33">
<Value>ProjectCode</Value>
</Value>
<Value name="34">
<Value>CurrencyIsLocal</Value>
</Value>
<Value name="35">
<Value>DeductionPercent</Value>
</Value>
<Value name="36">
<Value>DeductionSum</Value>
</Value>
<Value name="37">
<Value>CashSumFC</Value>
</Value>
<Value name="38">
<Value>CashSumSys</Value>
</Value>
<Value name="39">
<Value>BoeAccount</Value>
</Value>
<Value name="40">
<Value>BillOfExchangeAmount</Value>
</Value>
<Value name="41">
<Value>BillofExchangeStatus</Value>
</Value>
<Value name="42">
<Value>BillOfExchangeAmountFC</Value>
</Value>
<Value name="43">
<Value>BillOfExchangeAmountSC</Value>
</Value>
<Value name="44">
<Value>BillOfExchangeAgent</Value>
</Value>
<Value name="45">
<Value>WTCode</Value>
</Value>
<Value name="46">
<Value>WTAmount</Value>
</Value>
<Value name="47">
<Value>WTAmountFC</Value>
</Value>
<Value name="48">
<Value>WTAmountSC</Value>
</Value>
<Value name="49">
<Value>WTAccount</Value>
</Value>
<Value name="50">
<Value>WTTaxableAmount</Value>
</Value>
<Value name="51">
<Value>Proforma</Value>
</Value>
<Value name="52">
<Value>PayToBankCode</Value>
</Value>
<Value name="53">
<Value>PayToBankBranch</Value>
</Value>
<Value name="54">
<Value>PayToBankAccountNo</Value>
</Value>
<Value name="55">
<Value>PayToCode</Value>
</Value>
<Value name="56">
<Value>PayToBankCountry</Value>
</Value>
<Value name="57">
<Value>IsPayToBank</Value>
</Value>
<Value name="58">
<Value>DocEntry</Value>
</Value>
<Value name="59">
<Value>PaymentPriority</Value>
</Value>
<Value name="60">
<Value>TaxGroup</Value>
</Value>
<Value name="61">
<Value>BankChargeAmount</Value>
</Value>
<Value name="62">
<Value>BankChargeAmountInFC</Value>
</Value>
<Value name="63">
<Value>BankChargeAmountInSC</Value>
</Value>
<Value name="64">
<Value>UnderOverpaymentdifference</Value>
</Value>
<Value name="65">
<Value>UnderOverpaymentdiffSC</Value>
</Value>
<Value name="66">
<Value>WtBaseSum</Value>
</Value>
<Value name="67">
<Value>WtBaseSumFC</Value>
</Value>
<Value name="68">
<Value>WtBaseSumSC</Value>
</Value>
<Value name="69">
<Value>VatDate</Value>
</Value>
<Value name="70">
<Value>TransactionCode</Value>
</Value>
<Value name="71">
<Value>PaymentType</Value>
</Value>
<Value name="72">
<Value>TransferRealAmount</Value>
</Value>
<Value name="73">
<Value>DocObjectCode</Value>
</Value>
<Value name="74">
<Value>DocTypte</Value>
</Value>
<Value name="75">
<Value>DueDate</Value>
</Value>
<Value name="76">
<Value>LocationCode</Value>
</Value>
<Value name="77">
<Value>Cancelled</Value>
</Value>
<Value name="78">
<Value>ControlAccount</Value>
</Value>
<Value name="79">
<Value>UnderOverpaymentdiffFC</Value>
</Value>
<Value name="80">
<Value>AuthorizationStatus</Value>
</Value>
<Value name="81">
<Value>BPLID</Value>
</Value>
<Value name="82">
<Value>BPLName</Value>
</Value>
<Value name="83">
<Value>VATRegNum</Value>
</Value>
<Value name="84">
<Value>BlanketAgreement</Value>
</Value>
<Value name="85">
<Value>PaymentByWTCertif</Value>
</Value>
<Value name="86">
<Value>PaymentChecks</Value>
</Value>
<Value name="87">
<Value>PaymentInvoices</Value>
</Value>
<Value name="88">
<Value>PaymentCreditCards</Value>
</Value>
<Value name="89">
<Value>PaymentAccounts</Value>
</Value>
<Value name="90">
<Value>BillOfExchange</Value>
</Value>
<Value name="91">
<Value>WithholdingTaxCertificatesCollection</Value>
</Value>
<Value name="92">
<Value>ElectronicProtocols</Value>
</Value>
<Value name="93">
<Value>CashFlowAssignments</Value>
</Value>
<Value name="94">
<Value>PaymentsApprovalRequests</Value>
</Value>
<Value name="95">
<Value>WithholdingTaxDataWTXCollection</Value>
</Value>
</Data>
<DataLocation>^sapb1.vo.i6098.IncomingPayB5A6D</DataLocation>
<DefaultData>IncomingPaymentDefaultData</DefaultData>
<IdLocation>^sapb1.vo.i6098.IncomingPayB5A6D</IdLocation>
<IndexLocation>^sapb1.vo.i6098.IncomingPayB5A6I</IndexLocation>
<StreamLocation>^sapb1.vo.i6098.IncomingPayB5A6S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

