package com.jih.springStudy.member.controller;

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

import com.jih.springStudy._common.MultipartUpload;
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
	
	// chugaAttach ------------------------------------------------------------------------------------
	@RequestMapping("/chugaAttach")
	public String chugaAttach(
			Model model
		) {
		String title = "회원등록(Attach)";
		
		model.addAttribute("title",title);
		
		return returnValue + "/chugaAttach";
	}
	
	// chugaAttachProc ------------------------------------------------------------------------------------
	@RequestMapping("/chugaAttachProc")
	public String chugaAttach(
			Model model,
			HttpServletRequest request,
			@ModelAttribute MemberDTO dto,
			@RequestParam("file") List<MultipartFile> multiFileList
		) {
		
		
		String jumin = dto.getJumin1() + dto.getJumin2();
		dto.setJumin(jumin);
		
		MultipartUpload mu = new MultipartUpload();
		List<String> list = mu.attachProc(multiFileList, "/springStudy/member");
		
		String attachInfo = "";
		for(int i=0; i<list.size(); i++) {
			attachInfo += "|" + list.get(i);
		}
		attachInfo = attachInfo.substring(1);
		dto.setAttachInfo(attachInfo);
		
		System.out.println("attachInfo: " + attachInfo);
		
		int result = memberDao.setInsert(dto);
		
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
			@ModelAttribute MemberDTO dto
		) {
		
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
			HttpServletRequest request,
			@ModelAttribute MemberDTO dto,
			@RequestParam("file") List<MultipartFile> multiFileList
		) {
		
		MultipartUpload mu = new MultipartUpload();
		List<String> list = mu.attachProc(multiFileList, "/springStudy/member");
		
		String attachInfo = "";
		for(int i=0; i<list.size(); i++) {
			attachInfo += "|" + list.get(i);
		}
		attachInfo = attachInfo.substring(1);
		dto.setAttachInfo(attachInfo);
		
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
	
	// login ------------------------------------------------------------------------------------
	@RequestMapping("/login")
	public String login(
			Model model
			) {
		
		String title = "로그인";
		model.addAttribute("title", title);
		
		return returnValue + "/login";
	}
	
	// loginProc ------------------------------------------------------------------------------------
	@RequestMapping("/loginProc")
	public String loginProc(
			Model model,
			HttpSession session,
			@ModelAttribute MemberDTO arguDto
			) {
		
		int result = memberDao.getLogin(arguDto);
		
		if(result > 0) {//로그인 성공
			session.setAttribute("sessionNo", result);
			return "redirect:/member/list";
		} else {
			return "redirect:/member/login";
		}
		
	}
	
	// logout ------------------------------------------------------------------------------------
	@RequestMapping("/logout")
	public String logout(
			Model model,
			HttpSession session
			) {
		
		session.invalidate();
		
		return "redirect:/member/login";
		
	}
}
