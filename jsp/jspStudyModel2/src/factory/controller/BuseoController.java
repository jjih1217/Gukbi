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
import factory.model.dto.BuseoDTO;

@WebServlet("/buseo_servlet/*")
public class BuseoController extends HttpServlet {
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
		
		String forwardPage = "/WEB-INF/_test/factory/buseo";
		
		if(imsiUriFileName.equals("list.do")) {
			BuseoDAO dao = new BuseoDAO();
			ArrayList<BuseoDTO> list = dao.getSelectAll();
			
			request.setAttribute("list", list);
			
			forwardPage += "/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("view.do")) {
			String buseoNo_ = request.getParameter("buseoNo_");
			int buseoNo = util.getNumberCheck(buseoNo_, 0);
			
			BuseoDTO arguDto = new BuseoDTO();
			arguDto.setBuseoNo(buseoNo);
			
			BuseoDAO dao = new BuseoDAO();
			BuseoDTO returnDto = dao.getSelectOne(arguDto);
			
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("chuga.do")) {
			forwardPage += "/chuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("sujung.do")) {
			String buseoNo_ = request.getParameter("buseoNo");
			int buseoNo = util.getNumberCheck(buseoNo_, 0);
			
			BuseoDTO arguDto = new BuseoDTO();
			arguDto.setBuseoNo(buseoNo);
			
			BuseoDAO dao = new BuseoDAO();
			BuseoDTO returnDto = dao.getSelectOne(arguDto);
			
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/sujung.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("sakje.do")) {
			String buseoNo_ = request.getParameter("buseoNo");
			int buseoNo = util.getNumberCheck(buseoNo_, 0);
			
			BuseoDTO arguDto = new BuseoDTO();
			arguDto.setBuseoNo(buseoNo);
			
			BuseoDAO dao = new BuseoDAO();
			BuseoDTO returnDto = dao.getSelectOne(arguDto);
			
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/sakje.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("chugaProc.do")) {
			String buseoName = request.getParameter("buseoName");
			
			BuseoDTO arguDto = new BuseoDTO();
			arguDto.setBuseoName(buseoName);
			
			BuseoDAO dao = new BuseoDAO();
			int result = dao.setInsert(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/buseo_servlet/list.do");
			} else {
				response.sendRedirect(path + "/buseo_servlet/chuga.do");
			}
			
		} else if(imsiUriFileName.equals("sujungProc.do")) {
			String buseoNo_ = request.getParameter("buseoNo");
			String buseoName = request.getParameter("buseoName");
			
			int buseoNo = util.getNumberCheck(buseoNo_, 0);
			
			BuseoDTO arguDto = new BuseoDTO();
			arguDto.setBuseoNo(buseoNo);
			arguDto.setBuseoName(buseoName);
			
			BuseoDAO dao = new BuseoDAO();
			int result = dao.setUpdate(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/buseo_servlet/view.do?buseoNo=" + buseoNo);
			} else {
				response.sendRedirect(path + "/buseo_servlet/sujung.do?buseoNo=" + buseoNo);
			}
			
			
		} else if(imsiUriFileName.equals("sakjeProc.do")) {
			String buseoNo_ = request.getParameter("buseoNo");
			
			int buseoNo = util.getNumberCheck(buseoNo_, 0);
			
			BuseoDTO arguDto = new BuseoDTO();
			arguDto.setBuseoNo(buseoNo);
			
			BuseoDAO dao = new BuseoDAO();
			int result = dao.setDelete(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/buseo_servlet/list.do");
			} else {
				response.sendRedirect(path + "/buseo_servlet/sakje.do?buseoNo=" + buseoNo);
			}
			
		} else {
			System.out.println("존재하지않는 페이지 입니다");
		}
	}

}
