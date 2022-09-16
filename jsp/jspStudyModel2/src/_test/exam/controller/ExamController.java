package _test.exam.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;

@WebServlet("/exam_servlet/*") //url-mapping
public class ExamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI().toString();
		
		//System.out.println("path : " + path);
		//System.out.println("url : " + url);
		//System.out.println("uri : " + uri);
		
		/*
		if(url.indexOf("01.do") != -1) { //찾는 문자열이 없으면 -1을 리턴
			System.out.println("111");
		} else if(url.indexOf("02.do") != -1) {
			System.out.println("222");
		} else {
			System.out.println("없네");
		}
		*/
		
		String[] imsiUriArray = uri.split("/");
		String imsiUriFileName = imsiUriArray[imsiUriArray.length - 1];
		
		String forwardPage = "/WEB-INF/_test/exam";
		
		if(imsiUriFileName.equals("01.do")) { 
			forwardPage += "/01.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("01Proc.do")) {
			//System.out.println("01Proc.do");
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String age_ = request.getParameter("age");
			int age = Integer.parseInt(age_);
			
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("age", age);
			
			forwardPage += "/01Result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		}  else if(imsiUriFileName.equals("02.do")) {
			forwardPage += "/02.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("02Proc.do")) {
			String name = request.getParameter("name");
			String birthYear_ = request.getParameter("birthYear");
			int birthYear = Integer.parseInt(birthYear_);
			int age = (2022 - birthYear) + 1;
			
			request.setAttribute("name", name);
			request.setAttribute("birthYear", birthYear);
			request.setAttribute("age", age);
			
			forwardPage += "/02Result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("03.do")) {
			forwardPage += "/03.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("03Proc.do")) {
			String name = request.getParameter("name");
			String jumin = request.getParameter("jumin");
			String address = request.getParameter("address");
			
			String imsiBirth_ = jumin.substring(0,2);
			String imsiGender_ = jumin.substring(7,8);
			int imsiBirth = Integer.parseInt(imsiBirth_);
			int imsiGender = Integer.parseInt(imsiGender_);
			
			int imsiYear = 2000;
			if(imsiGender == 1 || imsiGender == 2) {
				imsiYear = 1900;
			}
			int age = 2022 - (imsiYear + imsiBirth) + 1;
			
			String gender = "F";
			if(imsiGender == 1 || imsiGender == 3) {
				gender = "M";
			}
			
			request.setAttribute("name", name);
			request.setAttribute("jumin", jumin);
			request.setAttribute("address", address);
			request.setAttribute("age", age);
			request.setAttribute("gender", gender);
			
			forwardPage += "/03Result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("04.do")) {
			forwardPage += "/04.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
				
		} else if(imsiUriFileName.equals("04Proc.do")) {
			String formCounter_ = request.getParameter("formCounter");
			int formCounter = Integer.parseInt(formCounter_);
			
			ArrayList<String> list = new ArrayList<>();
			for(int i = 1; i <= formCounter; i++) {
				String name = request.getParameter("name_" + i);
				String address = request.getParameter("address_" + i);
				String age_ = request.getParameter("age_" + i);
				int age = Integer.parseInt(age_);
				
				String msg = name +  "|" + address + "|" + age;
				list.add(msg);
			}
			
			request.setAttribute("list", list);
			
			forwardPage += "/04Result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
				
		} else if(imsiUriFileName.equals("05.do")) {
			forwardPage += "/05.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("05Proc.do")) {
			String[] names = request.getParameterValues("name");
			String name = "";
			for(int i=0; i< names.length; i++) {
				name += "," + names[i];
			}
			name = name.substring(1);
			System.out.println(name);
			
			String gender = request.getParameter("gender");
			String aboutAge = request.getParameter("aboutAge");
			
			String[] hobbys = request.getParameterValues("hobby");
			String hobby = "";
			for(int i=0; i< hobbys.length; i++) {
				hobby += "," + hobbys[i];
			}
			hobby = hobby.substring(1);
			
			String age_ = request.getParameter("age");
			int age = Integer.parseInt(age_);
			
			String memo = request.getParameter("memo");
			memo = memo.replace("\n", "<br>");
			
			String birthDay = request.getParameter("birthDay");
			
			//HashedMap	
			HashedMap<String, String> map = new HashedMap<>();
			map.put("name", name);
			map.put("gender", gender);
			map.put("aboutAge", aboutAge);
			map.put("hobby", hobby);
			map.put("age", age + "");
			map.put("memo", memo);
			map.put("birthDay", birthDay);
			
			request.setAttribute("map", map);
			
			forwardPage += "/05Result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("06.do")) {
			forwardPage += "/06.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		
		} else if(imsiUriFileName.equals("06Proc.do")) {
			String testDbId = "hong";
			String testDbPW = "1234";
			
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			String result = "X";
			if(testDbId.equals(id) && testDbPW.equals(passwd)) {
				result = "O";
			}
			
			request.setAttribute("id", id);
			request.setAttribute("result", result);
			
			forwardPage += "/06Result1.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			//response.sendRedirect("/jspStudyModel2/exam_servlet/06Proc2.do?id=" + id + "&result=" + result);
			
		} else if(imsiUriFileName.equals("06Proc2.do")) {
			String id = request.getParameter("id");
			String result = request.getParameter("result");
			
			request.setAttribute("id", id);
			request.setAttribute("result", result);
			
			forwardPage += "/06Result2.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("07.do")) {
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String age_ = request.getParameter("age");
			
			if(name == null || name.trim().equals("")) { name = ""; }
			if(address == null || address.trim().equals("")) { address = ""; }
			if(age_ == null || age_.trim().equals("")) { age_ = ""; }
			
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("age", age_);
			
			forwardPage += "/07.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		
		} else if(imsiUriFileName.equals("07Proc.do")) {
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String age_ = request.getParameter("age");
			int age = Integer.parseInt(age_);
			
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("age", age);
			
			forwardPage += "/07Result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else  {
			System.out.println("없음");
		}
		
	
	} 
		
		

}
