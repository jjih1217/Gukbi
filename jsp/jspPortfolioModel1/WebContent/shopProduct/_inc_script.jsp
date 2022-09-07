<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
/* function move(value1, value2, value3, value4) {
	var linkAddr = 'main.jsp?menuGubun=' + value1  + '&no=' + value2 + '&searchGubun=' + value3 + '&searchData=' + value4;
	location.href = linkAddr;
} */

function move(value1, value2) {
var linkAddr = 'main.jsp?menuGubun=' + value1  + '&productCode=' + value2 ;
location.href = linkAddr;
}
</script>
    