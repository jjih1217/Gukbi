<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="_inc_top.jsp" %> 

<%	
	SubBoardDTO arguDto = new SubBoardDTO();
	arguDto.setTbl(tbl);
	arguDto.setSearchGubun(searchGubun);
	arguDto.setSearchData(searchData);
	
	SubBoardDAO subBoardDao = new SubBoardDAO();
	
	int pageSize = 10; // 한 페이지에 출력될 글 수 
	int blockSize = 10; //페이징버튼 갯수
	int totalRecord = subBoardDao.getTotalRecord(arguDto);
	
	int block = (pageNumber - 1) / pageSize; //(11-1)/10 = 1
	int jj = totalRecord - pageSize * (pageNumber - 1); // 화면에 보여질 일련번호
	
	double totalPageDou = Math.ceil(totalRecord / (double)pageSize);// 1004/10 = 100.4 -> 101
	int totalPage = (int)totalPageDou;
	
	int startRecord = pageSize * (pageNumber - 1) + 1; // 각 페이지마다 첫 행 번호 ex)11페이지: 10*(11-1)+1 = 101
	int lastRecord = pageSize * pageNumber; // 각 페이지마다 마지막 행 번호 ex)2페이지 : 10*11 = 110
	
	SubBoardDTO arguDto2 = new SubBoardDTO();
	arguDto2.setTbl(tbl);
	arguDto2.setSearchGubun(searchGubun);
	arguDto2.setSearchData(searchData);
	arguDto2.setStartRecord(startRecord);
	arguDto2.setLastRecord(lastRecord);
	
	ArrayList<SubBoardDTO> list = subBoardDao.getSelectAll(arguDto2);
	
	//String imsiQueryString = "searchGubun=" + searchGubun + "&searhData=" + searchData;
	
%>
<h2><%=imsiBoardTitle %>게시글 목록</h2>
<div style="border: 0px solid red; padding: 20px 0; width: 80%;" align="left">
	<form name="searchForm">
	<input type="hidden" name="tbl" value="<%=tbl %>"> 
 	<select name="searchGubun">
 		<option value="">-- 선택 --</option> 
 		<option value="subject" <% if (searchGubun.equals("writer")) { out.println("selected"); } %>>작성자</option> 
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

<div style="border: 0px solid red; padding: 20px 0; width: 80%;" align="left">
<% if (imsiSearchCounter > 0) { //검색안함 %>
	* 전체목록 : <%=totalRecord %> 건 
<% } else { %>
	* 검색어 : "<span style="font-weight: bold; color: red;"><%=searchData %></span>" (으)로 검색된 목록 : <%=totalRecord %>
<% } %>
(<%=pageNumber %> / <%=totalPage %>)
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
		if(totalRecord <= 0) {
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
				<%=blankValue %><a href="#" onClick="move('subBoard_view','<%=pageNumber %>', '<%=dto.getNo() %>');"><%=imsiSubject %></a>
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
	<a href="main.jsp?menuGubun=subBoard_list&tbl=<%=tbl%>">전체목록</a>
	|
	<a href="#" onClick="move('subBoard_list', '1', '');">목록</a>
	|
	<a href="#" onClick="move('subBoard_chuga', '<%=pageNumber %>', '');">등록</a>
	|
</div>

<% if (totalRecord > 0) { %>
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="center">
	
	<%
		int totalBlock = totalPage / blockSize; // 101/10 = 10
		double value1 = (double)totalBlock; //10.0
		double value2 = totalPage / blockSize; //10.0
		if (value1 - value2 == 0 ) { //0
			totalBlock = totalBlock - 1; // 10-1 = 9 
		}
	%>
		<a href="#" onClick="move('subBoard_list','1','');">[첫페이지]</a>
	<%
		if (block > 0) { //1
			int imsiPage = (block - 1) * blockSize + 10; //(1-1)*10+10 = 10
	%>
			<a href="#" onClick="move('subBoard_list','<%=imsiPage%>', '');">[이전10개]</a>
	<% } else {  %> 
			[이전 10개]
	<% } %>
	
	
	
	<% 
		for (int goPage=1; goPage <= blockSize; goPage++) {  
			int imsiValue = block * blockSize + goPage; //1*10+1 = 11
			if (totalPage - imsiValue >= 0) { //101-11 >= 0
				if(imsiValue == pageNumber) { //11 == 11
	%>
					<b>[<%=imsiValue %>]</b> 
	<% 		
				} else { 
	%>
					<a href="#" onClick="move('subBoard_list','<%=imsiValue %>','');"><%=imsiValue %></a>
	<%
				}
				out.println("&nbsp;");
			}
		}
	%>
	
	<%
		if (block - totalBlock <= 0) { // 1-9 <= 0
			int yyy = (block + 1) * blockSize + 1; //(1+1)*10+1 = 21
			//int zzz = block + 1;
	%>
			<a href="#" onClick="move('subBoard_list', '<%=yyy %>','');">[다음10개]</a>
	<% } else { %>
			[다음10개]
	<% } %>

	<a href="#" onClick="move('subBoard_list','<%=totalPage %>','');">[끝페이지]</a>
</div>
<% } %>
<script>
function move(value1, value2, value3) {
	var imsiQueryString = '<%=imsiQueryString %>';
	location.href = 'main.jsp?menuGubun=' + value1 + '&pageNumber=' + value2 + '&no=' + value3 + '&' + imsiQueryString;	
}

</script>