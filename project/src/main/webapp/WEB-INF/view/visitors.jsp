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
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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


<body>
	<form action="visitors" method="post">
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
						<textarea name="detail" class="area-90 height-90"></textarea>
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
					no.${list.no }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					${list.writer }&nbsp;
					<a href="#"> <i class="fa fa-home" aria-hidden="true"></i></a>&nbsp;&nbsp;
					(${list.time })&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:choose>
					<c:when test="${list.writer eq userId }">
						<a href="#">비밀로 하기</a>&nbsp;&nbsp;|
						<a href="#">수정</a>&nbsp;&nbsp;|
						<a href="#">삭제</a>&nbsp;&nbsp;
					</c:when>
					<c:otherwise>
					 	<a href="#">삭제</a>&nbsp;&nbsp;
					 	<a href="#">신고</a>&nbsp;&nbsp;
					 </c:otherwise>
					 </c:choose>
					</div>
			</td>
		</tr>
		<tr>
			<td class="center area-40">
				<div class="text-center">
					<img src="${pageContext.request.contextPath }/img/customer.jpg"
						width="80%" height="180px">
				</div>
			</td>
			<td class="center">
				<div style="margin: auto, 0px;">${list.detail }</div>
			</td>
		</tr>
		<tr style="background-color: lightgray; height: 60px;">
			<td colspan="2">
				<div class="inner-align-left">
					<div class="area-100 text-center" style="padding-top: 5px;">
						<textarea class="area-90 height-100"></textarea>
					</div>
					<div style="padding-right: 10px">
						<input class="form-btn" type="submit" value="확인">
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td><br></td>
		</tr>
		</c:forEach>
	</table>
</body>

</html>
