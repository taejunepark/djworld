<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>???님의 미니홈피</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
body {
	margin: 10px;
}

a {
	text-decoration: none;
	color: black;
}

div {
	/*border:1px solid black;
            	margin: 1px 0px;*/
	
}

/*전체 div class*/
.mini {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 100%;
	height: 100%;
	border: 1px solid black;
}

/* Header div*/
header {
	border: 1px dotted blue;
	text-align: right;
	width: 100%;
	height: 3%;
	margin: 5px;
}

header>a {
	color: gray;
}

header>a :hover {
	background-color: yellow;
	color: red;
}

.info {
	display: flex;
	flex-wrap: wrap;
	border: 1px solid black;
	width: 100%;
	height: 5%;
	margin: 5px;
	padding: 5px;
}

.visit {
	border: 1px dotted blue;
	width: 15%;
	margin: 5px;
}

.title {
	flex-grow: 1;
	border: 1px dotted blue;
	margin: 5px;
}

/* 주요 Div */
main {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: 100%;
	height: 100%;
	border: 1px dotted blue;
	margin: 5px;
}

/* 사이드 Div */
aside {
	display: flex;
	flex-wrap: wrap;
	border: 1px solid green;
	width: 15%;
	margin: 5px;
	padding: 5px;
}

/* Main Div */
.highlight {
	display: flex;
	flex-direction: column;
	flex-wrap: nowrap;
	width: 75%;
	height: 100%;
	margin: 5px;
	padding: 5px;
}

.month {
	height: 3%;
	margin: 5px;
	padding: 5px;
}

.date {
	height: 3%;
	margin: 5px;
	padding: 5px;
}

.area {
	height: 83%;
	margin: 5px;
	padding: 5px;
}

.btns {
	display: flex;
	flex-direction: row;
	height: 5%;
	margin: 5px;
}

/* 우측 메뉴 Div */
.menu {
	border: 1px dotted blue;
	flex-grow: 1;
	margin: 5px;
	padding: 5px;
}

.menu ul {
	list-style: none;
	margin: 2px -40px;
}

.visitorTable {
	width: 80%;
	margin: auto;
	height: 230px;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	padding: 10px;
	background-color: lightgray;
}

.visitorListTable {
	width: 80%;
	margin: auto;
	padding-left: 10px;
	padding-right: 10px;
}

textarea {
	resize: none;
}
</style>
<!-- jQuery를 사용하기 위한 CDN 설정 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	function sendCheck() {
		event.preventDefault();

		var input = document.querySelector("textarea[id=visitorArea]");
		if (input.value == "") {
			alert("내용을 적어주세요.");
			return;
		}
		//전송
		var form = document.querySelector("form");
		form.submit();
	}
</script>
</head>
<body>
	<div class="mini">
		<header>
			<a class="header_a" href="#">내 홈피</a> <a class="header_a" href="#">바로
				가기</a> <a class="header_a" href="#">로그인</a>
		</header>

		<div class="info">
			<div class="visit">
				<span>Today 0 | </span> <span>Total 1</span>
			</div>

			<div class="title">
				<span>${member.name }님의 미니 홈피</span>
			</div>
		</div>

		<main>
		<aside>
			<a href="#">미정</a>
		</aside>
		<div class="highlight">
			<form action="${pageContext.request.contextPath }/minihome/${member.id }/visitors"
				method="post" onsubmit="sendCheck()">
				<input type="hidden" name="writer" value="${userId }">
				<table class="visitorTable">
					<tr>
						<td class="center area-40">
							<div class="text-center">
								<img src="${pageContext.request.contextPath }/img/customer.jpg"
									width="80%" height="180px">
							</div>
						</td>
						<td class="center">
							<div class="text-center height-100" style="padding-top: 10px;">
								<textarea id="visitorArea" name="detail"
									class="area-90 height-90"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="text-right">
								<button class="form-btn">확인</button>
							</div>
						</td>
					</tr>
				</table>
			</form>
			<table class="visitorListTable">
				<c:forEach var="list" items="${list }">
					<tr style="background-color: lightgray">
						<td colspan="2" style="border-top: 1px solid gray;">
							<div style="padding-left: 20px;" class="text-left row">
								no.${list.no }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${list.writer }&nbsp;
								<a href="${pageContext.request.contextPath }/minihome/${list.writer}"> <i class="fa fa-home" aria-hidden="true"></i></a>&nbsp;&nbsp;
								(${list.time })&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
									<c:when test="${list.writer eq userId }">
										<a href="#">비밀로 하기</a>&nbsp;&nbsp;|
								<a href="#">수정</a>&nbsp;&nbsp;|
								<a href="#">삭제</a>&nbsp;&nbsp;
							</c:when>
									<c:otherwise>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="#">삭제</a>&nbsp;&nbsp;
					 	<a href="#">신고</a>&nbsp;&nbsp;
					 </c:otherwise>
								</c:choose>
							</div>
						</td>
					</tr>
					<tr>
						<td width="200px">
							<div class="text-left">
								<img src="${pageContext.request.contextPath }/img/customer.jpg"
									width="200px" height="180px">
							</div>
						</td>
						<td class="center">
							<div style="padding-left: 10px; margin: auto, 0px;">${list.detail }</div>
						</td>
					</tr>
					<tr>
						<td algin="center" colspan="2">
							<table class="area-100">
								<c:if test="${not empty list.reply }">
									<c:forEach var="reply" items="${list.reply}">
										<tr height="40">
											<td class="center">
												<div style="width: 100%;" class="row text-center font-small">
													<font color="darksalmon">${reply.writer}</font>
												</div>
											</td>
											<td>
												<div class="inner-align-left">
													<div>
														${reply.web}&nbsp;&nbsp;<font color="gray" size="1.7em">(${reply.reg})</font>&nbsp;&nbsp;
													</div>
													<c:if test="${loginFlag && userId eq reply.writer}">
														<div class="text-right right">
															<a href="#">수정</a> <a href="#">삭제</a>
														</div>
													</c:if>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</td>
					</tr>
					<tr style="background-color: lightgray;">
						<td colspan="2" style="height: 100%; padding-top: 5px;">
							<form action="visitors/reply" method="post"
								style="margin-bottom: 5px;">
								<input type="hidden" name="writer" value="${userId}"> <input
									type="hidden" name="parent" value="${list.no}">
								<div class="inner-align-left">
									<div class="area-100" style="padding-left: 20px;">
										<c:choose>
											<c:when test="${loginFlag}">
												<textarea name="detail" rows="3" class="area-90"
													placeholder="댓글 내용 입력" required></textarea>
											</c:when>
											<c:otherwise>
												<textarea name="detail" rows="3" class="area-90"
													placeholder="로그인 후 이용하실 수 있습니다" required disabled></textarea>
											</c:otherwise>
										</c:choose>
									</div>
									<div style="padding-right: 10px; padding-top: 5px;">
										<c:choose>
											<c:when test="${loginFlag}">
												<input class="form-btn" type="submit" value="등록">
											</c:when>
											<c:otherwise>
												<input class="form-btn" type="submit" value="등록" disabled>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</form>
						</td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</main>
	</div>
</body>
</html>
