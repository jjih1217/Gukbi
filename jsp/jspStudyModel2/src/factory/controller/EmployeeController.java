package factory.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _common.Util;
import factory.model.dao.BuseoDAO;
import factory.model.dao.EmployeeDAO;
import factory.model.dto.BuseoDTO;
import factory.model.dto.EmployeeDTO;
import haksa.model.dao.StudentDAO;
import haksa.model.dto.StudentDTO;

@WebServlet("/employee_servlet/*")
public class EmployeeController extends HttpServlet {
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
		
		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI().toString();
		
		request.setAttribute("path", path);
		
		String[] imsiUriArray = uri.split("/");
		String imsiUriFileName = imsiUriArray[imsiUriArray.length - 1];
		
		String forwardPage = "/WEB-INF/_test/factory/employee";
		
		if(imsiUriFileName.equals("list.do")) {
			EmployeeDAO dao = new EmployeeDAO();
			ArrayList<EmployeeDTO> list = dao.getSelectAll();
			
			request.setAttribute("list", list);
			
			forwardPage += "/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("view.do")) {
			String sabun_ = request.getParameter("sabun");
			int sabun = util.getNumberCheck(sabun_, 0);
			
			EmployeeDTO arguDto = new EmployeeDTO();
			arguDto.setSabun(sabun);
			
			EmployeeDAO dao = new EmployeeDAO();
			EmployeeDTO returnDto = dao.getSelectOne(arguDto);
			
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("chuga.do")) {
			BuseoDAO buseoDao = new BuseoDAO();
			ArrayList<BuseoDTO> buseoList = buseoDao.getSelectAll();
			request.setAttribute("buseoList", buseoList);
			
			forwardPage += "/chuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("sujung.do")) {
			BuseoDAO buseoDao = new BuseoDAO();
			ArrayList<BuseoDTO> buseoList = buseoDao.getSelectAll();
			request.setAttribute("buseoList", buseoList);
			
			String sabun_ = request.getParameter("sabun");
			int sabun = util.getNumberCheck(sabun_, 0);
			
			EmployeeDTO arguDto = new EmployeeDTO();
			arguDto.setSabun(sabun);
			
			EmployeeDAO dao = new EmployeeDAO();
			EmployeeDTO returnDto = dao.getSelectOne(arguDto);
			
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/sujung.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("sakje.do")) {
			String sabun_ = request.getParameter("sabun");
			int sabun = util.getNumberCheck(sabun_, 0);
			
			EmployeeDTO arguDto = new EmployeeDTO();
			arguDto.setSabun(sabun);
			
			EmployeeDAO dao = new EmployeeDAO();
			EmployeeDTO returnDto = dao.getSelectOne(arguDto);
			
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/sakje.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("chugaProc.do")) {
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String hireDate_ = request.getParameter("hireDate");
			String email = request.getParameter("email");
			String salary_ = request.getParameter("salary");
			String buseoNo_ = request.getParameter("buseoNo");
			
			int salary = util.getNumberCheck(salary_, 0);
			int buseoNo = util.getNumberCheck(buseoNo_, 0);
			Date hireDate = Date.valueOf(hireDate_);
			
			EmployeeDTO arguDto = new EmployeeDTO();
			arguDto.setName(name);
			arguDto.setPhone(phone);
			arguDto.setHireDate(hireDate);
			arguDto.setEmail(email);
			arguDto.setSalary(salary);
			arguDto.setBuseoNo(buseoNo);
			
			EmployeeDAO dao = new EmployeeDAO();
			int result = dao.setInsert(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/employee_servlet/list.do");
			} else {
				response.sendRedirect(path + "/employee_servlet/chuga.do");
			}
			
		} else if(imsiUriFileName.equals("sujungProc.do")) {
			String sabun_ = request.getParameter("sabun");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String hireDate_ = request.getParameter("hireDate");
			String email = request.getParameter("email");
			String salary_ = request.getParameter("salary");
			String buseoNo_ = request.getParameter("buseoNo");
			
			int sabun = util.getNumberCheck(sabun_, 0);
			int salary = util.getNumberCheck(salary_, 0);
			int buseoNo = util.getNumberCheck(buseoNo_, 0);
			Date hireDate = Date.valueOf(hireDate_);
			
			EmployeeDTO arguDto = new EmployeeDTO();
			arguDto.setSabun(sabun);
			arguDto.setName(name);
			arguDto.setPhone(phone);
			arguDto.setHireDate(hireDate);
			arguDto.setEmail(email);
			arguDto.setSalary(salary);
			arguDto.setBuseoNo(buseoNo);
			
			EmployeeDAO dao = new EmployeeDAO();
			int result = dao.setUpdate(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/employee_servlet/view.do?sabun=" + sabun);
			} else {
				response.sendRedirect(path + "/employee_servlet/sujung.do?sabun=" + sabun);
			}
			
			
		} else if(imsiUriFileName.equals("sakjeProc.do")) {
			String sabun_ = request.getParameter("sabun");
			int sabun = util.getNumberCheck(sabun_, 0);
			
			EmployeeDTO arguDto = new EmployeeDTO();
			arguDto.setSabun(sabun);
			
			EmployeeDAO dao = new EmployeeDAO();
			int result = dao.setDelete(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/employee_servlet/list.do");
			} else {
				response.sendRedirect(path + "/employee_servlet/sakje.do?sabun=" + sabun);
			}
			
		} else {
			System.out.println("존재하지않는 페이지 입니다");
		}
	}

}
