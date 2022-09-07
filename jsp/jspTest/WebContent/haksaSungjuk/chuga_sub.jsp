<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>

<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>

<%
	HaksaMemberDAO memberDao = new HaksaMemberDAO();
	ArrayList<HaksaMemberDTO> memberList = memberDao.getSelectAll();

	HaksaSihumDAO sihumDao = new HaksaSihumDAO();
	ArrayList<HaksaSihumDTO> sihumList = sihumDao.getSelectAll();
%>
<h2>성적등록</h2>

<form name="DirForm">
<table border="1" width="60%" align="center">
	<tr>
		<td>국어</td>
		<td><input type="text" name="kor" id="kor"></td>
	</tr>
	<tr>
		<td>영어</td>
		<td><input type="text" name="eng" id="eng"></td>
	</tr>
	<tr>
		<td>수학</td>
		<td><input type="text" name="mat" id="mat"></td>
	</tr>
	<tr>
		<td>과학</td>
		<td><input type="text" name="sci" id="sci"></td>
	</tr>
	<tr>
		<td>역사</td>
		<td><input type="text" name="his" id="his"></td>
	</tr>
	<tr>
		<td>학번</td>
		<td>
			<select name="hakbun">
			<option value="" selected>-- 선택하세요 --</option>
			<%
				for (int i=0; i<memberList.size(); i++) {
					HaksaMemberDTO memberDto = memberList.get(i);
					
					String selectedValue = "";
					if(memberDto.getHakbun() == 0) {
						selectedValue = "selected";
					}
			%>
				<option value="<%=memberDto.getHakbun() %>" <%=selectedValue %>>
					(<%=memberDto.getHakbun() %>)
					<%=memberDto.getName() %>
				</option>
			<%
				}
			%>
			</select>
		</td>
	</tr>
	<tr>
		<td>시험종류</td>
		<td>
			<select name="sihumNo">
			<option value="" selected>-- 선택하세요 --</option>
			<%
				for (int i=0; i<sihumList.size(); i++) {
					HaksaSihumDTO sihumDto = sihumList.get(i);
					
					String selectedValue = "";
					if(sihumDto.getSihumNo() == 0) {
						selectedValue = "selected";
					}
			%>
				<option value="<%=sihumDto.getSihumNo() %>" <%=selectedValue %>>
					(<%=sihumDto.getSihumNo() %>)
					<%=sihumDto.getSihumName() %>
				</option>
			<%
				}
			%>
			</select>
		</td>
	</tr>
</table>

<div style="width: 60%; margin: 10px 0;" align="right">
	<button type="button" onClick="formSubmit();">저장하기</button>
	<button type="button" onClick="location.href='list.jsp';">목록</button>
</div>

</form>

<script>
function formSubmit(){
	document.DirForm.action = "chugaProc.jsp";
	document.DirForm.method = "post";
	document.DirForm.submit();
}
</script>

