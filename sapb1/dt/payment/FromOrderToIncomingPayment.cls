Class sapb1.dt.payment.FromOrderToIncomingPayment
{

ClassMethod Transform(pSource As %RegisteredObject, ByRef pTarget As %RegisteredObject, ByRef Aux) As %Status
{
	Try
	{
		#Dim statusCode As %Status         = $System.Status.OK()
		#Dim downPayment As %DynamicObject = pSource.DownPayment
		//
		If (pSource.TranformTo = "BillOfExchange Payd")
		{
			Set pTaget = ..MapPropertiesBOE(downPayment)
		}
		ElseIf (pSource.TranformTo = "Credit Card Payd")
		{
			Set pTarget = ..MapPropertiesCreditCard(downPayment)
		}
	}
	Catch (exception)
	{
		Set statusCode = exception.AsStatus()
	}
	Return statusCode
}

ClassMethod MapPropertiesCreditCard(downPayment As %String) As %String
{
	try
	{
		Set downPaymentSAP = ##Class(%DynamicObject).%FromJSON(downPayment)
		//
		#Dim incomingPayment As %DynamyObject = {}
		//
		Set incomingPayment.Address = downPaymentSAP.Address
		Set incomingPayment.DocCurrency = downPaymentSAP.DocCurrency
		Set incomingPayment.CardCode = downPaymentSAP.CardCode			
		Set incomingPayment.DocDueDate = downPaymentSAP.DueDate
		Set incomingPayment.DocTypte = "rCustomer"
		Set incomingPayment.DownPaymentType = "dptInvoice"
		//
		Set incomingPayment.PaymentInvoices = []
		Set paymentInvoice.DocEntry = downPaymentSAP.DocEntry
		Set paymentInvoice.InvoiceType = "it_DownPayment"
		Set paymentInvoice.SumApplied = downPaymentSAP.DocTotal
		Do incomingPayment.PaymentInvoices.%Push(paymentInvoice)
		//
		Set incomingPayment.PaymentCreditCards = []
		Set paymentCreditCard.CreditCard = "1"
		Set paymentCreditCard.CreditAcct = "1.01.01.01.01"
		Set paymentCreditCard.CreditCardNumber = orderOCC.paymentGroups.%Get(0).creditCardNumber
		Set paymentCreditCard.CardValidUntil = $zdate($SYSTEM.SQL.LASTDAY(orderOCC.paymentGroups.%Get(0).expirationYear _ "-" _ orderOCC.paymentGroups.%Get(0).expirationMonth _ "-" _ "01"),3)
		Set paymentCreditCard.VoucherNum = "4444"
		Set paymentCreditCard.PaymentMethodCode = "1"
		Set paymentCreditCard.NumOfPayments = "1"
		Set paymentCreditCard.FirstPaymentDue = "2019-05-17"
		Set paymentCreditCard.FirstPaymentSum = downPaymentSAP.DocTotal
		Set paymentCreditCard.CreditSum = downPaymentSAP.DocTotal
		Set paymentCreditCard.CreditCur = downPaymentSAP.DocCurrency
		Set paymentCreditCard.NumOfCreditPayments = "1"
		Set paymentCreditCard.CreditType = "cr_InternetTransaction"
		Set paymentCreditCard.SplitPayments = "tNO"
		Do incomingPayment.PaymentCreditCards.%Push()
		//
		Set incomingPaymentSAP = incomingPayment.%ToJSON()
		//
	}
	catch(e)
	{
		Set statusCode = e.AsStatus()
		Throw e
	}
	Return incomingPaymentSAP
}

ClassMethod MapPropertiesBOE(downPayment As %String) As %String
{
	try
	{
		Set downPaymentSAP = ##Class(%DynamicObject).%FromJSON(downPayment)
		//
		#Dim incomingPayment As %DynamyObject = {}
		//
		Set incomingPayment.Address = downPaymentSAP.Address
		Set incomingPayment.DocCurrency = downPaymentSAP.DocCurrency
		Set incomingPayment.CardCode = downPaymentSAP.CardCode			
		Set incomingPayment.DocDueDate = downPaymentSAP.DueDate
		Set incomingPayment.DocTypte = "rCustomer"
		Set incomingPayment.DownPaymentType = "dptInvoice"
		//
		Set incomingPayment.PaymentInvoices = []
		Set paymentInvoice.DocEntry = downPaymentSAP.DocEntry
		Set paymentInvoice.InvoiceType = "it_DownPayment"
		Set paymentInvoice.SumApplied = downPaymentSAP.DocTotal
		Do incomingPayment.PaymentInvoices.%Push(paymentInvoice)
		//
		Set incomingPayment.TransferAccount = "1.01.01.02.07"
		Set incomingPayment.TransferSum = downPaymentSAP.DocTotal
		Set incomingPayment.TransferDate = "2019-04-15"
		//
		Set incomingPaymentSAP = incomingPayment.%ToJSON()
		//
	}
	catch(e)
	{
		Set statusCode = e.AsStatus()
		Throw e
	}
	Return incomingPaymentSAP
}

}
