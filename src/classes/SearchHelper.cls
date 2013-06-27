/**
 *  SearchHelper is a convenience utility that makes constructing SOSL
 *  queries easier and less prone to errors.  It supports searching multiple 
 *  SObjects and includes support for adding Fields, Where clauses, and Limits.
 *  Search results are easily accessed by object.
 *  
 *  EXAMPLE USAGE
 *   
 *  SearchHelper sosl = new SearchHelper();
 *  sosl.setSearchScope( SearchHelper.Scope.ALL_FIELDS );
 *  sosl.setSearchObjects( new List<String>{ 'Account', 'Contact' } );
 *  
 *  // set Account options
 *  sosl.setFieldsForObject( 'Account', new List<String>{ 'Name', 'BillingCity', 'Phone' } );
 *  sosl.setConditionForObject( 'Account', 'CreatedDate <= TODAY' );
 *  sosl.setLimitForObject( 'Account', 25 );
 *  
 *  if( sosl.find( 'Acme' ) ) {  // returns false if there is an error
 *     List<Account> accounts = (List<Account>)sosl.getResultsForObject( 'Account' );
 *     List<Contact> contacts = (List<Contact>)sosl.getResultsForObject( 'Contact' );
 *  } else {
 *     System.debug( 'SOSL Error: ' + sosl.getError() );
 *  }
 *
**/

public class SearchHelper
{
    public enum Scope { ALL_FIELDS, 
                        NAME_FIELDS, 
                        EMAIL_FIELDS,
                        PHONE_FIELDS, 
                        SIDEBAR_FIELDS }
    private Scope currentScope;
    private Map<String,Map<String,String>> objects;
    private Map<String,List<SObject>> resultMap;
    private String error = '';
    
      
    /*
     # Public Methods
     ======================================================================= */
    
    
    /**
     * @param scope  setter for the search scope. 
     *
     * This is the set of fields searched by the sosl query. 
     *
    **/
    public void setSearchScope( Scope scope )
    {
        currentScope = scope;
    }
    
    /**
     *  @param  searchObjects  a list of SObject Type names.
     *
     *  Sets the objects that will be queried.
     *
    **/
    public void setSearchObjects( List<String> searchObjects )
    {
        objects = new Map<String,Map<String,String>>();

        for( String s : searchObjects ) {
            Map<String,String> options = new Map<String,String>();
            options.put( 'fields', 'Id');
            options.put( 'where', '');
            options.put( 'limit', '');

            objects.put( s, options );
        }
    }
    
    /**
     *  @param  objectName  an SObject Type name
     *  @param  fields      a list of field names
     *
     *  Set the fields that will be returned in the search query for the 
     *  given object.
     *
    **/
    public void setFieldsForObject( String objectName, List<String> fields )
    {
        Map<String,String> options = objects.get(objectName);

        String fieldStr = ',Id' ;
        for( String field : fields )
        {
            if( field.equalsIgnoreCase('id') ) continue;
            
            fieldStr += ',' + field;
        }

        options.put( 'fields', fieldStr.substring(1) );
        objects.put(objectName, options);
    }
    
    /**
     *  @param  objectName  an SObject Type name
     *  @param  lmt         an integer
     *
     * Set the number of records to limit the search results for the given
     * object.
     *
    **/
    public void setLimitForObject( String objectName, Integer lmt )
    {
        Map<String,String> options = objects.get(objectName);
        options.put( 'limit', 'LIMIT ' + String.valueOf( lmt ) );
        objects.put(objectName, options);
    }

    /**
     *  @param  objectName  an SObject Type name
     *  @param  condition   filters for a Where clause
     *
     *  Set the WHERE clause of a sosl search for the given object.
     *
    **/
    public void setConditionForObject( String objectName, String condition )
    {
        Map<String,String> options = objects.get(objectName);
        options.put( 'where', 'WHERE ' + condition );
        objects.put(objectName, options);
    }
    
    /**
     *  @return  a Set that contains the SObject types that will be queried.
     *
    **/
    public Set<String> getSearchObjects()
    {
        return objects.keySet();
    }
    
    /**
     *  @param   searchTerm  the word or phrase to be searched.
     *  @return  true if the query executes, false if there's an error.
     *
     *  This method executes the SOSL search and updates the internal state
     *  with the results ( or error ).
     *
    **/
    public Boolean find( String searchTerm )
    {
        Boolean success = false;
        List<List<SObject>> results = null;
        searchTerm = '\'' + searchTerm + '\'';
        String sosl = String.format( 'FIND {0} IN {1} RETURNING {2}', 
                        new List<String>{searchTerm
                                        ,getSearchScope()
                                        ,getSearchObjectsAsString() } );
        try {
            results = search.query( sosl );
            success = true;
        } catch( System.QueryException e ) {
            error = e.getMessage();
        }
        
        if( results != null ) {
           resultMap = new Map<String,List<SObject>>();

           for( List<SObject> objList : results ) {
               if( objList.size() > 0 ) {
                   resultMap.put( objList.get(0).getSObjectType().getDescribe().getName(), objList );
               }
           }
        }

        return success;
    }
    
    /**
     *  @param   objectName  an SObject Type name
     *  @return  a list of SObjects that were returned in the search.
     *
    **/
    public List<SObject> getResultsForObject( String objectName )
    {
        return resultMap.get( objectName );
    }

    /**
     *  @return  a list of all SObject lists that were returned in the query.
     *
    **/
    public Map<String,List<SObject>> getResults()
    {
        return resultMap;
    }
    
    /**
     *  @return  an error message, or the empty string if no error occurred.
     *
    **/
    public String getError()
    {
        return error;
    }
    
    
   /*
    # Private Methods 
    ======================================================================== */
    
    /**
     *  @return  a string representation of the search scope.
     *
    **/
    private String getSearchScope()
    {       
        return currentScope.name().replace('_', ' ' );
    }

    /**
     *  @return  a String used in the sosl query to list the objects and their 
     *           options. 
     *
    **/
    private String getSearchObjectsAsString()
    {
        String objectString = '';

        for( String s : objects.keySet() )
        {
            objectString += String.format( ',{0} ({1} {2} {3})',
                                new List<String> {s
                                   ,objects.get(s).get('fields')
                                   ,objects.get(s).get('where')
                                   ,objects.get(s).get('limit') });
        }

        return objectString.substring(1);
    }

}