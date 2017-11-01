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
		List<Member> temp = new ArrayList<>();
		if (id != null) {
			Member m = memberDao.info(id);
			session.setAttribute("profile", m.getProfile());
			 temp = friendDao.allList(id);
			try {
				Collections.shuffle(temp);
				// 일촌이 있는경우
				if (temp.size() >= 3) {
					for (int i = 0; i < 3; i++) {
						list.add(temp.get(i));
					}
					model.addAttribute("full", true);
				} 
				
				// 일촌이 없는 경우
				else {
					temp = memberDao.allList();
					for(int i = 0; i < temp.size(); i++) {
						if(temp.get(i).getId().equals(id)){
							temp.remove(i);
						}
					}
					for (int i = 0; i < temp.size(); i++) {
						if(i == 3) {
							break;
						}
						list.add(temp.get(i));
					}
				}
			} catch (IndexOutOfBoundsException e) {
				list = null;
			}
		}
		
		// 로그인 하지 않았을 경우
		else {
			temp = memberDao.allList();
			for(int i = 0; i < temp.size(); i++) {
				if(temp.get(i).getId().equals(id)){
					temp.remove(i);
				}
			}
			for (int i = 0; i < temp.size(); i++) {
				if(i == 3) {
					break;
				}
				list.add(temp.get(i));
			}
		}
		model.addAttribute("friend", list);
		return "home";
	}
	
	@RequestMapping("/minime")
	public String minime() {
		return "notice/ready";
	}
}