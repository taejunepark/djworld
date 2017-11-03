package mini.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import main.bean.Member;
import main.model.friend.FriendDao;
import main.model.member.MemberDao;
import mini.bean.Diary;
import mini.model.comment.MinicommentDao;
import mini.model.diary.DiaryDao;
import mini.model.total.TotalDao;
import mini.model.upload.UploadDao;
import mini.model.visitors.VisitorsDao;

@Controller
public class BoardController {
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private TotalDao totalDao;
	
	@Autowired
	private UploadDao uploadDao;
	
	@Autowired
	private FriendDao friendDao;
	
	@Autowired
	private MinicommentDao minicommentDao;
	
	@RequestMapping("/minihome/{id}/board")
	public String init_board(@PathVariable String id,Model model) {
		Member owner = memberDao.info(id);
		int total = totalDao.count(id);
		owner.setTotal(total);
		String message = minicommentDao.check(id); // 상태메세지
		List<Member> friendList = friendDao.allList(id);

		model.addAttribute("owner", owner);
		model.addAttribute("message", message);
		model.addAttribute("friendList", friendList);

		// Dao에서 해당 날짜의 데이터를 가져와서 Forward
		return "mini/board/board";
	}
}
