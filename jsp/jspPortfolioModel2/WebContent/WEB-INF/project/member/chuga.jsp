<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/inc_header.jsp" %>
<%@ include file = "_inc_top.jsp" %>

<h2>회원등록</h2>  
<form name="DirForm">
<input type="hidden" name="searchGubun" id="searchGubun" value="${searchGubun }">
<input type="hidden" name="searchData" id="searchGubun" value="${searchData }">
<table border="1" align="center" width="80%">
	<tr>
		<td width="150">아이디</td>
		<td>
			<input type="text" name="id" id="id" value="">
			<input type="hidden" name="tempId" id="tempId" value="">
			<button type="button" onClick="idCheck();">아이디찾기</button>
			<button type="button" onClick="idCheckWin();">아이디찾기(새창)</button>
			<br>
			<label id="label_id"></label>
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="passwd" value="">
		</td>
	</tr>
	<tr>
		<td>비밀번호확인</td>
		<td>
			<input type="password" name="passwdChk" value="">
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>
			<input type="text" name="name" value="">
		</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>
			<input type="text" name="jumin1" maxlength="6" style="width: 40px;"> -
			<input type="text" name="jumin2" maxlength="1" style="width: 10px;">******
		</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>
			<select name="phone1">
				<option value="010" selected> 010</option>
				<option value="011"> 011</option>
				<option value="016"> 016</option>
			</select>
			<input type="text" name="phone2" maxlength="4" style="width: 50px;">
			<input type="text" name="phone3" maxlength="4" style="width: 50px;">
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>
			<input type="text" name="email1" style="width: 100px;">
			@
			<select name="email2">
				<option value="google.com" selected> google.com</option>
				<option value="naver.com"> naver.com</option>
				<option value="daum.net"> daum.net</option>
			</select>
		</td>
	</tr>
	<tr>
		<td rowspan="3">주소</td>
		<td>
			<input type="text" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호">
			<input type="button" onClick="sample6_execDaumPostcode()" value="우편번호 찾기">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="sample6_address" id="sample6_address" placeholder="주소">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세주소">
			<input type="text" name="sample6_extraAddress" id="sample6_extraAddress" placeholder="참고항목">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="button" onClick="save();">등록하기</button>
			<button type="button" onClick="move('member_list.do','');">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	var id = document.DirForm.id.value;
	var tempId = document.DirForm.tempId.value;
	
	
	if(id == '' || tempId == '' && id != tempId){
		alert('아이디 찾기를 해주세요');
		return;
	}
	
	
	if(confirm('OK?')){
		document.DirForm.action = "${path}/member_servlet/member_chugaProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

function move (value1, value2) {
	location.href = "${path}/member_servlet/" + value1 + "?no=" + value2 + "&${searchQuery}";
}

function idCheck() {
	var id = $("#id").val();
	if(id == '') {
		$("#label_id").html("아이디를 입력하세요");
		$("#label_id").css('color', 'blue');
		$("#label_id").css('font-size', '8px');
		$("#id").focus();
		return;
	}
	
	//var param = {"id" : id }
	var param = "id=" + id
	$.ajax({
		type: "post",
		data: param,
		url: "${path}/member_servlet/member_idCheck.do",
		success: function(result) {
			alert('id:' + id);
			if(result > 0) {
				$("#id").val('');
				$("#tempId").val('');
				$("#label_id").html("이미 사용중인 아이디입니다");
				$("#label_id").css('color', 'red');
				$("#label_id").css('font-size', '8px');
			} else {
				$("#id").val(id);
				$("#tempId").val(id);
				$("#label_id").html("사용가능한 아이디입니다");
				$("#label_id").css('color', 'blue');
				$("#label_id").css('font-size', '8px');
			}
		}
	});
}

function idCheckWin() {
	window.open("${path }/member_servlet/member_idCheckWin.do", "idCheckNo", "width=600, height=210, toolbar=no, menubar=no, scrollbar=no, resizable=no")
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
