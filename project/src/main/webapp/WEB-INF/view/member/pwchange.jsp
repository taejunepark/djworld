<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/infoHeader.jsp"%>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
function pwCheck() {
	var pw = document.querySelector("input[name=newpw]");
	var regex = /^[\w!@#$%^&*()]{6,20}$/g;
	if(regex.test(pw.value)){ 
		pw.style = "border:2px solid blue";
		 $('#newpwMSG').html('<p style="color:blue">사용 가능한 비밀번호입니다.</p>');
		 return true;
	 }
	 else if(pw.value.length < 6 || pw.value.length > 20 ){
		 pw.style = "border:2px solid red";
		 $('#newpwMSG').html('<p style="color:red">비밀번호는 영문, 숫자, 기호 총 6~20글자로 정해주세요.</p>');
		 return false;
	 }
}

function pw2Check() {
	var pw = document.querySelector("input[name=newpw]");
	var pw2 = document.querySelector("input[name=newpw2]");

	if (pw.value === pw2.value && pw2.value !== "") {
		pw2.style = "border:2px solid blue";
		$('#newpw2MSG').html('<p style="color:blue">비밀번호가 일치합니다.</p>');
		return true;
	} else if (pw.value != pw2.value) {
		pw2.style = "border:2px solid red";
		$('#newpw2MSG').html('<p style="color:red">비밀번호가 일치하지 않습니다.</p>');
		return false;
	} else if(pw.value == ""){
		pw2.style = "border:2px solid red";
		$('#newpw2MSG').html('<p style="color:red">필수 정보입니다.</p>');
		pw2.value = "";
		return false;
	}
}

</script>
<div class="empty-row"></div>
<div class="area-60 center">
	<form action="${pageContext.request.contextPath }/member/pwchange" method="post" >
		<table class="area-60 center"
			style="border: 1px solid black; height: 700px; padding: 20px;">
			<tr>
				<th colspan="2">
					<div class="font-medium text-left"
						style="color: blue; margin-bottom: 20px">비밀번호 변경</div>
					<div class="font-small text-left">
						안전한 비밀번호로 내정보를 보호하세요<br> 다른 아이디/사이트에서 사용한 적 없는 비밀번호<br>
						이전에 사용한 적 없는 비밀번호가 안전합니다.
					</div>
				</th>
			</tr>
			<tr>
				<td>
					<input class="form-input" type="password" name="newpw"
					placeholder="새 비밀번호" onblur="pwCheck()"	required>
					<div id="newpwMSG" style="padding-bottom: 5px;"></div> 
				</td>
			</tr> 
			<tr>
				<td>
					<input	class="form-input" type="password" name="newpw2"
					placeholder="새 비밀번호 확인" onkeyup="pw2Check();" required>
					<div id="newpw2MSG" style="padding-bottom: 5px;"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input class="form-btn area-100" type="submit"
					value="확인" style="margin-bottom: 10px;"> <input
					class="form-btn area-100" type="button" value="취소"
					style="background-color: white; color: black;"
					onclick="location.href=${pageContext.request.contextPath}/">
				</td>
			</tr>
		</table>
	</form>
</div>
<div class="empty-row"></div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>
