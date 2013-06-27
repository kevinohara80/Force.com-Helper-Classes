/**
 *
 *
 *
 *
 *
 *
 *
**/

public class SearchHelper
{
    private final Set<String> scopes 
        = new Set<String>{'ALL FIELDS'
                         ,'NAME FIELDS' 
                         ,'EMAIL FIELDS' 
                         ,'PHONE FIELDS' 
                         ,'SIDEBAR FIELDS'};
    private Map<String,List<SObject>> resultMap;
    private String searchScope;
    private List<String> searchObjects;
    private String error;
    private Map<String,Map<String,String>> objects;
    

    public SearchHelper() { }

    /**
     *
     *
     *
     *
    **/
    public void setSearchScope( String searchScope )
    {
        if( scopes.contains(searchScope.toUpperCase()) ) {
            this.searchScope = searchScope;
        } else {
            searchScope = 'ALL FIELDS';
        }
    }

    /**
     *
     *
     *
    **/
    public String getSearchScope()
    {
        if( searchScope == null || searchScope == '' )
            return 'ALL FIELDS';
        else
            return searchScope;
    }

    /**
     *
     *
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
     *
     *
     *
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
     *
     *
     *
     *
    **/
    public void setLimitForObject( String objectName, Integer lmt )
    {
        Map<String,String> options = objects.get(objectName);
        options.put( 'limit', 'LIMIT ' + String.valueOf( lmt ) );
        objects.put(objectName, options);
    }

    /**
     *
     *
     *
     *
    **/
    public void setConditionForObject( String objectName, String condition )
    {
        Map<String,String> options = objects.get(objectName);
        options.put( 'where', 'WHERE ' + condition );
        objects.put(objectName, options);
    }

    /**
     *
     *
     *
    **/
    public List<String> getSearchObjects()
    {
        return searchObjects;
    }

    /**
     *
     *
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

    /**
     *
     *
     *
     *
    **/
    public Boolean find( String searchTerm )
    {
        List<List<SObject>> results = null;
        searchTerm = '\'' + searchTerm + '\'';
        String sosl = String.format( 'FIND {0} IN {1} RETURNING {2}', 
                        new List<String>{searchTerm
                                        ,getSearchScope()
                                        ,getSearchObjectsAsString() } );
        System.debug( sosl );
        try {
            results = search.query( sosl );
        } catch( System.QueryException e ) {
            setError( e.getMessage() );
            return false;
        }

        resultMap = new Map<String,List<SObject>>();

        for( List<SObject> objList : results ) {
            if( objList.size() > 0 ) {
                resultMap.put( objList.get(0).getSObjectType().getDescribe().getName(), objList );
            }
        }

        return true;
    }

    /**
     *
     *
     *
     *
    **/
    public List<SObject> getResultsForObject( String objectName )
    {
        return resultMap.get( objectName );
    }

    /**
     *
     *
     *
    **/
    public Map<String,List<SObject>> getResults()
    {
        return resultMap;
    }

    /**
     *
     *
     *
    **/
    private void setError( String error )
    {
        this.error = error;
    }

    /**
     *
     *
     *
    **/
    public String getError()
    {
        if( error == null )
            return '';
        else
            return error;
    }

}

