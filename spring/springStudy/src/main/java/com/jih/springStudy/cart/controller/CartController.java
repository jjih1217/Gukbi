package com.jih.springStudy.cart.controller;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jih.springStudy.cart.model.dao.CartDAO;
import com.jih.springStudy.cart.model.dto.CartDTO;
import com.jih.springStudy.cart.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Inject
	CartService cartService;
	
	String returnValue = "cart";
	
	int imsiProcGubun = 1; //imsiProcGubun = 0 : dao, imsiProcGubun = 1 : service
	
	// list ------------------------------------------------------------------------------------
	@RequestMapping("/list")
	public String list(
			Model model
		) {
		
		String title = "장바구니목록";
		List<CartDTO> list = cartService.getSelectAll();
		
		model.addAttribute("title", title);
		model.addAttribute("list", list);
		return returnValue + "/list";
	}
	
	// chugaProc ------------------------------------------------------------------------------------
	@RequestMapping("/chugaProc")
	public String chugaProc(
			Model model,
			@ModelAttribute CartDTO arguDto
		) {
		
		int result = cartService.setInsert(arguDto);
		
		if(result > 0) {
			return "redirect:/" + returnValue + "/list";
		} else {
			return "redirect:/" + returnValue + "/chuga";
		}
	}
	
	// sujungProc ------------------------------------------------------------------------------------
	@RequestMapping("/sujungProc")
	public String sujungProc(
			Model model,
			//DTO로 받을 수 없음
			HttpServletRequest request
		) {
		
		String totalCounter_ = request.getParameter("totalCounter");
		int totalCounter = Integer.parseInt(totalCounter_);
		
		List<String> list = new ArrayList<>();
		
		for(int i=0; i<totalCounter; i++) {
			String cartNo_ = request.getParameter("cartNo_" + i);
			String amount_ = request.getParameter("amount_" + i);
			
			int cartNo = Integer.parseInt(cartNo_);
			int amount = Integer.parseInt(amount_);
			
			CartDTO arguDto = new CartDTO();
			arguDto.setCartNo(cartNo);
			arguDto.setAmount(amount);
			
			int imsiResult = cartService.setUpdate(arguDto);
			if(imsiResult <= 0) {
				list.add(cartNo + "," + amount); //cartNo, amount
			}
		}
		
		return "redirect:/" + returnValue + "/list";
	}
	
	// sakjeProc ------------------------------------------------------------------------------------
	@RequestMapping("/sakjeProc")
	public String sakjeProc(
			Model model,
			@ModelAttribute CartDTO arguDto
		) {
		
		int result = cartService.setDelete(arguDto);
		
		return "redirect:/" + returnValue + "/list";
	}
	
	// cartClearProc ------------------------------------------------------------------------------------
	@RequestMapping("/cartClearProc")
	public String cartClearProc(
			Model model,
			HttpSession session,
			int memberNo
			
		) {
		
		if(session.getAttribute("sessionNo") != null) {
			int sessionNo = (int)session.getAttribute("sessionNo");
			
			if(sessionNo == memberNo) {
				int result = cartService.cartClear(memberNo);
			}
		}
		
		return "redirect:/" + returnValue + "/list";
	}
	
}
