/* 
 * Author: Kevin O'Hara
 * Date: 02/10/2012
 * 
 * Description: The Async class aims to circumvent a limitation of asynchronous (@future)
 * methods in Salesforce. The current @future implementation will only allow for primitives
 * or collections of primitives to be passed into an @future method. The Async class uses
 * native JSON serialization/deserialization to allow for passing an SObject, or List<SObject>
 * into an asynchronous method for DML operations. A helper method is also included for making 
 * the serialization processes simpler.
 */

public class Async {

    /***********************/
    /* ASYNC DML METHODS   */
    /***********************/
    
    // insert sobjects
    @future
    public static void insertSObjects(String jsonString) {
        
        List<SObject> sObjs = new List<SObject>();
        
        try {
            sObjs = (List<SObject>) JSON.deserialize(jsonString, List<SObject>.class);
        } catch (Exception e) {
            System.debug('Error in JSON deserialization');
        }
        
        if(!sObjs.isEmpty()) {
            try {
                insert sObjs;
            } catch (Exception e) {
                System.debug('Error inserting SObjects');
            }
            
        } 
        
    }
    
    // upsert sobjects
    @future
    public static void upsertSObjects(String jsonString) {
        
        List<SObject> sObjs = new List<SObject>();
        
        try {
            sObjs = (List<SObject>) JSON.deserialize(jsonString, List<SObject>.class);
        } catch (Exception e) {
            System.debug('Error in JSON deserialization');
        }
        
        if(!sObjs.isEmpty()) {
            try {
                upsert sObjs;
            } catch (Exception e) {
                System.debug('Error upserting SObjects');
            }
            
        } 
        
    }
    
    // update sobjects
    @future
    public static void updateSObjects(String jsonString) {
        
        List<SObject> sObjs = new List<SObject>();
        
        try {
            sObjs = (List<SObject>) JSON.deserialize(jsonString, List<SObject>.class);
        } catch (Exception e) {
            System.debug('Error in JSON deserialization');
        }
        
        if(!sObjs.isEmpty()) {
            try {
                update sObjs;
            } catch (Exception e) {
                System.debug('Error updating SObjects');
            }
            
        } 
        
    }
    
    // delete sobjects
    @future
    public static void deleteSObjects(String jsonString) {
        
        List<SObject> sObjs = new List<SObject>();
        
        try {
            sObjs = (List<SObject>) JSON.deserialize(jsonString, List<SObject>.class);
        } catch (Exception e) {
            System.debug('Error in JSON deserialization');
        }
        
        if(!sObjs.isEmpty()) {
            try {
                delete sObjs;
            } catch (Exception e) {
                System.debug('Error deleting SObjects');
            }
            
        } 
        
    }
    
    /***********************/
    /* HELPER METHODS      */
    /***********************/
    
    // list of sobjects
    public static String prepare(List<SObject> sObjs) {
        
        try {
            return JSON.serialize(sObjs);
        } catch (Exception e) {
            System.debug('Error in SObject List serialization');
        }
        return null;
        
    }
    
    // single sobject
    public static String prepare(SObject sObj) {
        
        try {
            return JSON.serialize(new List<SObject>{sObj});
        } catch (Exception e) {
            System.debug('Error in SObject serialization');
        }
        return null;
        
    }
    
}