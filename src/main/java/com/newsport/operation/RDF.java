package com.newsport.operation;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;


























import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QueryFactory;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.newsport.model.Sig_article;


public class RDF {
	public static List<String> getaboutNtriples(String meta){
		List<String> metaList=new ArrayList<String>();
        Model model = ModelFactory.createDefaultModel();
        InputStream is = new ByteArrayInputStream(meta.getBytes(StandardCharsets.UTF_8));
        if (is != null) {
            model.read(is, null, "N-TRIPLE");
            model.write(System.out, "RDF/XML");            
            String queryString=
        			"PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> "+
        	        "PREFIX j.0: <http://bk.sport.owl#> " +
        		    "SELECT * WHERE { " +
        	        " ?person j.0:about ?x ."+
        		    "}";
        	Query query = QueryFactory.create(queryString);
        	QueryExecution qexec=QueryExecutionFactory.create(query,model);        	
        	try{
        	ResultSet results = qexec.execSelect();
        	while(results.hasNext()){
        		QuerySolution soln=results.nextSolution();
        		if(soln!=null){
        			String name=soln.getResource("?x").toString();
        			metaList.add(name.substring(name.indexOf("#")+1).toUpperCase());
            		System.out.println("RDF"+name.substring(name.indexOf("#")+1).toUpperCase());  
        		}    	    		  		
        	 }
        	} finally{
        		qexec.close();
        	}
        	return metaList;
        } else {
        	return null;
        }
    }
	
	/*
	 * Get Contain of meta
	 */
	public static List<String> getcontainNtriples(String meta){
		List<String> containList=new ArrayList<String>();
        Model model = ModelFactory.createDefaultModel();
        InputStream is = new ByteArrayInputStream(meta.getBytes(StandardCharsets.UTF_8));
        if (is != null) {
            model.read(is, null, "N-TRIPLE");
            model.write(System.out, "RDF/XML");            
            String queryString=
        			"PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> "+
        	        "PREFIX j.0: <http://bk.sport.owl#> " +
        		    "SELECT * WHERE { " +
        	        " ?person j.0:contain ?x ."+
        		    "}";
        	Query query = QueryFactory.create(queryString);
        	QueryExecution qexec=QueryExecutionFactory.create(query,model);        	
        	try{
        	ResultSet results = qexec.execSelect();
        	while(results.hasNext()){
        		QuerySolution soln=results.nextSolution();
        		if(soln!=null){
        			String name=soln.getResource("?x").toString();
        			containList.add(name.substring(name.indexOf("#")+1));
            		System.out.println(name.substring(name.indexOf("#")+1));  
        		}    	    		  		
        	 }
        	} finally{
        		qexec.close();
        	}
        	return containList;
        } else {
        	return null;  
        }
    }
	
	public static List<String> getRDF(String meta){
		List<String> containList=new ArrayList<String>();
        Model model = ModelFactory.createDefaultModel();
        InputStream is = new ByteArrayInputStream(meta.getBytes(StandardCharsets.UTF_8));
        model.read(is, null, "RDF/XML");
		String queryString=
		        "PREFIX j: <http://bk.sport.owl#> " +
			    "SELECT ?z ?x ?y WHERE { " +
		        "?z j:about ?x ."+
		        "?z j:contain ?y ."+
			    "}";
		Query query = QueryFactory.create(queryString);
		QueryExecution qexec=QueryExecutionFactory.create(query,model);        	
		try{
		ResultSet results = qexec.execSelect();
		while(results.hasNext()){
			QuerySolution soln=results.nextSolution();
			if(soln!=null){
				String name=soln.getResource("?x").toString();
				containList.add(name.substring(name.indexOf("#")+1));
				String name2=soln.getResource("?y").toString();
				containList.add(name2.substring(name2.indexOf("#")+1));
			}    	    		  		
		 }
		} finally{
			qexec.close();
		}
		return containList;
    }
	
	
	
	 public static List<String> removeDuplicate(List<String> arrList)
	 {
	     @SuppressWarnings("unchecked")
		 HashSet<String> h = new HashSet<String>(arrList);
	     arrList.clear();
	     arrList.addAll(h);
	    
	     return arrList;
	                    
	 }
	 
	 public static List<Sig_article> removeDuplicateSig(List<Sig_article> arrList)
	 {
	     @SuppressWarnings("unchecked")
		 HashSet<Sig_article> h = new HashSet<Sig_article>(arrList);
	     arrList.clear();
	     arrList.addAll(h);
	    
	     return arrList;
	                    
	 }
	 
	 public static List<String> searchAPI(String meta){
			List<String> containList=new ArrayList<String>();
	        Model model = ModelFactory.createDefaultModel();
	        InputStream is = new ByteArrayInputStream(meta.getBytes(StandardCharsets.UTF_8));
	        model.read(is, null, "RDF/XML");
	         // model.write(System.out, "RDF/XML");            
			String queryString=
			        "PREFIX j: <http://bk.sport.owl#> " +
				    "SELECT ?z ?x ?y WHERE { " +
			        "?z j:about ?x ."+
			        "?z j:contain ?y ."+
				    "}";
			Query query = QueryFactory.create(queryString);
			QueryExecution qexec=QueryExecutionFactory.create(query,model);        	
			try{
			ResultSet results = qexec.execSelect();
			while(results.hasNext()){
				QuerySolution soln=results.nextSolution();
				if(soln!=null){
					System.out.println("DAO HONG THUAN");
					System.out.println(soln.getResource("?z"));
					String name=soln.getResource("?x").toString();
					containList.add(name.substring(name.indexOf("#")+1).toUpperCase());
					String name2=soln.getResource("?y").toString();
					containList.add(name2.substring(name2.indexOf("#")+1).toUpperCase());
					System.out.println(name.substring(name.indexOf("#")+1));  
				}    	    		  		
			 }
			} finally{
				qexec.close();
			}
			return containList;
	    }

}
