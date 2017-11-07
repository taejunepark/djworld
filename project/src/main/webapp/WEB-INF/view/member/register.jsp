<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/registerHeader.jsp"%>

<html>
<head>
<meta charset="UTF-8">
<title>회원가입 검사</title>
<!-- 디자인 코드를 작성하는 공간 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/each.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/swiper.css">
</head>
<style>
.empty-row {
	height: 30px;
}

.correct {
	border: 2px solid blue;
}

.incorrect {
	border: 2px solid red;
}

input[type=text] {
	width: 90%;
	font-size: 20px;
	padding: 10px;
}

input[type=password] {
	width: 90%;
	font-size: 20px;
	padding: 10px;
}

input[type=submit] {
	width: 90%;
	font-size: 20px;
	padding: 10px;
	background-color: black;
	color: white;
	outline: none;
	border: none;
}

button {
	width: 90%;
	font-size: 20px;
	padding: 10px;
	background-color: white;
	border: 1px solid black;
	color: black;
}

.table {
	border: 1px solid black;
	width: 40%;
	padding: 20px;
	margin: auto;
	margin-bottom: 100px;
}

.gender {
	margin: auto;
	width: 90%;
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var idFlag = false;
	var mailFlag = false;
	
	$(document).ready(function(){
		$("#id").on("blur", function(){
			$.ajax({
				 url:"idcheck",
				 type:'POST',
				 data:{
					 check:$("#id").val()
				 },
				 success:function(data){
					var input = document.querySelector("input[name=id]");
					var regex = /^[a-zA-Z0-9]{5,15}$/g;
					var regex2 = /^[가-힣ㄱ-ㅎ]+$/g;
					 if($.trim(data) == 0 && regex.test(input.value)){ 
						 input.className = "correct";
						 $('#idMSG').html('<p style="color:blue">사용 가능한 아이디입니다.</p>');
						 idFlag = true;
					 }
					 else if($.trim(data) == 1){
						 input.className = "incorrect";
						 $('#idMSG').html('<p style="color:red">중복된 아이디가 존재합니다.</p>');
					 }
					 else if(input.value.length < 5 || input.value.length > 15 || regex2.test(input.value)){
						 input.className = "incorrect";
						 $('#idMSG').html('<p style="color:red">아이디는 5~15 영문자, 숫자로 정해주세요.</p>');
					 }
				 },
				 err:function(err){
					 console.log("실패");
				}
			});
		});
	});
	
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

	function pw2Check() {
		var pw = document.querySelector("input[name=pw]");
		var pw2 = document.querySelector("input[id=pw2]");

		if (pw.value === pw2.value && pw2.value !== "") {
			pw2.style = "border:2px solid blue";
			$('#pw2MSG').html('<p style="color:blue">비밀번호가 일치합니다.</p>');
			return true;
		} else if (pw.value != pw2.value) {
			pw2.style = "border:2px solid red";
			$('#pw2MSG').html('<p style="color:red">비밀번호가 일치하지 않습니다.</p>');
			return false;
		} else if(pw.value == ""){
			pw2.style = "border:2px solid red";
			$('#pw2MSG').html('<p style="color:red">필수 정보입니다.</p>');
			pw2.value = "";
			return false;
		}
	}
	
	function birthCheck(){
		var input = document.querySelector("input[name=birth]");
		var regex = /^(19|20)[0-9]{2}(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|12[0-9]|30))|(02(0[1-9]|[12][0-9])))$/g;
		if(regex.test(input.value)){
			input.style = "border:2px solid blue";
			return true;
		}
		else{
			input.style = "border:2px solid red";
			return false;
		}
	}

	function nameCheck() {
		var input = document.querySelector("input[name=name]");
		var regex = /^[가-힣]{2,7}$/g;
		if (regex.test(input.value)) {
			input.style = "border:2px solid blue";
			$('#nameMSG').html("");
			return true;
		} else {
			input.style = "border:2px solid red";
			$('#nameMSG').html('<p style="color:red">이름은 2~7글자, 한글로만 입력해주세요.</p>');
			return false;
		}
	}

	function sendCheck() {
		//폼의 전송을 중지하고 검사한 뒤에 합격이면 전송한다

		//기본 이벤트를 중지시키는 명령
		event.preventDefault();
		
		//검사
		var result = idFlag && pwCheck() && pw2Check() && nameCheck() && birthCheck();
		if (!idFlag){
			alert("입력한 아이디를 다시 한번 확인해주세요.");
			return;
		}
		else if(!pwCheck()){
			alert("비밀번호를 다시 한번 확인해주세요.");
			return;
		}
		else if(!pw2Check()){
			alert("비밀번호가 맞지 않습니다.");
			return;
		}
		else if(!nameCheck()){
			alert("이름을 다시 한번 확인해주세요.");
			return;
		}
		else if(!mailFlag){
			alert("이메일을 다시 한번 확인해주세요.");
			return;
		}
		else if(!birthCheck()){
			alert("생년월일을 다시 한번 확인해주세요.");
			return;
		}
		
		if(result){
			var pw = $("input[name=pw]").val();
	        var encrypt = SHA256(pw);
	        $("input[name=pw]").val(encrypt);
		}
		
		//전송
		var form = document.querySelector("form");
		form.submit();
	}

	function gender(button) {
		var man = document.querySelector("button[value=man]");
		var women = document.querySelector("button[value=women]");
		if (button.value === "man") {
			man.style = "background-color: black;color: white; width: 100%";
			women.style = "background-color: white; color: black; width: 100%";

		} else {
			women.style = "background-color: black;color: white; width: 100%";
			man.style = "background-color: white; color: black; width: 100%";
		}
	}
