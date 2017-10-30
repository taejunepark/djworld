package mini.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.bean.Member;
import main.model.member.MemberDao;
import mini.bean.Diary;
import mini.model.diary.DiaryDao;

@Controller
public class MinihomeController {
	
	@Autowired
	private DiaryDao diaryDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value= {"/minihome/{id}"})
	public String home(@PathVariable String id, Model model) {
		Member m = memberDao.info(id);
		System.out.println("뭐지?");
		System.out.println(m);
		model.addAttribute("id", id);
		model.addAttribute("member", m);
		return "mini/minihome";
	}
	
	@RequestMapping("/minihome/{id}/comment")
	public String comment(@PathVariable String id) {
		return "mini/comment";
	}
	
	@RequestMapping("/minihome/{id}/diary")
	public String init_diary(@PathVariable String id,Model model) {
		Date date = new Date();
		
		// 현재 날짜를 input 태그의 형식에 맞게 변경
		String time = new SimpleDateFormat("yyyy-MM-dd").format(date);

		// Dao에서 해당 날짜의 데이터를 가져와서 Forward
		Diary d = diaryDao.info(time, "rlaeodnjs");
		model.addAttribute("d", d);
		
		return "mini/diary/diary";
	}
	
	/** Ajax 사용 
	 * @throws IOException */
	@RequestMapping("/minihome/{id}/diary/{reg}")
	@ResponseBody
	public String select_diary(HttpServletResponse response , @PathVariable String id,@PathVariable String reg, Model model) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		Diary d = diaryDao.info(reg, id);
		String text = d==null?"":d.getDetail();
		System.out.println(text);
		return text;
	}
	
	@RequestMapping(value="/minihome/{id}/diary_write", method=RequestMethod.POST)
	public String diary_write(@PathVariable String id, Model model, @RequestParam Map<String,Object> map) {
		String path = "";
		if(map.get("ir1") == null) {
			model.addAttribute("reg", map.get("reg"));
			path = "mini/diary/diary_write";
		}else {
			Diary d = new Diary();
			d.setReg((String)map.get("reg"));
			d.setDetail((String)map.get("ir1"));
			d.setSeparate(id);
			diaryDao.insert(d);
			path = "redirect:/minihome/"+id+"/diary";
		}
		return path;
	}
	
	@RequestMapping(value="/minihome/{id}/diary_edit", method=RequestMethod.POST)
	public String diary_edit(@PathVariable String id, Model model, @RequestParam Map<String,Object> map) {
		String path = "";
		if(map.get("ir1") == null) {
			model.addAttribute("reg", map.get("reg"));
			model.addAttribute("detail", map.get("detail"));
			path = "mini/diary/diary_edit";
		}else {
			Diary d = new Diary();
			d.setReg((String)map.get("reg"));
			d.setDetail((String)map.get("ir1"));
			d.setSeparate(id);
			diaryDao.edit(d);
			path = "redirect:/minihome/"+id+"/diary";
		}
		return path;
	}
}
