package com.jih.springPortfolio.board.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jih.springPortfolio._common.Search;
import com.jih.springPortfolio._common.Util;
import com.jih.springPortfolio.board.model.dao.BoardChkDAO;
import com.jih.springPortfolio.board.model.dto.BoardChkDTO;


@Controller
@RequestMapping("/boardChk")
public class boardChkController {
	
	@Inject
	BoardChkDAO boardChkDao;
	
	String folderName= "boardChk";
	
	Util util = new Util();
	Search search = new Search();	
	
	// ------------------------------------------------------------------------------------
	@RequestMapping("/list")
	public String list(
			Model model,
			@ModelAttribute BoardChkDTO arguDto,
			HttpServletRequest request
			) {
		
		String title = "게시판관리";
		
		List<BoardChkDTO> list = boardChkDao.getSelectAll(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("list", list);
		
		model.addAttribute("folderName", folderName);
		model.addAttribute("fileName", "list");
		return "main/main";
	}
	
	// ------------------------------------------------------------------------------------
	@RequestMapping("/chuga")
	public String chuga(
		Model model
		) {
	
		String title = "게시판 추가";
		model.addAttribute("title", title);
		
		model.addAttribute("folderName", folderName);
		model.addAttribute("fileName", "chuga");
		return "main/main";
	}
	
	// ------------------------------------------------------------------------------------
	@RequestMapping("/chugaProc")
	public String chugaProc(
		Model model,
		@ModelAttribute BoardChkDTO arguDto,
		HttpServletRequest request
		) {

		int result = boardChkDao.setInsert(arguDto);
		
		if(result > 0) {
			return "redirect:/" + folderName + "/list";
		} else {
			return "redirect:/" + folderName + "/chuga";
		}
	}
	
	// ------------------------------------------------------------------------------------
	@RequestMapping("/sujung")
	public String sujung(
		Model model,
		@ModelAttribute BoardChkDTO arguDto
		) {
	
		String title = "게시판 수정";

		BoardChkDTO returnDto = boardChkDao.getSelectOne(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		
		model.addAttribute("folderName", folderName);
		model.addAttribute("fileName", "sujung");
		return "main/main";
	}
	
	// ------------------------------------------------------------------------------------
	@RequestMapping("/sujungProc")
	public String sujungProc(
		Model model,
		@ModelAttribute BoardChkDTO arguDto
		) {
		
		System.out.println("arguDto.getBoardChkNo()" + arguDto.getBoardChkNo());
		int result = boardChkDao.setUpdate(arguDto);
		
		if(result > 0) {
			return "redirect:/" + folderName + "/list";
		} else {
			return "redirect:/" + folderName + "/sujung?boardChkNo=" + arguDto.getBoardChkNo();
		}
	}
	
	// ------------------------------------------------------------------------------------
	@RequestMapping("/sakje")
	public String sakje(
		Model model,
		@ModelAttribute BoardChkDTO arguDto
		) {
	
		String title = "게시판 삭제";
		BoardChkDTO returnDto = boardChkDao.getSelectOne(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
	
		model.addAttribute("folderName", folderName);
		model.addAttribute("fileName", "sakje");
		return "main/main";
	}
	
	// ------------------------------------------------------------------------------------
	@RequestMapping("/sakjeProc")
	public String sakjeProc(
		Model model,
		@ModelAttribute BoardChkDTO arguDto
		) {
	
		int result = boardChkDao.setDelete(arguDto);
		
		if(result > 0) {
			return "redirect:/" + folderName + "/list";
		} else {
			return "redirect:/" + folderName + "/sakje?boardChkNo=" + arguDto.getBoardChkNo();
		}
	}
}
