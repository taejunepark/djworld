package mini.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import main.bean.Reply;
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
}
