<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_top.jsp" %>

<table border="1" align="center" width="80%">
	<tr>
		<td colspan="2" ><h2 style="padding-top: 20px">회원상세보기</h2></td>
	</tr>
	<tr>
		<td width="150">순번</td>
		<td>${dto.no}</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${dto.name}</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>${dto.gender}</td>
	</tr>
	<tr>
		<td>태어난년도</td>
		<td>${dto.birth}</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>
			${dto.postcode} <br>
			${dto.address} ${dto.detailAddress} ${dto.extraAddress}
		</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${dto.regiDate}</td>
	</tr>
	
</table>