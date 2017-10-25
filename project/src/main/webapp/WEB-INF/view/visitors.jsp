<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/each.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.visitorTable {
	width: 40%;
	margin: auto;
	height: 230px;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	padding: 10px;
	background-color: lightgray;
}

.visitorListTable {
	width: 40%;
	margin: auto;
	height: 230px;
	padding-left: 10px;
	padding-right: 10px;
}

textarea {
	resize: none;
}
</style>
</head>

<script>
	function sendCheck(){
		event.preventDefault();
		
		var input = document.querySelector("textarea[id=visitorArea]");
		if(input.value == ""){
			alert("내용을 적어주세요.");
			return;
		}
		//전송
		var form = document.querySelector("form");
		form.submit();
	}
</script>

<body>
	<form action="visitors" method="post" onsubmit="sendCheck()">
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
						<textarea id="visitorArea" name="detail" class="area-90 height-90"></textarea>
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
	<br>
	<br>
	<table class="visitorListTable">
		<c:forEach var="list" items="${list }">
			<tr style="background-color: lightgray">
				<td colspan="2" style="border-top: 1px solid gray;">
					<div style="padding-left: 20px;" class="text-left row">
						no.${list.no }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${list.writer }&nbsp;
						<a href="#"> <i class="fa fa-home" aria-hidden="true"></i></a>&nbsp;&nbsp;
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
</body>

</html>
