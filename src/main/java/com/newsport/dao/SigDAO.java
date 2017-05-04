package com.newsport.dao;

import java.util.List;

import com.newsport.model.Sig_article;
import com.newsport.model.Sig_image;


public interface SigDAO {
	    public void Update(Sig_article sigs);
		public void delete(int sigId);
		public Sig_article findID(int sigId);
		public List<Sig_article> list(int limit);
		public List<Sig_article> listPagination();
		public List<Sig_article> find(int start, int limit);
		public List<Sig_article> getRelatedNew(List<String> meta);
		public List<Sig_image> getImage(int sigId, String coverUrl);
		public List<Sig_article> getRandomSig(int number);
}
