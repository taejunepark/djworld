package mini.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import main.bean.Member;
import main.model.member.MemberDao;
import mini.bean.Diary;
import mini.bean.Visitors;
import mini.model.diary.DiaryDao;
import mini.model.reply.ReplyDao;
import mini.model.visitors.VisitorsDao;

@Controller
public class MinihomeController {
	
	@Autowired
	private DiaryDao diaryDao;
	
	@Autowired
	private VisitorsDao visitorsDao;
	
	@Autowired
	public ReplyDao replyDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value= {"/minihome/{id}"})
	public String home(@PathVariable String id, Model model, HttpSession session) {
		// id의 미니홈피
		List<Visitors> list = visitorsDao.list(id);
		Member owner = memberDao.info(id);
		model.addAttribute("list", list);
		model.addAttribute("owner", owner);
		model.addAttribute("id", id);
	
		return "mini/minihome";
	}
	
	@RequestMapping("/minihome/{id}/comment")
	public String comment(@PathVariable String id) {
		return "mini/comment";
	}
	
	@RequestMapping("/minihome/{id}/diary")
	public String init_diary(@PathVariable String id,Model model) {
		Date date = new Date();
		List<Visitors> list = visitorsDao.list(id);
		Member owner = memberDao.info(id);
		model.addAttribute("list", list);
		model.addAttribute("owner", owner);
		model.addAttribute("id", id);
		
		String time = new SimpleDateFormat("yyyy-MM-dd").format(date);

		// Dao에서 해당 날짜의 데이터를 가져와서 Forward
		Diary d = diaryDao.info(time, id);
		model.addAttribute("d", d);
		return "mini/diary/diary";
	}
	
	/** Ajax 사용 
	 * @throws IOException */
	@RequestMapping(value = "/minihome/{id}/diary/{reg}", produces = "application/text; charset=utf8")
	@ResponseBody
	public String select_diary(HttpServletResponse response , @PathVariable String id,@PathVariable String reg, Model model) throws IOException {
		List<Visitors> list = visitorsDao.list(id);
		Member owner = memberDao.info(id);
		model.addAttribute("list", list);
		model.addAttribute("owner", owner);
		model.addAttribute("id", id);
		
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		Diary d = diaryDao.info(reg, id);
		String text = d==null?"":d.getDetail();
		return text;
	}
	
	
	
	@RequestMapping(value="/minihome/{id}/diary_write", method=RequestMethod.POST)
	public String diary_write(@PathVariable String id, Model model,RedirectAttributes redirect, @RequestParam Map<String,Object> map) {
		List<Visitors> list = visitorsDao.list(id);
		Member owner = memberDao.info(id);
		
		String path = "";
		String detail = (String)map.get("detail");
		String reg = (String)map.get("reg");
		if(detail == null || detail.equals("")) {
			model.addAttribute("list", list);
			model.addAttribute("owner", owner);
			model.addAttribute("id", id);
			model.addAttribute("reg", reg);
			path = "mini/diary/diary_write";
		}else {
			redirect.addFlashAttribute("list", list);
			redirect.addFlashAttribute("owner", owner);
			redirect.addFlashAttribute("id", id);
			Diary d = new Diary();
			d.setReg(reg);
			//detail = detail.substring(3, detail.length() - 4);
			d.setDetail(detail);
			d.setSeparate(id);
			diaryDao.insert(d);
			path = "redirect:/minihome/" + id + "/diary";
		}
		return path;
	}
	
	@RequestMapping(value="/minihome/{id}/diary_edit", method=RequestMethod.POST)
	public String diary_edit(@PathVariable String id, Model model, RedirectAttributes redirect, @RequestParam Map<String,Object> map) {
		List<Visitors> list = visitorsDao.list(id);
		Member owner = memberDao.info(id);
		
		String path = "";
		String editFlag = (String)map.get("editFlag");
		String detail = (String)map.get("detail");
		String reg = (String)map.get("reg");
		
		if(editFlag.equalsIgnoreCase("true")) {
			model.addAttribute("list", list);
			model.addAttribute("owner", owner);
			model.addAttribute("id", id);
			model.addAttribute("reg", reg);
			model.addAttribute("detail", detail);
			model.addAttribute("editFlag", "false");
			path = "mini/diary/diary_edit";
		}else {
			redirect.addFlashAttribute("list", list);
			redirect.addFlashAttribute("owner", owner);
			redirect.addFlashAttribute("id", id);
			Diary d = new Diary();
			d.setReg(reg);
			d.setDetail(detail);
			d.setSeparate(id);
			diaryDao.edit(d);
			path = "redirect:/minihome/"+id+"/diary";
		}
		return path;
	}
	
	
	// 방명록
	@RequestMapping("/minihome/{id}/visitors")
	public String visitors(@PathVariable String id,Model model, HttpSession session) {
		// id의 미니홈피
		List<Visitors> list = visitorsDao.list(id);
		Member owner = memberDao.info(id);
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
}
