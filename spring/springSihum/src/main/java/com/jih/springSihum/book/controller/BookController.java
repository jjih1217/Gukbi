package com.jih.springSihum.book.controller;

import java.io.Reader;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jih.springSihum.book.model.dao.BookDAO;
import com.jih.springSihum.book.model.dto.BookDTO;



@Controller
@RequestMapping("/book")
public class BookController {
	
	@Inject
	BookDAO bookDao;
	
	String returnValue = "book";
	
	// list ------------------------------------------------------------------------------------
	@RequestMapping("/list")
	public String list(
			Model model
			) {
		
		String title = "도서목록";
		List<BookDTO> list =  bookDao.getSelectAll();
		
		model.addAttribute("title", title);
		model.addAttribute("list", list);
		return returnValue + "/list";
	}
	// view ------------------------------------------------------------------------------------
	@RequestMapping("/view")
	public String view(
			Model model,
			@ModelAttribute BookDTO arguDto
			) {
		
		String title = "도서상세보기";
		
		BookDTO returnDto = bookDao.getSelectOne(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		return returnValue + "/view";
	}
	// chuga ------------------------------------------------------------------------------------
	@RequestMapping("/chuga")
	public String chuga(
			Model model
			) {
		
		String title = "도서추가";
		model.addAttribute("title", title);
		
		return returnValue + "/chuga";
	}
	// chugaProc ------------------------------------------------------------------------------------
	@RequestMapping("/chugaProc")
	public String chugaProc(
			Model model,
			@ModelAttribute BookDTO arguDto
			) {
		
		int result = bookDao.setInsert(arguDto);
		
		if(result > 0) {
			return "redirect:/" + returnValue + "/list";
		} else {
			return "redirect:/" + returnValue + "/chuga";
		}
	}
	// sujung ------------------------------------------------------------------------------------
	@RequestMapping("/sujung")
	public String sujung(
			Model model,
			@ModelAttribute BookDTO arguDto
			) {
		
		String title = "도서수정";
		
		BookDTO returnDto = bookDao.getSelectOne(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		
		return returnValue + "/sujung";
	}
	// sujungProc ------------------------------------------------------------------------------------
	@RequestMapping("/sujungProc")
	public String sujungProc(
			Model model,
			@ModelAttribute BookDTO arguDto
			) {
		
		int result = bookDao.setUpdate(arguDto);
		
		if(result > 0) {
			return "redirect:/" + returnValue + "/view?bookCode=" + arguDto.getBookCode();
		} else {
			return "redirect:/" + returnValue + "/sujung?bookCode=" + arguDto.getBookCode();
		}
	}
	// sakje ------------------------------------------------------------------------------------
	@RequestMapping("/sakje")
	public String sakje(
			Model model,
			@ModelAttribute BookDTO arguDto
			) {
		
		String title = "도서삭제";
		
		BookDTO returnDto = bookDao.getSelectOne(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		
		return returnValue + "/sakje";
	}
	// sakjeProc ------------------------------------------------------------------------------------
	@RequestMapping("/sakjeProc")
	public String sakjeProc(
			Model model,
			@ModelAttribute BookDTO arguDto
			) {
		
		int result = bookDao.setDelete(arguDto);
		
		if(result > 0) {
			return "redirect:/" + returnValue + "/list";
		} else {
			return "redirect:/" + returnValue + "/sakje?bookCode=" + arguDto.getBookCode();
		}
	}
	
}
