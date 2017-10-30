package main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import main.bean.Member;
import main.model.member.MemberDao;

@Controller
public class PayController {
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping("/pay")
	public String pay(HttpSession session, Model model) {
		String id = (String)session.getAttribute("userId");
		Member m = memberDao.info(id);
		model.addAttribute("bam", m.getBam());
		return "payment/bamselect";
	}
	
	@RequestMapping(value="/pay", method=RequestMethod.POST)
	public String pay(String bam, HttpSession session, Model model) {
		String id = (String)session.getAttribute("userId");
		Member m = memberDao.info(id);
		memberDao.payMent(id, Integer.valueOf(bam));
		model.addAttribute("email", m.getEmail());
		model.addAttribute("name", m.getName());
		model.addAttribute("money", Integer.valueOf(bam)*100);
		return "payment/bampay";
	}
}
