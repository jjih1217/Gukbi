package project.memo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.common.Util;
import project.memo.model.dao.MemoDAO;
import project.memo.model.dto.MemoDTO;

@WebServlet("/memo_servlet/*")
public class MemoController extends HttpServlet {
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
			MemoDAO dao = new MemoDAO();
			ArrayList<MemoDTO> list  = dao.getSelectAll();
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("view")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				System.out.println("no ; " + no);
				return;
			}
			
			MemoDTO arguDto = new MemoDTO();
			arguDto.setNo(no);
					
			MemoDAO dao = new MemoDAO();
			MemoDTO returnDto = dao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("chuga")) {
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("sujung")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				System.out.println("no ; " + no);
				return;
			}
			
			MemoDTO arguDto = new MemoDTO();
			arguDto.setNo(no);
					
			MemoDAO dao = new MemoDAO();
			MemoDTO returnDto = dao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);

			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("sakje")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				System.out.println("no ; " + no);
				return;
			}
			
			MemoDTO arguDto = new MemoDTO();
			arguDto.setNo(no);
					
			MemoDAO dao = new MemoDAO();
			MemoDTO returnDto = dao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("chugaProc")) {
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			writer = util.getNullBlankCheck(writer);
			content = util.getNullBlankCheck(content);
			
			int failCounter = 0;
            if(writer.equals("")) { failCounter++; }
            if(content.equals("")) { failCounter++; }
            
            if(failCounter > 0) {
				return;
			}
            
            //entity check
            writer = util.getCheckString(writer);
            content = util.getCheckString(content);
            
            MemoDTO arguDto = new MemoDTO();
            arguDto.setWriter(writer);
            arguDto.setContent(content);
            
            MemoDAO dao = new MemoDAO();
            int result = dao.setInsert(arguDto);
            
            if(result > 0) {
               response.sendRedirect(path + "/memo_servlet/memo_list.do");
            } else {
               response.sendRedirect(path + "/memo_servlet/memo_chuga.do");
            }
         
			
		} else if(fileName.equals("sujungProc")) {
			String no_ = request.getParameter("no");
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			int no = util.getNumberCheck(no_, 0);
			
			writer = util.getNullBlankCheck(writer);
			content = util.getNullBlankCheck(content);
			
			int failCounter = 0;
            if(writer.equals("")) { failCounter++; }
            if(content.equals("")) { failCounter++; }
            
            if(failCounter > 0) {
				return;
			}
            
            //entity check
            writer = util.getCheckString(writer);
            content = util.getCheckString(content);
            
            MemoDTO arguDto = new MemoDTO();
            arguDto.setNo(no);
            arguDto.setWriter(writer);
            arguDto.setContent(content);
            
            MemoDAO dao = new MemoDAO();
            int result = dao.setUpdate(arguDto);
            
            if(result > 0) {
               response.sendRedirect(path + "/memo_servlet/memo_view.do?no=" + no);
            } else {
               response.sendRedirect(path + "/memo_servlet/memo_sujung.do?no=" + no);
            }
         
			
		} else if(fileName.equals("sakjeProc")) {
			String no_ = request.getParameter("no");
			
			int no = util.getNumberCheck(no_, 0);
			
            MemoDTO arguDto = new MemoDTO();
            arguDto.setNo(no);
            
            MemoDAO dao = new MemoDAO();
            int result = dao.setDelete(arguDto);
            
            if(result > 0) {
               response.sendRedirect(path + "/memo_servlet/memo_view.do?no=" + no);
            } else {
               response.sendRedirect(path + "/memo_servlet/memo_sakje.do?no=" + no);
            }
         
		}
		
		
		
		
		
	}

}
