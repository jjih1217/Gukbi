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
	ArrayList<HaksaSungjukDTO> list = dao.getSelectAll();
	int totalRecord = list.size();
	
	HaksaSungjukDTO resultDto = dao.getSelectOne(arguDto);
	
	//member
	HaksaMemberDTO memberDto = new HaksaMemberDTO();
	memberDto.setHakbun(resultDto.getHakbun());
	
	HaksaMemberDAO memberDao = new HaksaMemberDAO();
	ArrayList<HaksaMemberDTO> memberList = memberDao.getSelectAll();
	HaksaMemberDTO memberValue = memberDao.getSelectOne(memberDto);
	
	//sihum
	HaksaSihumDTO sihumDto = new HaksaSihumDTO();
	sihumDto.setSihumNo(resultDto.getSihumNo());
	
	HaksaSihumDAO sihumDao = new HaksaSihumDAO();
	ArrayList<HaksaSihumDTO> sihumList = sihumDao.getSelectAll();
	HaksaSihumDTO sihumValue = sihumDao.getSelectOne(sihumDto);
	
%>

<h2>성적수정</h2>

<form name="DirForm">
<input type="text" name="sungjukNo" value="<%=resultDto.getSungjukNo() %>">
<table border="1" width="60%" align="center">
	<tr>
		<th>성적번호</th>
		<td><%=resultDto.getSungjukNo() %> </td>
	</tr>
	<tr>
		<th>학번</th>
		<td><%=resultDto.getHakbun() %></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><%=memberValue.getName() %></td>
	</tr>
	<tr>
		<th>국어</th>
		<td><input type="text" name="kor" id="kor" value="<%=resultDto.getKor() %>"></td>
	</tr>
	<tr>
		<th>영어</th>
		<td><input type="text" name="eng" id="eng" value="<%=resultDto.getEng() %>"></td>
	</tr>
	<tr>
		<th>수학</th>
		<td><input type="text" name="mat" id="mat" value="<%=resultDto.getMat() %>"></td>
	</tr>
	<tr>
		<th>과학</th>
		<td><input type="text" name="sci" id="sci" value="<%=resultDto.getSci() %>"></td>
	</tr>
	<tr>
		<th>역사</th>
		<td><input type="text" name="his" id="his" value="<%=resultDto.getHis() %>"></td>
	</tr>
	<tr>
		<th>총점</th>
		<td><%=resultDto.getTot() %></td>
	</tr>
	<tr>
		<th>평균</th>
		<td><%=resultDto.getAvg() %></td>
	</tr>
	<tr>
		<th>등급</th>
		<td><%=resultDto.getGrade() %> </td>
	</tr>
	<tr>
		<th>시험</th>
		<td><%=sihumValue.getSihumName() %> </td>
	</tr>
	<tr>
		<th>시험종류변경</th>
		<td>
			<select name="sihumNo">
			<option value="" selected>-- 선택하세요 --</option>
			<%
				for (int i=0; i<sihumList.size(); i++) {
					HaksaSihumDTO sihumDto2 = sihumList.get(i);
					
					if( sihumDto2.getSihumNo() == resultDto.getSihumNo()) { %>
						<option value="<%=sihumDto2.getSihumNo() %>" selected>(<%=sihumDto2.getSihumNo() %>) <%=sihumDto2.getSihumName() %></option>
					<%
						} else {  
					%>
						<option value="<%=sihumDto2.getSihumNo() %>">(<%=sihumDto2.getSihumNo() %>) <%=sihumDto2.getSihumName() %></option>
					<% 
						}
				}
			%>
			</select>
		</td>
	</tr>
	<tr>
		<th>등록일</th>
		<td><%=resultDto.getRegiDate() %></td>
	</tr>

</table>

<div style="width: 60%; margin: 10px 0;" align="right">
	<button type="button" onClick="formSubmit();">수정하기</button>
	<button type="button" onClick="move('list.jsp','');">목록</button>
</div>
</form>

<script>
function formSubmit(){
	if(confirm('수정하시겠습니까?')) {
		document.DirForm.action = "sujungProc.jsp";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

function move(value1, value2) {
	location.href= value1 + '?sungjukNo=' + value2;
}

</script>

