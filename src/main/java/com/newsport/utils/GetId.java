package com.newsport.utils;

import java.util.List;

import com.newsport.model.Sig_article;

public class GetId {
	public static int getNewid(String url) {
		if (url != null) {
			String urlNews = url.replaceAll("document", "");
			String[] urls = urlNews.split("#");
			return Integer.parseInt(urls[1].toString());
		}
		return 0;
	}
	
	public static String getMetaName(String meta){
		if(meta!=null){
			String[] urls = meta.split("#");
			if(urls!=null){
				return urls[1].toString();
			}
		}
		return null;
	}
	
	public static void main(String[] args){
		System.out.println("Parse ID:"
				+ GetId.getNewid("http://bk.sport.owl#document12345"));
	}
}
