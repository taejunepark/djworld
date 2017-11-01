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
import main.model.member.MemberDao;
import mini.bean.BoardCount;
import mini.bean.Visitors;
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
	private BoardcountDao boardcountDao;
	
	@Autowired
	private TotalDao totalDao;
	
	@RequestMapping(value= {"/minihome/{id}"})
	public String home(@PathVariable String id, Model model, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		// id의 미니홈피
		List<Visitors> list = visitorsDao.list(id);
		Member owner = memberDao.info(id);
		String message = minicommentDao.check(id);
		int visitorsCount = boardcountDao.visitorsCount(id);
//		int diaryCount = boardcountDao.diaryCount(id);
//		int photoCount = boardcountDao.photoCount(id);
		
		BoardCount b = new BoardCount();
		b.setVisitorsCount(visitorsCount);
//		b.setDiaryCount(diaryCount);
//		b.setPhotoCount(photoCount);
		
		String userId = (String)session.getAttribute("userId");
		Cookie[] cookies = request.getCookies();
		Cookie viewCookie = null;
		
		for(int i = 0; i< cookies.length; i++){
			System.out.println(i+"번째 : " + cookies[i]);
			if(cookies[i].getName().equals("userId") || cookies[i].getName().equals("ownerId")){ 
				viewCookie = cookies[i];
			}
		}  
		 if(viewCookie == null){
			  System.out.println("VIEWCOOKIE 없음");
			  Cookie newCookie = new Cookie("userId","|"+userId+"|"); 
			  response.addCookie(newCookie);
			  Cookie newCookie2 = new Cookie("ownerId","|"+id+"|"); 
			  response.addCookie(newCookie2);
			  totalDao.plus(id);
		 }
		 else{
			  System.out.println("VIEWCOOKIE 있음");
			  String value = viewCookie.getValue();
			  System.out.println(value);
			  if(value.indexOf("|"+userId+"|") <  0 && value.indexOf("|"+id+"|") <  0 ){
			   value = value+"|"+userId+"|";
			   viewCookie.setValue(value);
			   response.addCookie(viewCookie);
			   value = value+"|"+id+"|";
			   viewCookie.setValue(value);
			   response.addCookie(viewCookie);
			  }
		 }
		 int total = totalDao.count(id);
		 owner.setTotal(total);
		 model.addAttribute("list", list);
		 model.addAttribute("owner", owner);
		 model.addAttribute("id", id);
		 model.addAttribute("message", message);
		 model.addAttribute("count", b);
		 
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
	
//	@RequestMapping("/minihome/{id}/comment")
//	public String comment(@PathVariable String id) {
//		return "mini/comment";
//	}
}
