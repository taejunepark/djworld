<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/infoHeader.jsp"%>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>

$(document).ready(function(){
	$("#newemail").on("blur", function(){
		$.ajax({
			 url:"mailcheck",
			 type:'POST',
			 data:{
				 check:$("#newemail").val()
			 },
			 success:function(data){
				var input = document.querySelector("input[name=newemail]");
				var regex =  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				 if($.trim(data) == 0 && regex.test(input.value)){ 
					 input.style = "border:2px solid blue";
					 $('#newemailMSG').html('<p style="color:blue">사용 가능한 이메일입니다.</p>');
					 mailFlag = true;
				 }
				 else if($.trim(data) == 1){
					 input.style = "border:2px solid red";
					 $('#newemailMSG').html('<p style="color:red">중복된 이메일이 존재합니다.</p>');
				 }
				 else if(input.value.length < 5 || input.value.length > 15 || !regex.test(input.value)){
					 input.style = "border:2px solid red";
					 $('#newemailMSG').html('<p style="color:red">이메일 주소를 다시 한번 확인해주세요.</p>');
				 }
			 },
			 err:function(err){
				 console.log("실패");
			}
		});
	});
	
	$("#nowemail").on("blur", function(){
		$.ajax({
			 url:"idemailcheck",
			 type:'POST',
			 data:{
				 check:$("#nowemail").val()
			 },
			 success:function(data){
				var input = document.querySelector("input[name=nowemail]");
				 if(data === "true"){ 
					 input.style = "border:2px solid blue";
					 $('#nowemailMSG').html('<p style="color:blue">이메일이 일치합니다.</p>');
					 mailFlag = true;
				 }
				 else if(data === "false"){
					 input.style = "border:2px solid red";
					 $('#nowemailMSG').html('<p style="color:red">이메일이 일치하지 않습니다.</p>');
			 	}
			 },
			 err:function(err){
				 console.log("실패");
			}
		});
	});
});



function sendCheck() {
	//폼의 전송을 중지하고 검사한 뒤에 합격이면 전송한다

	//기본 이벤트를 중지시키는 명령
	event.preventDefault();

	//검사
	var result = mailFlag;
	if (!result){
		alert("입력한 이메일을 다시 한번 확인해주세요.");
		return;
	}

	//전송
	var form = document.querySelector("form");
	form.submit();
}
</script>
<div class="empty-row"></div>
<div class="area-60 center">
	<form action="${pageContext.request.contextPath }/member/emailchange"
		method="post" onSubmit="sendCheck();">
		<table class="area-60 center"
			style="border: 1px solid black; height: 700px; padding: 20px;">
			<tr>
				<th colspan="2">
					<div class="font-medium text-left"
						style="color: blue; margin-bottom: 20px">이메일 변경</div>
					<div class="font-small text-left">
						안전한 비밀번호로 내정보를 보호하세요<br> 다른 아이디/사이트에서 사용한 적 없는 비밀번호<br>
						이전에 사용한 적 없는 비밀번호가 안전합니다.
					</div>
				</th>
			</tr>
			<tr>
				<th><input type="text" id="nowemail" name="nowemail"
					placeholder="기존 이메일" class="form-input">
					<div id="nowemailMSG" style="padding-bottom: 5px;"></div></th>
			</tr>
			<tr>
				<th><input type="text" id="newemail" name="newemail"
					placeholder="새 이메일" class="form-input">
					<div id="newemailMSG" style="padding-bottom: 5px;"></div></th>
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
