package mini.controller;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
		model.addAttribute("inputVal", time);
		// 현재 날짜를 가져와서 데이터 베이스의 날짜 형식에 맞게 변경
		time = new SimpleDateFormat("yy/MM/dd").format(date);

		// Dao에서 해당 날짜의 데이터를 가져와서 Forward
		Diary d = diaryDao.info(time, "rlaeodnjs");
		model.addAttribute("d", d);
		
		// 현재 월의 마지막 요일을 구하여 Forward 
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int final_day = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		System.out.println("마지막 일 : " + final_day);
		model.addAttribute("final_day", final_day);
		return "mini/diary/diary";
	}
	
	@RequestMapping("/minihome/{id}/diary/{reg}")
	public String select_diary(@PathVariable String id,@PathVariable String reg, Model model) {
		// 현재 월의 마지막 요일을 구하여 Forward
		Calendar cal = Calendar.getInstance();
		int year = Integer.parseInt(reg.substring(0, 4));
		System.out.println("year : " + year);
		int month = Integer.parseInt(reg.substring(5,7));
		System.out.println("month : " + month);
		int date = Integer.parseInt(reg.substring(8, 10));
		System.out.println("date : " + date);
		cal.set(year, month - 1, date);
		int final_day = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		System.out.println("마지막 일 : " + final_day);
		model.addAttribute("final_day", final_day);
		
		model.addAttribute("inputVal", reg);
		reg = reg.substring(2).replace('-', '/');
		System.out.println(reg);
		
		// Dao에서 해당 날짜의 데이터를 가져와서 Forward
		Diary d = diaryDao.info(reg, "rlaeodnjs");
		model.addAttribute("d", d);
		
		
		return "mini/diary/diary";
	}
	
	@RequestMapping("/minihome/{id}/diary/diary_write/{reg}")
	public String diary_write(@PathVariable String id,@PathVariable String reg, Model model) {
		model.addAttribute("reg", reg);
		return "mini/diary/diary_write";
	}
	
	@RequestMapping(value="/minihome/{id}/diary/diary_write", method=RequestMethod.POST)
	public String diary_write(@PathVariable String id, @RequestParam Map<String,Object> map) {
		Diary d = new Diary();
		d.setReg((String)map.get("reg"));
		d.setDetail((String)map.get("ir1"));
		d.setSeparate("rlaeodnjs");
		diaryDao.insert(d);
		return "redirect:/minihome/diary";
	}
}
