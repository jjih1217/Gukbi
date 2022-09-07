<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>

<%
	CartDAO dao = new CartDAO();
	ArrayList<CartDTO> list = dao.getSelectAll();
%>

<h2>장바구니 목록</h2>  
<form name="DirForm">
<table border="1" width="80%">
	<tr>
		<th bgColor="lightgray" style="width:50px">
			<input type="checkBox" name="chkAll" id="chkAll">
		</th>
		<th bgColor="lightgray">이미지</th>
		<th bgColor="lightgray">제조사</th>
		<th bgColor="lightgray">상품이름</th>
		<th bgColor="lightgray">상품가격</th>
		<th bgColor="lightgray">수량</th>
		<th bgColor="lightgray">금액</th>
		<th bgColor="lightgray">등록일</th>
		<th bgColor="lightgray">비고</th>
	</tr>
	<% 
		int totalCounter = 0;
		int totalMoney = 0;
		for(int i=0; i<list.size(); i++) { 
			CartDTO dto = list.get(i);
			String[] imsiArray01 = dto.getProductInfo().split("[/]");
			//이미지
			String[] imsiArray02 = imsiArray01[3].split("[|]");
			String img = imsiArray02[1]; //서버상이미지이름
			
			if(img.equals("-")) {
				img = "&nbsp;";
			} else {
				img = imgDisplayPath + "/product/" + img;
				img = "<img src='" + img + "' width='60px' height='60px'>";
			}
			
			int hab = Integer.parseInt(imsiArray01[1]) * dto.getAmount();
			totalMoney += hab;
	%>
			<tr>
				<td>
					<%=dto.getCartNo()%>
					<input type="checkBox" name="chk" value="<%=dto.getCartNo()%>">
				</td>
				<td width="60px" height="60px"><%=img %></td>
				<td><%=imsiArray01[2] %></td>
				<td><%=imsiArray01[0] %></td>
				<td><%=imsiArray01[1] %></td>
				<td><%=dto.getAmount() %></td>
				<td><%=hab %></td>
				<td><%=dto.getRegiDate() %> </td>
				<td>
					<a href="#" onClick="cartClearOne('<%=dto.getCartNo() %>','G');">[삭제(G)]</a>/
					<a href="#" onClick="cartClearOne('<%=dto.getCartNo() %>','F');">[삭제(P)]</a>
				</td>
			</tr>
	<%
			totalCounter++;
		} 
	%>
	<tr>
		<td colspan="9" align="right" style="padding: 10px; background: #e7f2ff">
			Total : <%=totalMoney %>
		</td>
	</tr>
</table>
<input type="hidden" name="totalCounter" value="<%=totalCounter %>">
</form>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="move('shopCart_list', '');">목록</a>
	|
	<a href="#" onClick="cartClearForm();">삭제(Form)</a>
	|
	<a href="#" onClick="cartClearScript();">삭제(Script)</a>
	|
</div>

<form name="imsiForm">
<input type="hidden" name="cartNo">
</form>

<form name="suntaekForm">
<input type="hidden" name="suntaekNo">
</form>


<script>
$(document).ready(function(){
	$("#chkAll").click(function(){
		if($("#chkAll").prop("checked")){
			$('input[name="chk"]').prop("checked", true);
		} else {
			$('input[name="chk"]').prop("checked", false);
		}
	})
})


function move(value1, value2){
	location.href='main.jsp?menuGubun=' + value1 + '&cartNo=' + value2;
}

function cartClearOne(cartNo, procGubun) {
	if(confirm('삭제할까요?')){
		if(procGubun == 'G') {
			location.href='mainProc.jsp?menuGubun=shopCart_sakjeProcOne&cartNo=' + cartNo ;
		} else {
			document.imsiForm.cartNo.value = cartNo;
			document.imsiForm.action = "mainProc.jsp?menuGubun=shopCart_sakjeProcOne";
			document.imsiForm.method = "post";
			document.imsiForm.submit();
		}
	}
}

function cartClearForm() {
	if(confirm('삭제할까요?')) {
		document.DirForm.action = "mainProc.jsp?menuGubun=shopCart_sakjeProcForm";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

function cartClearScript() {
    if(confirm('장바구니를 비우시겠습니까?')) {
       var chk_no = '';
       $('input[name="chk"]:checked').each(function (index) {
          if(index != 0) {
             chk_no += ',';
          }
          chk_no += $(this).val();
       });
       document.suntaekForm.suntaekNo.value = chk_no;
       
       document.suntaekForm.action = "mainProc.jsp?menuGubun=shopCart_sakjeProcScript";
       document.suntaekForm.method = "post";
       document.suntaekForm.submit();         
    }
 }

</script>