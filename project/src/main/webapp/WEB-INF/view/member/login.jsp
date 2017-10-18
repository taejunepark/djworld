<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<title>로그인 페이지</title>
<!-- 디자인 코드를 작성하는 공간 -->
<style>
div {
	/*                            border:1px solid black;*/
	
}

.empty-row {
	height: 50px;
}

.page {
	width: 500px;
	/* 영역의 가운데 정렬은 margin으로 한다 */
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	position: absolute;
	z-index: 2;
	background-color: white;
}

.row {
	padding: 10px;
}

.col {
	display: inline-block;
	width: 48.8888%;
}
/* CSS의 속성 선택자를 활용 */
input[type=text] {
	width: 100%;
	font-size: 20px;
	padding: 10px;
}

input[type=password] {
	width: 100%;
	font-size: 20px;
	padding: 10px;
}

input[type=submit], button {
	width: 100%;
	font-size: 20px;
	padding: 10px;
	background-color: black;
	color: white;
	outline: none;
	border: none;
}

button {
	background-color: white !important;
	border: 1px solid black !important;
	color: black !important;
}

.back {
	position: relative;
	width: 100%;
	height: 100%;
	background-size: cover;
}

.img-cover {
	position: absolute;
	height: 100%;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.3);
	z-index: 1;
}
</style>
</head>

<body>
	<!-- 아래로 밀고 싶은 만큼 empty-row를 추가 -->
	<div class="back"
		style="background-image: url(${pageContext.request.contextPath }/img/bg1.jpg);">
		<div class="img-cover"></div>
		<div class=empty-row></div>
		<div class=empty-row></div>
		<form action="login" method="post">
			<div class="page">
				<div class="row" align="center">
					<a href="${pageContext.request.contextPath }"> <img
						src="${pageContext.request.contextPath }/img/naver2.png"
						width="150" height="100">
					</a>
				</div>
				<div class="row" align="center">
					<input type="text" name="id" placeholder="아이디">
				</div>
				<div class="row" align="center">
					<input type="password" name="pw" placeholder="비밀번호">
				</div>
				<div class="row">
					<div class="col" align="left">
						<input type="checkbox"> 자동로그인
					</div>
					<div class="col" align="right">
						<a href="#"> 아이디(이메일)/비밀번호 찾기 &gt; </a>
					</div>
				</div>
				<div class="row" align="center">
					<input type="submit" value="로그인">
				</div>
				<hr>
				<div class="row" align="center">
					<!--                <input type="button" value="회원가입">-->
					<button type="button"
						onclick="location.href='${pageContext.request.contextPath}/member/register'">회원가입</button>
				</div>
				<div class="row" align="center">
					<h3>&copy; DJWorld Corp.</h3>
				</div>
			</div>
		</form>
	</div>
</body>
</html>