package com.newsport.httpclients;

import org.apache.log4j.Logger;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Properties;

public class HttpCilentExample {
	public static final String USER_AGENT = "Mozilla/5.0";
	
	public static Properties p = new Properties();
	
	
	public static void main(String[] args) throws Exception {
        String data="daohongthuan";
	 	HttpCilentExample http = new HttpCilentExample();
        
		System.out.println("Testing 1 - Send Http GET request");
		sendGet(data);
	}
	
	public static String sendGet(String data) throws Exception {
		try {
			p.load(HttpCilentExample.class
					.getResourceAsStream("/url.properties"));
		} catch (Exception e) {
			Logger.getLogger("Api").error("Can not load database.properties");
		}
		String url =p.getProperty("url", "http://10.0.0.7:8080/qa-service-0.0.1/sparql?question=")+URLEncoder.encode(data);
		System.out.println("URL:"+ url);
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("User-Agent", USER_AGENT);
		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : " + url);
		System.out.println("Response Code : " + responseCode);
		BufferedReader in = new BufferedReader(new InputStreamReader(
				con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		return response.toString();
	}

}