package haksa.controller;

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
import haksa.model.dao.SihumDAO;
import haksa.model.dto.SihumDTO;

@WebServlet("/haksaSihum_servlet/*")
public class SihumController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public SihumController() {
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
		
		String forwardPage = "/WEB-INF/_test/haksa/sihum";
		
		if(imsiUriFileName.equals("list.do")) {
			SihumDAO dao = new SihumDAO();
			ArrayList<SihumDTO> list = dao.getSelectAll();
			
			request.setAttribute("list", list);
			
			forwardPage += "/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("view.do")) {
			String sihumNo_ = request.getParameter("sihumNo");
			int sihumNo = util.getNumberCheck(sihumNo_, 0);
			
			SihumDTO arguDto = new SihumDTO();
			arguDto.setSihumNo(sihumNo);
			
			SihumDAO sihumDao = new SihumDAO();
			SihumDTO returnDto = sihumDao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("chuga.do")) {
			forwardPage += "/chuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("sujung.do")) {
			String sihumNo_ = request.getParameter("sihumNo");
			int sihumNo = util.getNumberCheck(sihumNo_, 0);
			
			SihumDTO arguDto = new SihumDTO();
			arguDto.setSihumNo(sihumNo);
			
			SihumDAO sihumDao = new SihumDAO();
			SihumDTO returnDto = sihumDao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/sujung.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("sakje.do")) {
			String sihumNo_ = request.getParameter("sihumNo");
			int sihumNo = util.getNumberCheck(sihumNo_, 0);
			
			SihumDTO arguDto = new SihumDTO();
			arguDto.setSihumNo(sihumNo);
			
			SihumDAO sihumDao = new SihumDAO();
			SihumDTO returnDto = sihumDao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/sakje.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("chugaProc.do")) {
			String sihumName = request.getParameter("sihumName");
			String sihumDate_ = request.getParameter("sihumDate");
			Date sihumDate = Date.valueOf(sihumDate_);
			
			SihumDTO arguDto = new SihumDTO();
			arguDto.setSihumName(sihumName);
			arguDto.setSihumDate(sihumDate);
			
			SihumDAO dao = new SihumDAO();
			int result = dao.setInsert(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaSihum_servlet/list.do");
			} else {
				response.sendRedirect(path + "/haksaSihum_servlet/chuga.do");
			}
					
		} else if(imsiUriFileName.equals("sujungProc.do")) {
			String sihumNo_ = request.getParameter("sihumNo");
			int sihumNo = util.getNumberCheck(sihumNo_, 0);
			String sihumName = request.getParameter("sihumName");
			String sihumDate_ = request.getParameter("sihumDate");
			Date sihumDate = Date.valueOf(sihumDate_);
			
			SihumDTO arguDto = new SihumDTO();
			arguDto.setSihumNo(sihumNo);
			arguDto.setSihumName(sihumName);
			arguDto.setSihumDate(sihumDate);
			
			SihumDAO dao = new SihumDAO();
			int result = dao.setUpdate(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaSihum_servlet/view.do?sihumNo=" + sihumNo);
			} else {
				response.sendRedirect(path + "/haksaSihum_servlet/sujung.do?sihumNo=" + sihumNo);
			}
			
		} else if(imsiUriFileName.equals("sakjeProc.do")) {
			String sihumNo_ = request.getParameter("sihumNo");
			int sihumNo = util.getNumberCheck(sihumNo_, 0);
			
			SihumDTO arguDto = new SihumDTO();
			arguDto.setSihumNo(sihumNo);
			
			SihumDAO dao = new SihumDAO();
			int result = dao.setDelete(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaSihum_servlet/list.do");
			} else {
				response.sendRedirect(path + "/haksaSihum_servlet/sakje.do?sihumNo=" + sihumNo);
			}
		}
		
		
	}

}
