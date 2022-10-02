package project.guestBookMybatis.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.common.Util;
import project.guestBookMybatis.model.dao.GuestBookMybatisDAO;
import project.guestBookMybatis.model.dto.GuestBookMybatisDTO;


@WebServlet("/guestBookMybatis_servlet/*")
public class GuestBookController extends HttpServlet {
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
		
		/*
		if(sessionNo <= 0) { //로그인 안한 상태
			//response.sendRedirect(path + "/noLogin_servlet/noLogin_login.do");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용하세요');");
			out.println("location.href='" + path + "';");
			out.println("</script>");
			out.flush();
			out.close();
			return;
		}
		*/
		request.setAttribute("referer", referer);
		request.setAttribute("path", path);
		request.setAttribute("ip", ip);
		request.setAttribute("folderName", folderName);
		request.setAttribute("fileName", fileName);
		
		//페이징
		String pageNumber_ = request.getParameter("pageNumber");
		int pageNumber = util.getNumberCheck(pageNumber_, 1);
		request.setAttribute("pageNumber", pageNumber);
		
		//검색
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
		String searchQuery2 = "searchGubun=&searchData=";
		if(imsiSearchYN.equals("O")) {
			String imsiSerchGubun = URLEncoder.encode(searchGubun,"UTF-8");
			String imsiSerchData = URLEncoder.encode(searchData,"UTF-8");
			searchQuery = "pageNumber=" + pageNumber + "&searchGubun=" + imsiSerchGubun + "&searchData=" + imsiSerchData;
			searchQuery2 = "searchGubun=" + imsiSerchGubun + "&searchData=" + imsiSerchData;
		}
		
		request.setAttribute("searchGubun", searchGubun);
		request.setAttribute("searchData", searchData);
		request.setAttribute("searchQuery", searchQuery);
		request.setAttribute("searchQuery2", searchQuery2);
		
		String forwardPage = "/WEB-INF/project/main/main.jsp";
		if(fileName.equals("list")) {
			GuestBookMybatisDTO arguDto2 = new GuestBookMybatisDTO();
			arguDto2.setSearchGubun(searchGubun);
			arguDto2.setSearchData(searchData);

			GuestBookMybatisDAO dao = new GuestBookMybatisDAO();
			
			int pageSize = 1;
			int blockSize = 10;
			int totalRecord = dao.getTotalRecord(arguDto2);
			request.setAttribute("totalRecord", totalRecord);
			
			Map<String, Integer> map = util.getPagerMap(pageNumber, pageSize, blockSize, totalRecord);
			map.put("blockSize", blockSize);
			request.setAttribute("map", map);
			
			GuestBookMybatisDTO arguDto = new GuestBookMybatisDTO();
			arguDto.setSearchGubun(searchGubun);
			arguDto.setSearchData(searchData);
			arguDto.setStartRecord(map.get("startRecord"));
			arguDto.setLastRecord(map.get("lastRecord"));
			
			List<GuestBookMybatisDTO> list = dao.getSelectAll(arguDto);
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if (fileName.equals("view")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if (fileName.equals("chuga")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if (fileName.equals("chugaProc")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");
			
			name = util.getNullBlankCheck(name);
			email = util.getNullBlankCheck(email);
			passwd = util.getNullBlankCheck(passwd);
			content = util.getNullBlankCheck(content);
			int memberNo = 0;
			
			int failCounter = 0;
			if(name.equals("")) {
				failCounter++;
			}
			if(email.equals("")) {
				email = "-";
			}
			if(passwd.equals("")) {
				failCounter++;
			}
			if(content.equals("")) {
				content = "-";
			}
			
			if(failCounter > 0) {
				System.out.println("failCounter : " + failCounter);
				return;
			}
			
			name = util.getCheckString(name);
			email = util.getCheckString(email);
			passwd = util.getCheckString(passwd);
			content = util.getCheckString(content);
			
			GuestBookMybatisDTO arguDto = new GuestBookMybatisDTO();
			arguDto.setName(name);
			arguDto.setEmail(email);
			arguDto.setPasswd(passwd);
			arguDto.setContent(content);
			arguDto.setMemberNo(memberNo);
			
			GuestBookMybatisDAO dao = new GuestBookMybatisDAO();
			int result = dao.setInsert(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/guestBookMybatis_servlet/guestBookMybatis_list.do");
			} else {
				response.sendRedirect(path + "/guestBookMybatis_servlet/guestBookMybatis_chuga.do");
			}
			
			
		} else if (fileName.equals("sujung")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				return;
			}
			
			GuestBookMybatisDTO arguDto = new GuestBookMybatisDTO();
			arguDto.setNo(no);
			
			GuestBookMybatisDAO dao = new GuestBookMybatisDAO();
			GuestBookMybatisDTO returnDto = dao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if (fileName.equals("sujungProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				return;
			}
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String passwd = request.getParameter("passwd");
			String content = request.getParameter("content");
			
			name = util.getNullBlankCheck(name);
			email = util.getNullBlankCheck(email);
			passwd = util.getNullBlankCheck(passwd);
			content = util.getNullBlankCheck(content);
			
			
			int failCounter = 0;
			if(name.equals("")) {
				failCounter++;
			}
			if(email.equals("")) {
				email = "-";
			}
			if(passwd.equals("")) {
				failCounter++;
			}
			if(content.equals("")) {
				content = "-";
			}
			
			if(failCounter > 0) {
				System.out.println("failCounter : " + failCounter);
				return;
			}
			
			name = util.getCheckString(name);
			email = util.getCheckString(email);
			passwd = util.getCheckString(passwd);
			content = util.getCheckString(content);
			int memberNo = 0;
			
			GuestBookMybatisDTO arguDto = new GuestBookMybatisDTO();
			arguDto.setNo(no);
			arguDto.setName(name);
			arguDto.setEmail(email);
			arguDto.setPasswd(passwd);
			arguDto.setContent(content);
			arguDto.setMemberNo(memberNo);
			
			GuestBookMybatisDAO dao = new GuestBookMybatisDAO();
			int result = dao.setUpdate(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/guestBookMybatis_servlet/guestBookMybatis_list.do?" + searchQuery);
			} else {
				response.sendRedirect(path + "/guestBookMybatis_servlet/guestBookMybatis_sujung.do?no=" + no + "&" + searchQuery );
			}
			
			
		} else if (fileName.equals("sakje")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				return;
			}
			
			GuestBookMybatisDTO arguDto = new GuestBookMybatisDTO();
			arguDto.setNo(no);
			
			GuestBookMybatisDAO dao = new GuestBookMybatisDAO();
			GuestBookMybatisDTO returnDto = dao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if (fileName.equals("sakjeProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				return;
			}
			
			String passwd = request.getParameter("passwd");
			passwd = util.getCheckString(passwd);
			
			GuestBookMybatisDTO arguDto = new GuestBookMybatisDTO();
			arguDto.setNo(no);
			arguDto.setPasswd(passwd);
			
			GuestBookMybatisDAO dao = new GuestBookMybatisDAO();
			int result = dao.setDelete(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/guestBookMybatis_servlet/guestBookMybatis_list.do?" + searchQuery2);
			} else {
				response.sendRedirect(path + "/guestBookMybatis_servlet/guestBookMybatis_sakje.do?no=" + no + "&" + searchQuery);
			}
		} else if (fileName.equals("search")) {
			response.sendRedirect(path + "/guestBookMybatis_servlet/guestBookMybatis_list.do?" + searchQuery);
			
		} else {
			System.out.println("존재하지 않는 URL");
		}
		
	}

}
