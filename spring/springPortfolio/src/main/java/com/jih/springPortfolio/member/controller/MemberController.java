package com.jih.springPortfolio.member.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jih.springPortfolio._common.MultipartUpload;
import com.jih.springPortfolio._common.Util;
import com.jih.springPortfolio.member.model.dao.MemberDAO;
import com.jih.springPortfolio.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	MemberDAO memberDao;
	
	String folderName= "member";
	
	Util util = new Util();
			
	// list ------------------------------------------------------------------------------------
	@RequestMapping("/list")
	public String list(
			Model model,
			HttpServletRequest request,
			@ModelAttribute MemberDTO arguDto
		) throws UnsupportedEncodingException {
		
		String title = "회원목록";
		
		String searchGubun = arguDto.getSearchGubun();
		String searchData = arguDto.getSearchData();
		
		model.addAttribute("searchGubun", searchGubun);
		model.addAttribute("searchData", searchData);
		
		//페이징
		String pageNumber_ = request.getParameter("pageNumber");
		int pageNumber = util.getNumberCheck(pageNumber_, 1);
		request.setAttribute("pageNumber", pageNumber);
		

		String imsiSearchYN = "O";
		searchGubun = util.getNullBlankCheck(searchGubun);
		searchData = util.getNullBlankCheck(searchData);
		if(searchGubun.equals("") || searchData.equals("")) {
			imsiSearchYN = "X";
			searchGubun = "";
			searchData = "";
		}
			
		searchGubun = URLDecoder.decode(searchGubun,"UTF-8");
		searchData = URLDecoder.decode(searchData,"UTF-8");

		String searchQuery = "pageNumber=" + pageNumber + "&searchGubun=&searchData=";
		String searchQuery2 = "searchGubun=&searchData=";
		if(imsiSearchYN.equals("O")) {
			String imsiSerchGubun = URLEncoder.encode(searchGubun,"UTF-8");
			String imsiSerchData = URLEncoder.encode(searchData,"UTF-8");
			searchQuery = "pageNumber=" + pageNumber + "&searchGubun=" + imsiSerchGubun + "&searchData=" + imsiSerchData;
			searchQuery2 = "searchGubun=" + imsiSerchGubun + "&searchData=" + imsiSerchData;
		}
		
		int pageSize = 1;
		int blockSize = 10;
		
		int totalRecord = memberDao.getTotalRecord(arguDto);
		model.addAttribute("totalRecord", totalRecord);
		
		
		Map<String, Integer> map = util.getPagerMap(pageNumber, pageSize, blockSize, totalRecord);
		map.put("blockSize", blockSize);
		
		request.setAttribute("map", map);
		
		arguDto.setStartRecord(map.get("startRecord"));
		arguDto.setLastRecord(map.get("lastRecord"));
		
		
		model.addAttribute("map", map);

		
		List<MemberDTO> list = memberDao.getSelectAll(arguDto);
		
		model.addAttribute("title", title);
		model.addAttribute("list", list);
		
		model.addAttribute("folderName", folderName);
		model.addAttribute("fileName", "list");
		return "main/main";
	}
	// view ------------------------------------------------------------------------------------
		@RequestMapping("/view")
		public String view(
				Model model,
				@ModelAttribute MemberDTO arguDto
			) {
			MemberDTO returnDto = memberDao.getSelectOne(arguDto);
			
			String title = "회원상세보기";
			
			model.addAttribute("title", title);
			model.addAttribute("dto", returnDto);
			
			model.addAttribute("folderName", folderName);
			model.addAttribute("fileName", "view");
			return "main/main";
		}
		// chuga ------------------------------------------------------------------------------------
		@RequestMapping("/chuga")
		public String chuga(
				Model model
			) {
			String title = "회원등록";
			
			model.addAttribute("title",title);
			
			model.addAttribute("folderName", folderName);
			model.addAttribute("fileName", "chuga");
			return "main/main";
		}
		
		
		// chugaAttachProc ------------------------------------------------------------------------------------
		@RequestMapping("/chugaAttachProc")
		public String chugaAttach(
				Model model,
				HttpServletRequest request,
				@ModelAttribute MemberDTO arguDto,
				@RequestParam("file") List<MultipartFile> multiFileList
			) {
			
			String phone = arguDto.getPhone1() + arguDto.getPhone2() + arguDto.getPhone3();
			arguDto.setPhone(phone);
			
			String jumin = arguDto.getJumin1() + arguDto.getJumin2();
			arguDto.setJumin(jumin);

			String email = arguDto.getEmail1() + arguDto.getEmail2();
			arguDto.setEmail(email);
			
			String juso3 = arguDto.getJuso3();
			if(juso3 == null ||juso3.equals("")) {
				juso3 = "-";
			}
			String juso4 = arguDto.getJuso4();
			if(juso4 == null ||juso4.equals("")) {
				juso4 = "-";
			}
			
			MultipartUpload mu = new MultipartUpload();
			List<String> list = mu.attachProc(multiFileList, "/springPortfolio/member");
			
			String attachInfo = "";
			for(int i=0; i<list.size(); i++) {
				attachInfo += "|" + list.get(i);
			}
			attachInfo = attachInfo.substring(1);
			arguDto.setAttachInfo(attachInfo);
			
			System.out.println("attachInfo: " + attachInfo);
			
			int result = memberDao.setInsert(arguDto);
			
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
				@ModelAttribute MemberDTO arguDto
			) {
			
			MemberDTO returnDto = memberDao.getSelectOne(arguDto);
			String title = "회원수정";
			
			model.addAttribute("title",title);
			model.addAttribute("dto",returnDto);
			
			model.addAttribute("folderName", folderName);
			model.addAttribute("fileName", "sujung");
			return "main/main";
		}
		
		// sujungProc ------------------------------------------------------------------------------------
		@RequestMapping("/sujungProc")
		public String sujungProc(
				Model model,
				HttpServletRequest request,
				@ModelAttribute MemberDTO arguDto,
				@RequestParam("file") List<MultipartFile> multiFileList
			) {
			
			String phone = arguDto.getPhone1() + arguDto.getPhone2() + arguDto.getPhone3();
			arguDto.setPhone(phone);
			
			String jumin = arguDto.getJumin1() + arguDto.getJumin2();
			arguDto.setJumin(jumin);

			String email = arguDto.getEmail1() + arguDto.getEmail2();
			arguDto.setEmail(email);
			
			String juso3 = arguDto.getJuso3();
			if(juso3 == null ||juso3.equals("")) {
				juso3 = "-";
			}
			String juso4 = arguDto.getJuso4();
			if(juso4 == null ||juso4.equals("")) {
				juso4 = "-";
			}
			
			MultipartUpload mu = new MultipartUpload();
			List<String> list = mu.attachProc(multiFileList, "/springPortfolio/member");
			
			String attachInfo = "";
			for(int i=0; i<list.size(); i++) {
				attachInfo += "|" + list.get(i);
			}
			attachInfo = attachInfo.substring(1);
			arguDto.setAttachInfo(attachInfo);
			
			System.out.println("attachInfo: " + attachInfo);
			
			int result = memberDao.setUpdate(arguDto);
			
			if(result > 0) {
				return "redirect:/member/view?no=" + arguDto.getNo();
			} else {
				return "redirect:/member/sujung?no=" + arguDto.getNo();
			}
			
		}
		// sakje ------------------------------------------------------------------------------------
		@RequestMapping("/sakje")
		public String sakje(
				Model model,
				@ModelAttribute MemberDTO arguDto
			) {
			
			MemberDTO returnDto = memberDao.getSelectOne(arguDto);
			String title = "회원삭제";
			
			model.addAttribute("title",title);
			model.addAttribute("dto",returnDto);
			
			model.addAttribute("folderName", folderName);
			model.addAttribute("fileName", "sakje");
			
			return "main/main";
		}
		
		// sakjeProc ------------------------------------------------------------------------------------
		@RequestMapping("/sakjeProc")
		public String sakjeProc(
				Model model,
				@ModelAttribute MemberDTO arguDto
			) {
			
			int result = memberDao.setDelete(arguDto);
			
			if(result > 0) {
				return "redirect:/member/list";
			} else {
				return "redirect:/member/sakje?no=" + arguDto.getNo();
			}
			
		}
		
		// login ------------------------------------------------------------------------------------
		@RequestMapping("/login")
		public String login(
				Model model
				) {
			
			String title = "로그인";
			model.addAttribute("title", title);
			
			model.addAttribute("folderName", folderName);
			model.addAttribute("fileName", "login");
			
			return "main/main";
		}
		
		// loginProc ------------------------------------------------------------------------------------
		@RequestMapping("/loginProc")
		public String loginProc(
				Model model,
				HttpSession session,
				@ModelAttribute MemberDTO arguDto
				) {
			
			/* int result = memberDao.getLogin(arguDto); */
			
			/*
			if(result > 0) {//로그인 성공
				session.setAttribute("sessionNo", result);
				return "redirect:/member/list";
			} else {
				return "redirect:/member/login";
			}
			*/
			
			MemberDTO resultDto = memberDao.getLogin(arguDto);
			if(resultDto != null) {//로그인 성공
				session.setAttribute("sessionNo", resultDto.getNo());
				session.setAttribute("sessionId", resultDto.getId());
				session.setAttribute("sessionName", resultDto.getName());
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
		// logout ------------------------------------------------------------------------------------
		@RequestMapping("/search")
		public String search(
				Model model,
				@ModelAttribute MemberDTO arguDto
			) {
			
			return "redirect:/member/list?searchGubun=" + arguDto.getSearchGubun() + "&searchData=" + arguDto.getSearchData();
			
		}
}
