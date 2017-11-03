package mini.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import mini.bean.Board;
import mini.bean.Diary;
import mini.model.board.BoardDao;
import mini.model.comment.MinicommentDao;
import mini.model.diary.DiaryDao;
import mini.model.total.TotalDao;
import mini.model.upload.UploadDao;
import mini.model.visitors.VisitorsDao;
import mini.util.Utility;

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
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping("/minihome/{id}/board")
	public String init_board(@PathVariable String id,Model model) {
		Member owner = memberDao.info(id);
		int total = totalDao.count(id);
		owner.setTotal(total);
		String message = minicommentDao.check(id); // 상태메세지
		List<Member> friendList = friendDao.allList(id);
		List<Board> boardList = boardDao.list("board", id);

		model.addAttribute("owner", owner);
		model.addAttribute("message", message);
		model.addAttribute("friendList", friendList);
		model.addAttribute("boardList", boardList);

		// Dao에서 해당 날짜의 데이터를 가져와서 Forward
		return "mini/board/board";
	}
	
	@RequestMapping("/minihome/{id}/board_write")
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
		return "/mini/board/board_write";
	}
	
	@RequestMapping(value = "/minihome/{id}/board_write", method=RequestMethod.POST)
	public String board_write(@PathVariable String id, HttpServletRequest request,Model model, @RequestParam Map<String,Object> map) {
		Member owner = memberDao.info(id);
		int total = totalDao.count(id);
		owner.setTotal(total);
		Board b = new Board();
		b.setTitle((String)map.get("title"));
		b.setWriter(memberDao.info((String)request.getSession().getAttribute("userId")).getName());
		b.setDetail((String)map.get("detail"));
		b.setSeparate(id);
		boardDao.insert(b);
		List<String> list = Utility.substrURL((String)map.get("srcs"));
		int no = boardDao.newSeq(id);
		uploadDao.insert(list, no, id);
		return "redirect:/minihome/"+id+"/board";
	}
	
	@RequestMapping("/minihome/{id}/board_detail/{no}")
	public String board_detail(@PathVariable String id,@PathVariable int no, Model model) {
		Member owner = memberDao.info(id);
		int total = totalDao.count(id);
		owner.setTotal(total);
		String message = minicommentDao.check(id); // 상태메세지
		List<Member> friendList = friendDao.allList(id);
		Board board = boardDao.info(no, id);
		
		model.addAttribute("owner", owner);
		model.addAttribute("message", message);
		model.addAttribute("friendList", friendList);
		model.addAttribute("id", id);
		model.addAttribute("board", board);
		return "/mini/board/board_detail";
	}
}
