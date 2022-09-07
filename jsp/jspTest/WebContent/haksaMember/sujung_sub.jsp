<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>

<%
	String hakbun_ = request.getParameter("hakbun");
	int hakbun = Integer.parseInt(hakbun_);
	
	HaksaMemberDTO arguDto = new HaksaMemberDTO();
	arguDto.setHakbun(hakbun);
	
	HaksaMemberDAO dao = new HaksaMemberDAO();
	HaksaMemberDTO resultDto = dao.getSelectOne(arguDto);
	
%>

<h2>학생수정</h2>

<form name="DirForm">
<input type="text" name="hakbun" value="<%=resultDto.getHakbun() %>">
<table border="1" width="60%" align="center">
	<tr>
		<th>학번</th>
		<td><%=resultDto.getHakbun() %></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><%=resultDto.getName() %></td>
	</tr>
	<tr>
		<th>연락처</th>
		<td><input type="text" name="phone" id="phone" value="<%=resultDto.getPhone() %>"></td>
	</tr>
	<tr>
		<th>부모연락처</th>
		<td><input type="text" name="parentPhone" id="parentPhone" value="<%=resultDto.getParentPhone() %>"></td>
	</tr>
	<tr>
		<th>현재주소 </th>
		<td>(<%=resultDto.getAddr1() %>) <%=resultDto.getAddr2() %> <%=resultDto.getAddr3() %> <%=resultDto.getAddr4() %></td>
	</tr>
	<tr>
		<th rowspan="3">변경주소</th>
		<td>
			<input type="text" name="addr1" id="sample6_postcode" placeholder="우편번호">
			<button type="button" onClick="sample6_execDaumPostcode();">우편번호 찾기</button>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="addr2" id="sample6_address" placeholder="주소">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="addr3" id="sample6_detailAddress" placeholder="상세주소">
			<input type="text" name="addr4" id="sample6_extraAddress" placeholder="참고항목">
		</td>
	</tr>
</table>

<input type="text" name="juso1" value="<%=resultDto.getAddr1() %>">
<input type="text" name="juso2" value="<%=resultDto.getAddr2() %>">
<input type="text" name="juso3" value="<%=resultDto.getAddr3() %>">
<input type="text" name="juso4" value="<%=resultDto.getAddr4() %>">

<div style="width: 60%; margin: 10px 0;" align="right">
	<button type="button" onClick="formSubmit();">수정</button>
	<button type="button" onClick="move('list.jsp','');">목록</button>
</div>

</form>

<script>
function formSubmit(){
	document.DirForm.juso1.value = document.DirForm.addr1.value;
	document.DirForm.juso2.value = document.DirForm.addr2.value;
	document.DirForm.juso3.value = document.DirForm.addr3.value;
	document.DirForm.juso4.value = document.DirForm.addr4.value;
	
	if(confirm('수정하시겠습니까?')) {
		document.DirForm.action = "sujungProc.jsp";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

function move(value1, value2) {
	location.href= value1 + '?hakbun=' + value2;
}
</script>

<%@ include file = "_inc_daumApi.jsp" %>