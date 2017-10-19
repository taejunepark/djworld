package mini.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MinihomeController {
	@RequestMapping("/minihome")
	public String home() {
		return "mini/minihome";
	}
	
	@RequestMapping("/comment")
	public String comment() {
		return "mini/comment";
	}
}
