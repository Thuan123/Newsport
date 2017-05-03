package com.newsport.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openrdf.repository.RepositoryException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.franz.agraph.repository.AGRepositoryConnection;
import com.google.gson.Gson;
import com.newsport.allegropgraph.Allegrograph;
import com.newsport.allegropgraph.AllegrographQuery;
import com.newsport.dao.SigDAO;
import com.newsport.model.Sig_article;
import com.newsport.model.Sig_image;
import com.newsport.operation.RDF;
import com.newsport.operation.RandomArr;
import com.newsport.searchclients.JsonParser;
import com.newsport.utils.Search;
import com.newsport.utils.Sort;
import com.newsport.utils.SortComparator;

@Controller
public class HomeController {

	@Autowired
	private SigDAO sigDAOs;
	List<Sig_article> listPage = new ArrayList<Sig_article>();
	List<Sig_article> list_lienwan;
	List<String> list_meta;
	List<Integer> allegrographList;
	Sig_article sig;
	public static AGRepositoryConnection conn;
	public String query = null;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView listHome(ModelAndView model) {

		model.addObject("features", RandomArr.RandomElement(4, listPage));
		model.addObject("feats", RandomArr.RandomElement(3, listPage));
		model.addObject("foots", RandomArr.RandomElement(21, listPage));
		model.addObject("hots", RandomArr.RandomElement(2, listPage));
		model.addObject("galerys", RandomArr.RandomElement(15, listPage));
		model.addObject("latests", RandomArr.RandomElement(40, listPage));
		model.addObject("mores", RandomArr.RandomElement(21, listPage));
		model.setViewName("home");
		return model;
	}

	@ModelAttribute
	public void addingCommonObjects(Model model) {
		if (listPage.isEmpty()) {
			listPage.addAll(sigDAOs.list());
		}
		model.addAttribute("menus", RandomArr.RandomElement(5, listPage));
		model.addAttribute("homes", RandomArr.RandomElement(1, listPage));
		model.addAttribute("hots", RandomArr.RandomElement(1, listPage));
		model.addAttribute("mores", RandomArr.RandomElement(5, listPage));

		if (conn == null) {
			Allegrograph alle = new Allegrograph();
			conn = alle.getAGConnection();
		}
	}

	@RequestMapping(value = "/latestnews", method = RequestMethod.GET)
	public ModelAndView listLatest(ModelAndView model) {
		model.addObject("latests", RandomArr.RandomElement(6, listPage));
		model.setViewName("latestnews");
		return model;
	}

	@RequestMapping(value = "/keydetails/{id}", method = RequestMethod.GET)
	public ModelAndView keydetails(@PathVariable("id") int id, ModelAndView model) {
		List<Sort> sortList = new ArrayList<Sort>();
		list_meta = new ArrayList<String>();
		List<Sig_image> listImg = null;
		sig = sigDAOs.findID(id);
		listImg = sigDAOs.getImage(id, sig.getCover_url());

		if ((sig.getMeta() != null)) {
			list_meta = RDF.getRDF(sig.getMeta().toString());
			if (!list_meta.isEmpty()) {
				list_meta = RDF.removeDuplicate(list_meta);
			}
		}

		if (!list_meta.isEmpty()) {
			for (int i = 0; i < listPage.size(); i++) {
				if ((listPage.get(i).getMeta() != null)) {

					List<String> list_meta_2 = RDF.getRDF(listPage.get(i).getMeta().toString());
					HashSet<String> set1 = new HashSet<String>(list_meta);
					HashSet<String> set2 = new HashSet<String>(list_meta_2);
					set1.retainAll(set2);
					if (set1.size() != 3 && sortList.size() < 3) {
						sortList.add(new Sort(listPage.get(i), set1.size()));
					}
				}
			}
			Collections.sort(sortList, new SortComparator());
		}

		model.addObject("metasort", sortList);
		model.addObject("metas", list_meta);
		if (listImg.size() != 0) {
			if (listImg.get(0).getUrl() == null) {
				listImg.remove(0);
			}
			model.addObject("listimg", listImg);
		}
		model.addObject("sigs", sig);
		model.setViewName("details");
		return model;
	}

