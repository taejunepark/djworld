package main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping("/infofind/{code}")
	public String infoFind(@PathVariable String code, Model model) {
		model.addAttribute("code", code.substring(5, 7));
		return "infofind/infofind";
	}

	@RequestMapping(value = "/infofind/code=id", method = RequestMethod.POST)
	public String infoFind(Model model, String name, String email) {
		String id = findDao.idFind(name, email);
		if (id != null) {
			Member m = memberDao.info(id);
			model.addAttribute("id", id);
			model.addAttribute("reg", m.getDate());
		}
		return "infofind/idfind";
	}

	@RequestMapping(value = "/infofind/code=pw", method = RequestMethod.POST)
	public String infoFind(String id, String name, String email) {
		Member m = memberDao.info(id);
		if (m.getName().equals(name) && m.getEmail().equals(email)) {
			emailService.send(id, name, email);
			System.out.println("됨?");
		}
		return "infofind/pwfind";
	}
}
