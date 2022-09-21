package haksa.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.math3.analysis.function.Atan;

import _common.Util;
import haksa.model.dao.SihumDAO;
import haksa.model.dao.StudentDAO;
import haksa.model.dao.SungjukDAO;
import haksa.model.dto.SihumDTO;
import haksa.model.dto.StudentDTO;
import haksa.model.dto.SungjukDTO;

@WebServlet("/haksaSungjuk_servlet/*")
public class SungjukController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public SungjukController() {
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
		
		String forwardPage = "/WEB-INF/_test/haksa/sungjuk";
		
		if(imsiUriFileName.equals("list.do")) {
			SungjukDAO dao = new SungjukDAO();
			ArrayList<SungjukDTO> list = dao.getSelectAll();
			request.setAttribute("list", list);
			
			forwardPage += "/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("view.do")) {
			String sungjukNo_ = request.getParameter("sungjukNo");
			int sungjukNo = util.getNumberCheck(sungjukNo_, 0);
			
			SungjukDTO arguDto = new SungjukDTO();
			arguDto.setSungjukNo(sungjukNo);
			
			SungjukDAO sungjukDao = new SungjukDAO();
			SungjukDTO returnDto = sungjukDao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("chuga.do")) {
			//학번
			StudentDAO studentDao = new StudentDAO();
			ArrayList<StudentDTO> studentList = studentDao.getSelectAll();
			request.setAttribute("studentList", studentList);
			//시험명
			SihumDAO sihumDao = new SihumDAO();
			ArrayList<SihumDTO> sihumList = sihumDao.getSelectAll();
			request.setAttribute("sihumList", sihumList);
			
			forwardPage += "/chuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("sujung.do")) {
			//학번
			StudentDAO studentDao = new StudentDAO();
			ArrayList<StudentDTO> studentList = studentDao.getSelectAll();
			request.setAttribute("studentList", studentList);
			//시험명
			SihumDAO sihumDao = new SihumDAO();
			ArrayList<SihumDTO> sihumList = sihumDao.getSelectAll();
			request.setAttribute("sihumList", sihumList);
			
			String sungjukNo_ = request.getParameter("sungjukNo");
			int sungjukNo = util.getNumberCheck(sungjukNo_, 0);
			
			SungjukDTO arguDto = new SungjukDTO();
			arguDto.setSungjukNo(sungjukNo);
			
			SungjukDAO sungjukDao = new SungjukDAO();
			SungjukDTO returnDto = sungjukDao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/sujung.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("sakje.do")) {
			String sungjukNo_ = request.getParameter("sungjukNo");
			int sungjukNo = util.getNumberCheck(sungjukNo_, 0);
			
			SungjukDTO arguDto = new SungjukDTO();
			arguDto.setSungjukNo(sungjukNo);
			
			SungjukDAO sungjukDao = new SungjukDAO();
			SungjukDTO returnDto = sungjukDao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			forwardPage += "/sakje.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("chugaProc.do")) {
			String kor_ = request.getParameter("kor");
			String eng_ = request.getParameter("eng");
			String mat_ = request.getParameter("mat");
			String sci_ = request.getParameter("sci");
			String his_ = request.getParameter("his");
			String hakbun_ = request.getParameter("hakbun");
			String sihumNo_ = request.getParameter("sihumNo");

			int kor = util.getNumberCheck(kor_, 0);
			int eng = util.getNumberCheck(eng_, 0);
			int mat = util.getNumberCheck(mat_, 0);
			int sci = util.getNumberCheck(sci_, 0);
			int his = util.getNumberCheck(his_, 0);
			int hakbun = util.getNumberCheck(hakbun_, 0);
			int sihumNo = util.getNumberCheck(sihumNo_, 0);
			
			int tot = kor + eng + mat + sci + his;
			double avg = tot / 5.0;
			
			String grade = "가";
			if(avg >= 90) {
				grade = "수";
			} else if(avg >= 80) {
				grade = "우";
			} else if(avg >= 70) {
				grade = "미";
			} else if(avg >= 60) {
				grade = "양";
			}
			
			SungjukDTO arguDto = new SungjukDTO();
			arguDto.setKor(kor);
			arguDto.setEng(eng);
			arguDto.setMat(mat);
			arguDto.setSci(sci);
			arguDto.setHis(his);
			arguDto.setTot(tot);
			arguDto.setAvg(avg);
			arguDto.setGrade(grade);
			arguDto.setHakbun(hakbun);
			arguDto.setSihumNo(sihumNo);
			
			SungjukDAO dao = new SungjukDAO();
			int result = dao.setInsert(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaSungjuk_servlet/list.do");
			} else {
				response.sendRedirect(path + "/haksaSungjuk_servlet/chuga.do");
			}
					
		} else if(imsiUriFileName.equals("sujungProc.do")) {
			String sungjukNo_ = request.getParameter("sungjukNo");
			int sungjukNo = util.getNumberCheck(sungjukNo_, 0);
			
			/*
			 * if(sungjukNo <= 0) { return; }
			 */
			String kor_ = request.getParameter("kor");
			String eng_ = request.getParameter("eng");
			String mat_ = request.getParameter("mat");
			String sci_ = request.getParameter("sci");
			String his_ = request.getParameter("his");
			String hakbun_ = request.getParameter("hakbun");
			String sihumNo_ = request.getParameter("sihumNo");

			int kor = util.getNumberCheck(kor_, 0);
			int eng = util.getNumberCheck(eng_, 0);
			int mat = util.getNumberCheck(mat_, 0);
			int sci = util.getNumberCheck(sci_, 0);
			int his = util.getNumberCheck(his_, 0);
			int hakbun = util.getNumberCheck(hakbun_, 0);
			int sihumNo = util.getNumberCheck(sihumNo_, 0);
			
			int tot = kor + eng + mat + sci + his;
			double avg = tot / 5.0;
			
			String grade = "가";
			if(avg >= 90) {
				grade = "수";
			} else if(avg >= 80) {
				grade = "우";
			} else if(avg >= 70) {
				grade = "미";
			} else if(avg >= 60) {
				grade = "양";
			}
			
			SungjukDTO arguDto = new SungjukDTO();
			arguDto.setSungjukNo(sungjukNo);
			arguDto.setKor(kor);
			arguDto.setEng(eng);
			arguDto.setMat(mat);
			arguDto.setSci(sci);
			arguDto.setHis(his);
			arguDto.setTot(tot);
			arguDto.setAvg(avg);
			arguDto.setGrade(grade);
			arguDto.setHakbun(hakbun);
			arguDto.setSihumNo(sihumNo);
			
			SungjukDAO dao = new SungjukDAO();
			int result = dao.setUpdate(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaSungjuk_servlet/list.do");
			} else {
				response.sendRedirect(path + "/haksaSungjuk_servlet/sujung.do?sungjukNo=" + sungjukNo);
			}
			
		} else if(imsiUriFileName.equals("sakjeProc.do")) {
			String sungjukNo_ = request.getParameter("sungjukNo");
			int sungjukNo = util.getNumberCheck(sungjukNo_, 0);
			
			SungjukDTO arguDto = new SungjukDTO();
			arguDto.setSungjukNo(sungjukNo);
			
			SungjukDAO dao = new SungjukDAO();
			int result = dao.setDelete(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/haksaSungjuk_servlet/list.do");
			} else {
				response.sendRedirect(path + "/haksaSungjuk_servlet/sakje.do?sungjukNo=" + sungjukNo );
			}
		} else {
			System.out.println("존재하지않는 페이지입니다");
		}
		
		
	}

}
