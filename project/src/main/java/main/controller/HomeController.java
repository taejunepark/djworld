package main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(value= {"home", "/", ""})
	public String home(HttpSession session) {
		session.removeAttribute("pwFlag");
		return "home";
	}
}