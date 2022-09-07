<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>

<%
	String productCode_ = request.getParameter("productCode");
	int productCode = Integer.parseInt(productCode_);
	
	ShopProductDTO arguDto = new ShopProductDTO();
	arguDto.setProductCode(productCode);
	
	ShopProductDAO shopProductDao = new ShopProductDAO();
	ShopProductDTO returnDto = shopProductDao.getSelectOne(arguDto);
%>

<h2>쇼핑몰 상세보기</h2>    
<table border="1" width="80%">
<tr>
	<th bgColor="lightgray" width="120px">상품코드</th>
	<td><%=returnDto.getProductCode() %></td>
</tr>
<tr>
	<th bgColor="lightgray">상품명</th>
	<td><%=returnDto.getProductName() %></td>
</tr>
<tr>
	<th bgColor="lightgray">상품가격</th>
	<td><%=returnDto.getProductPrice() %></td>
</tr>
<tr>
	<th bgColor="lightgray">제조사명</th>
	<td><%=returnDto.getVendorCode() %></td>
</tr>
<tr>
	<th bgColor="lightgray">등록일</th>
	<td><%=returnDto.getRegiDate() %></td>
</tr>
<tr>
	<th bgColor="lightgray">상품이미지</th>
	<td>
		<%
			String[] imsiArray01 = returnDto.getAttachInfo().split(",");
			for(int i = 0; i<imsiArray01.length; i++) {
				String[] imsiArray02 = imsiArray01[i].split("[|]");
				if(imsiArray02[1].equals("-")) {
					out.println("이미지 없음");
				} else {
					String imsiImgPath = "";
					imsiImgPath += request.getContextPath();
					imsiImgPath += "/attach";
					imsiImgPath += request.getContextPath();
					imsiImgPath += "/product/";
					imsiImgPath += imsiArray02[1];
					
					out.println("<img src='" + imsiImgPath + "' width='120' height='120'>");
				}
				out.println("<hr>");
			}
		%>
	</td>
</tr>
<tr>
	<td colspan="2" style="padding: 20px;">
		<select name="jumunSu" id="jumunSu">
			<option value="0">-- 선택 --</option>
			<% for(int i=0; i<=20; i++) { %>
				<option value="<%=i %>"><%=i %></option>
			<% } %>
		</select>
		<button type="button" onClick="btnProc('saveCart');">장바구니담기</button>
		<button type="button" onClick="btnProc('gumae');">바로구매</button>
		<button type="button" onClick="btnProc('shopping');">계속쇼핑</button>
		<button type="button" onClick="btnProc('viewCart');">장바구니보기</button>
	</td>
</tr>
</table>

<form name="imsiForm">
<%-- <input type="text" name="imsiProductCode" value="<%=productCode %>">
<input type="text" name="amount"> --%>
<input type="hidden" name="imsi">
</form>

<script>
function btnProc(value1) {
	if(value1 == 'saveCart') {
		if(confirm('장바구니에 담을까요?')) {
			//document.imsiForm.amount.value = document.getElementById("jumunSu").value;
			document.imsiForm.imsi.value = <%=productCode %> + "|" + document.getElementById("jumunSu").value;
			document.imsiForm.action = "mainProc.jsp?menuGubun=shopMall_cartChugaProc";
			document.imsiForm.method = "post";
			document.imsiForm.submit();
		}
	} else if (value1 == 'gumae') {
		alert('바로구매');
	} else if (value1 == 'shopping') {
		location.href = 'main.jsp?menuGubun=shopMall_list';
	} else if (value1 = 'viewCart') {
		location.href = 'main.jsp?menuGubun=shopCart_list';
	}
}
</script>