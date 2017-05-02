package com.newsport.allegropgraph;

import java.util.ArrayList;
import java.util.List;

import org.openrdf.model.Value;
import org.openrdf.query.BindingSet;
import org.openrdf.query.QueryLanguage;
import org.openrdf.query.TupleQueryResult;

import com.franz.agraph.repository.AGRepositoryConnection;
import com.franz.agraph.repository.AGTupleQuery;
import com.newsport.utils.GetId;

public class AllegrographQuery {

	public static List<Integer> NewsQuery(AGRepositoryConnection conn, String id) throws Exception {
		List<Integer> news = new ArrayList<Integer>();

		try {
			// String queryString = "SELECT DISTINCT ?s ?o WHERE
			// {<http://bk.sport.owl#document1890> <http://bk.sport.owl#about>
			// ?o. ?s <http://bk.sport.owl#about> ?o. filter (?s !=
			// <http://bk.sport.owl#document1890>)} order by ?s";

			String queryString = "select DISTINCT ?s ?o where {{<" + id/* "http://bk.sport.owl#document1890" */
					+ "> <http://bk.sport.owl#contain> ?o. ?s <http://bk.sport.owl#contain> ?o.} UNION {<"
					+ id/* "http://bk.sport.owl#document1890" */
					+ "> <http://bk.sport.owl#about> ?o. ?s <http://bk.sport.owl#about> ?o.} filter (?s != <"
					+ id/* "http://bk.sport.owl#document1890" */ + ">)} order by ?s";

			AGTupleQuery tupleQuery = conn.prepareTupleQuery(QueryLanguage.SPARQL, queryString);
			TupleQueryResult result = tupleQuery.evaluate();
			try {
				while (result.hasNext()) {

					BindingSet bindingSet = result.next();
					Value s = bindingSet.getValue("s");
					Value o = bindingSet.getValue("o");
					
					if (!s.toString().contains("url")) {
						news.add(GetId.getNewid(s.toString()));
					}
				}

			} finally {
				result.close();
			}
			return news;
			// conn.close();
		} finally {
			conn.close();
		}
	}

	public static List<Integer> searchAPI(AGRepositoryConnection conn, String query) throws Exception {
		List<Integer> news = new ArrayList<Integer>();
		try {

			AGTupleQuery tupleQuery = conn.prepareTupleQuery(QueryLanguage.SPARQL, query);
			TupleQueryResult result = tupleQuery.evaluate();
			try {
				List<String> bindingName = result.getBindingNames();
				if (!bindingName.isEmpty())
					while (result.hasNext()) {

						BindingSet bindingSet = result.next();
						Value s = bindingSet.getValue(bindingName.get(0));
						news.add(GetId.getNewid(s.toString()));
					}

			} finally {
				result.close();
			}
			return news;
		} finally {
			conn.close();
		}
	}
}
