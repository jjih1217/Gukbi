package com.jih.springPortfolio.memo.controller;

import java.net.UnknownHostException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jih.springPortfolio._common.MultipartUpload;
import com.jih.springPortfolio._common.Util;
import com.jih.springPortfolio.memo.model.dao.MemoDAO;
import com.jih.springPortfolio.memo.model.dto.MemoDTO;

@Controller
@RequestMapping("/memo")
public class MemoController {
	
	@Inject
	MemoDAO memoDao;
	
	String folderName= "memo";
	// list ------------------------------------------------------------------------------------
	@RequestMapping("/list")
	public String list(
			Model model
		) {
		
		List<MemoDTO> list = memoDao.getSelectAll();
		String title = "메모목록";
		
		model.addAttribute("title", title);
		model.addAttribute("list", list);
		
		model.addAttribute("folderName", folderName);
		model.addAttribute("fileName", "list");
		return "main/main";
	}
	// view ------------------------------------------------------------------------------------
		@RequestMapping("/view")
		public String view(
				Model model,
				@ModelAttribute MemoDTO dto
			) {
			MemoDTO returnDto = memoDao.getSelectOne(dto);
			
			String title = "메모상세보기";
			
			model.addAttribute("title", title);
			model.addAttribute("dto", returnDto);
			
			model.addAttribute("folderName", folderName);
			model.addAttribute("fileName", "view");
			return "main/main";
		}
		// chuga ------------------------------------------------------------------------------------
		@RequestMapping("/chuga")
		public String chuga(
				Model model
			) {
			String title = "메모등록";
			
			model.addAttribute("title",title);
			
			model.addAttribute("folderName", folderName);
			model.addAttribute("fileName", "chuga");
			return "main/main";
		}
		
		
		// chugaAttachProc ------------------------------------------------------------------------------------
		@RequestMapping("/chugaProc")
		public String chugaAttach(
				Model model,
				HttpServletRequest request,
				@ModelAttribute MemoDTO dto
			) {
			
			
			int result = memoDao.setInsert(dto);
			
			if(result > 0) {
				return "redirect:/memo/list";
			} else {
				return "redirect:/memo/chugaAttach";
			}
		}
			
		// sujung ------------------------------------------------------------------------------------
		@RequestMapping("/sujung")
		public String sujung(
				Model model,
				@ModelAttribute MemoDTO dto
			) {
			
			MemoDTO returnDto = memoDao.getSelectOne(dto);
			String title = "메모수정";
			
			model.addAttribute("title",title);
			
			model.addAttribute("folderName", folderName);
			model.addAttribute("fileName", "sujung");
			model.addAttribute("dto",returnDto);
			
			return "main/main";
		}
		
		// sujungProc ------------------------------------------------------------------------------------
		@RequestMapping("/sujungProc")
		public String sujungProc(
				Model model,
				HttpServletRequest request,
				@ModelAttribute MemoDTO dto,
				@RequestParam("file") List<MultipartFile> multiFileList
			) {
			
			int result = memoDao.setUpdate(dto);
			
			if(result > 0) {
				return "redirect:/memo/view?no=" + dto.getNo();
			} else {
				return "redirect:/memo/sujung?no=" + dto.getNo();
			}
			
		}
		// sakje ------------------------------------------------------------------------------------
		@RequestMapping("/sakje")
		public String sakje(
				Model model,
				@ModelAttribute MemoDTO dto
			) {
			
			MemoDTO returnDto = memoDao.getSelectOne(dto);
			String title = "메모삭제";
			
			model.addAttribute("title",title);
			model.addAttribute("dto",returnDto);
			
			model.addAttribute("folderName", folderName);
			model.addAttribute("fileName", "sakje");
			
			return "main/main";
		}
		
		// sakjeProc ------------------------------------------------------------------------------------
		@RequestMapping("/sakjeProc")
		public String sakjeProc(
				Model model,
				@ModelAttribute MemoDTO dto
			) {
			
			int result = memoDao.setDelete(dto);
			
			if(result > 0) {
				return "redirect:/memo/list";
			} else {
				return "redirect:/memo/sakje?no=" + dto.getNo();
			}
			
		}
		
		

}
