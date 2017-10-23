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
	
	@RequestMapping("/minihome/diary")
	public String diary() {
		return "mini/diary/diary";
	}
	
	@RequestMapping("/minihome/diary/diary_write")
	public String diary_write() {
		return "mini/diary/diary_write";
	}
}
