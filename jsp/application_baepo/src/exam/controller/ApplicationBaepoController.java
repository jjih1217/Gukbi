package exam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.common.Util;
import exam.model.dao.ApplicationDAO;
import exam.model.dto.ApplicationDTO;

@WebServlet("/ApplicationBaepoController/*")
public class ApplicationBaepoController extends HttpServlet {
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
		
		//로그인
		String[] sessionArray = util.getSessionCheck(request);
		int sessionNo = Integer.parseInt(sessionArray[0]);
		String sessionId = sessionArray[1];
		String sessionName = sessionArray[2];
		
		request.setAttribute("referer", referer);
		request.setAttribute("path", path);
		request.setAttribute("ip", ip);
		request.setAttribute("folderName", folderName);
		request.setAttribute("fileName", fileName);
		
		String forwardPage = "/WEB-INF/exam/";
		if(fileName.equals("list")) { 
			ApplicationDAO dao = new ApplicationDAO(); 
			List<ApplicationDTO> list = dao.getSelectAll(); 
			request.setAttribute("list", list);
			 
			forwardPage += "list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			
			rd.forward(request, response);
		} else if (fileName.equals("join")) {
			forwardPage += "join.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if (fileName.equals("view")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			ApplicationDTO arguDto = new ApplicationDTO();
			arguDto.setNo(no);
			
			ApplicationDAO dao = new ApplicationDAO();
			ApplicationDTO returnDto = dao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			forwardPage += "view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if (fileName.equals("joinProc")) {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String passwdChk = request.getParameter("passwdChk");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String birth_ = request.getParameter("birth");
			String postcode = request.getParameter("sample6_postcode");
            String address = request.getParameter("sample6_address");
            String detailAddress = request.getParameter("sample6_detailAddress");
            String extraAddress = request.getParameter("sample6_extraAddress");
            
            id = util.getNullBlankCheck(id);
            passwd = util.getNullBlankCheck(passwd);
            passwdChk = util.getNullBlankCheck(passwdChk);
            name = util.getNullBlankCheck(name);
            gender = util.getNullBlankCheck(gender);
            birth_ = util.getNullBlankCheck(birth_);
            postcode = util.getNullBlankCheck(postcode);
            address = util.getNullBlankCheck(address);
            detailAddress = util.getNullBlankCheck(detailAddress);
            extraAddress = util.getNullBlankCheck(extraAddress);
            
            int failCounter = 0;
            if(id.equals("")) { failCounter++; }
            if(passwd.equals("")) { failCounter++; }
            if(passwdChk.equals("")) { failCounter++; }
            if(name.equals("")) { failCounter++; }
            if(gender.equals("")) { failCounter++; }
            if(birth_.equals("")) { failCounter++; }
            if(postcode.equals("")) { failCounter++; }
            if(address.equals("")) { failCounter++; }
            if(detailAddress.equals("")) { failCounter++; }
            if(extraAddress.equals("")) { extraAddress = "-"; }
			if(!passwd.equals("") && passwd.equals(passwdChk) ) {
							
			} else {
				failCounter++;
				response.sendRedirect(path + "/ApplicationBaepoController/exam_join.do");
			}
			
			if(failCounter > 0) {
				System.out.println("failCounter : " + failCounter);
				return;
			}
			
			id = util.getCheckString(id);
            passwd = util.getCheckString(passwd);
            name = util.getCheckString(name);
            gender = util.getCheckString(gender);
            birth_ = util.getCheckString(birth_);
            postcode = util.getCheckString(postcode);
            address = util.getCheckString(address);
            detailAddress = util.getCheckString(detailAddress);
            extraAddress = util.getCheckString(extraAddress);
            
            int birth = Integer.parseInt(birth_);
            
            ApplicationDTO arguDto = new ApplicationDTO();
            arguDto.setId(id);
            arguDto.setPasswd(passwd);
            arguDto.setName(name);
            arguDto.setGender(gender);
            arguDto.setBirth(birth);
            arguDto.setBirth(birth);
            arguDto.setPostcode(postcode);
            arguDto.setAddress(address);
            arguDto.setDetailAddress(detailAddress);
            arguDto.setExtraAddress(extraAddress);
            
            ApplicationDAO dao = new ApplicationDAO();
            int result = dao.setInsert(arguDto);
            
            if(result > 0) {
                response.sendRedirect(path + "/ApplicationBaepoController/exam_list.do");
             } else {
                response.sendRedirect(path + "/ApplicationBaepoController/exam_join.do");
             }
		}
	
	}

}
