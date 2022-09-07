<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "_inc_top.jsp" %>
<%@ include file = "_inc_script.jsp" %>

<%	
	String pageNumber_ = request.getParameter("pageNumber");
	if(pageNumber_ == null || pageNumber_.trim().equals("")){
		pageNumber_ = "1";
	}
	int pageNumber = Integer.parseInt(pageNumber_);
	
	//검색
	String searchValue = "O";
	String searchGubun = request.getParameter("searchGubun");
	String searchData = request.getParameter("searchData");
	
	if(searchGubun == null || searchGubun.trim().equals("")) {
		searchGubun = "";
	}
	if(searchData == null || searchData.trim().equals("")) {
		searchData = "";
	}
	if(searchGubun.trim().equals("") || searchData.trim().equals("")) {
		searchValue = "X";
		searchGubun = "";
		searchData = "";
	}
	
	BoardDAO dao = new BoardDAO();
	
	//페이징
	int totalRecord = dao.getTotalRecord(searchGubun, searchData); //검색한 값의 totalrecord
	//out.println("totalRecord : " + totalRecord );
	int pageSize = 10; // 한 페이지에 나타낼 레코드 갯수
	int blockSize = 10; // [1][2]...[10]
	int block = (pageNumber - 1) / pageSize; //pageNumber:보이는 페이지
	int jj = totalRecord - pageSize * (pageNumber - 1); //최근레코드부터 내림차순(화면에 보이는 용도의 일련번호)
	
	double totalPageDou = Math.ceil(totalRecord / (double)pageSize);
	int totalPage = (int)totalPageDou;
	
	int startRecord = pageSize * (pageNumber - 1) + 1;
	int lastRecord = pageSize * pageNumber; 
	
	
	ArrayList<BoardDTO> list = dao.getSelectAll(searchGubun, searchData, startRecord, lastRecord); //검색항목 매개변수
%>

<h2>게시글 목록</h2>

<div style="border: 0px solid red; padding: 20px 0; width: 80%;" align="left">
<% if(searchValue.equals("O")) { %>
 * 검색어 "<%=searchData %>"(으)로 검색된 목록 : <%=totalRecord %>건
<%  } else { %>
 * 전체 목록 : <%=totalRecord %>건
<% } %>
(현재페이지: <%=pageNumber %> / 전체페이지 : <%=totalPage %>)
</div>

<table border="1" width="80%">
	<tr>
		<th>no</th>
		<th>num</th>
		<th>subject</th>
		<th>writer</th>
		<th>regiDate</th>
		<th>hit</th>
		
		<th>refNo</th>
		<th>stepNo</th>
		<th>levelNo</th>
		<th>parentNo</th>
		
		<th>memberNo</th>
		<th>ip</th>
		<th>noticeNo</th>
		<th>secretGubun</th>
		
	</tr>

	<% for(int i=0; i<list.size(); i++) {
		BoardDTO indexDto = list.get(i);
	%>
		<tr>
			<td>
				<%
					if(indexDto.getNoticeNo() > 0) { 
						out.println("공지");
					} else {
						//out.println(indexDto.getNo());
						out.println(jj);
				 	} 
				%>
			</td>
			<td><%=indexDto.getNum() %></td>
			<td>
				<%
					String blankValue = "";
					for(int j=2; j<=indexDto.getStepNo(); j++) {
						blankValue += "&nbsp;&nbsp;";
					}
					
					String tempSubject = indexDto.getSubject();
					if(tempSubject.length() > 10) {
						tempSubject = tempSubject.substring(0, 10) + "...";
					}
					
					if(indexDto.getStepNo() > 1) {
						tempSubject = "[re]: " + tempSubject;
					}
					
					/* String msg = "";
					msg += "<a href=\"#\" onClick=\"move('board_view', '" + indexDto.getNo() + "');\">" + tempSubject + "</a>";
					out.println(msg); */
				%>
				<%=blankValue %>
				<a href="#" onClick="move('board_view','<%=indexDto.getNo() %>', '<%=searchGubun %>', '<%=searchData %>');"><%=tempSubject %></a>
			</td>
			<td><%=indexDto.getWriter() %></td>
			<td><%=indexDto.getRegiDate() %></td>
			<td><%=indexDto.getHit() %></td>
			
			<td><%=indexDto.getRefNo() %></td>
			<td><%=indexDto.getStepNo() %></td>
			<td><%=indexDto.getLevelNo() %></td>
			<td><%=indexDto.getParentNo() %></td>
			
			<td><%=indexDto.getMemberNo() %></td>
			<td><%=indexDto.getIp() %></td>
			<td><%=indexDto.getNoticeNo() %></td>
			<td><%=indexDto.getSecretGubun() %></td>
		</tr>
	<% 
			jj--;
		} 
	%>

