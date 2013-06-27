# Helper Classes for Force.com
  
I am building a collection of useful helper classes for Salesforce and Force.com.

### Contributing

You should contribute...

1. Fork this repo

2. Add some awesomeness (either classes of your own or enhancements to existing classes)

3. Submit pull request

4. Enjoy

## Helper Classes

### Async.cls

The Async class aims to circumvent a limitation of asynchronous (@future) methods in Salesforce. The current @future implementation will only allow for primitives or collections of primitives to be passed into an @future method. The Async class uses native JSON serialization/deserialization to allow for passing an SObject, or List<SObject> into an asynchronous method for DML operations. A helper method is also included for making the serialization processes simpler.

Usage:

```java
List<Lead> leads = [SELECT Id, FirstName, LastName FROM Lead LIMIT 10];
  
for(Lead l : leads) {
  l.FirstName = 'Somethingelse';
}

// this will update asynchronously
Async.updateSObjects(Async.prepare(leads));
```

### InvokeUpdateTriggerBatch.cls 

I find myself needing to run mass-updates on records once I finish an "On Update" trigger. I created this simple utility batch class that runs an update on all records retrieved by a SOQL query string that is supplied as the classes only argument. There is a static method that will run this in one line.

Usage:

```java
String batchId = InvokeUpdateTriggerBatch.invoke('SELECT Id FROM Lead');
```

### StateFormatter.cls

I created this class to automatically format US State names and State Codes from raw user input. The result is better reporting and cleaner data. The class has a single static method called getState() that accepts a String as its argument. It returns a State object with the formal State Name and State Code as its properties. See the test method for usage examples.

Usage:

```java
String myState = 'mich';

// This will return MI
myState = StateFormatter.getState(myState).statecode;

// This will return Michigan
myState = StateFormatter.getState(myState).statename;
```
  
### SuperMap.cls
  
I created this class to help circumvent the 1000 element maximum in Map collections.  It's not a wonderful solution, but until parameterization is allowed in Apex, this is a decent workaround.

Usage:

```java
SuperMap mySuperMap = new SuperMap();

for(Integer i=1; i<=10000; i++) {
  mySuperMap.put(String.valueOf(i), 'value' + String.valueOf(i));
}

// remember to cast as the supermap stores generic objects
String val = (String) mySuperMap.get('10000');
```  

### SearchHelper.cls

SearchHelper is a convenience utility that makes constructing SOSL
queries easier and less prone to errors.  It supports searching multiple 
SObjects and includes support for adding Fields, Where clauses, and Limits.
Search results are easily accessed by object.

EXAMPLE USAGE:

```java
SearchHelper sosl = new SearchHelper();
sosl.setSearchScope( SearchHelper.Scope.ALL_FIELDS );
sosl.setSearchObjects( new List<String>{ 'Account', 'Contact' } );
  
// set Account options
sosl.setFieldsForObject( 'Account', new List<String>{ 'Name', 'BillingCity', 'Phone' } );
sosl.setConditionForObject( 'Account', 'CreatedDate <= TODAY' );
sosl.setLimitForObject( 'Account', 25 );
 
if( sosl.find( 'Acme' ) ) {  // returns false if there is an error
   List<Account> accounts = (List<Account>)sosl.getResultsForObject( 'Account' );
   List<Contact> contacts = (List<Contact>)sosl.getResultsForObject( 'Contact' );
} else {
   System.debug( 'SOSL Error: ' + sosl.getError() );
}
```

## Contributors

- Kevin O'Hara
- Clint Lee
