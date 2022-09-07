<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.ArrayList"%>
<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>

<%@page import="config.Util"%>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<% 
	String searchGubun = request.getParameter("searchGubun");
	String searchData = request.getParameter("searchData");
	
	Util util = new Util();
	searchGubun = util.getNullBlankCheck(searchGubun, "");
	searchData = util.getNullBlankCheck(searchData, "");
	
	if(searchGubun.equals("") || searchData.equals("")){
		searchGubun = "";
		searchData = "";
	}

	MemoDAO dao = new MemoDAO();
	ArrayList<MemoDTO> list = dao.getSelectAll(searchGubun, searchData);
%>

<h2>메모목록</h2>

<fieldset style="border: 0px solid blue; margin: 10px 0 20px; width: 80%;">
	<form name="chugaForm">
	<table border="0" align="left">
		<tr>
			<th>no</th>
			<td><input type="text" name="no" id="no"></td>
		</tr>
		<tr>
			<th>proc</th>
			<td><input type="text" name="procGubun" id="procGubun" value="memo_chugaProc"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" id="writer"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea type="text" name="content" id="content" style="width: 200px; height: 50px;"></textarea></td>
		</tr>
		<tr>
			<td><button type="button" onClick="save();" id="btnSave">등록하기</button></td>
		</tr>
	</table>
	</form>
	<script>
	function save() {
		if(confirm('처리할까요?')) {
			var procGubun = document.chugaForm.procGubun.value;
			document.chugaForm.action = "mainProc.jsp?menuGubun=" + procGubun;
			document.chugaForm.method = "post";
			document.chugaForm.submit();
		}
		
	}
	</script>
</fieldset>

<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>작성자</th>
		<th>내용</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
	
	<% 
		for(int i=0; i<list.size(); i++) {
			MemoDTO dto = list.get(i);	
	%>
		<tr>
			<td><%=dto.getNo() %></td>
			<td><a href="#" onClick="move('view.jsp','<%=dto.getNo() %>');"><%=dto.getWriter() %></a></td>
			<td>
				<%=dto.getContent() %>
				<input type="hidden" id="no_<%=i %>" value="<%=dto.getNo() %>">
				<input type="hidden" id="writer_<%=i %>" value="<%=dto.getWriter() %>">
				<input type="hidden" id="content_<%=i %>" value="<%=dto.getContent() %>">
			</td>
			<td><%=dto.getRegiDate() %></td>
			<td>
				<%-- <input type="hidden" id="no_<%=i %>" value="<%=dto.getNo() %>">
				<input type="hidden" id="writer_<%=i %>" value="<%=dto.getWriter() %>">
				<input type="hidden" id="content_<%=i %>" value="<%=dto.getContent() %>"> --%>
				
				<a href="#" onClick="suntaek('<%=dto.getNo() %>', 'memo_sujungProc','수정하기');">[수정]</a>
				/
				<a href="#" onClick="suntaek('<%=dto.getNo() %>', 'memo_sakjeProc','삭제하기');">[삭제]</a>
			</td>

		</tr>
	<%
		}
	%>
	
	<tr>
		<td colspan="5" align="center" style="padding: 20px 0px">
			<form name="searchForm">
			<select name="searchGubun">
				<option value="" <% if(searchGubun.equals("")) { out.println("selected"); } %> >-- 선택 --</option>
				<option value="writer" <% if(searchGubun.equals("writer")) { out.println("selected"); } %> >작성자</option>
				<option value="content" <% if(searchGubun.equals("content")) { out.println("selected"); } %> >내용</option>
				<option value="writer_content" <% if(searchGubun.equals("writer_content")) { out.println("selected"); } %> >작성자+내용</option>
			</select>
			
			<input type="text" name="searchData" value="<%=searchData %>">
			&nbsp;
			<button type="button" onClick="search();">검색하기</button>
			</form>
			<script>
			function search() {
				document.searchForm.action = "mainProc.jsp?menuGubun=memo_listSearch";
				document.searchForm.method = "post";
				document.searchForm.submit();
			}
			</script>
		</td>
	</tr>
	
	
</table>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="main.jsp?menuGubun=memo_chuga">등록</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href = 'main.jsp?menuGubun=' + value1  + '&no=' + value2;
}

function suntaek(value1, value2, value3) {
	alert('i 값 : ' + value1);
	var jsNo = $("#no_" + value1).val();
	var jsWriter = $("#writer_" + value1).val();
	var jsConetent = $("#content_" + value1).val();
	
	$("#no").val(jsNo);
	$("#writer").val(jsWriter);
	$("#content").val(jsConetent);
	$("#procGubun").val(value2);
	$("#btnSave").text(value3);
}
</script>