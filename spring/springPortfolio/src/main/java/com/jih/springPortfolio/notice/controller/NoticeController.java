package com.jih.springPortfolio.notice.controller;

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
import com.jih.springPortfolio.notice.model.dao.NoticeDAO;
import com.jih.springPortfolio.notice.model.dto.NoticeDTO;


@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Inject
	NoticeDAO noticeDao;
	
	String folderName= "notice";
	
	Util util = new Util();
	Search search = new Search();	
	
	
	// list ------------------------------------------------------------------------------------
	@RequestMapping("/list")
	public String list(
			Model model,
			HttpServletRequest request,
			@ModelAttribute NoticeDTO arguDto
			) throws UnsupportedEncodingException {
		
		String title = "공지사항";
		
		String pageNumber_ = request.getParameter("pageNumber");
		int pageNumber = util.getNumberCheck(pageNumber_, 1);
		request.setAttribute("pageNumber", pageNumber);
		
		int pageSize = 10;
		int blockSize = 10;
		
		int totalRecord = noticeDao.getTotalRecord(arguDto);
		model.addAttribute("totalRecord", totalRecord);
		
		String searchQuery = search.getSerchInfo(pageNumber, arguDto.getSearchGubun(), arguDto.getSearchData());
		request.setAttribute("searchQuery", searchQuery);
		
		Map<String, Integer> map = util.getPagerMap(pageNumber, pageSize, blockSize, totalRecord);
		map.put("blockSize", blockSize);
		
		//request.setAttribute("map", map);
		
		arguDto.setStartRecord(map.get("startRecord"));
		arguDto.setLastRecord(map.get("lastRecord"));
		
		model.addAttribute("map", map);
		
		List<NoticeDTO> list = noticeDao.getSelectAll(arguDto);
		
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
			@ModelAttribute NoticeDTO arguDto
		) {
		
		NoticeDTO returnDto = noticeDao.getSelectOne(arguDto);
		
		int hit = noticeDao.setUpdateHit(arguDto);
		returnDto.setHit(hit);
		
		String title = "공지 상세보기";
		
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
			@ModelAttribute NoticeDTO arguDto
		) {

		String title = "공지 추가";
		NoticeDTO returnDto = noticeDao.getSelectOne(arguDto);
		
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
			@ModelAttribute NoticeDTO arguDto,
			@RequestParam("file") List<MultipartFile> multiFileList
		) {
		
		String noticeGubun = request.getParameter("noticeGubun");
		String secretGubun = request.getParameter("secretGubun");
		
		int num = noticeDao.getMaxNumRefNoNoticeNo("num") + 1;
		arguDto.setNum(num);
		
		String tbl = "-";
		arguDto.setTbl(tbl);
		
		int hit = 0;
		arguDto.setHit(hit);
		
		//새글
		int refNo = noticeDao.getMaxNumRefNoNoticeNo("refNo") + 1;
		arguDto.setRefNo(refNo);
		
		//로그인
		String[] sessionArray = util.getSessionCheck(request);
		int sessionNo = Integer.parseInt(sessionArray[0]);
		String sessionId = sessionArray[1];
		String sessionName = sessionArray[2];
		
		int memberNo = sessionNo;
		arguDto.setMemberNo(memberNo);
		
		int noticeNo = 0;
		if(noticeGubun.equals("T")) { //공지글이면
			noticeNo = noticeDao.getMaxNumRefNoNoticeNo("noticeNo") + 1;	
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
		
		
		int result = noticeDao.setInsert(arguDto);
		
		if(result > 0) {
			return "redirect:/" + folderName + "/list";
		} else {
			return "redirect:/" + folderName + "/chuga";
		}
	}
		
	// sujung ------------------------------------------------------------------------------------
	@RequestMapping("/sujung")
	public String sujung(
		Model model,
		@ModelAttribute NoticeDTO arguDto
		) {
	
		String title = "공지 수정";
		NoticeDTO returnDto = noticeDao.getSelectOne(arguDto);
		
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
			@ModelAttribute NoticeDTO arguDto,
			@RequestParam("file") List<MultipartFile> multiFileList
		) {
		
		MultipartUpload mu = new MultipartUpload();
		List<String> list = mu.attachProc(multiFileList, "/springPortfolio/member");
		
		String attachInfo = "";
		for(int i=0; i<list.size(); i++) {
			attachInfo += "|" + list.get(i);
		}
		attachInfo = attachInfo.substring(1);
		arguDto.setAttachInfo(attachInfo);
		
		System.out.println("attachInfo: " + attachInfo);
		
		int result = noticeDao.setUpdate(arguDto);
		
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
		@ModelAttribute NoticeDTO arguDto
		) {
	
		String title = "공지 삭제";
		NoticeDTO returnDto = noticeDao.getSelectOne(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
	
		model.addAttribute("folderName", folderName);
		model.addAttribute("fileName", "sakje");
		return "main/main";
	}
	
	// sakjeProc ------------------------------------------------------------------------------------
	@RequestMapping("/sakjeProc")
	public String sakjeProc(
		Model model,
		@ModelAttribute NoticeDTO arguDto
		) {
	
		int result = noticeDao.setDelete(arguDto);
		
		if(result > 0) {
			return "redirect:/" + folderName + "/list";
		} else {
			return "redirect:/" + folderName + "/sakje?no=" + arguDto.getNo();
		}
	}
}