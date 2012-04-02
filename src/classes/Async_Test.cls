/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class Async_Test {
	
	static List<Lead> leads;
	
	static {
		
		leads = new List<Lead>();
    	
    	Lead l1 = new Lead();
    	l1.FirstName = 'Test1';
    	l1.LastName = 'TestLast1';
    	l1.Email = 'blah1@test.com';
    	l1.Status = 'New';
    	l1.Company = 'Test Co';
    	leads.add(l1);
    	
    	Lead l2 = new Lead();
    	l2.FirstName = 'Test2';
    	l2.LastName = 'TestLast2';
    	l2.Email = 'blah2@test.com';
    	l2.Status = 'New';
    	l2.Company = 'Test Co';
    	leads.add(l2);
    	
	}
	

    static testMethod void testInsertList() {
    	Async.insertSObjects(Async.prepare(leads));
    }
    
     static testMethod void testInsertSingle() {	
    	Async.insertSObjects(Async.prepare(leads.get(0)));
    }
    
     static testMethod void testUpdateList() {
    	insert leads;
    	for(Lead l : leads) {
    		l.FirstName = 'NewName';
    	}
    	Async.updateSObjects(Async.prepare(leads));
    }
    
    static testMethod void testUpdateSingle() {
    	insert leads;
    	leads.get(0).FirstName = 'NewName';
    	Async.updateSObjects(Async.prepare(leads.get(0)));
    }
    
    static testMethod void testUpsertList() {
    	insert leads;
    	for(Lead l : leads) {
    		l.FirstName = 'NewName';
    	}
    	Async.upsertSObjects(Async.prepare(leads));	
    }
    
    static testMethod void testUpsertSingle() {
    	insert leads;
    	leads.get(0).FirstName = 'NewName';
    	Async.upsertSObjects(Async.prepare(leads.get(0)));
    }
    
    static testMethod void testDeleteList() {
    	insert leads;
    	for(Lead l : leads) {
    		l.FirstName = 'NewName';
    	}
    	Async.deleteSObjects(Async.prepare(leads));
    }
    
    static testMethod void testDeleteSingle() {
    	insert leads;
    	leads.get(0).FirstName = 'NewName';
    	Async.deleteSObjects(Async.prepare(leads.get(0)));
    }
    
    static testMethod void forceSingleInsertFailure() {
    	SObject s;	
    	Async.insertSObjects(Async.prepare(s));
    }
    
    static testMethod void forceListInsertFailure() {
    	List<SObject> s = new List<SObject>();	
    	Async.insertSObjects(Async.prepare(s));
    }
    
    static testMethod void forceSingleUpdateFailure() {
    	SObject s;	
    	Async.updateSObjects(Async.prepare(s));
    }
    
    static testMethod void forceListUpdateFailure() {
    	List<SObject> s = new List<SObject>();	
    	Async.updateSObjects(Async.prepare(s));
    }
    
    static testMethod void forceSingleUpsertFailure() {
    	SObject s;	
    	Async.upsertSObjects(Async.prepare(s));
    }
    
    static testMethod void forceListUpsertFailure() {
    	List<SObject> s = new List<SObject>();	
    	Async.upsertSObjects(Async.prepare(s));
    }
    
    static testMethod void forceSingleDeleteFailure() {
    	SObject s;	
    	Async.deleteSObjects(Async.prepare(s));
    }
    
    static testMethod void forceListDeleteFailure() {
    	List<SObject> s = new List<SObject>();	
    	Async.deleteSObjects(Async.prepare(s));
    }
    
    static testMethod void testPrepareListNull() {	
    	Async.deleteSObjects(Async.prepare(new List<SObject>()));
    }
    
    static testMethod void testPrepareSingleNull() {	
    	SObject obj;
    	Async.deleteSObjects(Async.prepare(obj));
    }
    
}