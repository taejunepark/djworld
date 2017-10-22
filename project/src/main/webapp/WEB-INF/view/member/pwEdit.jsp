<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/infoHeader.jsp"%>

<script>

$(document).ready(function(){
	$("#email").on("blur", function(){
		$.ajax({
			 url:"mailcheck",
			 type:'POST',
			 data:{
				 check:$("#email").val()
			 },
			 success:function(data){
				var input = document.querySelector("input[name=email]");
				var regex =  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				 if($.trim(data) == 0 && regex.test(input.value)){ 
					 input.className = "correct";
					 $('#mailMSG').html('<p style="color:blue">사용 가능한 이메일입니다.</p>');
					 mailFlag = true;
				 }
				 else if($.trim(data) == 1){
					 input.className = "incorrect";
					 $('#mailMSG').html('<p style="color:red">중복된 이메일이 존재합니다.</p>');
				 }
				 else if(input.value.length < 5 || input.value.length > 15 || !regex.test(input.value)){
					 input.className = "incorrect";
					 $('#mailMSG').html('<p style="color:red">이메일 주소를 다시 한번 확인해주세요.</p>');
				 }
			 },
			 err:function(err){
				 console.log("실패");
			}
		});
	});
});

function pwCheck() {
	var input = document.querySelector("input[name=pw]");
	var regex = /^[\w!@#$%^&*()]{6,20}$/g;
	if(regex.test(input.value)){ 
		 input.className = "correct";
		 $('#pwMSG').html('<p style="color:blue">사용 가능한 비밀번호입니다.</p>');
		 return true;
	 }
	 else if(input.value.length < 6 || input.value.length > 20 ){
		 input.className = "incorrect";
		 $('#pwMSG').html('<p style="color:red">비밀번호는 영문, 숫자, 기호 총 6~20글자로 정해주세요.</p>');
		 return false;
	 }
}
</script>
<div class="empty-row"></div>
<div class="area-60 center">
	<form action="edit" method="post">
		<table class="area-60 center font-small table-80">
			<tr>
				<th colspan="2" class="font-big"></th>
			</tr>
			<tr>
				<th width="20%">이름</th>
				<td><input class="form-input" type="text" name="name"
					placeholder="이름" value="${member.name}" readonly></td>
			</tr>
			<tr>
				<th class="area-30">아이디</th>
				<td><input class="form-input" type="text" name="id"
					placeholder="아이디" value="${member.id}" readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input class="form-input" type="password" name="pw"
					placeholder="비밀번호" onblur="pwCheck()" required></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input class="form-input" type="text" name="birth"
					placeholder="생년월일" value="${member.birth}" readonly></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input class="form-input" type="text" name="phone"
					placeholder="전화번호" value="${member.phone}"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input class="form-input" type="text"  id="email" name="email"
					placeholder="이메일" value="${member.email}"></td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="row text-center">
						<div class="inline">
							<input class="form-btn" type="submit" value="수정">
						</div>
					</div>
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>
