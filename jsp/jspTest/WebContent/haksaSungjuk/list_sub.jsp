<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.ArrayList"%>
<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@page import="haksaSungjuk.model.dao.HaksaSungjukDAO"%>
<%@page import="haksaSungjuk.model.dto.HaksaSungjukDTO"%>

<%
	HaksaSungjukDAO dao = new HaksaSungjukDAO();
	ArrayList<HaksaSungjukDTO> list = dao.getSelectAll();
	
	int totalRecord = list.size();
	//out.println(totalRecord);
	
	HaksaMemberDTO memberDto = new HaksaMemberDTO();
	HaksaMemberDAO memberDao = new HaksaMemberDAO();
	
	HaksaSihumDTO sihumDto = new HaksaSihumDTO();
	HaksaSihumDAO sihumDao = new HaksaSihumDAO();
%>

<h2>성적목록</h2>

<table border="1" width="60%" align="center">
	<tr>
		<th>순번</th>
		<!-- <th>성적번호</th> -->
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>과학</th>
		<th>역사</th>
		<th>총점</th>
		<th>평균</th>
		<!-- <th>등급</th> -->
		<th>시험종류</th>
		<th>등록일</th>
	</tr>
	<% if( totalRecord == 0) { %>
		<tr>
			<td colspan="13" height="200px" align="center">등록된 내용이 없습니다</td>
		</tr>
	<% } %>
	
	<%
		int num = totalRecord;
		for(int i=0; i < list.size(); i++) {
			HaksaSungjukDTO resultDto = list.get(i);
			
			memberDto.setHakbun(resultDto.getHakbun());
			HaksaMemberDTO memberValue = memberDao.getSelectOne(memberDto);
			
			sihumDto.setSihumNo(resultDto.getSihumNo());
			HaksaSihumDTO sihumValue = sihumDao.getSelectOne(sihumDto);
	%>
		<tr>
			<td><%=num %> </td>
			<%--<td><%=dto.getHakbun() %></td>--%>
			<td>
				<a href="#" Onclick="move('view.jsp','<%=resultDto.getSungjukNo() %>');"><%=memberValue.getName() %> (<%=resultDto.getHakbun() %>)</a>
			</td>
			<%-- <td><%=dto.getSungjukNo() %> </td> --%>
			<td><%=resultDto.getKor() %></td>
			<td><%=resultDto.getEng() %></td>
			<td><%=resultDto.getMat() %></td>
			<td><%=resultDto.getSci() %></td>
			<td><%=resultDto.getHis() %></td>
			<td><%=resultDto.getTot() %></td>
			<td><%=resultDto.getAvg() %></td>
			<%--<td><%=dto.getGrade() %> </td>--%>
			<%--<td><%=dto.getSihumNo() %> </td>--%>
			<td><%=sihumValue.getSihumName() %> </td>
			<td><%=resultDto.getRegiDate() %></td>
		</tr>
	<%  		
			num--;
		} 
	%>
</table>

<div style="width: 60%; margin: 10px 0;" align="right">
	<button type="button" onClick="move('list.jsp','');">목록</button>
	<button type="button" onClick="move('chuga.jsp','');">등록</button>
</div>


<script>
function move(value1, value2) {
	location.href= value1 + '?sungjukNo=' + value2;
}

</script>

