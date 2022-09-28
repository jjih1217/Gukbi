package application_testModel2.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import application_testModel2.member.model.dao.MemberDAO;
import application_testModel2.member.model.dto.MemberDTO;
import common.Util;


@WebServlet("/MemberController/*")
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
		
		String forwardPage = "/WEB-INF/member/main.jsp";
		if(fileName.equals("login")) { 
			
			forwardPage = "/WEB-INF/member/login.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("loginProc")) {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
		   	
		    MemberDTO arguDto = new MemberDTO();
		   	arguDto.setId(id);
		   	arguDto.setPasswd(passwd);
		   	
		   	MemberDAO dao = new MemberDAO();
		   	MemberDTO returnDto = dao.getLogin(arguDto);
		   	
		   	String msg = "아이디 또는 비밀번호가 다릅니다.\\n다시 이용해주세요";
		   	if(returnDto.getId() != null) {
				msg = "정상적으로 로그인되었습니다.";
				HttpSession session = request.getSession();
				session.setMaxInactiveInterval(1*60);
				session.setAttribute("sessionId", returnDto.getId());
				
				if(returnDto.getMonth() > 6) {
					
					response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('6개월동안 비밀번호를 변경하지 않았습니다.\\\\n비밀번호변경 페이지로 이동합니다');");
					out.println("location.href='change.jsp';");
					out.println("</script>");
					out.flush();
					out.close();
					return;
					
		   		} else {
		   			response.setContentType("text/html; charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('로그인 성공');");
					out.println("location.href='main.jsp';");
					out.println("</script>");
					out.flush();
					out.close();
					return;
		   		}
				
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("location.href='login.jsp';");
				out.println("</script>");
				out.flush();
				out.close();
				return;
				
			}
		   	
		} else if(fileName.equals("change")) {
			if(sessionNo <= 0) { //로그인 안한 상태
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인 후 이용하세요');");
				out.println("location.href='main.jsp';");
				out.println("</script>");
				out.flush();
				out.close();
				return;
			}
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("sujungProc")) {
			String id = request.getParameter("id");
		   	String passwd = request.getParameter("passwd");
		   	String passwdChk = request.getParameter("passwdChk");
		   	
		   	int failCounter = 0;
		   	if(passwd == null || passwdChk == null || passwd.trim().equals("") || passwdChk.trim().equals("")) {
		   		response.sendRedirect("change.jsp");
		   		return;
		   	} 
		   	
		 	if(!passwd.equals(passwdChk) ) {
		 		response.sendRedirect("change.jsp");
		 		return;
			}
		   	
		 	//String sessionId = (String) session.getAttribute("sessionId");
		 	
		   	MemberDTO arguDto = new MemberDTO();
		   	arguDto.setId(sessionId);
		   	arguDto.setPasswd(passwd);
		   	
			MemberDAO dao = new MemberDAO();
		   	int result  = dao.setUpdate(arguDto);
		   
		   	if (result > 0) {
		   		
		   		PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('비밀번호 변경 성공')");	
				out.println("location.href='main.jsp';");
				out.println("</script>");
				out.flush();
				out.close();
				return;
				
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정 중 오류 발생')");	
				out.println("location.href='change.jsp';");
				out.println("</script>");
				out.flush();
				out.close();
				return;
			}
		   	
		}  else if(fileName.equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그아웃되었습니다.');");
			out.println("location.href='main.jsp';");
			out.println("</script>");
			out.flush();
			out.close();
			return;
			
		}

	
	}

}
