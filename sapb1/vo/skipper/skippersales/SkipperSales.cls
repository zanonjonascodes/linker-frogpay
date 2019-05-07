Class sapb1.vo.skipper.skippersales.SkipperSales Extends (%SerialObject, %XML.Adaptor)
{

Property CustomerName As sapb1.vo.skipper.skippersales.Customer;

Property Acquirer As %String(MAXLEN = "");

Property CardBrand As %String(MAXLEN = "");

Property DateTime As %String(MAXLEN = "");

Property NsuTransaction As %String(MAXLEN = "");

Property AuthorizationCode As %String(MAXLEN = "");

Property NumberOfInstallments As %String(MAXLEN = "");

Property ProductType As %String(MAXLEN = "");

Property GrossValue As %Double;

Property DiscountValueSubacquirer As %Double;

Property DiscountValueAcquirer As %Double;

Property NetValue As %Double;

Property Terminal As %String(MAXLEN = "");

Property Status As %String(MAXLEN = "");

Storage Default
{
<Data name="SkipperSalesState">
<Value name="1">
<Value>CustomerName</Value>
</Value>
<Value name="2">
<Value>Acquirer</Value>
</Value>
<Value name="3">
<Value>CardBrand</Value>
</Value>
<Value name="4">
<Value>DateTime</Value>
</Value>
<Value name="5">
<Value>NsuTransaction</Value>
</Value>
<Value name="6">
<Value>AuthorizationCode</Value>
</Value>
<Value name="7">
<Value>NumberOfInstallments</Value>
</Value>
<Value name="8">
<Value>ProductType</Value>
</Value>
<Value name="9">
<Value>GrossValue</Value>
</Value>
<Value name="10">
<Value>DiscountValueSubacquirer</Value>
</Value>
<Value name="11">
<Value>DiscountValueAcquirer</Value>
</Value>
<Value name="12">
<Value>NetValue</Value>
</Value>
<Value name="13">
<Value>Terminal</Value>
</Value>
<Value name="14">
<Value>Status</Value>
</Value>
</Data>
<State>SkipperSalesState</State>
<StreamLocation>^sapb1.vo.skip5EF3.SkipperSalesS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
