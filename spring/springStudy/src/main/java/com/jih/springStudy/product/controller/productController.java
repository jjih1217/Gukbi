package com.jih.springStudy.product.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jih.springStudy._common.MultipartUpload;
import com.jih.springStudy.product.model.dao.ProductDAO;
import com.jih.springStudy.product.model.dto.ProductDTO;
import com.jih.springStudy.product.service.ProductService;

@Controller
@RequestMapping("/product")
public class productController {
	
	@Inject
	ProductDAO productDao;
	//ProductService productService;
	
	String returnValue = "product";
	
	// list ------------------------------------------------------------------------------------
	@RequestMapping("/list")
	public String list(
			Model model
		) {
		
		List<ProductDTO> list = productDao.getSelectAll();
		String title = "상품목록";
		
		model.addAttribute("title", title);
		model.addAttribute("list", list);
	
		return returnValue + "/list";
	}
	
	// view ------------------------------------------------------------------------------------
	@RequestMapping("/view")
	public String view(
			Model model,
			@ModelAttribute ProductDTO arguDto
		) {
		ProductDTO returnDto = productDao.getSelectOne(arguDto);
		
		String title = "상품상세보기";
		
		model.addAttribute("title", title);
		model.addAttribute("dto", returnDto);
		
		return returnValue + "/view";
	}
	// chuga ------------------------------------------------------------------------------------
	@RequestMapping("/chuga")
	public String chuga(
			Model model
		) {
		String title = "상품등록";
		
		model.addAttribute("title",title);
		
		return returnValue + "/chuga";
	}
	
	// chugaProc ------------------------------------------------------------------------------------
	@RequestMapping("/chugaProc")
	public String chugaProc(
			Model model,
			@ModelAttribute ProductDTO arguDto
		) {
		
		int result = productDao.setInsert(arguDto);
		
		if(result > 0) {
			return "redirect:/product/list";
		} else {
			return "redirect:/product/chuga";
		}
	}
	
	// chugaAttach ------------------------------------------------------------------------------------
	@RequestMapping("/chugaAttach")
	public String chugaAttach(
			Model model
		) {
		String title = "상품등록(Attach)";
		
		model.addAttribute("title",title);
		
		return returnValue + "/chugaAttach";
	}
	
	// chugaAttachProc ------------------------------------------------------------------------------------
	@RequestMapping("/chugaAttachProc")
	public String chugaAttach(
			Model model,
			HttpServletRequest request,
			@ModelAttribute ProductDTO arguDto,
			@RequestParam("file") List<MultipartFile> multiFileList
		) {
		
		
		MultipartUpload mu = new MultipartUpload();
		List<String> list = mu.attachProc(multiFileList, "/springStudy/product");
		
		String attachInfo = "";
		for(int i=0; i<list.size(); i++) {
			attachInfo += "|" + list.get(i);
		}
		attachInfo = attachInfo.substring(1);
		arguDto.setAttachInfo(attachInfo);
		
		System.out.println("attachInfo: " + attachInfo);
		
		int result = productDao.setInsert(arguDto);
		
		if(result > 0) {
			return "redirect:/product/list";
		} else {
			return "redirect:/product/chugaAttach";
		}
	}
		
		
	// sujung ------------------------------------------------------------------------------------
	@RequestMapping("/sujung")
	public String sujung(
			Model model,
			@ModelAttribute ProductDTO arguDto
		) {
		
		ProductDTO returnDto = productDao.getSelectOne(arguDto);
		String title = "상품수정";
		
		model.addAttribute("title",title);
		model.addAttribute("dto",returnDto);
		
		return returnValue + "/sujung";
	}
	
	// sujungProc ------------------------------------------------------------------------------------
	@RequestMapping("/sujungProc")
	public String sujungProc(
			Model model,
			@ModelAttribute ProductDTO arguDto
		) {
		
		int result = productDao.setUpdate(arguDto);
		
		if(result > 0) {
			return "redirect:/product/view?productNo=" + arguDto.getProductNo();
		} else {
			return "redirect:/product/sujung?productNo=" + arguDto.getProductNo();
		}
		
	}
	// sakje ------------------------------------------------------------------------------------
	@RequestMapping("/sakje")
	public String sakje(
			Model model,
			@ModelAttribute ProductDTO dto
		) {
		
		ProductDTO returnDto = productDao.getSelectOne(dto);
		String title = "상품삭제";
		
		model.addAttribute("title",title);
		model.addAttribute("dto",returnDto);
		
		return returnValue + "/sakje";
	}
	
	// sakjeProc ------------------------------------------------------------------------------------
	@RequestMapping("/sakjeProc")
	public String sakjeProc(
			Model model,
			@ModelAttribute ProductDTO arguDto
		) {
		
		int result = productDao.setDelete(arguDto);
		
		if(result > 0) {
			return "redirect:/product/list";
		} else {
			return "redirect:/product/sakje?productNo=" + arguDto.getProductNo();
		}
		
	}
	
	// download ------------------------------------------------------------------------------------
		@RequestMapping("/download")
		public void download(
				Model model,
				HttpServletRequest request,
				HttpServletResponse response
			) {
			String productNo_ = request.getParameter("productNo");
			String num_ = request.getParameter("num");
			int productNo = Integer.parseInt(productNo_);
			int num = Integer.parseInt(num_);
			
			ProductDTO arguDto = new ProductDTO();
			arguDto.setProductNo(productNo);
			
			ProductDTO returnDto = productDao.getSelectOne(arguDto);
			String[] imsiArray = returnDto.getAttachInfo().split("[|]");
			
			for (int i=0; i<imsiArray.length; i++) {
				if (i == num) {
					String[] tempArray = imsiArray[i].split(",");
					System.out.println(tempArray[0]);
					System.out.println(tempArray[1]);
					MultipartUpload mu = new MultipartUpload();
					mu.attachDownload(response, tempArray[0], tempArray[1], "/springStudy/product");
					break;
				}
			}

			
		}
	
	
	
}
