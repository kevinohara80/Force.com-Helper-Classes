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

}