</table>

<div style="border: 0px solid red; padding: 20px 0; width: 80%;" align="center">
	<form name="searchForm">
	<select name="searchGubun">
		<option value="">-- 선택 --</option>
		<option value="writer" <% if(searchGubun.equals("writer")){ out.println("selected"); } %>>작성자</option>
		<option value="subject" <% if(searchGubun.equals("subject")){ out.println("selected"); } %>>제목</option>
		<option value="content" <% if(searchGubun.equals("content")){ out.println("selected"); } %>>내용</option>
		<option value="writer_subject_content" <% if(searchGubun.equals("writer_subject_content")){ out.println("selected"); } %>>작성자+제목+내용</option>
	</select>
	&nbsp;
	<input type="text" name="searchData" value="<%=searchData %>">
	&nbsp;
	<button type="button" onClick="search();">검색</button>
	</form>
	
	<script>
	function search() {
		if(confirm('검색?')) {
			document.searchForm.action = "main.jsp?menuGubun=board_listSearch";
			document.searchForm.method = "post";
			document.searchForm.submit();
		}
	}
	</script>
</div>

<div style="border: 0px solid red; padding: 20px 0; width: 80%;" align="center">

<%
	int totalBlock = totalPage / blockSize;
	double value1 = (double)totalBlock;
	double value2 = totalPage / blockSize;
	if(value1 - value2 == 0) {
		totalBlock = totalBlock -1;
	}
%>

<a href="#" onClick="goPage('<%=menuGubun %>', '1', '<%=searchGubun %>', '<%=searchData %>');">[첫페이지]</a>
&nbsp;&nbsp;

<!-- 이전10개  -->	
<% 
	if(block > 0) { 
	int imsiPage = (block - 1) * blockSize + 10;
%>
	<a href="#" onClick="goPage('<%=menuGubun %>', '<%=imsiPage %>', '<%=searchGubun %>', '<%=searchData %>');">[이전10개]</a>
<% } else { %>
	[이전10개]
<% } %>

&nbsp;&nbsp;
<!-- 페이저  -->	
<% 
	for(int goPage = 1; goPage <= blockSize; goPage++) {
		int imsiValue = block * blockSize + goPage;
		if(totalPage - imsiValue >= 0) {
			if(imsiValue == pageNumber) {
%>
				<span style="font-weight: bold;">[<%=imsiValue %>]</span>
<% 
			} else {
%>
				<a href="#" onClick="goPage('<%=menuGubun %>', '<%=imsiValue %>', '<%=searchGubun %>', '<%=searchData %>');"><%=imsiValue %></a> 
<%
			}
			out.println("&nbsp;");
		}
	}
%>
<!-- 다음10개  -->			
<%
	if(block - totalBlock <= 0) {
		int yyy = (block + 1) * blockSize + 1;
		//int zzz = block + 1;
%>
		<a href="#" onClick="goPage('<%=menuGubun %>', '<%=yyy %>', '<%=searchGubun %>', '<%=searchData %>');">[다음10개]</a> 
<%
	} else {
%>	
		[다음10개]
<%
	}
%>

&nbsp;&nbsp;
<!-- 끝페이지  -->	
<a href="#" onClick="goPage('<%=menuGubun %>', '<%=totalPage %>', '<%=searchGubun %>', '<%=searchData %>');">[끝페이지]</a>
</div>

<script>
function goPage(value1, value2, value3, value4) {
	location.href = 'main.jsp?menuGubun=' + value1 + '&pageNumber=' + value2 +  '&searchGubun=' + value3 + '&searchData=' + value4;
}
</script>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="move('board_list', '', '', '');">전체목록</a>
	|
	<a href="#" onClick="move('board_list', '', '<%=searchGubun %>', '<%=searchData %>');">목록</a>
	|
	<a href="#" onClick="move('board_chuga', '', '<%=searchGubun %>', '<%=searchData %>');">등록</a>
	|
</div>
