package com.jih.springPortfolio.board.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
			HttpServletRequest request,
			@ModelAttribute BoardDTO arguDto
			) throws UnsupportedEncodingException {
		
		String title = "게시판 목록";
		
		/*
		String searchGubun =  request.getParameter("searchGubun");
		String searchData =  request.getParameter("searchData");
		request.setAttribute("searchGubun", searchGubun);
		request.setAttribute("searchData", searchData);
		*/
		
		String pageNumber_ = request.getParameter("pageNumber");
		int pageNumber = util.getNumberCheck(pageNumber_, 1);
		request.setAttribute("pageNumber", pageNumber);
		
		int pageSize = 10;
		int blockSize = 10;
		
		int totalRecord = boardDao.getTotalRecord(arguDto);
		model.addAttribute("totalRecord", totalRecord);
		
		String searchQuery = search.getSerchInfo(pageNumber, arguDto.getSearchGubun(), arguDto.getSearchData());
		request.setAttribute("searchQuery", searchQuery);
		
		Map<String, Integer> map = util.getPagerMap(pageNumber, pageSize, blockSize, totalRecord);
		map.put("blockSize", blockSize);
		
		//request.setAttribute("map", map);
		
		arguDto.setStartRecord(map.get("startRecord"));
		arguDto.setLastRecord(map.get("lastRecord"));
		
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
			HttpServletRequest request,
			@ModelAttribute BoardDTO arguDto
		) {
		BoardDTO returnDto = boardDao.getSelectOne(arguDto);
		
		String title = "게시판 상세보기";
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		
		model.addAttribute("folderName", folderName);
		model.addAttribute("fileName", "view");
		return "main/main";
	}
	
	// chuga ------------------------------------------------------------------------------------
	@RequestMapping("/chuga")
	public String chuga(
		Model model,
		HttpServletRequest request,
		@ModelAttribute BoardDTO arguDto
		) {

		String title = "게시판 추가";
		BoardDTO returnDto = boardDao.getSelectOne(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		
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
		
		
		String noticeGubun = request.getParameter("noticeGubun");
		String secretGubun = request.getParameter("secretGubun");
		
		String email = arguDto.getEmail1() + arguDto.getEmail2();
		arguDto.setEmail(email);
		
		int num = boardDao.getMaxNumRefNoNoticeNo("num") + 1;
		arguDto.setNum(num);
		
		String tbl = "-";
		arguDto.setTbl(tbl);
		
		String ip = "-";
		arguDto.setIp(ip);
		
		//새글
		int refNo = boardDao.getMaxNumRefNoNoticeNo("refNo") + 1;
		int stepNo = 1;
		int levelNo = 1;
		int parentNo = 0;
		
		if(arguDto.getNo() > 0) { //답변글
			BoardDTO returnDto = boardDao.getSelectOne(arguDto);
			
			boardDao.setUpdateRelevel(returnDto); //DB에서 읽어온 값을 매개변수로
			//부모글의 levelNo보다 큰 levelNo들은 1씩 증가
			refNo = returnDto.getRefNo(); //부모글의 refNo
			stepNo = returnDto.getStepNo() + 1; //부모글의 stepNo + 1
			levelNo = returnDto.getLevelNo() + 1; //부모글의 levelNo + 1
			parentNo = returnDto.getNo();
		}
		
		arguDto.setRefNo(refNo);
		arguDto.setStepNo(stepNo);
		arguDto.setLevelNo(levelNo);
		arguDto.setParentNo(parentNo);
		
		int hit = 0;
		arguDto.setHit(hit);
		
		//로그인
		String[] sessionArray = util.getSessionCheck(request);
		int sessionNo = Integer.parseInt(sessionArray[0]);
		String sessionId = sessionArray[1];
		String sessionName = sessionArray[2];
		
		int memberNo = sessionNo;
		arguDto.setMemberNo(memberNo);
		
		int noticeNo = 0;
		if(noticeGubun.equals("T")) { //공지글이면
			noticeNo = boardDao.getMaxNumRefNoNoticeNo("noticeNo") + 1;	
		}
		arguDto.setNoticeNo(noticeNo);
		
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
			return "redirect:/board/list";
		} else {
			return "redirect:/board/chuga";
		}
	}
		
	// sujung ------------------------------------------------------------------------------------
	@RequestMapping("/sujung")
	public String sujung(
		Model model,
		@ModelAttribute BoardDTO arguDto
		) {
	
		String title = "게시판 수정";
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
	
		String title = "게시판 삭제";
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