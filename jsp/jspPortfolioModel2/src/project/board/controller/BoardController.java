package project.board.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.board.model.dao.BoardDAO;
import project.board.model.dto.BoardDTO;
import project.common.Util;

@WebServlet("/board_servlet/*")
public class BoardController extends HttpServlet {
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
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("view")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("chuga")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("sujung")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("sakje")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("chugaProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				return;
			}
			
			String writer = request.getParameter("writer");
			String email = request.getParameter("email");
			String passwd = request.getParameter("passwd");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String noticeGubun = request.getParameter("noticeGubun");
			String secretGubun = request.getParameter("secretGubun");
			String attachInfo = "";

			writer = util.getNullBlankCheck(writer);
			email = util.getNullBlankCheck(email);
			passwd = util.getNullBlankCheck(passwd);
			subject = util.getNullBlankCheck(subject);
			content = util.getNullBlankCheck(content);
			noticeGubun = util.getNullBlankCheck(noticeGubun);
			secretGubun = util.getNullBlankCheck(secretGubun);
			
			int failCounter = 0;
			if(writer.equals("")) {
				failCounter++;
			}
			if(email.equals("")) {
				email = "-";
			}
			if(passwd.equals("")) {
				failCounter++;
			}
			if(content.equals("")) {
				failCounter++;
			}
			if(noticeGubun.equals("")) {
				failCounter++;
			}
			if(secretGubun.equals("")) {
				failCounter++;
			}
			if(failCounter > 0) {
				System.out.println("failCounter : " + failCounter);
				return;
			}
			
			writer = util.getCheckString(writer);
			email = util.getCheckString(email);
			content = util.getCheckString(content);
			passwd = util.getCheckString(passwd);
			content = util.getCheckString(content);
			
			BoardDAO dao = new BoardDAO();
			int num = dao.getMaxNumRefNo("num") + 1;
			
			//새글
			int refNo = dao.getMaxNumRefNo("refNo") + 1;
			int stepNo = 1;
			int levelNo = 1;
			int parentNo = 0;
			
			if(no > 0) { //답변글
				BoardDTO boardDto1 = new BoardDTO();
				boardDto1.setNo(no);
				
				BoardDAO boardDao1 = new BoardDAO();
				BoardDTO boardDto2 = boardDao1.getSelectOne(boardDto1);
				
				boardDao1.setUpdateRelevel(boardDto2);
				//부모글의 levelNo보다 큰 levelNo들은 1씩 증가
				refNo = boardDto2.getRefNo(); //부모글의 refNo
				stepNo = boardDto2.getStepNo() + 1; //부모글의 stepNo + 1
				levelNo = boardDto2.getLevelNo() + 1; //부모글의 levelNo + 1
				parentNo = no;
			}
			
			int hit = 0;
			
			//String ip = "";
			int memberNo = sessionNo;
			
			int noticeNo = 0;
			if(noticeGubun.equals("T")) { //공지글이면
				noticeNo = dao.getMaxNumRefNo("noticeNo") + 1;	
			}
			
			
			
			BoardDTO arguDto = new BoardDTO();
			
			
			
		} else if(fileName.equals("sujungProc")) {
			
		} else if(fileName.equals("sakjeProc")) {
			
		} else if(fileName.equals("search")) {
			
		} else {
			System.out.println("존재하지 않는 URL");
		}
	}
	
}
