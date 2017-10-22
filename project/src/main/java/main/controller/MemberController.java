package main.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String register(Member m, HttpServletRequest request) {
		memberDao.register(m);
		return "redirect:login";
	}

	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String id = request.getParameter("check");
		int result = memberDao.idCheck(id);
		return String.valueOf(result);
	}

	@RequestMapping(value = "/mailcheck", method = RequestMethod.POST)
	@ResponseBody
	public String mailCheck(HttpServletRequest request) {
		String email = request.getParameter("check");
		int result = memberDao.emailCheck(email);
		return String.valueOf(result);
	}

	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member m, @RequestParam(required = false) String save, HttpSession session,
			HttpServletResponse response, Model model) throws IOException {
		boolean result = memberDao.login(m);
		m = memberDao.info(m.getId());
		if (result) {
			session.setAttribute("loginFlag", true);
			session.setAttribute("userId", m.getId());
			session.setAttribute("name", m.getName());
			Cookie c = new Cookie("save", m.getId());
			c.setMaxAge(save == null ? 0 : 2419200);
			response.addCookie(c);
			return "redirect:/";
		} else {
			model.addAttribute("result", true);
			return "member/login";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/info")
	public String info(Model model, HttpSession session) {
		String id = (String) session.getAttribute("userId");
		if (id != null) {
			Member member = memberDao.info(id);
			model.addAttribute("member", member);
			return "member/info";
		} else {
			model.addAttribute("loginCheck", true);
			return "redirect:login";
		}
	}

	@RequestMapping(value = "/info", method = RequestMethod.POST)
	public String info(RedirectAttributes redirect, HttpSession session, String pw) {
		String id = (String) session.getAttribute("userId");
		boolean result = memberDao.pwCheck(id, pw);
		if (result) {
			session.setAttribute("pwFlag", result);
			return "redirect:info";
		} else {
			redirect.addFlashAttribute("fail", true);
			return "redirect:info";
		}
	}

	@RequestMapping("/edit")
	public String edit(Model model, HttpSession session) {
		String id = (String) session.getAttribute("userId");
		Member member = memberDao.info(id);
		model.addAttribute("member", member);
		return "member/edit";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(Member m) {
		boolean result = memberDao.edit(m);
		if (result) {
			return "redirect:info";
		} else {
			return "member/edit";
		}
	}

	@RequestMapping("/drop")
	public String drop(Model model, HttpSession session) {
		String id = (String) session.getAttribute("userId");
		Member member = memberDao.info(id);
		model.addAttribute("member", member);
		return "member/drop";
	}

	@RequestMapping(value = "/drop", method = RequestMethod.POST)
	public String drop(HttpSession session, Member m, RedirectAttributes redirect) {
		String id = (String) session.getAttribute("userId");
		boolean result = memberDao.drop(id, m);
		if(result) {
			session.invalidate();
		}
		redirect.addFlashAttribute("result", result);
		return "redirect:goodbye";
	}

	@RequestMapping({ "/find", "/find/" })
	public String find(Model model) {
		List<Member> list = memberDao.memberList();
		Collections.shuffle(list);
		model.addAttribute("list", list);
		return "member/find";
	}

	@RequestMapping("/find/{key}")
	public String search(@PathVariable String key, Model model) {
		List<Member> list = memberDao.search(key);
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
