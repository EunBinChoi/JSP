package me.json.javaApp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JSONUtil {

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("name", "sally");
		map.put("age", "30");
		
		// key:value
		JSONObject jsonObject = new JSONObject(map); // HashMap extends
		
		// JSONObject -> String
		String jsonString = jsonObject.toJSONString();
		System.out.println(jsonString);
		
		// String -> JSONObject
		// Q1. jsonString을 안다고 가정했을 때 name 키의 value
		JSONObject parsedObject = getJSONObjectFromString(jsonString);
		String value = (String)parsedObject.get("name");
		System.out.println(value);
		
		// Q2. jsonString을 안다고 가정했을 때 age 키의 value 
		value = (String)parsedObject.get("age");
		System.out.println(value);
		
		////////////////////////////////////////////////////////////////////////////
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list.add(new HashMap<String, Object>()  {{
		    put("name", "sally");
		    put("age", "30");
		}});
		list.add(new HashMap<String, Object>()  {{
		    put("name", "eunbin");
		    put("age", "20");
		}});
		// [{key:value}, {key:value}, .....]
		
		JSONArray jsonArray = new JSONArray(); // ArrayList extends
		for(Map<String, Object> li : list) {
			jsonArray.add(li);
		}
		
		// JSONArray -> String (stringify)
		String jsonArrayString = jsonArray.toJSONString();
		System.out.println(jsonArrayString);
		
		// String -> JSONArray (parse)
		// getJSONArrayFromString(String jsonArrayString)
		JSONArray parsedArray = getJSONArrayFromString(jsonArrayString);
		for(int i = 0; i < parsedArray.size(); i++) {
			System.out.println(parsedArray.get(i));
		}
	}
	
	/**
	 * String을 JSONObject으로 변환
	 * 
	 * @param String.
	 * @return JSONObject.
	 */
	// JSONObject -> String -(*)-> JSONObject
	public static JSONObject getJSONObjectFromString(String jsonString) {
		/*Map<String, Object> map = new HashMap<>();
		String[] entrySet = jsonString.replace("{", "").replace("}", "").split(",");
		for(String entry : entrySet) {
			String[] entrySplit = entry.split(":");
			String key = entrySplit[0].replace("\"", "");
			String value = entrySplit[1].replace("\"", "");
			map.put(key, value);
		}
		JSONObject jsonObject = new JSONObject(map);
		return jsonObject;
		*/
		
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = null;
		try {
			jsonObject = (JSONObject)parser.parse(jsonString);
		} catch(ParseException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	/**
	 * String을 JSONArray으로 변환
	 * 
	 * @param String.
	 * @return JSONArray.
	 */
	// JSONArray -> String -(*)-> JSONArray
	public static JSONArray getJSONArrayFromString(String jsonArrayString) {
		JSONArray jsonArray  = new JSONArray();
		String[] jsonObjects = jsonArrayString.replace("[", "").replace("]", "")
				.split("[}][,][{]");

		for(int i = 0; i < jsonObjects.length; i++) {
			if(i % 2 == 0) jsonObjects[i] = jsonObjects[i] + "}";
			else jsonObjects[i] = "{" +  jsonObjects[i];
			
			// getJSONObjectFromString: JSONString -> JSONObject
			jsonArray.add(getJSONObjectFromString(jsonObjects[i]));
		}
		return jsonArray;
	}

}
