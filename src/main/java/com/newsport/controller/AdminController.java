package com.newsport.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.newsport.dao.SigDAO;
import com.newsport.model.Sig_article;
import com.newsport.operation.RDF;


@Controller
@RequestMapping("admin/page")
public class AdminController {
	@Autowired
    private SigDAO sigDAOs;
	Sig_article sig;
	List<Sig_article> listPage;
	
	@ModelAttribute
	public void addingCommonObjects(Model model){
		listPage= sigDAOs.listPagination();
	}
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public ModelAndView listLatest(ModelAndView model, HttpServletRequest request, HttpServletResponse response){
		
		PagedListHolder pagedListHolder = new PagedListHolder(listPage);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		System.out.println(listPage.size());
		pagedListHolder.setPage(page);
		int pageSize = 10;
		pagedListHolder.setPageSize(pageSize);
		model.addObject("pagedListHolder", pagedListHolder);
	    model.setViewName("/admin/pages/index");
	    return model;
	    
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deletes(@PathVariable("id") int id, ModelAndView model) {
		sigDAOs.delete(id);
		model.setViewName("redirect:/admin/page/index");
	    return model;
	}
	
	@RequestMapping(value = "/saveNews", method = RequestMethod.POST)
	public ModelAndView saveContact(@ModelAttribute Sig_article sigs) {
		System.out.println(sigs.getCover_url());
		sigDAOs.Update(sigs);
		
	    return new ModelAndView("redirect:/admin/page/index");
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable("id") int id, ModelAndView model) {
		List<String> list_meta = new ArrayList<String>();
		sig = sigDAOs.findID(id);
		if ((sig.getMeta() != null)) {
			list_meta = RDF.getRDF(sig.getMeta().toString());
		}
		if (!list_meta.isEmpty()) {
			list_meta = RDF.removeDuplicate(list_meta);
		}
		model.addObject("metas", list_meta);
		model.addObject("sigs",sig);
		model.setViewName("/admin/pages/news-form");
	    return model;
	}
	
	@RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
	public ModelAndView show(@PathVariable("id") int id, ModelAndView model) {
		sig = sigDAOs.findID(id);
		model.addObject("sigs",sig);
		model.setViewName("/admin/pages/show");
	    return model;
	}
}
