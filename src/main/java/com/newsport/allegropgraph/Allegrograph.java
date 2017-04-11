package com.newsport.allegropgraph;

import java.util.Properties;

import org.apache.log4j.Logger;

import com.franz.agraph.repository.AGCatalog;
import com.franz.agraph.repository.AGRepository;
import com.franz.agraph.repository.AGRepositoryConnection;
import com.franz.agraph.repository.AGServer;

public class Allegrograph {
	public static AGRepositoryConnection conn;
	static {
		Properties p = new Properties();
		try {
			p.load(Allegrograph.class
					.getResourceAsStream("/allegrograph.properties"));
		} catch (Exception e) {
			Logger.getLogger("Api").error("Can not load database.properties");
		}
		AGServer server = new AGServer(p.getProperty("server_url",
				"http://172.245.22.156:10035/"), p.getProperty("username",
				"sv_test"), p.getProperty("password", "123456"));
		try {
			System.out.println("Available catalogs: " + server.listCatalogs());
			AGCatalog catalog = server.getCatalog(p.getProperty("catalog_id",
					"vtio-catalog"));
			AGRepository myRepository = catalog.createRepository(p.getProperty(
					"repository_id", "bksport-repository"));
			myRepository.initialize();
			conn = myRepository.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
