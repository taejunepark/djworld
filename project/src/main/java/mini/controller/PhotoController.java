package mini.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import main.bean.Member;
import main.model.member.MemberDao;
import mini.bean.Photo;
import mini.model.photo.PhotoDao;
import mini.model.total.TotalDao;
import mini.model.upload.UploadDao;
import mini.util.Utility;

@Controller
public class PhotoController {
	@Autowired
	private MemberDao MemberDao;
	
	@Autowired
	private UploadDao uploadDao;
	
	@Autowired 
	private PhotoDao photoDao;
	
	@Autowired
	private TotalDao TotalDao;
	
	@RequestMapping("/minihome/{id}/photo")
	public String photo(@PathVariable String id, Model model) {
		Member owner = MemberDao.info(id);
		List<Photo> list = photoDao.list("photo", id); 
		int total = TotalDao.count(id);
		owner.setTotal(total);
		model.addAttribute("list", list);
		model.addAttribute("owner", owner);
		model.addAttribute("id", id);
		return "/mini/photo/photo";
	}
	
	@RequestMapping("/minihome/{id}/photo_write")
	public String view_write(@PathVariable String id, Model model) {
		Member owner = MemberDao.info(id);
		int total = TotalDao.count(id);
		owner.setTotal(total);
		model.addAttribute("owner", owner);
		model.addAttribute("id", id);
		return "/mini/photo/photo_write";
	}
	
	@RequestMapping(value = "/minihome/{id}/photo_write", method=RequestMethod.POST)
	public String photo_write(@PathVariable String id, Model model, RedirectAttributes redirect, @RequestParam Map<String,Object> map) {
		Member owner = MemberDao.info(id);
		int total = TotalDao.count(id);
		String title = (String)map.get("title");
		String detail = (String)map.get("detail");
		photoDao.insert(title, detail, id);
		List<String> list = Utility.substrURL((String)map.get("srcs"));
		int no = photoDao.newSeq(id);
		uploadDao.insert(list, no, id);
		owner.setTotal(total);
		redirect.addFlashAttribute("owner", owner);
		redirect.addFlashAttribute("id", id);
		return "redirect:/minihome/"+id+"/photo";
	}
}
