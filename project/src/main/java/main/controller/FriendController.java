package main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import main.bean.Member;
import main.model.friend.FriendDao;

@Controller
@RequestMapping("/friend")
public class FriendController {
	
	@Autowired
	private FriendDao friendDao;
	
	@RequestMapping("/list")
	public String list(HttpSession session, Model model) {
		String id = (String)session.getAttribute("userId");
		boolean result = friendDao.listCheck(id);
		if(result) {
			List<Member> list = friendDao.allList(id);
			model.addAttribute("result", result);
			model.addAttribute("list", list);
		}
		return "friend/list";
	}
	
	@RequestMapping("/requestlist")
	public String requestList(HttpSession session, Model model) {
		String id = (String)session.getAttribute("userId");
		List<Member> list = friendDao.requestList(id);
		model.addAttribute("list", list);
		return "friend/requestlist";
	}
	
	@RequestMapping("/sendlist")
	public String sendList(HttpSession session, Model model) {
		String id = (String)session.getAttribute("userId");
		List<Member> list = friendDao.sendList(id);
		model.addAttribute("list", list);
		return "friend/sendlist";
	}
	
	@RequestMapping("/sendcancel/{rcid}")
	public String sendCancel(@PathVariable String rcid, HttpSession session) {
		String rqid = (String)session.getAttribute("userId");
		friendDao.sendCancel(rqid, rcid);
		return "redirect:/friend/sendlist";
	}
	
	@RequestMapping("/agree/{rqid}")
	public String agree(@PathVariable String rqid, HttpSession session) {
		String rcid = (String)session.getAttribute("userId");
		friendDao.agree(rqid, rcid);
		return "redirect:/friend/requestlist";
	}
	
	@RequestMapping("/disagree/{rqid}")
	public String disagree(@PathVariable String rqid, HttpSession session) {
		String rcid = (String)session.getAttribute("userId");
		friendDao.disagree(rqid, rcid);
		return "redirect:/friend/requestlist";
	}
	
	@RequestMapping("/drop/{id}")
	public String drop(@PathVariable String id, HttpSession session, HttpServletRequest request) {
		String myid = (String)session.getAttribute("userId");
		friendDao.drop(myid, id);
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
}
