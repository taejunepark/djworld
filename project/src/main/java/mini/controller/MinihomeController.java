package mini.controller;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Set;

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
	
	@RequestMapping(value= {"/minihome"})
	public String home() {
		return "mini/minihome";
	}
	
	@RequestMapping("/minihome/comment")
	public String comment() {
		return "mini/comment";
	}
	
	@RequestMapping("/minihome/diary")
	public String diary(Model model) {
		String time = new SimpleDateFormat("yy/MM/dd").format(new Date());
		System.out.println(time);
		Diary d = diaryDao.info(time, "rlaeodnjs");
		model.addAttribute("d", d);
		return "mini/diary/diary";
	}
	
	@RequestMapping("/minihome/diary/diary_write/{reg}")
	public String diary_write(@PathVariable String reg, Model model) {
		model.addAttribute("reg", reg);
		return "mini/diary/diary_write";
	}
	
	@RequestMapping(value="/minihome/diary/diary_write", method=RequestMethod.POST)
	public String diary_write(@RequestParam Map<String,Object> map) {
		Diary d = new Diary();
		d.setReg((String)map.get("reg"));
		d.setDetail((String)map.get("ir1"));
		d.setSeparate("rlaeodnjs");
		diaryDao.insert(d);
		return "mini/diary/diary";
	}
}
