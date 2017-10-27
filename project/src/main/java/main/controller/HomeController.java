package main.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import main.bean.Member;
import main.model.friend.FriendDao;
import main.model.member.MemberDao;

@Controller
public class HomeController {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private FriendDao friendDao;

	@RequestMapping(value = { "home", "/", "" })
	public String home(HttpSession session, Model model) throws InterruptedException {
		session.removeAttribute("pwFlag");

		String id = (String) session.getAttribute("userId");
		List<Member> list = new ArrayList<>();

		if (id != null) {
			Member m = memberDao.info(id);
			session.setAttribute("profile", m.getProfile());
			List<Member> temp = friendDao.allList(id);
			try {
				Collections.shuffle(temp);
				if (temp.size() >= 3) {
					for (int i = 0; i < 3; i++) {
						list.add(temp.get(i));
					}
				} 
				else {
					for (int i = 0; i < temp.size(); i++) {
						list.add(temp.get(i));
					}
					int t = 3 - temp.size();
					temp = memberDao.allList();
					Collections.shuffle(temp);
					for(int i = 0; i < t; i++) {
						list.add(temp.get(i));
					}
				}
			} catch (IndexOutOfBoundsException e) {
				list = null;
			}
		}
		else {
			list = memberDao.allList();
		}
		model.addAttribute("friend", list);
		return "home";
	}
	
	@RequestMapping("/minime")
	public String minime() {
		return "ready";
	}
}