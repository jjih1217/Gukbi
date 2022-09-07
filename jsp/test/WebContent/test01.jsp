<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	int sumOdd = 0;
	int sumEven = 0;
	
 	for(int i=1; i<=100; i++) {
 		if(i%2 != 0 ) {
 			sumOdd += i;
 		} else {
 			sumEven += i;
 		}
 	}
%>

홀수의 합 : <%=sumOdd %><br>
짝수의 합 : <%=sumEven %>


