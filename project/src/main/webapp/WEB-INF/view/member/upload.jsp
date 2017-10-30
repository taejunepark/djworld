<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype HTML>
<html>
<head>
<title>이미지 게시판</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/main.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css?ver=2">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/each.css">
</head>

<script>

	function cancel() {
		window.open('', '_self').close();
	}
</script>

<c:if test="${result }">
	  <script type="text/javascript">
		window.opener.location.reload();
		window.open('', '_self').close();
	</script>
</c:if>


<body>
	<div class="area-80 center">
		<div class="row line-black" align="center">
			<h1>프로필 설정</h1>
		</div>
		<div style="height:10px;"></div>
		<form action="${pageContext.request.contextPath }/member/upload" method="post" enctype="multipart/form-data" 
			name="form" onsubmit="goOpener()" style="width: 100%;">
			<div class="row center">
				<input type="file" id="file" name="file" required	class="user-input fill" style="width: 96%;">
			</div>
			<div style="height:10px;"></div>
			<div class="row center text-center">
				<input type="submit" class="form-btn" value="변경" >&nbsp;&nbsp;&nbsp;&nbsp;
				 <input type="button" class="form-btn" value="취소" onclick="cancel()">
			</div>
		</form>
	</div>
</body>
</html>