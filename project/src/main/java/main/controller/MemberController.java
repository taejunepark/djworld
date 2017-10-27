package main.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import main.bean.Member;
import main.model.friend.FriendDao;
import main.model.image.ImageBoardDao;
import main.model.member.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private ImageBoardDao imageBoardDao;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private MemberDao memberDao;

	@Autowired
	private FriendDao friendDao;

	// 로그인
	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}

	// 로그인(POST)
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member m, @RequestParam(required = false) String save, HttpSession session,
			HttpServletResponse response, Model model) throws IOException {
		boolean result = memberDao.login(m);
		m = memberDao.info(m.getId());
		if (result) {
			session.setAttribute("loginFlag", true);
			session.setAttribute("userId", m.getId());
			session.setAttribute("name", m.getName());
			Cookie c = new Cookie("remember", m.getId());
			c.setMaxAge(save == null ? 0 : 2419200);
			response.addCookie(c);
			return "redirect:/";
		} else {
			model.addAttribute("result", true);
			return "member/login";
		}
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/agreement")
	public String agreement() {
		return "member/agreement";
	}

	// 회원가입
	@RequestMapping("/register")
	public String register() {
		return "member/register";
	}

	// 회원가입(POST)
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Member m, HttpServletRequest request) {
		memberDao.register(m);
		return "redirect:login";
	}

	// 회원가입시 아이디 중복체크
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String id = request.getParameter("check");
		int result = memberDao.idCheck(id);
		return String.valueOf(result);
	}

	// 회원가입시 이메일 중복체크
	@RequestMapping(value = "/mailcheck", method = RequestMethod.POST)
	@ResponseBody
	public String mailCheck(HttpServletRequest request) {
		String email = request.getParameter("check");
		int result = memberDao.emailCheck(email);
		return String.valueOf(result);
	}

	// 이메일 변경시 이메일 중복체크
	@RequestMapping(value = "/idemailcheck", method = RequestMethod.POST)
	@ResponseBody
	public String idmailCheck(HttpServletRequest request, HttpSession session) {
		String email = request.getParameter("check");
		String id = (String) session.getAttribute("userId");
		String result = memberDao.idEmail(id);
		return String.valueOf(result.equals(email));
	}

	@RequestMapping(value = "/pwcheck/{path}")
	public String pwcheck(@PathVariable String path, Model model, HttpSession session, RedirectAttributes redirect) {
		String id = (String) session.getAttribute("userId");
		if (id == null) {
			redirect.addFlashAttribute("loginCheck", true);
			return "redirect:/member/login";
		}
		model.addAttribute("path", path);
		return "member/pwcheck";
	}

	// 내 정보, 변경 하기 전 비번 체크
	@RequestMapping(value = "/pwcheck/{path}", method = RequestMethod.POST)
	public String pwcheck(@PathVariable String path, Model model, HttpSession session, String pw) {
		String id = (String) session.getAttribute("userId");
		boolean result = memberDao.pwCheck(id, pw);
		if (result) {
			if (path.equals("info")) {
				return "redirect:/member/info";
			} else if (path.equals("pwchange")) {
				return "member/pwchange";
			} else {
				model.addAttribute("pathError", true);
				return "member/pwcheck";
			}
		} else {
			model.addAttribute("pwFlag", true);
			return "member/pwcheck";
		}
	}

	// 내 정보
	@RequestMapping("/info")
	public String info(Model model, HttpSession session, RedirectAttributes redirect) {
		String id = (String) session.getAttribute("userId");
		if (id != null) {
			Member member = memberDao.info(id);
			model.addAttribute("member", member);
			return "member/info";
		} else {
			redirect.addFlashAttribute("loginCheck", true);
			return "redirect:login";
		}
	}

	// 비밀번호 변경(POST)
	@RequestMapping(value = "/pwchange", method = RequestMethod.POST)
	public String pwchange(HttpServletRequest request, HttpSession session, RedirectAttributes redirect) {
		String pw = request.getParameter("newpw");
		String id = (String) session.getAttribute("userId");
		boolean result = memberDao.pwChange(id, pw);
		redirect.addFlashAttribute("pwchange", result);
		return "redirect:/";
	}

	// 이메일 변경
	@RequestMapping("/emailchange")
	public String emailedit(HttpSession session, Model model) {
		String id = (String) session.getAttribute("userId");
		String email = memberDao.idEmail(id);
		model.addAttribute("email", email);
		return "member/emailchange";
	}

	// 이메일 변경(POST)
	@RequestMapping(value = "/emailchange", method = RequestMethod.POST)
	public String emailedit(HttpServletRequest request, RedirectAttributes redirect) {
		String nowemail = request.getParameter("nowemail");
		String newemail = request.getParameter("newemail");
		boolean result = memberDao.emailChange(nowemail, newemail);
		redirect.addFlashAttribute("emailchange", result);
		return "redirect:/";
	}

	// 회원탈퇴
	@RequestMapping("/drop")
	public String drop(Model model, HttpSession session) {
		String id = (String) session.getAttribute("userId");
		Member member = memberDao.info(id);
		model.addAttribute("member", member);
		return "member/drop";
	}

	// 회원탈퇴(POST)
	@RequestMapping(value = "/drop", method = RequestMethod.POST)
	public String drop(HttpSession session, Member m, RedirectAttributes redirect) {
		String id = (String) session.getAttribute("userId");
		boolean result = memberDao.drop(id, m);
		if (result) {
			session.invalidate(); // 회원 정보가 맞을 경우
		}
		redirect.addFlashAttribute("result", result); // 회원 정보를 잘못 입력했을 경우
		return "redirect:goodbye";
	}

	// 회원탈퇴 후 이동할 페이지
	@RequestMapping("/goodbye")
	public String goodbye() {
		return "member/goodbye";
	}

	// 친구 찾기(전체 리스트)
	@RequestMapping({ "/find", "/find/" })
	public String find(Model model, HttpSession session) {
		String id = (String) session.getAttribute("userId");
		id = id == null ? " " : id;
		List<Member> list = memberDao.memberList(id);
		Collections.shuffle(list);
		model.addAttribute("list", list);
		return "member/find";
	}

	// 친구 찾기(검색)
	@RequestMapping("/find/{key}")
	public String search(@PathVariable String key, Model model, HttpSession session) {
		String id = (String) session.getAttribute("userId");
		id = id == null ? " " : id;
		List<Member> list = memberDao.search(key, id);
		model.addAttribute("key", key);
		model.addAttribute("list", list);
		return "member/find";
	}

	@RequestMapping("/friendrequest/{request}")
	public String freind(@PathVariable String request, RedirectAttributes redirect, HttpSession session) {
		String rqId = (String) session.getAttribute("userId");
		String rcId = request;
		friendDao.request(rqId, rcId);
		return "redirect:/member/find";
	}

	@RequestMapping("/friendcancel/{request}")
	public String friend(@PathVariable String request, RedirectAttributes redirect, HttpSession session) {
		String rqId = (String) session.getAttribute("userId");
		String rcId = request;
		friendDao.cancel(rqId, rcId);
		return "redirect:/member/find";
	}
	
	@RequestMapping("/upload")
	public String upload() {
		return "member/upload";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(MultipartHttpServletRequest mRequest, RedirectAttributes redirect, Model model, HttpSession session) throws IllegalStateException, IOException {
		String id = (String)session.getAttribute("userId");
		MultipartFile mf = mRequest.getFile("file");
		String ip = mRequest.getRemoteAddr();
		long time = System.currentTimeMillis();
		UUID uuid = UUID.randomUUID();
		String savename = ip+"_"+time+"_"+uuid.toString();
		
		boolean result = imageBoardDao.insert(id, savename);
		String path = servletContext.getRealPath("/upload");
		File target = new File(path, savename);
		mf.transferTo(target);
		redirect.addFlashAttribute("result", result);
		return "redirect:upload";
	}
}
