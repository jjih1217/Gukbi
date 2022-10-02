package com.jih.springStudy._index;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexContoroller {
	
	@RequestMapping("/")
	public String index(Model model) {
		model.addAttribute("name", "홍길동");
		model.addAttribute("insa", "안녕하세요?");
		return "_home/index";
	}
	
}
