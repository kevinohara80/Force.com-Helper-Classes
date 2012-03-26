# Helper Classes for Force.com
  
I am building a collection of useful helper classes for Salesforce and Force.com.

### Contributing

You should contribute...

1. Fork this repo

2. Add some awesomeness (either classes of your own or enhancements to existing classes)

3. Submit pull request

4. Enjoy

## Helper Classes

### InvokeUpdateTriggerBatch.cls 

I find myself needing to run mass-updates on records once I finish an "On Update" trigger. I created this simple utility batch class that runs an update on all records retrieved by a SOQL query string that is supplied as the classes only argument. There is a static method that will run this in one line.

`String batchId = InvokeUpdateTriggerBatch.invoke('SELECT Id FROM Lead');`

### StateFormatter.cls

I created this class to automatically format US State names and State Codes from raw user input. The result is better reporting and cleaner data. The class has a single static method called getState() that accepts a String as its argument. It returns a State object with the formal State Name and State Code as its properties. See the test method for usage examples.
  
### SuperMap.cls
  
I created this class to help circumvent the 1000 element maximum in Map collections.  It's not a wonderful solution, but until parameterization is allowed in Apex, this is a decent workaround.  

## Contributors

- Kevin O'Hara
- {{Your Name Here}}
