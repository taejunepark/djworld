package main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {
	
	@RequestMapping("/pay")
	public String pay() {
		return "pay";
	}
}
