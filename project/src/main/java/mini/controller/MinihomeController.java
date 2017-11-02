package mini.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import main.bean.Member;
import main.model.friend.FriendDao;
import main.model.member.MemberDao;
import mini.bean.BoardCount;
import mini.bean.Friendcomment;
import mini.model.comment.MinicommentDao;
import mini.model.count.BoardcountDao;
import mini.model.total.TotalDao;
import mini.model.visitors.VisitorsDao;

@Controller
public class MinihomeController {
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private VisitorsDao visitorsDao;
	
	@Autowired
	private MinicommentDao minicommentDao;
		
	@Autowired
	private FriendDao friendDao;
	
	@Autowired
	private BoardcountDao boardcountDao;
	
	@Autowired
	private TotalDao totalDao;
	
	@RequestMapping(value= {"/minihome/{id}"})
	public String home(@PathVariable String id, Model model, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		// id의 미니홈피
		Member owner = memberDao.info(id); // 미니홈피 주인 정보
		String message = minicommentDao.check(id); // 상태메세지
		List<Member> friendList = friendDao.allList(id);
		int visitorsCount = boardcountDao.visitorsCount(id); // 게시판 수
//		int diaryCount = boardcountDao.diaryCount(id);
//		int photoCount = boardcountDao.photoCount(id);
		List<Friendcomment> friendCommentList = minicommentDao.friendCommentList(id);
		
		// 게시판 전체 수
		BoardCount b = new BoardCount();
		b.setVisitorsCount(visitorsCount);
//		b.setDiaryCount(diaryCount);
//		b.setPhotoCount(photoCount);
		
		String userId = (String)session.getAttribute("userId");
		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;
		
		String temp = userId+id;
		 if(cookies != null && cookies.length > 0){
			for(int i = 0; i< cookies.length; i++){
				if(cookies[i].getName().equals("userId")){ 
					viewCookie = cookies[i];
				}
			}  
		 }
		 if(viewCookie == null){
			  Cookie newCookie = new Cookie("userId","|"+temp+"|"); 
			  response.addCookie(newCookie);
			  totalDao.plus(id);
		 }
		 else{
			  String value = viewCookie.getValue();
			  if(value.indexOf("|"+temp+"|") <  0){
				  value = value+"|"+temp+"|";
				  viewCookie.setValue(value);
				  response.addCookie(viewCookie);
				  totalDao.plus(id);
			  }
		 }
		 if(viewCookie != null) {
			 viewCookie.setMaxAge(24*60*60);
		 }
		 
		 int total = totalDao.count(id);
		 owner.setTotal(total);
		 model.addAttribute("owner", owner);
		 model.addAttribute("id", id);
		 if(message == null) {
			 message = "자기소개가 없습니다.";
		 }
		 model.addAttribute("message", message);
		 model.addAttribute("friendList", friendList);
		 model.addAttribute("count", b);
		 model.addAttribute("friendCommentList", friendCommentList);
		 return "mini/minihome";
	}
	
	@RequestMapping(value="/minihome/{id}/minicomment", method=RequestMethod.POST)
	public String hello(@PathVariable String id, Model model, HttpServletRequest request, RedirectAttributes redirect) {
		String comment = request.getParameter("comment");
		String type = request.getParameter("type");
		if(type.equals("insert")) {
			minicommentDao.insert(id, comment);
		}
		else {
			minicommentDao.update(id, comment);
		}
		return "redirect:/minihome/"+id;
	}
	
	@RequestMapping(value="/minihome/{id}/friendcomment")
	public String comment(@PathVariable String id, String friendcomment, String writer) {
		minicommentDao.friendCommentInsert(writer, id, friendcomment);
		return "redirect:/minihome/"+id;
	}
}
