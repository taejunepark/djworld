package mini.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mini.bean.Diary;
import mini.model.diary.DiaryDao;

@Controller
public class MinihomeController {
	@Autowired
	private DiaryDao diaryDao;
	
	@RequestMapping(value= {"/minihome/{id}"})
	public String home(@PathVariable String id, Model model) {
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
	public void select_diary(@PathVariable String id,@PathVariable String reg, HttpServletResponse response, Model model) throws IOException {
		PrintWriter pw = response.getWriter();
		Diary d = diaryDao.info(reg, id);
		String text = d==null?"":d.getDetail();
		pw.write(text);
		pw.flush();
		pw.close();
	}
	
	@RequestMapping("/minihome/{id}/diary/diary_write/{reg}")
	public String diary_write(@PathVariable String id,@PathVariable String reg, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("reg", reg);
		return "mini/diary/diary_write";
	}
	
	@RequestMapping(value="/minihome/{id}/diary/diary_write/{reg}", method=RequestMethod.POST)
	public String diary_write(@PathVariable String id, @PathVariable String reg, @RequestParam Map<String,Object> map) {
		Diary d = new Diary();
		d.setReg((String)map.get("reg"));
		d.setDetail((String)map.get("ir1"));
		d.setSeparate("rlaeodnjs");
		diaryDao.insert(d);
		return "redirect:/minihome/"+id+"/diary";
	}
}
