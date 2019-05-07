Class linker.boapi.pooling.Stone Extends linker.boapi.Pooling
{

ClassMethod PreSaveInRepository(pStream As %String, pServiceConsumer As linker.data.config.Services, pResourcePath As %String) As %String [ Private ]
{
	#Dim xmlReader As %XML.Reader                                 = ##Class(%XML.Reader).%New()
	#Dim statusCode As %Status                                    =  xmlReader.OpenStream(pStream)
	#Dim conciliation As sapb1.vo.stone.conciliation.Conciliation = ""
	//
	If ($System.Status.IsError(statusCode))
	{
		Throw ##Class(%Exception.StatusException).CreateFromStatus(statusCode)
	}
	Do xmlReader.Correlate("Conciliation", "sapb1.vo.stone.conciliation.Conciliation")
	//
	While (xmlReader.Next(.conciliation))
	{
		Do ..SaveInRepository(conciliation.FinancialTransactions, pServiceConsumer)
	}
	Return ""
}

ClassMethod SaveInRepository(pObjects As %ListOfObjects, pServiceConsumer As linker.data.config.Services) [ Private ]
{
	Try
	{
		#Dim indexTransaction As %Integer = 0
		//
		For indexTransaction = 1 : 1 : pObjects.Count()
		{
			#Dim transaction As sapb1.vo.stone.conciliation.Transaction = pObjects.GetAt(indexTransaction)
			#Dim transactionString As %String                           = ""
			//
			Do transaction.XMLExportToString(.transactionString, "Transaction")
			Do ##Class(linker.data.Repository).CreateEntry(transactionString, pServiceConsumer)
		}
	}
	Catch (exception)
	{
		Throw exception
	}
}

}