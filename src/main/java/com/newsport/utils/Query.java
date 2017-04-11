package com.newsport.utils;

import java.util.List;

public class Query {
    private String code;
    private List<String> data;
    
	public Query(String code, List<String> data) {
		super();
		this.code = code;
		this.data = data;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public List<String> getData() {
		return data;
	}
	public void setData(List<String> data) {
		this.data = data;
	}
}
