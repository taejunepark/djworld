package mini.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import main.bean.Member;
import main.model.member.MemberDao;
import mini.bean.Visitors;
import mini.model.total.TotalDao;
import mini.model.visitors.VisitorsDao;

@Controller
public class VisitorController {
	@Autowired
	private VisitorsDao visitorsDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private TotalDao totalDao;
	// 방명록
		@RequestMapping("/minihome/{id}/visitors")
		public String visitors(@PathVariable String id,Model model, HttpSession session) {
			// id의 미니홈피
			List<Visitors> list = visitorsDao.list(id);
			Member owner = memberDao.info(id);
			int total = totalDao.count(id);
			owner.setTotal(total);
			model.addAttribute("list", list);
			model.addAttribute("owner", owner);

			// 접속한 계정의 정보
			String  userId = (String)session.getAttribute("userId");
			Member user = memberDao.info(userId);
			model.addAttribute("user", user);
			
			return "mini/visitors/visitors";
		}
		
		@RequestMapping(value="/minihome/{id}/visitors", method=RequestMethod.POST)
		public String visitors(@PathVariable String id, Model model, Visitors v, HttpSession session) {
			visitorsDao.write(v.getWriter(), v.getDetail(), id);
			return "redirect:/minihome/"+id+"/visitors";
		}
		
		@RequestMapping("/minihome/{id}/visitors/delete/{no}")
		public String visitorsDelete(@PathVariable String id, @PathVariable int no) {
			visitorsDao.delete(id, no);
			return "redirect:/minihome/"+id+"/visitors";
		}
}
