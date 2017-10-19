<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	/*            padding-left: 50px;*/
	/*
            background-image: url('img/message.png');
            background-size: 25px;
            background-repeat: no-repeat;
            background-position: 10px 10px;
*/
}

input[type=password] {
	width: 90%;
	font-size: 20px;
	padding: 10px;
	/*
            padding-left: 50px;
            background-image: url('img/lock.png');
            background-size: 25px;
            background-repeat: no-repeat;
            background-position: 10px 10px;
*/
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

<script>
	$(document).ready(function(){
		$("#id").blur(function(){
			$.ajax({
				 url:"${pageContext.request.ContextPath}/member/idcheck",
				 type:"get",
				 data:{
					 check:$("#id").val()
				 },
				 success:function(res){
					 console.log("성공");
				 },
				 err:function(err){
					 console.log("실패");
				}
			});
		});
	});
	function idCheck() {
		var input = document.querySelector("input[name=id]");
		var regex = /^[\w]{5,15}$/g;
		if (regex.test(input.value)) {
			//                    input.style = "border:2px solid blue";
			input.className = "correct"; //변경
			//                    input.classList.add("correct");//추가
			return true;
		} else {
			//                    input.style = "border:2px solid red";
			input.className = "incorrect";
			return false;
		}
	}

	function pwCheck() {
		var input = document.querySelector("input[name=pw]");
		var regex = /^[\w!@#$%^&*()]{6,20}$/g;
		if (regex.test(input.value)) {
			input.style = "border:2px solid blue";
			return true;
		} else {
			input.style = "border:2px solid red";
			return false;
		}
	}

	function pw2Check() {
		var pw = document.querySelector("input[name=pw]");
		var pw2 = document.querySelector("input[id=pw2]");

		if (pw.value === pw2.value && pw2.value !== "") {
			pw2.style = "border:2px solid blue";
			return true;
		} else if (pw.value == "") {
			pw2.style = "border:2px solid red";
			pw2.value = "";
			return false;
		} else {
			pw2.style = "border:2px solid red";
			return false;
		}
	}

	function nameCheck() {
		var input = document.querySelector("input[name=name]");
		var regex = /^[가-힣]{2,7}$/g;
		if (regex.test(input.value)) {
			input.style = "border:2px solid blue";
			return true;
		} else {
			input.style = "border:2px solid red";
			return false;
		}
	}

	function sendCheck() {
		//폼의 전송을 중지하고 검사한 뒤에 합격이면 전송한다

		//기본 이벤트를 중지시키는 명령
		event.preventDefault();

		//검사
		var result = idCheck() && pwCheck() && pw2Check() && nameCheck();
		if (!result)
			return;

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
	<div class="empty-row"></div>
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
				<th><input type="text"  id= "id" name="id" onblur="idCheck();"
					placeholder="아이디"></th>
			</tr>
			<tr>
				<th><input type="password" name="pw" onblur="pwCheck();"
					placeholder="비밀번호"></th>
			</tr>
			<tr>
				<th><input type="password" id="pw2" onkeyup="pw2Check();"
					placeholder="비밀번호 확인"></th>
			</tr>
			<tr>
				<th>
					<div class="empty-row"></div>
				</th>
			</tr>
			<tr>
				<th><input type="text" name="name" onblur="nameCheck();"
					placeholder="이름"></th>
			</tr>
			<tr>
				<th><input type="text" name="email" placeholder="본인 확인(이메일)">
				</th>
			</tr>
			<tr>
				<th>
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
			</th>
			</tr>
			<tr>
				<th><input type="text" name="birth"
					placeholder="생년월일(ex)19931105"></th>
			</tr>
			<tr>
				<th><input type="text" name="phone" placeholder="휴대폰 번호(11자리)">
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
</body>

</html>

