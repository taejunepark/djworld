<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!Doctype HTML>
<html>
<head>
<title>이미지 게시판</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/main.css">
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
	<div class="area-50 center">
		<div class="row line-black" align="center">
			<h1>프로필 설정</h1>
		</div>
		<div class="empty-row"></div>
		<form action="${pageContext.request.contextPath }/member/upload" method="post" enctype="multipart/form-data" name="form" onsubmit="goOpener()">
			<div class="row center">
				<input type="file" id="file" name="file" required	class="user-input fill">
			</div>
			<div class="row center">
				<input type="submit" class="input-btn" value="변경" >
				 <input type="button" class="input-btn" value="취소" onclick="cancel()">
			</div>
		</form>
	</div>
</body>
</html>