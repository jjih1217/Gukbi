package haksa.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _common.Util;
import haksa.model.dao.StudentDAO;
import haksa.model.dto.StudentDTO;

@WebServlet("/haksaStudent_servlet/*")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public StudentController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Util util = new Util();
		
		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI().toString();
		
		request.setAttribute("path", path);
		
		String[] imsiUriArray = uri.split("/");
		String imsiUriFileName = imsiUriArray[imsiUriArray.length - 1];
		
		String forwardPage = "/WEB-INF/_test/haksa/student";
		
		if(imsiUriFileName.equals("list.do")) {
			StudentDAO dao = new StudentDAO();
			ArrayList<StudentDTO> list = dao.getSelectAll();
			
			request.setAttribute("list", list);
			
			forwardPage += "/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("view.do")) {
			String hakbun_ = request.getParameter("hakbun");
			int hakbun = util.getNumberCheck(hakbun_, 0);
			
			StudentDTO arguDto = new StudentDTO();
			arguDto.setHakbun(hakbun);
			
			StudentDAO studentDao = new StudentDAO();
			StudentDTO returnDto = studentDao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("chuga.do")) {
			forwardPage += "/chuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("sujung.do")) {
			String hakbun_ = request.getParameter("hakbun");
			int hakbun = util.getNumberCheck(hakbun_, 0);
			
			StudentDTO arguDto = new StudentDTO();
			arguDto.setHakbun(hakbun);
			
			StudentDAO studentDao = new StudentDAO();
			StudentDTO returnDto = studentDao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/sujung.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("sakje.do")) {
			String hakbun_ = request.getParameter("hakbun");
			int hakbun = util.getNumberCheck(hakbun_, 0);
			
			StudentDTO arguDto = new StudentDTO();
			arguDto.setHakbun(hakbun);
			
			StudentDAO studentDao = new StudentDAO();
			StudentDTO returnDto = studentDao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/sakje.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("chugaProc.do")) {
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String parentPhone = request.getParameter("parentPhone");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String addr3 = request.getParameter("addr3");
			String addr4 = request.getParameter("addr4");
			
			StudentDTO arguDto = new StudentDTO();
			arguDto.setName(name);
			arguDto.setPhone(phone);
			arguDto.setParentPhone(parentPhone);
			arguDto.setAddr1(addr1);
			arguDto.setAddr2(addr2);
			arguDto.setAddr3(addr3);
			arguDto.setAddr4(addr4);
			
			StudentDAO dao = new StudentDAO();
			int result = dao.setInsert(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaStudent_servlet/list.do");
			} else {
				response.sendRedirect(path + "/haksaStudent_servlet/chuga.do");
			}
					
		} else if(imsiUriFileName.equals("sujungProc.do")) {
			String hakbun_ = request.getParameter("hakbun");
			int hakbun = util.getNumberCheck(hakbun_, 0);
			String phone = request.getParameter("phone");
			String parentPhone = request.getParameter("parentPhone");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String addr3 = request.getParameter("addr3");
			String addr4 = request.getParameter("addr4");
			
			StudentDTO arguDto = new StudentDTO();
			arguDto.setHakbun(hakbun);
			arguDto.setPhone(phone);
			arguDto.setParentPhone(parentPhone);
			arguDto.setAddr1(addr1);
			arguDto.setAddr2(addr2);
			arguDto.setAddr3(addr3);
			arguDto.setAddr4(addr4);
			
			StudentDAO dao = new StudentDAO();
			int result = dao.setUpdate(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaStudent_servlet/view.do?hakbun=" + hakbun);
			} else {
				response.sendRedirect(path + "/haksaStudent_servlet/sujung.do?hakbun=" + hakbun );
			}
			
		} else if(imsiUriFileName.equals("sakjeProc.do")) {
			String hakbun_ = request.getParameter("hakbun");
			int hakbun = util.getNumberCheck(hakbun_, 0);
			
			StudentDTO arguDto = new StudentDTO();
			arguDto.setHakbun(hakbun);
			
			StudentDAO dao = new StudentDAO();
			int result = dao.setDelete(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaStudent_servlet/list.do");
			} else {
				response.sendRedirect(path + "/haksaStudent_servlet/sakje.do?hakbun=" + hakbun );
			}
		}
		
		
	}

}
