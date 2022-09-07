<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String nickName = request.getParameter("nickName");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String jumin = request.getParameter("jumin");
	String address = request.getParameter("address");
	//String gender = request.getParameter("gender");
	
	//out.println(address + "<br>"); // 입력안했을때 -> 공백
	//out.println(gender + "<br>"); // null
%>

<%-- 
	<a href="exam04Result.jsp?id=<%=id %>&name=<%=name%>">완료페이지 이동</a>
--%>

<form name="imsiForm">
	<input type="hidden" name="id" value="<%=id%>">;
	<input type="hidden" name="name" value="<%=name%>">;
</form>


<!-- 자동으로 페이지 이동-->
<script> 
function move() {
	location.href="exam04Result.jsp?id=<%=id %>&name=<%=name%>";
}
//move();

function submitForm() {
	document.imsiForm.action = "exam04Result.jsp";
	document.imsiForm.method = "post";
	document.imsiForm.submit();
}
submitForm();

</script>

