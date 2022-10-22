package com.jih.springStudy.memberNew.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jih.springStudy._common.Constants;
import com.jih.springStudy.memberNew.model.dao.MemberNewDAO;
import com.jih.springStudy.memberNew.model.dto.MemberNewDTO;

@Controller
@RequestMapping("/memberNew")

/* servlet_context.xml에서 접두사, 접미사 저장 
 * return "/WEB_INF/views/memberNew/list.jsp" 
 */

public class MemberNewController {
	
	@RequestMapping("/list")
	public String list(
			Model model,
			@ModelAttribute MemberNewDTO dto,
			HttpServletRequest request
		) {
		
		//검색
		String searchGubun = dto.getSearchGubun();
		String searchData = dto.getSearchData();
		if(searchGubun == null || searchGubun.trim().equals("")) {
			searchGubun = "";
		}
		if(searchData == null || searchData.trim().equals("")) {
			searchData = "";
		}
		if(searchGubun.equals("") || searchData.equals("")) {
			searchGubun = "";
			searchData = "";
		}
		
		
		//페이징
		String pageNumber_ = request.getParameter("pageNumber");
		if(pageNumber_ == null || pageNumber_.trim().equals("")) {
			pageNumber_ = "1";
		}
		int pageNumber = Integer.parseInt(pageNumber_);
		
		MemberNewDAO memberNewDao = new MemberNewDAO();
		MemberNewDTO arguDto = new MemberNewDTO();
		arguDto.setSearchGubun(searchGubun);
		arguDto.setSearchData(searchData);
		
		int pageSize = Constants.MEMBER_PAGE_SIZE;
		int blockSize = Constants.BLOCKSIZE;
		int totalRecord = memberNewDao.getTotalRecord(arguDto);
		int startRecord = pageSize * (pageNumber - 1) + 1;
		int lastRecord = pageSize * pageNumber;
		if(lastRecord > totalRecord) {
			lastRecord = totalRecord;
		}
		int jj = totalRecord - pageSize * (pageNumber - 1);
		
		int totalPage = 0;
		int startPage = 0;
		int lastPage = 0;
		
		if(totalRecord > 0) {
			totalPage = totalRecord / pageSize + (totalRecord % pageSize == 0 ? 0 : 1);
			startPage = (pageNumber / blockSize - (pageNumber % blockSize != 0 ? 0 : 1)) * blockSize + 1;
			lastPage = startPage + blockSize - 1;
			
			if(lastPage > totalPage) {
				lastPage = totalPage;
			}
		} else {
			totalPage = 1;
		}
		
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("pageSize", pageSize );
		model.addAttribute("blockSize",blockSize );
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("startRecord", startRecord);
		model.addAttribute("lastRecord", lastRecord);
		model.addAttribute("jj", jj);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		
		//검색범위
		arguDto.setStartRecord(startRecord);
		arguDto.setLastRecord(lastRecord);
		
		List<MemberNewDTO> list = memberNewDao.getSelectAll(arguDto);
		
		model.addAttribute("list", list);
		model.addAttribute("searchGubun", searchGubun);
		model.addAttribute("searchData", searchData);
		
		String searchGubunEn = "";
		try {
			searchGubunEn = URLEncoder.encode(searchGubun,"UTF-8");
		} catch (Exception e) {
			// e.printStackTrace();
			searchGubunEn = "";
		}
		String searchDataEn = "";
		try {
			searchDataEn = URLEncoder.encode(searchData,"UTF-8");
		} catch (Exception e) {
			// e.printStackTrace();
			searchDataEn = "";
		}
		String searchQueryString = "searchGubun=" + searchGubunEn + "&searchData=" + searchDataEn;
		
		model.addAttribute("searchQueryString", searchQueryString);
		
		
		return "memberNew/list";
	}
	
	@RequestMapping("/listSearch")
	public String listSearch(
			Model model,
			@ModelAttribute MemberNewDTO arguDto
		) {
		
		String searchGubun = arguDto.getSearchGubun();
		String searchData = arguDto.getSearchData();
		
		if(arguDto.getSearchGubun() == null || arguDto.getSearchGubun().trim().equals("")) {
			searchGubun = "";
		}
		if(arguDto.getSearchData() == null || arguDto.getSearchData().trim().equals("")) {
			searchData = "";
		}

		//URLEncoder
		try {
			searchGubun = URLEncoder.encode(searchGubun,"UTF-8");
		} catch (Exception e) {
			// e.printStackTrace();
			searchGubun = "";
		}
		try {
			searchData = URLEncoder.encode(searchData,"UTF-8");
		} catch (Exception e) {
			// e.printStackTrace();
			searchData = "";
		}
		
		if(searchGubun.equals("") || searchData.equals("")) {
			searchGubun = "";
			searchData = "";
		}
		
		/*
		try {
			searchGubun = URLDecoder.decode(searchGubun, "UTF-8");
		} catch (Exception e) {
			// e.printStackTrace();
			searchGubun = "";
		}
		try {
			searchData = URLDecoder.decode(searchData, "UTF-8");
		} catch (Exception e) {
			// e.printStackTrace();
			searchGubun = "";
		}
		
		System.out.println("URLDncode: " + searchGubun + " / " + searchData);
		*/
		
		return "redirect:/memberNew/list?searchGubun=" + searchGubun + "&searchData=" + searchData;
		
	}
	
