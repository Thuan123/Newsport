package com.newsport.model;

public class Sig_image {
	private int id;
	private String url;
	private String des;
	private int sig_id;

	public Sig_image() {
		super();
	}

	public Sig_image(int id, String url, String des, int sig_id) {
		super();
		this.id = id;
		this.url = url;
		this.des = des;
		this.sig_id = sig_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public int getSig_id() {
		return sig_id;
	}

	public void setSig_id(int sig_id) {
		this.sig_id = sig_id;
	}
}
