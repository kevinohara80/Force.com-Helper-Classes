global class InvokeUpdateTriggerBatch implements Database.Batchable<sObject> {
	
	private String query;
	
	global InvokeUpdateTriggerBatch(String query) {
		this.query = query;
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC){
		
		return Database.getQueryLocator(this.query);	
	}
	
	global void execute(Database.BatchableContext BC, List<sObject> scope){		
		update scope;			
	}

	global void finish(Database.BatchableContext BC){	
   		System.debug('Batch Process Complete');	
	}
	
	// utility static method to kick off a batch in one line.
	global static String invoke(String query) {
		InvokeUpdateTriggerBatch batch = new InvokeUpdateTriggerBatch(query);
		return Database.executeBatch(batch);
	}
	
	static testmethod void testBatch() {
		
		List<Lead> leads = new List<Lead>();
		
		for(Integer i=0; i<100; i++) {
			
			Lead l = new Lead();
			l.FirstName = 'Test' + String.valueof(i);
			l.LastName = 'Test' + String.valueof(i);
			l.Email = 'test' + String.valueof(i) + '@test.com';
			l.Company = 'Blah Company';
			leads.add(l);
			
		}
		
		insert leads;
		
		Test.startTest();
		
		String batchId = InvokeUpdateTriggerBatch.invoke('SELECT Id FROM Lead');
		
		Test.stopTest();
		
	}

}