<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@include file="../include/inc_dbInfo.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String passwdChk = request.getParameter("passwdChk");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	if (id == null || id.equals("")) {
		//out.println("아이디 비정상");
		//response.sendRedirect("chuga.jsp");
		
		/*
		out.println("<script>");
		out.println("function move() {");
		out.println("alert('aaa');");
		out.println("location.href='chuga.jsp';");
		out.println("}");
		out.println("move();");
		out.println("</script>");
		*/
%>
	<script>
		function move() {
			//alert("아이디를 입력하세요.");
			location.href="chuga.jsp";
			//history.back();
			//history.go(-1);
		}
		move();
	</script>

<%
		return;
	}
	
	if (passwd == null || passwd.equals("")) {
		out.println("비밀번호 비정상");
		return;
	}
	
	if (passwdChk == null || passwdChk.equals("")) {
		out.println("비밀번호확인 비정상");
		return;
	}
	
	if (!passwd.equals(passwdChk)) {
		out.println("비밀번호 동일하지 않음");
		return;
	}
	
	if (name == null || name.equals("")) {
		out.println("이름 비정상");
		return;
	}
	
	if (phone == null || phone.equals("")) {
		out.println("전화번호 비정상");
		return;
	}
	
	if (email == null || email.equals("")) {
		out.println("이메일 비정상");
		return;
	}
	
	if (address == null || address.equals("")) {
		out.println("주소 비정상");
		return;
	}
	
	/*
	out.print("id : " + id + "<br>");
	out.print("passwd : " + passwd + "<br>");
	out.print("passwdChk : " + passwdChk + "<br>");
	out.print("name : " + name + "<br>");
	out.print("phone : " + phone + "<br>");
	out.print("email : " + email + "<br>");
	out.print("address : " + address + "<br>");
	*/
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
   
    int result = 0;
    try {
    	/*
    	String dbDriver = "oracle.jdbc.driver.OracleDriver";
        String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
        String dbId = "jspTest";
        String dbPw = "1234";
        */
        
	 	Class.forName(dbDriver);
        conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
        System.out.println("오라클 접속 성공");
        //-----------------------------------------------------------------
        String sql = "insert into member (id, passwd, name, phone, email, address, regiDate) values (?, ?, ?, ?, ?, ?, sysdate)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, passwd);
        pstmt.setString(3, name);
        pstmt.setString(4, phone);
        pstmt.setString(5, email);
        pstmt.setString(6, address);
        
        result = pstmt.executeUpdate();
        //-----------------------------------------------------------------
    } catch (Exception e) {
    	//e.printStackTrace()
       System.out.println("오라클 접속 실패");
    } finally {
       if (rs != null) { rs.close(); }
       if (pstmt != null) { pstmt.close(); }
       if (conn != null) { conn.close(); }
       System.out.println("오라클 접속 해제");
    }
   
	if(result > 0) {
		response.sendRedirect("list.jsp"); 
		//out.print("<script>");
		//out.print("location.href='list.jsp';");
		//out.print("</script>");
	} else {
		//response.sendRedirect("chuga.jsp"); 
		out.print("<script>");
		out.print("alert('추가 처리 중 오류가 발생했습니다!')");
		out.print("location.href='chuga.jsp';");
		out.print("</script>");
	}
%>

<!-- 
<script>
	function movePage() {
		location.href="list.jsp";
	}
	//movePage();
</script>

<a href="#" onClick="movePage();">[목록페이지로]</a>
 -->
