package com.jih.myProject._index;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexContoroller {
	
	@RequestMapping("/")
	public String index(Model model) {
		model.addAttribute("path","/myProject");
		return "_home/index";
	}
	
}
