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
	String sungjukNo_ = request.getParameter("sungjukNo");
	int sungjukNo = Integer.parseInt(sungjukNo_);
	
	HaksaSungjukDTO arguDto = new HaksaSungjukDTO();
	arguDto.setSungjukNo(sungjukNo);
	
	HaksaSungjukDAO dao = new HaksaSungjukDAO();
	HaksaSungjukDTO resultDto = dao.getSelectOne(arguDto);
	
	//member
	HaksaMemberDTO memberDto = new HaksaMemberDTO();
	memberDto.setHakbun(resultDto.getHakbun());
	
	HaksaMemberDAO memberDao = new HaksaMemberDAO();
	HaksaMemberDTO memberValue = memberDao.getSelectOne(memberDto);
	
	//sihum
	HaksaSihumDTO sihumDto = new HaksaSihumDTO();
	sihumDto.setSihumNo(resultDto.getSihumNo());
	
	HaksaSihumDAO sihumDao = new HaksaSihumDAO();
	HaksaSihumDTO sihumValue = sihumDao.getSelectOne(sihumDto);
	
%>

<h2>성적상세보기</h2>

<table border="1" width="60%" align="center">
	<tr>
		<th>성적번호</th>
		<th>학번</th>
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>과학</th>
		<th>역사</th>
		<th>총점</th>
		<th>평균</th>
		<th>등급</th>
		<th>시험번호</th>
		<th>시험종류</th>
		<th>등록일</th>
	</tr>
	<tr>
		<td><%=resultDto.getSungjukNo() %> </td>
		<td><%=resultDto.getHakbun() %></td>
		<td><%=memberValue.getName() %></td>
		<td><%=resultDto.getKor() %></td>
		<td><%=resultDto.getEng() %></td>
		<td><%=resultDto.getMat() %></td>
		<td><%=resultDto.getSci() %></td>
		<td><%=resultDto.getHis() %></td>
		<td><%=resultDto.getTot() %></td>
		<td><%=resultDto.getAvg() %></td>
		<td><%=resultDto.getGrade() %> </td>
		<td><%=resultDto.getSihumNo() %> </td>
		<td><%=sihumValue.getSihumName() %> </td>
		<td><%=resultDto.getRegiDate() %></td>
	</tr>
	<tr>
	</tr>

</table>

<div style="width: 60%; margin: 10px 0;" align="right">
	<button type="button" onClick="move('sujung.jsp','<%=resultDto.getSungjukNo() %>');">수정</button>
	<button type="button" onClick="move('sakje.jsp','<%=resultDto.getSungjukNo() %>');">삭제</button>
	<button type="button" onClick="move('list.jsp','');">목록</button>
</div>


<script>
function move(value1, value2) {
	location.href= value1 + '?sungjukNo=' + value2;
}

</script>

