package com.jih.springStudy.memo.controller;

import java.io.Reader;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jih.springStudy.memo.model.dao.MemoDAO;
import com.jih.springStudy.memo.model.dto.MemoDTO;
import com.jih.springStudy.memo.service.MemoService;

@Controller
@RequestMapping("/memo")
public class MemoController {
	
	@Inject
	MemoDAO memoDao;
	@Inject
	MemoService memoService;
	
	String returnValue = "memo";
	
	int imsiProcGubun = 0; //imsiProcGubun = 0 : dao, imsiProcGubun = 1 : service
	
	// list ------------------------------------------------------------------------------------
	@RequestMapping("/list")
	public String list(
			Model model
			) {
		
		String title = "메모목록";
		List<MemoDTO> list;
		
		if(imsiProcGubun == 0) { //dao
			list = memoDao.getSelectAll();
		} else { //service
			list = memoService.getSelectAll();
		}
		
		model.addAttribute("title", title);
		model.addAttribute("list", list);
		return returnValue + "/list";
	}
	// view ------------------------------------------------------------------------------------
	@RequestMapping("/view")
	public String view(
			Model model,
			@ModelAttribute MemoDTO arguDto
			) {
		
		String title = "메모상세보기";
		
		MemoDTO returnDto;
		if(imsiProcGubun == 0) { //dao
			returnDto = memoDao.getSelectOne(arguDto);
		} else { //service
			returnDto = memoService.getSelectOne(arguDto);
		}
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		return returnValue + "/view";
	}
	// chuga ------------------------------------------------------------------------------------
	@RequestMapping("/chuga")
	public String chuga(
			Model model
			) {
		
		String title = "메모추가";
		model.addAttribute("title", title);
		
		return returnValue + "/chuga";
	}
	// chugaProc ------------------------------------------------------------------------------------
	@RequestMapping("/chugaProc")
	public String chugaProc(
			Model model,
			@ModelAttribute MemoDTO arguDto
			) {
		
		int result;
		if(imsiProcGubun == 0) { //dao
			result = memoDao.setInsert(arguDto);
		} else { //service
			result = memoService.setInsert(arguDto);
		}
		
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
			@ModelAttribute MemoDTO arguDto
			) {
		
		String title = "메모수정";
		
		MemoDTO returnDto;
		if(imsiProcGubun == 0) { //dao
			returnDto = memoDao.getSelectOne(arguDto);
		} else { //service
			returnDto = memoService.getSelectOne(arguDto);
		}
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		
		return returnValue + "/sujung";
	}
	// sujungProc ------------------------------------------------------------------------------------
	@RequestMapping("/sujungProc")
	public String sujungProc(
			Model model,
			@ModelAttribute MemoDTO arguDto
			) {
		
		int result;
		if(imsiProcGubun == 0) { //dao
			result = memoDao.setUpdate(arguDto);
		} else { //service
			result = memoService.setUpdate(arguDto);
		}
		
		if(result > 0) {
			return "redirect:/" + returnValue + "/view?no=" + arguDto.getNo();
		} else {
			return "redirect:/" + returnValue + "/sujung?no=" + arguDto.getNo();
		}
	}
	// sakje ------------------------------------------------------------------------------------
	@RequestMapping("/sakje")
	public String sakje(
			Model model,
			@ModelAttribute MemoDTO arguDto
			) {
		
		String title = "메모삭제";
		
		MemoDTO returnDto;
		if(imsiProcGubun == 0) { //dao
			returnDto = memoDao.getSelectOne(arguDto);
		} else { //service
			returnDto = memoService.getSelectOne(arguDto);
		}
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		
		return returnValue + "/sakje";
	}
	// sakjeProc ------------------------------------------------------------------------------------
	@RequestMapping("/sakjeProc")
	public String sakjeProc(
			Model model,
			@ModelAttribute MemoDTO arguDto
			) {
		
		int result;
		if(imsiProcGubun == 0) { //dao
			result = memoDao.setDelete(arguDto);
		} else { //service
			result = memoService.setDelete(arguDto);
		}
		
		if(result > 0) {
			return "redirect:/" + returnValue + "/list";
		} else {
			return "redirect:/" + returnValue + "/sakje?no=" + arguDto.getNo();
		}
	}
	
}
