package com.jih.springStudy.memberNew.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
			@ModelAttribute MemberNewDTO dto
		) {
		
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
		
		MemberNewDAO memberNewDao = new MemberNewDAO();
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

