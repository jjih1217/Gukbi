package com.jih.springPortfolio.guestBook.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jih.springPortfolio.guestBook.model.dao.GuestBookDAO;
import com.jih.springPortfolio.guestBook.model.dto.GuestBookDTO;


@Controller
@RequestMapping("/guestBook")
public class GuestBookController {
	
	@Inject
	GuestBookDAO guestBookDao;
	
	String folderName= "guestBook";
	
	@RequestMapping("/list")
	public String list(
			Model model
			) {
		
		String title = "방명록 목록";
		List<GuestBookDTO> list = guestBookDao.getSelectAll();
		
		model.addAttribute("title", title);
		model.addAttribute("list", list);
		
		model.addAttribute("folderName", folderName);
		model.addAttribute("fileName", "list");
		return "main/main";
	}
	
	@RequestMapping("/view")
	public String view(
		Model model,
		@ModelAttribute GuestBookDTO arguDto
		) {
	
	String title = "방명록 상세보기";
	GuestBookDTO returnDto = guestBookDao.getSelectOne(arguDto);
	
	model.addAttribute("folderName", folderName);
	model.addAttribute("fileName", "view");
	return "main/main";
	}
	
	@RequestMapping("/chuga")
	public String chuga(
		Model model
		) {
	
		String title = "방명록 추가";
		model.addAttribute("title", title);
		
		model.addAttribute("folderName", folderName);
		model.addAttribute("fileName", "chuga");
		return "main/main";
	}
	
	@RequestMapping("/chugaProc")
	public String chugaProc(
		Model model,
		@ModelAttribute GuestBookDTO arguDto,
		HttpServletRequest request
		) {
		
		String email = arguDto.getEmail1() + arguDto.getEmail2();
		String memberNo_ = request.getParameter("memberNo");
		int memberNo = Integer.parseInt(memberNo_);
		
		arguDto.setMemberNo(memberNo);
		arguDto.setEmail(email);
		
		
		int result = guestBookDao.setInsert(arguDto);
		
		if(result > 0) {
			return "redirect:/" + folderName + "/list";
		} else {
			return "redirect:/" + folderName + "/chuga";
		}
	}
	
	@RequestMapping("/sujung")
	public String sujung(
		Model model,
		@ModelAttribute GuestBookDTO arguDto
		) {
	
		String title = "방명록 수정";
		GuestBookDTO returnDto = guestBookDao.getSelectOne(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		
		model.addAttribute("folderName", folderName);
		model.addAttribute("fileName", "sujung");
		return "main/main";
	}
	
	@RequestMapping("/sujungProc")
	public String sujungProc(
		Model model,
		@ModelAttribute GuestBookDTO arguDto
		) {
		
		String email = arguDto.getEmail1() + arguDto.getEmail2();
		arguDto.setEmail(email);
	
		int result = guestBookDao.setUpdate(arguDto);
		
		if(result > 0) {
			return "redirect:/" + folderName + "/list";
		} else {
			return "redirect:/" + folderName + "/sujung?no=" + arguDto.getNo();
		}
	}
	
	@RequestMapping("/sakje")
	public String sakje(
		Model model,
		@ModelAttribute GuestBookDTO arguDto
		) {
	
		String title = "방명록 삭제";
		GuestBookDTO returnDto = guestBookDao.getSelectOne(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
	
		model.addAttribute("folderName", folderName);
		model.addAttribute("fileName", "sujung");
		return "main/main";
	}
	
	@RequestMapping("/sakjeProc")
	public String sakjeProc(
		Model model,
		@ModelAttribute GuestBookDTO arguDto
		) {
	
		int result = guestBookDao.setDelete(arguDto);
		
		if(result > 0) {
			return "redirect:/" + folderName + "/list";
		} else {
			return "redirect:/" + folderName + "/sakje?no=" + arguDto.getNo();
		}
	}
}