</script>
</head>

<body>
	<div class="empty-row"></div>

	<form action="register" method="post" onsubmit="sendCheck();">
		<table class="table">

			<tr>
				<th><a href="${pageContext.request.contextPath}"> <img
						src="${pageContext.request.contextPath }/img/naver2.png"
						height="120">
				</a></th>
			</tr>
			<tr>
				<th>
					<div class="empty-row"></div>
				</th>
			</tr>
			<tr>
				<th>
				<input type="text"  id= "id" name="id" 	placeholder="아이디">
					<div id="idMSG"  style="padding-bottom: 5px;">
					</div>
				</th>
					
			</tr>
			<tr>
				<th><input type="password" name="pw" onblur="pwCheck();"
					placeholder="비밀번호">
					<div id="pwMSG"  style="padding-bottom: 5px;"></div>
					</th>
			</tr>
			<tr>
				<th><input type="password" id="pw2" onkeyup="pw2Check();"
					placeholder="비밀번호 확인">
					<div id="pw2MSG"  style="padding-bottom: 5px;"></div>
				</th>
			</tr>
			<tr>
				<th>
					<div class="empty-row"></div>
				</th>
			</tr>
			<tr>
				<th><input type="text" name="name" onblur="nameCheck();"
					placeholder="이름">
					<div id="nameMSG"  style="padding-bottom: 5px;"></div>
				</th>
			</tr>
			<tr>
				<th><input type="text"  id="email" name="email"  placeholder="본인 확인(이메일)">
					<div id="mailMSG"  style="padding-bottom: 5px;"></div>
				</th>
			</tr>
			<tr>
				<td>
					<div class="gender">
						<div style="float: left; width: 50%;">
							<span class="lt-radio-wrapper"> <input class="lt-radio"
								type="radio" name="gender" id="form-gender-0" value="남자" /> <label
								for="form-gender-0" class="lt-radio-label"></label> <label
								for="form-gender-0">남자</label>
							</span>
						</div>
						<div style="float: left; width: 50%;">
							<span class="lt-radio-wrapper"> <input class="lt-radio"
								type="radio" name="gender" id="form-gender-1" value="여자" /> <label
								for="form-gender-1" class="lt-radio-label"></label> <label
								for="form-gender-1">여자</label>
							</span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th><input type="text" name="birth"
					placeholder="생년월일(ex)19931105" onblur="birthCheck()"></th>
			</tr>
			<tr>
				<th><input type="text" name="phone" placeholder="휴대폰 번호(11자리)" maxlength="11">
				</th>
			</tr>
			<tr>
				<th>
					<div class="empty-row"></div>
				</th>
			<tr>
				<th><input type="submit" value="가입하기"></th>
			</tr>
		</table>
	</form>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>
