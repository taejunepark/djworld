package main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import main.bean.Member;
import main.model.friend.FriendDao;

@Controller
@RequestMapping("/friend")
public class FriendController {
	
	@Autowired
	private FriendDao friendDao;
	
	@RequestMapping("/list")
	public String list() {
		return "friend/list";
	}
	
	@RequestMapping("/requestlist")
	public String requestList(HttpSession session) {
		String id = (String)session.getAttribute("userId");
		List<Member> list = friendDao.requestList(id);
		return "friend/requestlist";
	}
	
	@RequestMapping("/sendlist")
	public String sendList() {
		
		return "friend/sendlist";
	}
}
