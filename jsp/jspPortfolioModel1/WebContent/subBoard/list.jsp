<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="_inc_top.jsp" %> 

<%	
	SubBoardDTO arguDto = new SubBoardDTO();
	arguDto.setSearchGubun(searchGubun);
	arguDto.setSearchData(searchData);
	
	SubBoardDAO subBoardDao = new SubBoardDAO();
	ArrayList<SubBoardDTO> list = subBoardDao.getSelectAll(arguDto);
%>
<h2>게시글 목록</h2>
<div style="border: 0px solid red; padding: 20px 0; width: 80%;" align="left">
	<form name="searchForm">
 	<select name="searchGubun">
 		<option value="">-- 선택 --</option> 
 		<option value="writer" <% if (searchGubun.equals("writer")) { out.println("selected"); } %>>작성자</option> 
 		<option value="subject" <% if (searchGubun.equals("subject")) { out.println("selected"); } %>>제목</option> 
 		<option value="content" <% if (searchGubun.equals("content")) { out.println("selected"); } %>>내용</option> 
 		<option value="writer_subject_content" <% if (searchGubun.equals("writer_subject_content")) { out.println("selected"); } %>>작성자+제목+내용</option> 
 	</select>
 	&nbsp;
 	<input type="text" name="searchData" value="<%=searchData %>">
 	&nbsp;
 	<button type="button" onClick="search();">검색</button>
 	</form>
 	
 	<script>
 	function search() {
 		document.searchForm.action = "mainProc.jsp?menuGubun=subBoard_listSearch";
 		document.searchForm.method = "post";
 		document.searchForm.submit();
 	}
 	</script>
</div>

<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		
		<th>refNo</th>
		<th>stepNo</th>
		<th>levelNo</th>
		<th>parentNo</th>
		
		<th>memberNo</th>
		<th>ip</th>
		<th>공지글</th>
		<th>비밀글</th>
	</tr>
	
	<%
		if(list == null || list.size() <= 0) {
	%>
		<tr>
			<td colspan="13" height="200px" align="center">
		 		등록된 내용이 없습니다.
		 	</td>
		 </tr>
	<% 
		}
	%>
	
	<%
		for(int i=0; i<list.size(); i++) {
			SubBoardDTO dto = list.get(i);
	%>
		<tr>
			<td><%=dto.getNo() %></td>
			<td>
				<% 
					String blankValue = "";
					for (int k=2; k<=dto.getStepNo(); k++) { // 1 --> 새글
						blankValue += "&nbsp;&nbsp;";
					}
					
					int imsiLength = 3;
					String imsiSubject = dto.getSubject();
					if(imsiSubject.length() > imsiLength) {
						imsiSubject = imsiSubject.substring(0, imsiLength) + "...";
					}
					
					if(dto.getStepNo() > 1) {
						imsiSubject = "[Re]: " + imsiSubject;
					}
				%>
				<%=blankValue %><a href="#" onClick="move('subBoard_view','<%=dto.getNo() %>', '<%=searchGubun %>', '<%=searchData %>');"><%=imsiSubject %></a>
			</td>
			<td><%=dto.getWriter() %></td>
			<td><%=dto.getRegiDate() %></td>
			<td><%=dto.getHit() %></td>
			
			<td><%=dto.getRefNo() %></td>
			<td><%=dto.getStepNo() %></td>
			<td><%=dto.getLevelNo() %></td>
			<td><%=dto.getParentNo() %></td>
			
			<td><%=dto.getMemberNo() %></td>
			<td><%=dto.getIp() %></td>
			<td><%=dto.getNoticeNo() %></td>
			<td><%=dto.getSecretGubun() %></td>
		</tr>
	<% 
		}
	%>
</table>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="move('subBoard_list', '', '', '');">전체목록</a>
	|
	<a href="#" onClick="move('subBoard_list', '', '<%=searchGubun %>', '<%=searchData %>');">목록</a>
	|
	<a href="#" onClick="move('subBoard_chuga', '', '<%=searchGubun %>', '<%=searchData %>');">등록</a>
	|
</div>

<script>
function move(value1, value2, value3, value4) {
	location.href = 'main.jsp?menuGubun=' + value1 + '&no=' + value2 + '&searchGubun=' + value3 + '&searchData=' + value4; 	
}
</script>