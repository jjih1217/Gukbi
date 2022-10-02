<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name="DirForm">
<%-- <input type="hidden" name="pageNumber" value="${pageNumber }">
<input type="hidden" name="searchGubun" value="${searchGubun }">
<input type="hidden" name="searchData" value="${searchData }"> --%>
<input type="hidden" name="no" value="${dto.no}">
<table border="1" width="80%">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject" value=""></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea name="content" style="width: 300px; height: 100px;"></textarea>
		</td>
	</tr>
	<tr>
		<td>공지글</td>
		<td>
			<input type="radio" name="noticeGubun" value="T"> 공지글 &nbsp;
			<input type="radio" name="noticeGubun" value="F" checked> 공지글아님 &nbsp;
		</td>
	</tr>
	<tr>
		<td>비밀글</td>
		<td>
			<input type="radio" name="secretGubun" value="T"> 비밀글 &nbsp;
			<input type="radio" name="secretGubun" value="F" checked> 비밀글아님 &nbsp;
		</td>
	</tr>
	<tr>
		<td>첨부 :  </td>
		<td>
			<input type="file" name="file1"><br>
			<input type="file" name="file2"><br>
			<input type="file" name="file3"><br>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="save();">등록</button>
			<button type="button" onClick="${path}/board_servlet/board_list.do">목록</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('등록할까요?')) {
		document.DirForm.enctype = "multipart/form-data";
		document.DirForm.action = "${path}/board_servlet/board_chugaProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
	
}
</script>