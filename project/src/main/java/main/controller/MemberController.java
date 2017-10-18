package main.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import main.bean.Member;
import main.model.member.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;

	@RequestMapping("/register")
	public String register() {
		return "member/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Member m) {
		memberDao.register(m);
		return "redirect:login";
	}

	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member m, @RequestParam(required = false) String save, HttpSession session,
			HttpServletResponse response) throws IOException {
		boolean result = memberDao.login(m);
		if (result) {
			session.setAttribute("loginFlag", true);
			session.setAttribute("userId", m.getId());
			Cookie c = new Cookie("save", m.getId());
			c.setMaxAge(save == null ? 0 : 2419200);
			response.addCookie(c);
			return "redirect:/";
		} else {
			response.sendError(500);
			return null;
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/info")
	public String info(Model model, HttpSession session){
		String id = (String)session.getAttribute("userId");
		if(id != null) {
			Member member = memberDao.info(id);
			model.addAttribute("member", member);
			return "member/myinfo";
		}
		else {
			return "redirect:login";
		}
	}
	
	@RequestMapping(value="/info", method=RequestMethod.POST)
	public String info(Model model, HttpSession session, String pw) {
		String id = (String)session.getAttribute("userId");
		boolean result = memberDao.pwCheck(id, pw);
		if(result) {
			session.setAttribute("pwFlag", result);
			return "redirect:info";
		}
		else {
			return "member/pwfail";
		}
	}
	
	@RequestMapping("/edit")
	public String edit(Model model, HttpSession session) {
		String id = (String)session.getAttribute("userId");
		Member member = memberDao.info(id);
		model.addAttribute("member", member);
		return "member/edit";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit(Member m) {
		boolean result = memberDao.edit(m);
		if(result) {
			return "redirect:info";
		}
		else {
			return "member/edit";
		}
	}
	
	@RequestMapping("/drop")
	public String drop(Model model, HttpSession session) {
		String id = (String)session.getAttribute("userId");
		Member member = memberDao.info(id);
		model.addAttribute("member", member);
		return "member/drop";
	}
	
	@RequestMapping(value="/drop", method=RequestMethod.POST)
	public String drop(HttpSession session, Member m) {
		String id = (String) session.getAttribute("userId");
		if(memberDao.drop(id, m)) {
			session.invalidate();
			return "redirect:goodbye";
		}
		else
			return "???";
	}
	
	@RequestMapping({"/find", "/find/"})
	public String find(Model model){
		List<Member> list = memberDao.memberList();
		System.out.println("전체");
		Collections.shuffle(list);
		model.addAttribute("list", list);
		return "member/find";
	}
	
	@RequestMapping("/find/{key}")
	public String search(@PathVariable String key, Model model) {
		List<Member> list = memberDao.search(key);
		System.out.println("검색");
		model.addAttribute("key", key);
		Collections.shuffle(list);
		model.addAttribute("list", list);
		return "member/find";
	}
	
	@RequestMapping("/goodbye")
	public String goodbye() {
		return "member/goodbye";
	}
}