	@RequestMapping("/view")
	public String view(
			Model model,
			@ModelAttribute MemberNewDTO dto
		) {
		
		MemberNewDAO memberNewDao = new MemberNewDAO();
		MemberNewDTO returnDto = memberNewDao.getSelectOne(dto);
		model.addAttribute("dto", returnDto);
		
		String searchGubun = dto.getSearchGubun();
		String searchData = dto.getSearchData();
		if(searchGubun == null || searchGubun.trim().equals("")) {
			searchGubun = "";
		}
		if(searchData == null || searchData.trim().equals("")) {
			searchData = "";
		}
		if(searchGubun.equals("") || searchData.equals("")) {
			searchGubun = "";
			searchData = "";
		}
		
		MemberNewDTO arguDto = new MemberNewDTO();
		arguDto.setSearchGubun(searchGubun);
		arguDto.setSearchData(searchData);
		
		model.addAttribute("searchGubun", searchGubun);
		model.addAttribute("searchData", searchData);
		
		String searchGubunEn = "";
		try {
			searchGubunEn = URLEncoder.encode(searchGubun,"UTF-8");
		} catch (Exception e) {
			// e.printStackTrace();
			searchGubunEn = "";
		}
		String searchDataEn = "";
		try {
			searchDataEn = URLEncoder.encode(searchData,"UTF-8");
		} catch (Exception e) {
			// e.printStackTrace();
			searchDataEn = "";
		}
		String searchQueryString = "searchGubun=" + searchGubunEn + "&searchData=" + searchDataEn;
		
		model.addAttribute("searchQueryString", searchQueryString);
		
		return "memberNew/view";
	}
	
	@RequestMapping("/chuga")
	public String chuga(Model model) {
		
		return "memberNew/chuga";
	}
	
	@RequestMapping("/chugaProc")
	public String chugaProc(
			Model model,
			@ModelAttribute MemberNewDTO arguDto
		) {
		
		if(!arguDto.getPasswd().equals(arguDto.getPasswdChk())) {
			System.out.println("비밀번호가 일치하지 않습니다");
			return "redirect:/memberNew/chuga";
		}
		MemberNewDAO memberNewDao = new MemberNewDAO();
		int result = memberNewDao.setInsert(arguDto);
		
		if(result > 0) {
			return "redirect:/memberNew/list";
		} else {
			return "redirect:/memberNew/chuga";
		}
		//return "memberNew/chuga";
	}
	
	@RequestMapping("/sujung")
	public String sujung(
			Model model,
			@ModelAttribute MemberNewDTO dto
		) {
		
		MemberNewDAO memberNewDao = new MemberNewDAO();
		MemberNewDTO returnDto = memberNewDao.getSelectOne(dto);
		model.addAttribute("dto", returnDto);
		
		return "memberNew/sujung";
	}
	
	@RequestMapping("/sujungProc")
	public String sujungProc(
			Model model,
			@ModelAttribute MemberNewDTO dto
		) {
		
		MemberNewDAO memberNewDao = new MemberNewDAO();
		int result = memberNewDao.setUpdate(dto);
		
		if(result > 0) {
			return "redirect:/memberNew/view?no=" + dto.getNo();
		} else {
			return "redirect:/memberNew/sujung?no=" + dto.getNo();
		}
		
		//return "memberNew/sujung";
	}
	
	@RequestMapping("/sakje")
	public String sakje(
			Model model,
			@ModelAttribute MemberNewDTO dto
		) {

		MemberNewDAO memberNewDao = new MemberNewDAO();
		MemberNewDTO returnDto = memberNewDao.getSelectOne(dto);
		model.addAttribute("dto", returnDto);
		
		return "memberNew/sakje";
	}
	
	@RequestMapping("/sakjeProc")
	public String sakjeProc(
			Model model,
			@ModelAttribute MemberNewDTO dto
		) {
		
		MemberNewDAO memberNewDao = new MemberNewDAO();
		int result = memberNewDao.setDelete(dto);
		
		if(result > 0) {
			return "redirect:/memberNew/list";
		} else {
			return "redirect:/memberNew/Sakje?no=" + dto.getNo();
		}
		
		//return "memberNew/sujung";
	}

}

