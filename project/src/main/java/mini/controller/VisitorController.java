package mini.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import main.bean.Member;
import main.model.friend.FriendDao;
import main.model.member.MemberDao;
import mini.bean.Visitors;
import mini.model.comment.MinicommentDao;
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
	
	@Autowired
	private MinicommentDao minicommentDao;
	
	@Autowired
	private FriendDao friendDao;
	
	// 방명록
		@RequestMapping("/minihome/{id}/visitors")
		public String visitors(@PathVariable String id,Model model, HttpSession session) {
			// id의 미니홈피
			List<Visitors> list = visitorsDao.list(id);
			Member owner = memberDao.info(id);
			int total = totalDao.count(id);
			String message = minicommentDao.check(id); // 상태메세지
			List<Member> friendList = friendDao.allList(id);
			model.addAttribute("message", message);
			model.addAttribute("friendList", friendList);
			
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
		
		@RequestMapping(value= "/minihome/{id}/visitors/edit/{no}", produces = "application/text; charset=utf8")
		@ResponseBody
		public String visitorsEdit(@PathVariable String id, @PathVariable int no, HttpServletRequest request) {
			String detail = request.getParameter("detail");
			visitorsDao.edit(id, no, detail);
			return detail;
		}
}
