public class SearchHelper_Test 
{
	static testmethod void testOne()
	{
		// setup Account and Contact Data
		Account a = new Account( Name = 'Test Account' );
		insert a;
		
		Contact c = new Contact( FirstName = 'Test'
		                        ,LastName  = 'Contact'
		                        ,AccountId = a.Id
		                        ,Email     = 'testing@gooogle.org.net' );
		insert c;
		
		// mock up sosl results
		List<Id> searchResults = new List<Id>{ a.Id, c.Id };
		Test.setFixedSearchResults( searchResults );
		
		SearchHelper sosl = new SearchHelper();
		sosl.setSearchScope( SearchHelper.Scope.NAME_FIELDS );
		sosl.setSearchObjects( new List<String>{ 'Account', 'Contact' } );
		
		// set Account options
		sosl.setFieldsForObject( 'Account', new List<String>{'Name', 'Phone'} );
		sosl.setConditionForObject( 'Account', 'CreatedDate <= TODAY' );
		sosl.setLimitForObject( 'Account', 10 );
		
		// execute SOSL query
		Boolean success = sosl.find('Acme');
		System.assert( success );
		
		// fetch results
		List<SObject> acctResults            = sosl.getResultsForObject( 'Account' );
		List<SObject> contResults            = sosl.getResultsForObject( 'Contact' );
		Map<String,List<SObject>> allResults = sosl.getResults();
		
		// assert results are correct
	    System.assertEquals( 1, acctResults.size() );
        System.assertEquals( 1, contResults.size() );
        System.assertEquals( 1, allResults.get('Account').size() );
        System.assertEquals( 1, allResults.get('Contact').size() );
	    System.assertEquals( 2, sosl.getSearchObjects().size() );
	    System.assertEquals( '', sosl.getError() );
	}

}