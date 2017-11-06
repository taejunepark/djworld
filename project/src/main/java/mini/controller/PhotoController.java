package mini.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import main.bean.Member;
import main.model.friend.FriendDao;
import main.model.member.MemberDao;
import mini.bean.Photo;
import mini.model.comment.MinicommentDao;
import mini.model.photo.PhotoDao;
import mini.model.reply.ReplyDao;
import mini.model.total.TotalDao;
import mini.model.upload.UploadDao;
import mini.util.Utility;

@Controller
public class PhotoController {
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private UploadDao uploadDao;
	
	@Autowired 
	private PhotoDao photoDao;
	
	@Autowired
	private TotalDao totalDao;
	
	@Autowired
	private MinicommentDao minicommentDao;
	
	@Autowired
	private FriendDao friendDao;
	
	@Autowired
	private ReplyDao replyDao;
	
	@RequestMapping("/minihome/{id}/photo")
	public String photo(@PathVariable String id, Model model) {
		Member owner = memberDao.info(id);
		int total = totalDao.count(id);
		owner.setTotal(total);
		String message = minicommentDao.check(id); // 상태메세지
		List<Member> friendList = friendDao.allList(id);
		List<Photo> list = photoDao.list("photo", id); 
		
		model.addAttribute("owner", owner);
		model.addAttribute("message", message);
		model.addAttribute("friendList", friendList);
		
		model.addAttribute("list", list);
		model.addAttribute("id", id);
		return "/mini/photo/photo";
	}
	
	@RequestMapping("/minihome/{id}/photo_write")
	public String view_write(@PathVariable String id, Model model) {
		Member owner = memberDao.info(id);
		int total = totalDao.count(id);
		owner.setTotal(total);
		String message = minicommentDao.check(id); // 상태메세지
		List<Member> friendList = friendDao.allList(id);
		
		model.addAttribute("owner", owner);
		model.addAttribute("message", message);
		model.addAttribute("friendList", friendList);
		model.addAttribute("id", id);
		return "/mini/photo/photo_write";
	}
	
	@RequestMapping(value = "/minihome/{id}/photo_write", method=RequestMethod.POST)
	public String photo_write(@PathVariable String id, Model model, RedirectAttributes redirect, @RequestParam Map<String,Object> map) {
		Member owner = memberDao.info(id);
		int total = totalDao.count(id);
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
	
	@RequestMapping("/minihome/{id}/photo_edit/{no}")
	public String view_edit(@PathVariable String id, @PathVariable int no, Model model) {
		Member owner = memberDao.info(id);
		int total = totalDao.count(id);
		owner.setTotal(total);
		String message = minicommentDao.check(id); // 상태메세지
		List<Member> friendList = friendDao.allList(id);
		Photo photo = photoDao.info(no);
		
		model.addAttribute("photo", photo);
		model.addAttribute("owner", owner);
		model.addAttribute("message", message);
		model.addAttribute("friendList", friendList);
		model.addAttribute("id", id);
		
		return "/mini/photo/photo_edit";
	}
	
	@RequestMapping(value="/minihome/{id}/photo_edit/{no}", method=RequestMethod.POST)
	public String photo_edit(@PathVariable String id, @PathVariable int no, Model model, @RequestParam Map<String,Object> map, RedirectAttributes redirect) {
		Member owner = memberDao.info(id);
		int total = totalDao.count(id);
		owner.setTotal(total);
		String message = minicommentDao.check(id); // 상태메세지
		List<Member> friendList = friendDao.allList(id);
		
		String title = (String)map.get("title");
		String detail = (String)map.get("detail");
		
		photoDao.edit(title, detail, id, no);
		Photo p = photoDao.info(no);
		uploadDao.delete(p.getOwner(), p.getNo());
		
		List<String> list = Utility.substrURL((String)map.get("srcs"));
		if(list.size() != 0)
			uploadDao.insert(list, p.getNo(), p.getOwner());
		
		redirect.addFlashAttribute("owner", owner);
		redirect.addFlashAttribute("message", message);
		redirect.addFlashAttribute("friendList", friendList);
		redirect.addFlashAttribute("id", id);
		
		return "redirect:/minihome/"+id+"/photo";
	}
	
	@RequestMapping(value="/minihome/{id}/photo_delete/{no}")
	public String photo_delete(@PathVariable String id, @PathVariable int no, Model model, @RequestParam Map<String,Object> map, RedirectAttributes redirect) {
		Member owner = memberDao.info(id);
		int total = totalDao.count(id);
		owner.setTotal(total);
		String message = minicommentDao.check(id); // 상태메세지
		List<Member> friendList = friendDao.allList(id);
		
		String title = (String)map.get("title");
		String detail = (String)map.get("detail");
		
		photoDao.delete(id, no);
		uploadDao.delete(id, no);
		replyDao.deleteAll(id, no);
		
		redirect.addFlashAttribute("owner", owner);
		redirect.addFlashAttribute("message", message);
		redirect.addFlashAttribute("friendList", friendList);
		redirect.addFlashAttribute("id", id);
		
		return "redirect:/minihome/"+id+"/photo";
	}
}
