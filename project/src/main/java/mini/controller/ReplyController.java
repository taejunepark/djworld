package mini.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mini.bean.Reply;
import mini.model.reply.ReplyDao;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyDao replyDao;
	
	@RequestMapping(value="/reply", method= {RequestMethod.GET, RequestMethod.POST})
	public String reply(Reply r, Model m, HttpServletRequest request) {
		replyDao.insert(r.getWriter(), r.getDetail(), r.getParent(), r.getFriend());
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	
	@RequestMapping(value="/replydelete/{no}/{id}")
	public String replyDelete(@PathVariable int no, @PathVariable String id) {
		replyDao.delete(id, no);
		return "redirect:/minihome/"+id+"/visitors";
	}
	
	@RequestMapping(value="/replyedit/{no}/{writer}",  produces = "application/text; charset=utf8")
	@ResponseBody
	public String replyEdit(@PathVariable int no, @PathVariable String writer, HttpServletRequest request) {
		String detail = request.getParameter("detail");
		replyDao.edit(writer, no, detail);
		return detail;
	}
}
