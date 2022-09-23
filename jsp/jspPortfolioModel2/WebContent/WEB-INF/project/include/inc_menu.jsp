<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<table border="0" align="center" width="80%">
	<tr>
		<td colspan="13 style="padding: 0 0 10px 10px">
		location : project> ${folderName } > ${fileName }
		</td>
		<td colspan="13" style="padding: 0 0 0 20px" align="right">
		접속IP : ${ip }
		<br>
		<%-- ${referer } --%>
		</td>
	</tr>
	<tr>
		<td style="padding: 0px 10px;" id="home">
			<a href="${path }/dashBoard_index.do">Home</a>
		</td>
		<td style="padding: 0px 10px;" id="member">
			<a href="${path }/member_servlet/member_list.do">회원관리</a>
		</td>
		<td style="padding: 0px 10px;" id="memo">
			<a href="${path }/memo_servlet/memo_list.do">메모장</a>
		</td>
		<td style="padding: 0px 10px;" id="guestBook">
			<a href="#">방명록</a>
		</td>
		<td style="padding: 0px 10px;" id="board">
			<a href="#">게시판</a>
		</td>
		<td style="padding: 0px 10px;" id="shopProduct">
			<a href="#">Mall(상품관리)</a>
		</td>
		<td style="padding: 0px 10px;" id="shopVender">
			<a href="#">Mall(제조사)</a>
		</td>
		<td style="padding: 0px 10px;" id="shopMall">
			<a href="#">Mall(쇼핑몰)</a>
		</td>
		<td style="padding: 0px 10px;" id="chart">
			<a href="#">Chart</a>
		</td>
	</tr>
</table>