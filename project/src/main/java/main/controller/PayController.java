package main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import main.bean.Member;
import main.model.member.MemberDao;
import main.model.payment.PaymentDao;

@Controller
@RequestMapping(value="/payments")
public class PayController {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private PaymentDao paymentDao;
	
	@RequestMapping("/try")
	public String pay(HttpSession session, Model model) {
		String id = (String)session.getAttribute("userId");
		Member m = memberDao.info(id);
		model.addAttribute("bam", m.getBam());
		return "payment/bamselect";
	}
	
	@RequestMapping(value="/try", method=RequestMethod.POST)
	public String pay(String bam, HttpSession session, Model model) {
		String id = (String)session.getAttribute("userId");
		Member m = memberDao.info(id);
		model.addAttribute("email", m.getEmail());
		model.addAttribute("name", m.getName());
		model.addAttribute("money", Integer.valueOf(bam)*100);
		return "payment/bampay";
	}
	
	@RequestMapping(value="/complete", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String complete(HttpServletRequest request, HttpSession session) {
		String 	tid = request.getParameter("imp_tid");
		String id = (String)session.getAttribute("userId");
		String temp = request.getParameter("imp_amount");
		int amount = Integer.valueOf(temp);
		int bam = amount / 100;
		String method = request.getParameter("imp_method");
		int result = paymentDao.payMent(tid, id, amount, method);
		if(result > 0) {
			paymentDao.bamBuy(id, bam);
		}
		return String.valueOf(result); 
	}
}
