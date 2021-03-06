package main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import main.bean.Member;
import main.model.find.EmailService;
import main.model.find.FindDao;
import main.model.member.MemberDao;

@Controller
@RequestMapping("/info")
public class FindController {

	@Autowired
	private FindDao findDao;

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private EmailService emailService;

	@RequestMapping("/infofind")
	public String infoFind(Model model, RedirectAttributes redirect, HttpSession session) {
		String id = (String)session.getAttribute("userId");
		if(id != null) {
			redirect.addFlashAttribute("findFlag", "실패");
			return "redirect:/";
		}
		return "infofind/infofind";
	}

	@RequestMapping(value = "/infofind/id", method = {RequestMethod.GET, RequestMethod.POST})
	public String infoFind(RedirectAttributes redirect, Model model, String name, String email) {
		String id = findDao.idFind(name, email);
		if(id != null) {
			Member m = memberDao.info(id);
			id = id.substring(0, id.length() - 2) + "**";
			model.addAttribute("id", id);
			model.addAttribute("reg", m.getDate());
			return "infofind/idfind";
		}
		else {
			redirect.addFlashAttribute("fail", "error");
			return "redirect:/info/infofind";
		}
	}

	@RequestMapping(value = "/infofind/pw", method = {RequestMethod.GET, RequestMethod.POST})
	public String infoFind(RedirectAttributes redirect, String id, String name, String email, Model model) {
		boolean result = memberDao.infoCheck(id, name, email);
		if(result) {
			Member m = memberDao.info(id);
			if (m.getName().equals(name) && m.getEmail().equals(email)) {
				emailService.send(id, name, email);
				model.addAttribute("id",  id);
				model.addAttribute("email",  email);
			}
			return "infofind/pwfind";
		}
		else {
			redirect.addFlashAttribute("fail", "error");
			return "redirect:/info/infofind";
		}
	}
}
