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
import com.jih.springPortfolio._common.Search;
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
	Search search = new Search();		
	
	// list ------------------------------------------------------------------------------------
	@RequestMapping("/list")
	public String list(
			Model model,
			@ModelAttribute MemberDTO dto,
			HttpServletRequest request
		) {
		
		String title = "회원목록";
		/*
		String searchGubun =  request.getParameter("searchGubun");
		String searchData =  request.getParameter("searchData");
		request.setAttribute("searchGubun", searchGubun);
		request.setAttribute("searchData", searchData);
		*/
		
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
		
		MemberDTO arguDto = new MemberDTO();
		arguDto.setSearchGubun(searchGubun);
		arguDto.setSearchData(searchData);
		
		String pageNumber_ = request.getParameter("pageNumber");
		int pageNumber = util.getNumberCheck(pageNumber_, 1);
		request.setAttribute("pageNumber", pageNumber);
		
		int pageSize = 10;
		int blockSize = 10;
		
		int totalRecord = memberDao.getTotalRecord(arguDto);
		model.addAttribute("totalRecord", totalRecord);
		
		String searchQuery = "";
		try {
			searchQuery = search.getSerchInfo(pageNumber, arguDto.getSearchGubun(), arguDto.getSearchData());
			model.addAttribute("searchQuery", searchQuery);
		} catch (UnsupportedEncodingException e) {
			//e.printStackTrace();
		}
		
		Map<String, Integer> map = util.getPagerMap(pageNumber, pageSize, blockSize, totalRecord);
		map.put("blockSize", blockSize);
		
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
				HttpServletRequest request,
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
				@ModelAttribute MemberDTO dto,
				@RequestParam("file") List<MultipartFile> multiFileList
			) {
			
			String phone = dto.getPhone1() + dto.getPhone2() + dto.getPhone3();
			dto.setPhone(phone);
			
			String jumin = dto.getJumin1() + dto.getJumin2();
			dto.setJumin(jumin);

			String email = dto.getEmail1() + dto.getEmail2();
			dto.setEmail(email);
			
			String juso3 = dto.getJuso3();
			if(juso3 == null ||juso3.equals("")) {
				juso3 = "-";
			}
			String juso4 = dto.getJuso4();
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
			
			model.addAttribute("folderName", folderName);
			model.addAttribute("fileName", "sujung");
			return "main/main";
		}
		
		// sujungProc ------------------------------------------------------------------------------------
		@RequestMapping("/sujungProc")
		public String sujungProc(
				Model model,
				@ModelAttribute MemberDTO dto,
				@RequestParam("file") List<MultipartFile> multiFileList
			) {
			
			String phone = dto.getPhone1() + dto.getPhone2() + dto.getPhone3();
			dto.setPhone(phone);
			
			String jumin = dto.getJumin1() + dto.getJumin2();
			dto.setJumin(jumin);

			String email = dto.getEmail1() + dto.getEmail2();
			dto.setEmail(email);
			
			String juso3 = dto.getJuso3();
			if(juso3 == null ||juso3.equals("")) {
				juso3 = "-";
			}
			String juso4 = dto.getJuso4();
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
			dto.setAttachInfo(attachInfo);
			
			System.out.println("attachInfo: " + attachInfo);
			
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
			
			model.addAttribute("folderName", folderName);
			model.addAttribute("fileName", "sakje");
			
			return "main/main";
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
		// search ------------------------------------------------------------------------------------
		@RequestMapping("/search")
		public String search(
				Model model,
				@ModelAttribute MemberDTO dto,
				HttpServletRequest request
			) {
			
			String searchGubun = dto.getSearchGubun();
			String searchData = dto.getSearchData();
			
			if(dto.getSearchGubun() == null || dto.getSearchGubun().trim().equals("")) {
				searchGubun = "";
			}
			if(dto.getSearchData() == null || dto.getSearchData().trim().equals("")) {
				searchData = "";
			}
			
			String pageNumber_ = request.getParameter("pageNumber");
			int pageNumber = util.getNumberCheck(pageNumber_, 1);
			request.setAttribute("pageNumber", pageNumber);
			
			String searchQuery = "";
			try {
				searchQuery = search.getSerchInfo(pageNumber, searchGubun, searchData);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			//model.addAttribute("searchQuery", searchQuery);
			return "redirect:/member/list?" + searchQuery;
			
		}
}
