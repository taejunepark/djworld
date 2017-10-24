package main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import main.bean.Visitors;
import mini.model.visitors.VisitorsDao;

@Controller
public class MiniController {
	
	@Autowired
	private VisitorsDao visitorsDao;
	
	@RequestMapping("/visitors")
	public String visitors(Model model) {
		List<Visitors> list = visitorsDao.list();
		model.addAttribute("list", list);
		return "visitors";
	}
	
	@RequestMapping(value="/visitors", method=RequestMethod.POST)
	public String visitors(Visitors v) {
		visitorsDao.write(v.getDetail(), v.getWriter());
		return "redirect:/visitors";
	}
}
