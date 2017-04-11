package com.newsport.utils;

import com.newsport.model.Sig_article;

public class Sort {
    private Sig_article news;
    private int count;
    
	public Sort(Sig_article news, int count) {
		super();
		this.news = news;
		this.count = count;
	}
	
	public Sig_article getNews() {
		return news;
	}
	public void setNews(Sig_article news) {
		this.news = news;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
        
	
}
