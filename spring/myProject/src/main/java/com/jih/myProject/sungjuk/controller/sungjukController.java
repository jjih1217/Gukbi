package com.jih.myProject.sungjuk.controller;

import java.io.Reader;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jih.myProject.sungjuk.model.dao.SungjukDAO;
import com.jih.myProject.sungjuk.model.dto.SungjukDTO;




@Controller
@RequestMapping("/sungjuk")
public class sungjukController {
	
	@Inject
	SungjukDAO sungjukDao;
	
	String returnValue = "sungjuk";
	
	// list ------------------------------------------------------------------------------------
	@RequestMapping("/list")
	public String list(
			Model model
		) {
		
		String title = "성적목록";
		List<SungjukDTO> list =  sungjukDao.getSelectAll();
		
		model.addAttribute("title", title);
		model.addAttribute("list", list);
		return returnValue + "/list";
	}
	// view ------------------------------------------------------------------------------------
	@RequestMapping("/view")
	public String view(
			Model model,
			@ModelAttribute SungjukDTO arguDto
		) {
		
		String title = "성적상세보기";
		
		SungjukDTO returnDto = sungjukDao.getSelectOne(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		return returnValue + "/view";
	}
	// chuga ------------------------------------------------------------------------------------
	@RequestMapping("/chuga")
	public String chuga(
			Model model
		) {
		
		String title = "성적추가";
		model.addAttribute("title", title);
		
		
		return returnValue + "/chuga";
	}
	// chugaProc ------------------------------------------------------------------------------------
	@RequestMapping("/chugaProc")
	public String chugaProc(
			Model model,
			@ModelAttribute SungjukDTO arguDto
		) {
		
		int tot = arguDto.getKor() + arguDto.getEng() + arguDto.getMat();
		double avg = tot / 3.0;
		String avg_ = String.format("%.2f", avg);
		avg = Double.parseDouble(avg_);
		String grade = "E";
		if(avg >= 90) {
			grade = "A";
		} else if (avg >= 80) {
			grade = "B";
		} else if (avg >= 70) {
			grade = "C";
		} else if (avg >= 60) {
			grade = "D";
		} 
		
		arguDto.setTot(tot);
		arguDto.setAvg(avg);
		arguDto.setGrade(grade);
		int result = sungjukDao.setInsert(arguDto);
		
		if(result > 0) {
			return "redirect:/" + returnValue + "/list";
		} else {
			return "redirect:/" + returnValue + "/chuga";
		}
	}
	// sujung ------------------------------------------------------------------------------------
	@RequestMapping("/sujung")
	public String sujung(
			Model model,
			@ModelAttribute SungjukDTO arguDto
		) {
		
		String title = "성적수정";
		SungjukDTO returnDto = sungjukDao.getSelectOne(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		
		return returnValue + "/sujung";
	}
	// sujungProc ------------------------------------------------------------------------------------
	@RequestMapping("/sujungProc")
	public String sujungProc(
			Model model,
			@ModelAttribute SungjukDTO arguDto
		) {
		
		int tot = arguDto.getKor() + arguDto.getEng() + arguDto.getMat();
		double avg = tot / 3.0;
		String avg_ = String.format("%.2f", avg);
		avg = Double.parseDouble(avg_);
		
		String grade = "E";
		if(avg >= 90) {
			grade = "A";
		} else if (avg >= 80) {
			grade = "B";
		} else if (avg >= 70) {
			grade = "C";
		} else if (avg >= 60) {
			grade = "D";
		} 
		
		arguDto.setTot(tot);
		arguDto.setAvg(avg);
		arguDto.setGrade(grade);
	
		int result = sungjukDao.setUpdate(arguDto);
		
		if(result > 0) {
			return "redirect:/" + returnValue + "/view?no=" + arguDto.getNo();
		} else {
			return "redirect:/" + returnValue + "/sujung?no=" + arguDto.getNo();
		}
	}
	// sakje ------------------------------------------------------------------------------------
	@RequestMapping("/sakje")
	public String sakje(
			Model model,
			@ModelAttribute SungjukDTO arguDto
		) {
		
		String title = "성적삭제";
		
		SungjukDTO returnDto = sungjukDao.getSelectOne(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		
		return returnValue + "/sakje";
	}
	// sakjeProc ------------------------------------------------------------------------------------
	@RequestMapping("/sakjeProc")
	public String sakjeProc(
			Model model,
			@ModelAttribute SungjukDTO arguDto
		) {
		
		int result = sungjukDao.setDelete(arguDto);
		
		if(result > 0) {
			return "redirect:/" + returnValue + "/list";
		} else {
			return "redirect:/" + returnValue + "/sakje?no=" + arguDto.getNo();
		}
	}
	
}
