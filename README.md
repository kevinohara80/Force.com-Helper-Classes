# Helper Classes for Force.com
  
Here are some utility/helper classes that I have compiled for Salesforce and Force.com  
 
## InvokeUpdateTriggerBatch Class 

I find myself needing to run mass-updates on records once I finish an "On Update" trigger. I created this simple utility batch class that runs an update on all records retrieved by a SOQL query string that is supplied as the classes only argument. There is a static method that will run this in one line.

`String batchId = InvokeUpdateTriggerBatch.invoke('SELECT Id FROM Lead');`
  
## SuperMap Class
  
I created this class to help circumvent the 1000 element maximum in Map collections.  It's not a wonderful solution, but until parameterization is allowed in Apex, this is a decent workaround.  
