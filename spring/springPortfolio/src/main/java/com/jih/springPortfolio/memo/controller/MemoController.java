package com.jih.springPortfolio.memo.controller;

import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.util.List;
import java.util.Map;

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
import com.jih.springPortfolio._common.Search;
import com.jih.springPortfolio._common.Util;
import com.jih.springPortfolio.memo.model.dao.MemoDAO;
import com.jih.springPortfolio.memo.model.dto.MemoDTO;

@Controller
@RequestMapping("/memo")
public class MemoController {
	
	@Inject
	MemoDAO memoDao;
	
	String folderName= "memo";
	
	Util util = new Util();
	Search search = new Search();		
	
	// list ------------------------------------------------------------------------------------
	@RequestMapping("/list")
	public String list(
			Model model,
			HttpServletRequest request,
			@ModelAttribute MemoDTO arguDto
		) throws UnsupportedEncodingException {
		
		String title = "메모목록";
		
		String searchGubun =  request.getParameter("searchGubun");
		String searchData =  request.getParameter("searchData");
		request.setAttribute("searchGubun", searchGubun);
		request.setAttribute("searchData", searchData);
		
		String pageNumber_ = request.getParameter("pageNumber");
		int pageNumber = util.getNumberCheck(pageNumber_, 1);
		request.setAttribute("pageNumber", pageNumber);
		
		int pageSize = 10;
		int blockSize = 10;
		
		int totalRecord = memoDao.getTotalRecord(arguDto);
		model.addAttribute("totalRecord", totalRecord);
		
		String searchQuery = search.getSerchInfo(pageNumber, searchGubun, searchData);
		request.setAttribute("searchQuery", searchQuery);
		
		Map<String, Integer> map = util.getPagerMap(pageNumber, pageSize, blockSize, totalRecord);
		map.put("blockSize", blockSize);
		
		request.setAttribute("map", map);
		
		arguDto.setStartRecord(map.get("startRecord"));
		arguDto.setLastRecord(map.get("lastRecord"));
		
		model.addAttribute("map", map);

		List<MemoDTO> list = memoDao.getSelectAll(arguDto);
	
		
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
				@ModelAttribute MemoDTO arguDto
			) {
			MemoDTO returnDto = memoDao.getSelectOne(arguDto);
			
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
				@ModelAttribute MemoDTO arguDto
			) {
			
			
			int result = memoDao.setInsert(arguDto);
			
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
				@ModelAttribute MemoDTO arguDto
			) {
			
			MemoDTO returnDto = memoDao.getSelectOne(arguDto);
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
				@ModelAttribute MemoDTO arguDto,
				@RequestParam("file") List<MultipartFile> multiFileList
			) {
			
			int result = memoDao.setUpdate(arguDto);
			
			if(result > 0) {
				return "redirect:/memo/view?no=" + arguDto.getNo();
			} else {
				return "redirect:/memo/sujung?no=" + arguDto.getNo();
			}
			
		}
		// sakje ------------------------------------------------------------------------------------
		@RequestMapping("/sakje")
		public String sakje(
				Model model,
				@ModelAttribute MemoDTO arguDto
			) {
			
			MemoDTO returnDto = memoDao.getSelectOne(arguDto);
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
				@ModelAttribute MemoDTO arguDto
			) {
			
			int result = memoDao.setDelete(arguDto);
			
			if(result > 0) {
				return "redirect:/memo/list";
			} else {
				return "redirect:/memo/sakje?no=" + arguDto.getNo();
			}
			
		}
		
		// logout ------------------------------------------------------------------------------------
				@RequestMapping("/search")
				public String search(
						Model model,
						HttpServletRequest request,
						@ModelAttribute MemoDTO arguDto
					) throws UnsupportedEncodingException {
					
					String searchGubun =  request.getParameter("searchGubun");
					String searchData =  request.getParameter("searchData");
					request.setAttribute("searchGubun", searchGubun);
					request.setAttribute("searchData", searchData);
					
					String pageNumber_ = request.getParameter("pageNumber");
					int pageNumber = util.getNumberCheck(pageNumber_, 1);
					request.setAttribute("pageNumber", pageNumber);
					
					String searchQuery = search.getSerchInfo(pageNumber, searchGubun, searchData);
					request.setAttribute("searchQuery", searchQuery);
					
					return "redirect:/memo/list?" + searchQuery;
					
				}
		
		

}
