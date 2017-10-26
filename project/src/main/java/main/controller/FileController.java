package main.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import main.model.image.ImageBoardDao;

@Controller
public class FileController {
	
	@Autowired
	private ImageBoardDao imageBoardDao;
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("/upload")
	public String upload() {
		return "upload";
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
