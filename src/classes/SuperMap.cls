global class SuperMap {
	
	private List<Map<String, Object>> mapList;
	private static final Integer MAX_MAP_SIZE = 999;
	
	global SuperMap() {
	
		this.mapList = new List<Map<String, Object>>();
		mapList.add(new Map<String, Object>());
	
	}
	
	global Boolean containsKey(String key) {
		
		Boolean doesContainKey = false;
		
		for(Map<String, Object> thisMap : mapList) {
			if(thisMap.containsKey(key)) {
				doesContainKey = true;
				break;
			}
		}
		
		return doesContainKey;
		
	}
	
	global void put(String key, Object val) {
		
		for(Integer i=0; i < mapList.size(); i++) {
			
			Map<String, Object> currentMap = mapList.get(i);
			Integer currentMapSize = currentMap.keySet().size();
			
			if(currentMap.containsKey(key) || 
				(!currentMap.containsKey(key) && currentMapSize < MAX_MAP_SIZE)) {
				currentMap.put(key, val);
				break;
			} else if(i == mapList.size() - 1) {
				
				Map<String, Object> newMap = new Map<String, Object>();
				newMap.put(key, val);
				mapList.add(newMap);
				
				System.debug('Added new Map for a total of ' + mapList.size());
				
				break;
			}
			
			
		}
		
	}
	
	global Object get(String key) {
		
		for(Map<String, Object> currentMap : mapList) {
			if(currentMap.containsKey(key)) {
				return currentMap.get(key);
			}
		}
		
		return null;
		
	}
	
	global List<Set<String>> keySet() {
		
		List<Set<String>> keyset = new List<Set<String>>();
		
		for(Map<String, Object> currentMap : mapList) {
			keyset.add(currentMap.keyset());
		}
		
		return keyset;
		
	}
	
	global List<List<Object>> values() {
		
		List<List<Object>> values = new List<List<Object>>();
		
		for(Map<String, Object> currentMap : mapList) {
			values.add(currentMap.values());
		}
		
		return values;
		
	}

	
	

}