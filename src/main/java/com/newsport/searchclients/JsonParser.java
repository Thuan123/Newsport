package com.newsport.searchclients;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.jena.atlas.json.io.parser.JSONParser;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.franz.agraph.repository.AGRepositoryConnection;
import com.google.gson.Gson;
import com.newsport.allegropgraph.Allegrograph;
import com.newsport.allegropgraph.AllegrographQuery;
import com.newsport.utils.GetId;
import com.newsport.utils.Query;

public class JsonParser {
	public static String jsonData = "";
	public static AGRepositoryConnection conn;
	public static String query=null;
	
	public static String readFile(File file) {
		BufferedReader br = null;
		try {
			String line;
			br = new BufferedReader(new FileReader(file));
			while ((line = br.readLine()) != null) {
				jsonData += line + "\n";
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null)
					br.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return jsonData;
	}
    
	
	public static List<Integer> parser(String json){
		List<Integer> idList = new ArrayList<Integer>();
		try {
			JSONObject obj = new JSONObject(json);
			JSONArray lang= (JSONArray) obj.get("data");
			if(lang!=null){
				for(int i=0;i< lang.length();i++){
					JSONObject objects = lang.getJSONObject(i);
					idList.add(GetId.getNewid(objects.getString("id")));
				}
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return idList;
	}
	
	public static String parserID(String json){
		try {
			JSONObject obj = new JSONObject(json);
			JSONArray lang= (JSONArray) obj.get("sparql");
			if(lang.length()!=0){
				return lang.get(0).toString();
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return null;
	}
}