	@RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
	public ModelAndView details(@PathVariable("id") int id, ModelAndView model) {

		allegrographList = new ArrayList<Integer>();
		List<Sort> sortList = new ArrayList<Sort>();
		list_meta = new ArrayList<String>();
		List<Sig_image> listImg = null;

		sig = sigDAOs.findID(id);

		if (sigDAOs.getImage(id, sig.getCover_url()) != null) {
			listImg = sigDAOs.getImage(id, sig.getCover_url());
		}

		if ((sig.getMeta() != null)) {
			String id_str = "http://bk.sport.owl#document" + id;
			list_meta = RDF.getRDF(sig.getMeta().toString());
			if (!list_meta.isEmpty()) {
				list_meta = RDF.removeDuplicate(list_meta);
			}

			try {
				allegrographList = AllegrographQuery.NewsQuery(conn, id_str);
				Set<Integer> uniqueSet = new HashSet<Integer>(allegrographList);
				for (int temp : uniqueSet) {
					Sig_article sigs = sigDAOs.findID(temp);
					if (sigs != null) {
						if (sigs.getMeta() != null) {
							if (sortList.size() < 3) {
								sortList.add(new Sort(sigs, Collections.frequency(allegrographList, temp)));
							}
						}
					}
				}

				Collections.sort(sortList, new SortComparator());

				conn.close();
			} catch (Exception e) {
				try {
					conn.close();
				} catch (RepositoryException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			}
		}

		model.addObject("metasort", sortList);
		model.addObject("metas", list_meta);

		if (listImg.size() != 0) {
			if (listImg.get(0).getUrl() == null) {
				listImg.remove(0);
			}
			model.addObject("listimg", listImg);
		}
		model.addObject("sigs", sig);
		model.setViewName("details");
		return model;
	}

	@RequestMapping(value = "/relatednews/{title}", method = RequestMethod.GET)
	public ModelAndView relatednews(@PathVariable("title") String title, ModelAndView model) {
		List<Sig_article> News = new ArrayList<Sig_article>();
		if (title != null) {
			for (int i = 0; i < listPage.size(); i++) {
				if (listPage.get(i).getMeta() != null) {
					if (listPage.get(i).getMeta().indexOf(title) != -1) {
						News.add(listPage.get(i));
					}
				}
			}
		}
		model.addObject("newlienwans", News);

		model.setViewName("relatednews");
		return model;
	}

	@RequestMapping(value = "/keymetas/{id}", method = RequestMethod.GET)
	public ModelAndView keymetanews(@PathVariable("id") int id, ModelAndView model) {
		List<Sort> sortList = new ArrayList<Sort>();
		List<String> list_meta = new ArrayList<String>();

		Sig_article sig = sigDAOs.findID(id);
		if ((sig.getMeta() != null)) {
			list_meta = RDF.getRDF(sig.getMeta().toString());
		}
		if (!list_meta.isEmpty()) {
			list_meta = RDF.removeDuplicate(list_meta);
			for (int i = 0; i < listPage.size(); i++) {
				if ((listPage.get(i).getMeta() != null)) {
					List<String> list_meta_2 = RDF.getRDF(listPage.get(i).getMeta().toString());
					HashSet<String> set1 = new HashSet<String>(list_meta);
					HashSet<String> set2 = new HashSet<String>(list_meta_2);
					set1.retainAll(set2);
					if (set1.size() != 0) {
						sortList.add(new Sort(listPage.get(i), set1.size()));
					}
				}
			}
			Collections.sort(sortList, new SortComparator());
		}

		model.addObject("id", id);
		model.addObject("latests", sortList);
		model.setViewName("more_related");
		return model;
	}

	@RequestMapping(value = "/metas/{id}", method = RequestMethod.GET)
	public ModelAndView metanews(@PathVariable("id") int id, ModelAndView model) {
		String id_str = "http://bk.sport.owl#document" + id;
		List<Sort> sortList = new ArrayList<Sort>();
		try {
			allegrographList = AllegrographQuery.NewsQuery(conn, id_str);
			Set<Integer> uniqueSet = new HashSet<Integer>(allegrographList);
			for (int temp : uniqueSet) {
				Sig_article sigs = sigDAOs.findID(temp);
				if (sigs != null) {
					if (sigs.getMeta() != null) {
						sortList.add(new Sort(sigs, Collections.frequency(allegrographList, temp)));
					}
				}
			}

			Collections.sort(sortList, new SortComparator());
			conn.close();

		} catch (Exception e) {
			try {
				conn.close();
			} catch (RepositoryException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}

		model.addObject("id", id);
		model.addObject("latests", sortList);
		model.setViewName("more_related");

		return model;
	}

	@RequestMapping(value = "/timenews/{time}", method = RequestMethod.GET)
	public ModelAndView timenews(@PathVariable("time") String time, ModelAndView model) {
		List<Sig_article> News = new ArrayList<Sig_article>();
		if (time != null) {
			for (int i = 0; i < listPage.size(); i++) {
				if (listPage.get(i).getPublished().toString().indexOf(time) != -1) {
					News.add(listPage.get(i));
				}
			}

		}
		model.addObject("newlienwans", News);
		model.setViewName("timenews");
		return model;
	}

	@RequestMapping(value = "/searchNews", method = RequestMethod.GET)
	public ModelAndView getSearch(@ModelAttribute Search sigs, ModelAndView model, HttpServletRequest request,
			HttpServletResponse response) {

		String data = null;
		List<Integer> idlist = new ArrayList<Integer>();
		List<Sig_article> latests = new ArrayList<Sig_article>();

		ClassLoader classLoader = JsonParser.class.getClassLoader();

		File file = new File(classLoader.getResource("pages/data.txt").getFile());

		data = JsonParser.parserID(JsonParser.readFile(file));
		/*
		 * try { if (sigs.getQuery() != null) { data =
		 * JsonParser.parserID(HttpCilentExample.sendGet(sigs.getQuery())); } }
		 * catch (Exception e) { e.printStackTrace(); }
		 */

		if (data != null) {
			query = data;/* JsonParser.parserID(JsonParser.readFile(file)); */
			if (query != null) {
				System.out.println(query);
				try {
					idlist = AllegrographQuery.searchAPI(conn, query);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (idlist.size() != 0) {
					for (int i = 0; i < idlist.size(); i++) {
						Sig_article sis = sigDAOs.findID(idlist.get(i));
						if (sis != null) {
							latests.add(sis);
						}
					}
				}
				model.addObject("reponse", query);
			}
		}

		PagedListHolder pagedListHolder = new PagedListHolder(latests);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		int pageSize = 3;
		pagedListHolder.setPageSize(pageSize);
		model.addObject("pagedListHolder", pagedListHolder);
		model.setViewName("searchnews");
		model.addObject("news", sigs.getQuery());
		return model;
	}

	@RequestMapping(value = "/loadmorenews", method = RequestMethod.POST)
	public @ResponseBody String post(@RequestBody final String page) {
		int count = 1;
		int limit = 6;

		if (page != null) {
			count = Integer.parseInt(page.substring(page.length() - 1));
		} else {
			count = 1;
		}
		if (count < 1) {
			count = 1;
		}
		int start = (limit * count) - limit + count;
		int end = limit + 1;
		List<Sig_article> loadmore = sigDAOs.find(start, end);
		return new Gson().toJson(loadmore);
	}

}
