package com.jih.springStudy.member.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jih.springStudy.member.model.dao.MemberDAO;
import com.jih.springStudy.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	MemberDAO memberDao;
	
	String returnValue = "member";
	
	// list ------------------------------------------------------------------------------------
	@RequestMapping("/list")
	public String list(
			Model model
		) {
		
		List<MemberDTO> list = memberDao.getSelectAll();
		String title = "회원목록";
		model.addAttribute("title", title);
		model.addAttribute("list", list);
	
		return returnValue + "/list";
	}
	
	// view ------------------------------------------------------------------------------------
	@RequestMapping("/view")
	public String view(
			Model model,
			@ModelAttribute MemberDTO dto
		) {
		MemberDTO returnDto = memberDao.getSelectOne(dto);
		
		String title = "회원상세보기";
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		
		return returnValue + "/view";
	}
	// chuga ------------------------------------------------------------------------------------
	@RequestMapping("/chuga")
	public String chuga(
			Model model
		) {
		String title = "회원등록";
		
		model.addAttribute("title",title);
		
		return returnValue + "/chuga";
	}
	
	// chugaProc ------------------------------------------------------------------------------------
		@RequestMapping("/chugaProc")
		public String chugaProc(
				Model model,
				@ModelAttribute MemberDTO dto
			) {
			
			String jumin = dto.getJumin1() + dto.getJumin2();
			dto.setJumin(jumin);
			
			int result = memberDao.setInsert(dto);
			if(result > 0) {
				return "redirect:/member/list";
			} else {
				return "redirect:/member/chuga";
			}
			
		}
		
	// sujung ------------------------------------------------------------------------------------
	@RequestMapping("/sujung")
	public String sujung(
			Model model,
			@ModelAttribute MemberDTO dto
		) {
		
			/*
			 * int no = dto.getNo(); dto.setNo(no);
			 */
		
		MemberDTO returnDto = memberDao.getSelectOne(dto);
		String title = "회원수정";
		
		model.addAttribute("title",title);
		model.addAttribute("dto",returnDto);
		
		return returnValue + "/sujung";
	}
	
	// sujungProc ------------------------------------------------------------------------------------
			@RequestMapping("/sujungProc")
			public String sujungProc(
					Model model,
					@ModelAttribute MemberDTO dto
				) {
				
				int result = memberDao.setUpdate(dto);
				if(result > 0) {
					return "redirect:/member/view?no=" + dto.getNo();
				} else {
					return "redirect:/member/sujung?no=" + dto.getNo();
				}
				
			}
	// sakje ------------------------------------------------------------------------------------
	@RequestMapping("/sakje")
	public String sakje(
			Model model,
			@ModelAttribute MemberDTO dto
		) {
		MemberDTO returnDto = memberDao.getSelectOne(dto);
		String title = "회원삭제";
		
		model.addAttribute("title",title);
		model.addAttribute("dto",returnDto);
		
		return returnValue + "/sakje";
	}
	
	// sakjeProc ------------------------------------------------------------------------------------
	@RequestMapping("/sakjeProc")
	public String sakjeProc(
			Model model,
			@ModelAttribute MemberDTO dto
		) {
		
		int result = memberDao.setDelete(dto);
		if(result > 0) {
			return "redirect:/member/list";
		} else {
			return "redirect:/member/sakje?no=" + dto.getNo();
		}
		
	}
}
