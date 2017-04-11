package com.newsport.operation;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.newsport.model.Sig_article;

public class RandomArr {
    public static List<Sig_article> RandomElement(int size, List<Sig_article> sig){
    	List<Sig_article> ranList = new ArrayList<Sig_article>();
    	for(int i=0;i<size;i++){
    		ranList.add( sig.get(new Random().nextInt(sig.size())));
    	}
    	return RDF.removeDuplicateSig(ranList);
    }
}
