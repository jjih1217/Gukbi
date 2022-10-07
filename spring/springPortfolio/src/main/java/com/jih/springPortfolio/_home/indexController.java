package com.jih.springPortfolio._home;

import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class indexController {
	@RequestMapping("/")
	public String index (
		Model model
		){
		model.addAttribute("folderName", "_home");
		model.addAttribute("fileName", "index");
		//model.addAttribute("path", "/springPortfolio");
		return "main/main";
	}
}
