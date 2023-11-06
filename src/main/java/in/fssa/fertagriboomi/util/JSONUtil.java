package in.fssa.fertagriboomi.util;

import java.io.BufferedReader;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JSONUtil {

	
	public static Map<String, List<Map<String, Object>>> getJSONArray(HttpServletRequest request) {
		 
		
		StringBuilder requestData = new StringBuilder();
		try {
          String line;
          
          
          BufferedReader reader = request.getReader();
          while ((line = reader.readLine()) != null) {
              requestData.append(line);
          }

          
         // System.out.println("json"+requestData);
          // Parse the JSON data into a Java object
          ObjectMapper objectMapper = new ObjectMapper();
          Map<String, List<Map<String, Object>>> jsonData = objectMapper.readValue(requestData.toString(), new TypeReference<Map<String, List<Map<String, Object>>>>() {});
          //System.out.println(jsonData);
         
          return jsonData;
		}catch(Exception e) {
			throw new RuntimeException("Unable to parse json - " + requestData.toString());
		}

	}
	

	public static List<Map<String, Object>> getJSONArray(HttpServletRequest request, String key) {
		 
		
		StringBuilder requestData = new StringBuilder();
		try {
          String line;
          
          
          BufferedReader reader = request.getReader();
          while ((line = reader.readLine()) != null) {
              requestData.append(line);
          }

          
          //System.out.println("json"+requestData);
          // Parse the JSON data into a Java object
          ObjectMapper objectMapper = new ObjectMapper();
          Map<String, List<Map<String, Object>>> jsonData = objectMapper.readValue(requestData.toString(), new TypeReference<Map<String, List<Map<String, Object>>>>() {});

          
          //System.out.print(jsonData);
          // Get the productsInOrder list
          List<Map<String, Object>> data = jsonData.get(key);
          return data;
		}catch(Exception e) {
			throw new RuntimeException("Unable to parse json - " + requestData.toString());
		}

	}

}
