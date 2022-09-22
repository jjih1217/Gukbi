package project.member.controller;

import java.io.IOException;
import java.util.ArrayList;

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
		
		request.setAttribute("path", path);
		request.setAttribute("ip", ip);
		request.setAttribute("folderName", folderName);
		request.setAttribute("fileName", fileName);
		
		String forwardPage = "/WEB-INF/project/main/main.jsp"; // 무조건 메인으로 이동
		if(fileName.equals("list")) {
			MemberDAO dao = new MemberDAO();
			ArrayList<MemberDTO> list  = dao.getSelectAll();
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if (fileName.equals("view")) {
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
			
		} else if (fileName.equals("chugaProc")) {
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
               response.sendRedirect(path + "/member_servlet/member_chuga.do");
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
                response.sendRedirect(path + "/member_servlet/member_view.do?no=" + no);
             } else {
                response.sendRedirect(path + "/member_servlet/member_sujung.do?no=" + no);
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
                response.sendRedirect(path + "/member_servlet/member_list.do");
             } else {
                response.sendRedirect(path + "/member_servlet/member_sakje.do?no=" + no);
             }
            
	        
		} else {
			System.out.println("없는 페이지입니다");
		}
		
		
	}

}
