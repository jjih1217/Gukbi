package com.jih.springPortfolio.board.controller;

import java.io.UnsupportedEncodingException;
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
import com.jih.springPortfolio.board.model.dao.BoardDAO;
import com.jih.springPortfolio.board.model.dto.BoardDTO;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Inject
	BoardDAO boardDao;
	
	String folderName= "board";
	
	Util util = new Util();
	Search search = new Search();	
	
	
	
	// list ------------------------------------------------------------------------------------
	@RequestMapping("/list")
	public String list(
			Model model,
			@ModelAttribute BoardDTO arguDto,
			HttpServletRequest request
			) throws UnsupportedEncodingException {
		
		String title = "방명록 목록";
		
		String pageNumber_ = request.getParameter("pageNumber");
		int pageNumber = util.getNumberCheck(pageNumber_, 1);
		request.setAttribute("pageNumber", pageNumber);
		
		int pageSize = 3;
		int blockSize = 10;
		
		int totalRecord = boardDao.getTotalRecord(arguDto);
		model.addAttribute("totalRecord", totalRecord);
		
		
		Map<String, Integer> map = util.getPagerMap(pageNumber, pageSize, blockSize, totalRecord);
		map.put("blockSize", blockSize);
		
		request.setAttribute("map", map);
		
		/*
		 * arguDto.setStartRecord(map.get("startRecord"));
		 * arguDto.setLastRecord(map.get("lastRecord"));
		 */
		
		model.addAttribute("map", map);
		List<BoardDTO> list = boardDao.getSelectAll(arguDto);
		
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
		@ModelAttribute BoardDTO arguDto
		) {
	
	String title = "방명록 상세보기";
	BoardDTO returnDto = boardDao.getSelectOne(arguDto);
	
	model.addAttribute("folderName", folderName);
	model.addAttribute("fileName", "view");
	return "main/main";
	}
	
	// chuga ------------------------------------------------------------------------------------
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
	
	// chugaAttachProc ------------------------------------------------------------------------------------
	@RequestMapping("/chugaAttachProc")
	public String chugaAttach(
			Model model,
			HttpServletRequest request,
			HttpSession session,
			@ModelAttribute BoardDTO arguDto,
			@RequestParam("file") List<MultipartFile> multiFileList
		) {
		
		String tbl = "-";
		String noticeGubun = request.getParameter("noticeGubun");
		String secretGubun = request.getParameter("secretGubun");
		
		String email = arguDto.getEmail1() + arguDto.getEmail2();
		arguDto.setEmail(email);
				
		int num = boardDao.getMaxNumRefNo("num") + 1;
		arguDto.setNum(num);
		
		//새글
		int refNo = boardDao.getMaxNumRefNo("refNo") + 1;
		int stepNo = 1;
		int levelNo = 1;
		int parentNo = 0;
		
		if(arguDto.getNo() > 0) { //답변글
			
			BoardDTO returnDto = boardDao.getSelectOne(arguDto);
			
			boardDao.setUpdateRelevel(returnDto);
			//부모글의 levelNo보다 큰 levelNo들은 1씩 증가
			refNo = returnDto.getRefNo(); //부모글의 refNo
			stepNo = returnDto.getStepNo() + 1; //부모글의 stepNo + 1
			levelNo = returnDto.getLevelNo() + 1; //부모글의 levelNo + 1
			parentNo = returnDto.getNo();
		}
		
		int hit = 0;
		
		//로그인
		String[] sessionArray = util.getSessionCheck(request);
		int sessionNo = Integer.parseInt(sessionArray[0]);
		String sessionId = sessionArray[1];
		String sessionName = sessionArray[2];
		
		int memberNo = sessionNo;
		
		int noticeNo = 0;
		if(noticeGubun.equals("T")) { //공지글이면
			noticeNo = boardDao.getMaxNumRefNo("noticeNo") + 1;	
		}
		
		MultipartUpload mu = new MultipartUpload();
		List<String> list = mu.attachProc(multiFileList, "/springPortfolio/board");
		
		String attachInfo = "";
		for(int i=0; i<list.size(); i++) {
			attachInfo += "|" + list.get(i);
		}
		attachInfo = attachInfo.substring(1);
		arguDto.setAttachInfo(attachInfo);
		
		int result = boardDao.setInsert(arguDto);
		
		if(result > 0) {
			return "redirect:/member/list";
		} else {
			return "redirect:/member/chugaAttach";
		}
	}
		
	// sujung ------------------------------------------------------------------------------------
	@RequestMapping("/sujung")
	public String sujung(
		Model model,
		@ModelAttribute BoardDTO arguDto
		) {
	
		String title = "방명록 수정";
		BoardDTO returnDto = boardDao.getSelectOne(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		
		model.addAttribute("folderName", folderName);
		model.addAttribute("fileName", "sujung");
		return "main/main";
	}
	
	// sujungProc ------------------------------------------------------------------------------------
	@RequestMapping("/sujungProc")
	public String sujungProc(
		Model model,
		@ModelAttribute BoardDTO arguDto
		) {
		
		String email = arguDto.getEmail1() + arguDto.getEmail2();
		arguDto.setEmail(email);
	
		int result = boardDao.setUpdate(arguDto);
		
		if(result > 0) {
			return "redirect:/" + folderName + "/list";
		} else {
			return "redirect:/" + folderName + "/sujung?no=" + arguDto.getNo();
		}
	}
	
	// sakje ------------------------------------------------------------------------------------
	@RequestMapping("/sakje")
	public String sakje(
		Model model,
		@ModelAttribute BoardDTO arguDto
		) {
	
		String title = "방명록 삭제";
		BoardDTO returnDto = boardDao.getSelectOne(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
	
		model.addAttribute("folderName", folderName);
		model.addAttribute("fileName", "sujung");
		return "main/main";
	}
	
	// sakjeProc ------------------------------------------------------------------------------------
	@RequestMapping("/sakjeProc")
	public String sakjeProc(
		Model model,
		@ModelAttribute BoardDTO arguDto
		) {
	
		int result = boardDao.setDelete(arguDto);
		
		if(result > 0) {
			return "redirect:/" + folderName + "/list";
		} else {
			return "redirect:/" + folderName + "/sakje?no=" + arguDto.getNo();
		}
	}
}
