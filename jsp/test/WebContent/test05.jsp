<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="testForm" method="post" action="test05Proc.jsp">
<table border="0">
	<tr>
		<td>사원번호</td>
		<td><input type="text" name="eno"></td>
	</tr>
	<tr>
		<td>사원명</td>
		<td><input type="text" name="ename"></td>
	</tr>
	<tr>
		<td>부서명</td>
		<td><input type="text" name="dname"></td>
	</tr>
	<tr>
		<td>급여</td>
		<td><input type="text" name="salary"></td>
	</tr>
	<tr>
		<td>부서장명</td>
		<td><input type="text" name="manager"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="submit">확인</button>
		</td>
	</tr>
</table>
</form>

