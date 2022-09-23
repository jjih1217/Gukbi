package project.member.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.common.Util;
import project.member.model.dao.MemberDAO;
import project.member.model.dto.MemberDTO;


@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Util util = new Util();
		
		String[] serverInfo = util.getServerInfo(request);
		String referer = serverInfo[0];
		String path = serverInfo[1];
		String url = serverInfo[2]; 
		String uri = serverInfo[3]; 
		String ip = serverInfo[4];
		String ip6 = serverInfo[5];
		String folderName = serverInfo[6];
		String fileName = serverInfo[7];
		
		request.setAttribute("referer", referer);
		request.setAttribute("path", path);
		request.setAttribute("ip", ip);
		request.setAttribute("folderName", folderName);
		request.setAttribute("fileName", fileName);
		
		String pageNumber_ = request.getParameter("pageNumber");
		int pageNumber = util.getNumberCheck(pageNumber_, 1);
		request.setAttribute("pageNumber", pageNumber);
		
		String searchGubun = request.getParameter("searchGubun");
		String searchData = request.getParameter("searchData");
		
		String imsiSearchYN = "O";
		searchGubun = util.getNullBlankCheck(searchGubun);
		searchData = util.getNullBlankCheck(searchData);
		if(searchGubun.equals("") || searchData.equals("")) {
			imsiSearchYN = "X";
			searchGubun = "";
			searchData = "";
		}
		
		//searchGubun = URLEncoder.encode(searchGubun,"UTF-8");
		//searchData = URLEncoder.encode(searchData,"UTF-8");
		searchGubun = URLDecoder.decode(searchGubun,"UTF-8");
		searchData = URLDecoder.decode(searchData,"UTF-8");
		
		String searchQuery = "pageNumber=" + pageNumber + "&searchGubun=&searchData=";
		if(imsiSearchYN.equals("O")) {
			String imsiSerchGubun = URLEncoder.encode(searchGubun,"UTF-8");
			String imsiSerchData = URLEncoder.encode(searchData,"UTF-8");
			searchQuery = "pageNumber=" + pageNumber + "&searchGubun=" + imsiSerchGubun + "&searchData=" + imsiSerchData;
		}
		
		System.out.println("searchQuery :  " + searchQuery);
		
		request.setAttribute("searchGubun", searchGubun);
		request.setAttribute("searchData", searchData);
		request.setAttribute("searchQuery", searchQuery);
		
		
		String forwardPage = "/WEB-INF/project/main/main.jsp";
		if(fileName.equals("list")) {
			
			MemberDTO arguDto2 = new MemberDTO();
			arguDto2.setSearchGubun(searchGubun);
			arguDto2.setSearchData(searchData);
			
			MemberDAO dao = new MemberDAO();
			
			//-------------------------------------------------------------------
			int pageSize = 3;
			int blockSize = 10;
			int totalRecord = dao.getTotalRecord(arguDto2);
			request.setAttribute("totalRecord", totalRecord);
			
			Map<String, Integer> map = util.getPagerMap(pageNumber, pageSize, blockSize, totalRecord);
			map.put("blockSize", blockSize);
			request.setAttribute("map", map);
			
			
			MemberDTO arguDto = new MemberDTO();
			arguDto.setSearchGubun(searchGubun);
			arguDto.setSearchData(searchData);
			arguDto.setStartRecord(map.get("startRecord"));
			arguDto.setLastRecord(map.get("lastRecord"));
			
			ArrayList<MemberDTO> list = dao.getSelectAll(arguDto);
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if (fileName.equals("view")) {
			/*
			MemberDTO arguDto2 = new MemberDTO();
			arguDto2.setSearchGubun(searchGubun);
			arguDto2.setSearchData(searchData);
			*/
			
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				System.out.println("no ; " + no);
				return;
			}
			
			MemberDTO arguDto = new MemberDTO();
			arguDto.setNo(no);
			arguDto.setSearchGubun(searchGubun);
			arguDto.setSearchData(searchData);
					
			MemberDAO dao = new MemberDAO();
			MemberDTO returnDto = dao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if (fileName.equals("chuga")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if (fileName.equals("sujung")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				System.out.println("no ; " + no);
				return;
			}
			
			MemberDTO arguDto = new MemberDTO();
			arguDto.setNo(no);
					
			MemberDAO dao = new MemberDAO();
			MemberDTO returnDto = dao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);

			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if (fileName.equals("sakje")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				System.out.println("no ; " + no);
				return;
			}
			
			MemberDTO arguDto = new MemberDTO();
			arguDto.setNo(no);
					
			MemberDAO dao = new MemberDAO();
			MemberDTO returnDto = dao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
		
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		}  else if (fileName.equals("search")) {
			
			String moveUrl = "";
			moveUrl += path + "/member_servlet/member_list.do?" + searchQuery;
			
			response.sendRedirect(moveUrl);
			
		} else if (fileName.equals("chugaProc")) {
			//chuga.jsp에서 접속하지 않으면 리턴(추가, 수정, 삭제)
			
			System.out.println("referer : " + referer);
			String[] imsiRefererArray = referer.split("/");
			String imsiRefererName = imsiRefererArray[imsiRefererArray.length - 1];
			System.out.println("imsiRefererName : " + imsiRefererName);
			
			/*
			String[] imsiArray = imsiRefererName.split(".");
			System.out.println("imsiArray : " + imsiArray[0]);
			*/
			
			/*
			String[] imsiArray = imsiRefererName.split(".");
			System.out.println("imsiArray : " + imsiArray[0]);
			
			System.out.println("imsiRefererName : " + imsiRefererName);
			*/
			
			/*
			if(!imsiRefererName.equals("member_chuga_do?no=")) {
				System.out.println("정상적인 접근이 아닙니다");
				return;
			}
			*/
			
			String id = request.getParameter("id");
            String passwd = request.getParameter("passwd");
            String passwdChk = request.getParameter("passwdChk");
            String name = request.getParameter("name");
            String jumin1 = request.getParameter("jumin1");
            String jumin2 = request.getParameter("jumin2");
            String phone1 = request.getParameter("phone1");
            String phone2 = request.getParameter("phone2");
            String phone3 = request.getParameter("phone3");
            String email1 = request.getParameter("email1");
            String email2 = request.getParameter("email2");
			
            String postcode = request.getParameter("sample6_postcode");
            String address = request.getParameter("sample6_address");
            String detailAddress = request.getParameter("sample6_detailAddress");
            String extraAddress = request.getParameter("sample6_extraAddress");
			
            id = util.getNullBlankCheck(id);
            passwd = util.getNullBlankCheck(passwd);
            passwdChk = util.getNullBlankCheck(passwdChk);
            name = util.getNullBlankCheck(name);
            jumin1 = util.getNullBlankCheck(jumin1);
            jumin2 = util.getNullBlankCheck(jumin2);
            phone1 = util.getNullBlankCheck(phone1);
            phone2 = util.getNullBlankCheck(phone2);
            phone3 = util.getNullBlankCheck(phone3);
            email1 = util.getNullBlankCheck(email1);
            email2 = util.getNullBlankCheck(email2);
            postcode = util.getNullBlankCheck(postcode);
            address = util.getNullBlankCheck(address);
            detailAddress = util.getNullBlankCheck(detailAddress);
            extraAddress = util.getNullBlankCheck(extraAddress);

            int failCounter = 0;
            if(id.equals("")) { failCounter++; }
            if(passwd.equals("")) { failCounter++; }
            if(passwdChk.equals("")) { failCounter++; }
            if(name.equals("")) { failCounter++; }
            if(jumin1.equals("")) { failCounter++; }
            if(jumin2.equals("")) { failCounter++; }
            if(phone1.equals("")) { failCounter++; }
            if(phone2.equals("")) { failCounter++; }
            if(phone3.equals("")) { failCounter++; }
            if(email1.equals("")) { failCounter++; }
            if(email2.equals("")) { failCounter++; }
            if(postcode.equals("")) { failCounter++; }
            if(address.equals("")) { failCounter++; }
            if(detailAddress.equals("")) { failCounter++; }
            if(extraAddress.equals("")) { extraAddress = "-"; }
			
			//passwd 체크
			if(!passwd.equals("") && passwd.equals(passwdChk) ) {
				
			} else {
				failCounter++;
			}
			
			//jumin 숫자체크
			int imsiJumin1 = util.getNumberCheck(jumin1, 0);
			if(!(jumin1.length() == 6 && imsiJumin1 > 0)) {
				failCounter++;
			}
			int imsiJumin2 = util.getNumberCheck(jumin2, 0);
			if(!(jumin2.length() == 1 && imsiJumin1 > 0)) {
				failCounter++;
			}
			
			//전화번호 체크
			if(!(phone1.equals("010") || phone1.equals("011") || phone1.equals("016"))) {
				failCounter++;
			}
			int imsiPhone2 = util.getNumberCheck(phone2, 0);
			if(!(phone2.length() == 4 && imsiPhone2 >= 0)) {
				failCounter++;
			}
			int imsiPhone3 = util.getNumberCheck(phone3, 0);
			if(!(phone3.length() == 4 && imsiPhone3 >= 0)) {
				failCounter++;
			}
			
			if(failCounter > 0) {
				return;
			}
			
			//entity check
			id = util.getCheckString(id);
            passwd = util.getCheckString(passwd);
            name = util.getCheckString(name);
            jumin1 = util.getCheckString(jumin1);
            jumin2 = util.getCheckString(jumin2);
            phone1 = util.getCheckString(phone1);
            phone2 = util.getCheckString(phone2);
            phone3 = util.getCheckString(phone3);
            email1 = util.getCheckString(email1);
            email2 = util.getCheckString(email2);
            postcode = util.getCheckString(postcode);
            address = util.getCheckString(address);
            detailAddress = util.getCheckString(detailAddress);
            extraAddress = util.getCheckString(extraAddress);

            MemberDTO arguDto = new MemberDTO();
            arguDto.setId(id);
            arguDto.setPasswd(passwd);
            arguDto.setName(name);
            arguDto.setJumin1(jumin1);
            arguDto.setJumin2(jumin2);
            arguDto.setPhone1(phone1);
            arguDto.setPhone2(phone2);
            arguDto.setPhone3(phone3);
            arguDto.setEmail1(email1);
            arguDto.setEmail2(email2);
            arguDto.setPostcode(postcode);
            arguDto.setAddress(address);
            arguDto.setDetailAddress(detailAddress);
            arguDto.setExtraAddress(extraAddress);

            MemberDAO dao = new MemberDAO();
            int result = dao.setInsert(arguDto);
            
            if(result > 0) {
               response.sendRedirect(path + "/member_servlet/member_list.do");
            } else {
               response.sendRedirect(path + "/member_servlet/member_chuga.do?" + searchQuery);
            }
			
		} else if (fileName.equals("sujungProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				System.out.println("no ; " + no);
				return;
			}
			
            String passwd = request.getParameter("passwd");
            String phone1 = request.getParameter("phone1");
            String phone2 = request.getParameter("phone2");
            String phone3 = request.getParameter("phone3");
            String email1 = request.getParameter("email1");
            String email2 = request.getParameter("email2");
			
            String postcode = request.getParameter("sample6_postcode");
            String address = request.getParameter("sample6_address");
            String detailAddress = request.getParameter("sample6_detailAddress");
            String extraAddress = request.getParameter("sample6_extraAddress");
            
            passwd = util.getNullBlankCheck(passwd);
            phone1 = util.getNullBlankCheck(phone1);
            phone2 = util.getNullBlankCheck(phone2);
            phone3 = util.getNullBlankCheck(phone3);
            email1 = util.getNullBlankCheck(email1);
            email2 = util.getNullBlankCheck(email2);
            postcode = util.getNullBlankCheck(postcode);
            address = util.getNullBlankCheck(address);
            detailAddress = util.getNullBlankCheck(detailAddress);
            extraAddress = util.getNullBlankCheck(extraAddress);

            int failCounter = 0;
            if(passwd.equals("")) { failCounter++; }
            if(phone1.equals("")) { failCounter++; }
            if(phone2.equals("")) { failCounter++; }
            if(phone3.equals("")) { failCounter++; }
            if(email1.equals("")) { failCounter++; }
            if(email2.equals("")) { failCounter++; }
            if(postcode.equals("")) { failCounter++; }
            if(address.equals("")) { failCounter++; }
            if(detailAddress.equals("")) { failCounter++; }
            if(extraAddress.equals("")) { extraAddress = "-"; }
			
			
			//전화번호 체크
			if(!(phone1.equals("010") || phone1.equals("011") || phone1.equals("016"))) {
				failCounter++;
			}
			int imsiPhone2 = util.getNumberCheck(phone2, 0);
			if(!(phone2.length() == 4 && imsiPhone2 >= 0)) {
				failCounter++;
			}
			int imsiPhone3 = util.getNumberCheck(phone3, 0);
			if(!(phone3.length() == 4 && imsiPhone3 >= 0)) {
				failCounter++;
			}
			
			if(failCounter > 0) {
				return;
			}
			
			//entity check
            passwd = util.getCheckString(passwd);
            phone1 = util.getCheckString(phone1);
            phone2 = util.getCheckString(phone2);
            phone3 = util.getCheckString(phone3);
            email1 = util.getCheckString(email1);
            email2 = util.getCheckString(email2);
            postcode = util.getCheckString(postcode);
            address = util.getCheckString(address);
            detailAddress = util.getCheckString(detailAddress);
            extraAddress = util.getCheckString(extraAddress);
			
			//비밀번호 DB비밀번호 비교
			MemberDTO arguDto = new MemberDTO();
            arguDto.setNo(no);
            arguDto.setPasswd(passwd);
            arguDto.setPhone1(phone1);
            arguDto.setPhone2(phone2);
            arguDto.setPhone3(phone3);
            arguDto.setEmail1(email1);
            arguDto.setEmail2(email2);
            arguDto.setPostcode(postcode);
            arguDto.setAddress(address);
            arguDto.setDetailAddress(detailAddress);
            arguDto.setExtraAddress(extraAddress);

            MemberDAO dao = new MemberDAO();
            MemberDTO returnDto = dao.getSelectOne(arguDto);
		
            if(!passwd.equals(returnDto.getPasswd())) {
            	failCounter ++;
            	return;
            }
            
            int result = dao.setUpdate(arguDto);
            
            if(result > 0) {
                response.sendRedirect(path + "/member_servlet/member_view.do?no=" + no + "&" + searchQuery);
             } else {
                response.sendRedirect(path + "/member_servlet/member_sujung.do?no=" + no + "&" + searchQuery);
             }
            
		} else if (fileName.equals("sakjeProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				System.out.println("no : " + no);
				return;
			}
			
			String passwd = request.getParameter("passwd");
			
			passwd = util.getNullBlankCheck(passwd);
			
			int failCounter = 0;
	        if(passwd.equals("")) { failCounter++; }
			
	        if(failCounter > 0) {
				return;
			}
	        
	        passwd = util.getCheckString(passwd);
	        
	        MemberDTO arguDto = new MemberDTO();
            arguDto.setNo(no);
            arguDto.setPasswd(passwd);
	        
            MemberDAO dao = new MemberDAO();
            MemberDTO returnDto = dao.getSelectOne(arguDto);
		
            if(!passwd.equals(returnDto.getPasswd())) {
            	failCounter ++;
            	return;
            }
            
            int result = dao.setDelete(arguDto);
            
            if(result > 0) {
                response.sendRedirect(path + "/member_servlet/member_list.do" + "?" + searchQuery);
             } else {
                response.sendRedirect(path + "/member_servlet/member_sakje.do?no=" + no + "&" + searchQuery);
             }
            
		} else if (fileName.equals("idCheckWin")) {
			forwardPage = "/WEB-INF/project/member/idCheckWin.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
            
		}  else if (fileName.equals("idCheckWinProc")) {
			String id = request.getParameter("id");
			id = util.getNullBlankCheck(id);
			
			MemberDTO arguDto = new MemberDTO();
			arguDto.setId(id);
			
			MemberDAO dao = new MemberDAO();
			int result = dao.getIdCheckWin(arguDto);
			
			String imsiId = id;
			String msg = "사용 가능한 아이디입니다.";
			if(result > 0) {
				imsiId = "";
				msg = "불가능한 아이디입니다.";
			}
			request.setAttribute("imsiId", imsiId);
			request.setAttribute("id", id);
			request.setAttribute("msg", msg);
			
			forwardPage = "/WEB-INF/project/member/idCheckWin.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else {
			System.out.println("없는 페이지입니다");
		}
		
		
	}

}
