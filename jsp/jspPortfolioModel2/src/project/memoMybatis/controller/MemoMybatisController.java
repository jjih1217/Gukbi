package project.memoMybatis.controller;

import java.io.IOException;
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
import project.memo.model.dao.MemoDAO;
import project.memo.model.dto.MemoDTO;
import project.memoMybatis.model.dao.MemoMybatisDAO;
import project.memoMybatis.model.dto.MemoMybatisDTO;

@WebServlet("/memoMybatis_servlet/*")
public class MemoMybatisController extends HttpServlet {
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
		
		request.setAttribute("referer", referer);
		request.setAttribute("path", path);
		request.setAttribute("ip", ip);
		request.setAttribute("folderName", folderName);
		request.setAttribute("fileName", fileName);
		
		
		String pageNumber_ = request.getParameter("pageNumber");
		int pageNumber = util.getNumberCheck(pageNumber_, 1);
		request.setAttribute("pageNumber", pageNumber);
		
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
		if(imsiSearchYN.equals("O")) {
			String imsiSerchGubun = URLEncoder.encode(searchGubun,"UTF-8");
			String imsiSerchData = URLEncoder.encode(searchData,"UTF-8");
			searchQuery = "pageNumber=" + pageNumber + "&searchGubun=" + imsiSerchGubun + "&searchData=" + imsiSerchData;
		}
		
		request.setAttribute("searchGubun", searchGubun);
		request.setAttribute("searchData", searchData);
		request.setAttribute("searchQuery", searchQuery);
		
		
		String forwardPage = "/WEB-INF/project/main/main.jsp";
		if(fileName.equals("list")) {
			MemoMybatisDTO arguDto2 = new MemoMybatisDTO();
			arguDto2.setSearchGubun(searchGubun);
			arguDto2.setSearchData(searchData);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			
			int pageSize = 10;
			int blockSize = 10;
			int totalRecord = dao.getTotalRecord(arguDto2);
			request.setAttribute("totalRecord", totalRecord);
			
			Map<String, Integer> map = util.getPagerMap(pageNumber, pageSize, blockSize, totalRecord);
			map.put("blockSize", blockSize);
			request.setAttribute("map", map);
			
			MemoMybatisDTO arguDto = new MemoMybatisDTO();
			arguDto.setSearchGubun(searchGubun);
			arguDto.setSearchData(searchData);
			arguDto.setStartRecord(map.get("startRecord"));
			arguDto.setLastRecord(map.get("lastRecord"));
			
			List<MemoMybatisDTO> list = dao.getSelectAll(arguDto);
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("view")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				return;
			}
			
			MemoMybatisDTO arguDto = new MemoMybatisDTO();
			arguDto.setNo(no);
			//이전글다음글 사용할때 searchGubun, searchData 담음
			arguDto.setSearchGubun(searchGubun);
			arguDto.setSearchData(searchData);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			MemoMybatisDTO returnDto = dao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("chuga")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("chugaProc")) {
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			writer = util.getNullBlankCheck(writer);
			content = util.getNullBlankCheck(content);
			
			int failCounter = 0;
			if(writer.equals("")) {failCounter++;}
			if(content.equals("")) {failCounter++;}
			if(failCounter > 0) {
				System.out.println("failCounter : " + failCounter);
				return;
			}
			
			writer = util.getCheckString(writer);
			content = util.getCheckString(content);
			
			MemoMybatisDTO arguDto = new MemoMybatisDTO();
			arguDto.setWriter(writer);
			arguDto.setContent(content);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			int result = dao.setInsert(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_list.do");
			} else {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_chuga.do?" + searchQuery);
			}
			
		} else if(fileName.equals("sujung")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				return;
			}
			
			MemoMybatisDTO arguDto = new MemoMybatisDTO();
			arguDto.setNo(no);
			//arguDto.setSearchGubun(searchGubun);
			//arguDto.setSearchData(searchData);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			MemoMybatisDTO returnDto = dao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("sujungProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				return;
			}
			
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
            
			MemoMybatisDTO arguDto = new MemoMybatisDTO();
            arguDto.setNo(no);
            arguDto.setWriter(writer);
            arguDto.setContent(content);
            
            MemoMybatisDAO dao = new MemoMybatisDAO();
            int result = dao.setUpdate(arguDto);
            
            if(result > 0) {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_view.do?no=" + no + "&" + searchQuery);
			} else {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_sujung.do?no=" + no + "&" + searchQuery);
			}
			
		} else if(fileName.equals("sakje")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				return;
			}
			
			MemoMybatisDTO arguDto = new MemoMybatisDTO();
			arguDto.setNo(no);
			//arguDto.setSearchGubun(searchGubun);
			//arguDto.setSearchData(searchData);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			MemoMybatisDTO returnDto = dao.getSelectOne(arguDto);
			request.setAttribute("dto", returnDto);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(fileName.equals("sakjeProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(no == 0) {
				return;
			}
			
			MemoMybatisDTO arguDto = new MemoMybatisDTO();
            arguDto.setNo(no);
            
            MemoMybatisDAO dao = new MemoMybatisDAO();
            int result = dao.setDelete(arguDto);
            
            if(result > 0) {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_list.do");
			} else {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_sakje.do?no=" + no + "&" + searchQuery);
			}
		} else if(fileName.equals("search")) {
			
			String moveUrl = "";
			moveUrl += path + "/memoMybatis_servlet/memoMybatis_list.do?" + searchQuery;
			
			response.sendRedirect(moveUrl);
			
		} else {
			System.out.println("존재하지않는 URL");
		}
	}

}
