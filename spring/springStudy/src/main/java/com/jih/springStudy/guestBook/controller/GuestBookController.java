package com.jih.springStudy.guestBook.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jih.springStudy.guestBook.model.dao.GuestBookDAO;
import com.jih.springStudy.guestBook.model.dto.GuestBookDTO;


@Controller
@RequestMapping("/guestBook")
public class GuestBookController {
	
	@Inject
	GuestBookDAO guestBookDao;
	
	String returnValue = "guestBook";
	
	@RequestMapping("/list")
	public String list(
			Model model
			) {
		
		String title = "방명록 목록";
		List<GuestBookDTO> list = guestBookDao.getSelectAll();
		
		model.addAttribute("title", title);
		model.addAttribute("list", list);
		
		return returnValue + "/list";
	}
	
	@RequestMapping("/view")
	public String view(
		Model model,
		@ModelAttribute GuestBookDTO arguDto
		) {
	
	String title = "방명록 상세보기";
	GuestBookDTO returnDto = guestBookDao.getSelectOne(arguDto);
	
	model.addAttribute("title", title);
	model.addAttribute("dto", returnDto);
	
	return returnValue + "/view";
	}
	
	@RequestMapping("/chuga")
	public String chuga(
		Model model
		) {
	
		String title = "방명록 추가";
		model.addAttribute("title", title);
		
		return returnValue + "/chuga";
	}
	
	@RequestMapping("/chugaProc")
	public String chugaProc(
		Model model,
		@ModelAttribute GuestBookDTO arguDto
		) {
		
		int result = guestBookDao.setInsert(arguDto);
		
		if(result > 0) {
			return "redirect:/" + returnValue + "/list";
		} else {
			return "redirect:/" + returnValue + "/chuga";
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
	
	return returnValue + "/sujung";
	}
	
	@RequestMapping("/sujungProc")
	public String sujungProc(
		Model model,
		@ModelAttribute GuestBookDTO arguDto
		) {
	
		int result = guestBookDao.setUpdate(arguDto);
		
		if(result > 0) {
			return "redirect:/" + returnValue + "/list";
		} else {
			return "redirect:/" + returnValue + "/sujung?no=" + arguDto.getNo();
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
	
	return returnValue + "/sakje";
	}
	
	@RequestMapping("/sakjeProc")
	public String sakjeProc(
		Model model,
		@ModelAttribute GuestBookDTO arguDto
		) {
	
		int result = guestBookDao.setDelete(arguDto);
		
		if(result > 0) {
			return "redirect:/" + returnValue + "/list";
		} else {
			return "redirect:/" + returnValue + "/sakje?no=" + arguDto.getNo();
		}
	}
}
