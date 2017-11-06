<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<html>
<head>
<title>DJWorld</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/minihome.css?ver=3">
<%-- <link href="${pageContext.request.contextPath }/css/ko_KR/smart_editor2.css?ver=2" rel="stylesheet" type="text/css"> --%>
<link
	href="${pageContext.request.contextPath }/css/ko_KR/smart_editor2.css?ver=2"
	rel="stylesheet" type="text/css">
<!-- jQuery를 사용하기 위한 CDN 설정 -->

<style>
form {
	margin: 0px;
}

#menu_home {
	color: blue;
}

.boardcount-left {
	border-bottom: 1px dotted gray;
	border-right: 1px dotted gray;
	padding: 3px 0px;
	text-align: center;
}

.boardcount-right {
	border-bottom: 1px dotted gray;
	padding: 3px 0px;
	text-align: center;
}

.btn {
	border-radius: 5px;
	padding: 3px;
	font-size: 12px;
	text-decoration: none;
	color: #fff;
}

.btn:active {
	transform: translate(0px, 5px);
	-webkit-transform: translate(0px, 5px);
	box-shadow: 0px 1px 0px 0px;
}

.blue {
	background-color: #55acee;
	box-shadow: 0px 5px 0px 0px #3C93D5;
}

.blue:hover {
	background-color: #6FC6FF;
}

.green {
	background-color: #2ecc71;
	box-shadow: 0px 5px 0px 0px #15B358;
}

.green:hover {
	background-color: #48E68B;
}

.yellow {
	background-color: #f1c40f;
	box-shadow: 0px 5px 0px 0px #D8AB00;
}

.yellow:hover {
	background-color: #FFDE29;
}

.partOne {
	width: 100%;
	height: 25%;
	margin: 0 5px;
}

.partOne .left {
	float: left;
	border: 1px solid black;
	width: 47.5%;
	height: 120px;
	padding: 5px;
}

.partOne .right {
	display: inline-block;
	border: 1px solid black;
	width: 47.5%;
	height: 120px;
	padding: 5px;
}
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$(".edit_hello")
								.on(
										"click",
										function() {
											event.preventDefault();
											var result = false;
											if ($(this).val() === "삽입") {
												$(".empty").empty();
												var input = $(
														"<textarea rows='8' cols='19'></textarea>")
														.val(text);
												$(this).before(input);
												$(this).val("완료");
											} else if ($(this).val() === "수정") {
												var text = $(this).prev()
														.text().trim();
												var input = $(
														"<textarea rows='8' cols='19'></textarea>")
														.val(text);
												$(this).prev().remove();
												$(this).before(input);
												$(this).val("완료");
											} else {
												var text = $(this).prev().val();
												var div = $("<div/>").addClass(
														"message").text(text)
														.css("font-size",
																"0.9em");
												$(this).prev().remove();
												$(this).before(div);
												$(this).val("수정");
												$("#comment").val(
														$(".message").text());
												result = true;
											}
											if (result) {
												var form = document
														.querySelector("#helloform");
												form.submit();
											}
										});
					});
</script>
<body >
	<div class="mini" >
		<header>
			<a class="header_a"
				href="${pageContext.request.contextPath }/minihome/${userId}">내
				홈피</a>
			<c:if test="${!friendCheck }">
				<font color="gray">&nbsp;|&nbsp;일촌맺기</font>
			</c:if>
		</header>
		<div class="info">
			<div class="visit">Total ${owner.total }</div>
			<div class="title">
				<font color="blue" style="font-size: 1.5em;">${owner.name }의
					미니 홈피</font>
			</div>
		</div>
		<main>
		<aside>
			<div class="profile" style="height: 170px;">
				<c:choose>
					<c:when test="${owner.profile != null}">
						<img
							src="${pageContext.request.contextPath }/file/${owner.profile}"
							width="150" height="150">
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath }/img/프로필.jpg"
							width="150" height="150">
					</c:otherwise>
				</c:choose>
			</div>
			<form id="helloform"
				action="${pageContext.request.contextPath }/minihome/${owner.id}/minicomment"
				method="post">
				<div id="hello" class="hello">
					<input type="hidden" id="comment" name="comment">
					<div id="message" class="message">
						<c:choose>
							<c:when test="${message == null }">
								<div class="empty">
									<font style="font-size: 0.9em;">자기소개가 없습니다.</font>
								</div>
							</c:when>
							<c:otherwise>
								<font style="font-size: 0.9em;">${message }</font>
							</c:otherwise>
						</c:choose>
					</div>
					<c:choose>
						<c:when test="${owner.id eq userId && message != null}">
							<input type="submit" class="edit_hello" value="수정">
							<input type="hidden" name="type" value="update">
						</c:when>
						<c:when test="${owner.id eq userId && message == null}">
							<input type="submit" class="edit_hello" value="삽입">
							<input type="hidden" name="type" value="insert">
						</c:when>
					</c:choose>
				</div>
			</form>
			<div style="height: 40px;"></div>
			<div class="text-center">
				<h3>──&nbsp;history&nbsp;──</h3>
			</div>
			<div class="name text-center">
				<h3>
					${owner.name}
					<c:if test="${owner.gender eq '남자'}">(♂)</c:if>
					<c:if test="${owner.gender eq '여자'}">(♀)</c:if>
				</h3>
				<select name="friend-list" style="width: 95%;"
					onchange="if(this.value) location.href=(this.value);">
					<option value="">파도타기</option>
					<c:forEach var="friend" items="${friendList }">
						<option
							value="${pageContext.request.contextPath }/minihome/${friend.id }">${friend.name }</option>
					</c:forEach>
				</select>
			</div>
		</aside>

		<div class="highlight">
			<div class="partOne">
				<div class="left">
					<div style="background-color: skyblue;">
						<font size="3" style="font-weight: bold">최근 게시물</font>
						<hr style="margin: 0px; margin-bottom: 3px;">
					</div>
					<div style="background-color: lightgray; height: 97px; paddin-top:5px;">
						<div style="margin-bottom: 10px;">
							<a href="#" class="btn green">사진첩</a>&nbsp;&nbsp;
								<c:choose>
									<c:when test="${newPhoto == null}">
										업로드된 사진이 없습니다.
									</c:when>
									<c:otherwise>
										${newPhoto }
									</c:otherwise>
								</c:choose>
						</div>
						<div style="margin-bottom: 10px;">
							<a href="#" class="btn yellow">게시판</a>&nbsp;&nbsp;
								<c:choose>
									<c:when test="${newBoard == null}">
										업로드된 게시판이 없습니다.
									</c:when>
									<c:otherwise>
										${newBoard }
									</c:otherwise>
								</c:choose>
						</div>
						<div>
							<a href="#" class="btn blue">방명록</a>&nbsp;&nbsp;
								<c:choose>
									<c:when test="${newVisitors == null}">
										업로드된 사진이 없습니다.
									</c:when>
									<c:otherwise>
										${newVisitors }
									</c:otherwise>
								</c:choose>
						</div>
					</div>
				</div>

				<div class="right center" style="display: inline-block;">
					<div style="width: 100%; border-bottom : 1px dotted gray; margin-bottom: 10px;">
						<div style="float: left; width: 47%;">
							<a
								href="${pageContext.request.contextPath }/minihome/${owner.id}/diary">
								다이어리 <font color="blue" style="font-size: 0.8em;">${count.diaryTodayCount}
									/ ${count.diaryCount}</font>
							</a>
							<c:if test="${count.diaryTodayCount != 0 }">
								<img src="${pageContext.request.contextPath }/img/new.png"
									width="15" height="15"
									style="border: none; vertical-align: middle;">
							</c:if>
						</div>
						<div style="display: inline-block;">
							<a href="${pageContext.request.contextPath }/minihome/${owner.id}/board"> 게시판 <font color="blue" style="font-size: 0.8em;">0
									/ 0</font></a>
							<%-- 					<c:if test="${count.diaryTodayCount != 0 }"> --%>
							<%-- 						<img src="${pageContext.request.contextPath }/img/new.png" width="15" height="15" --%>
							<!-- 						style="border: none; vertical-align:middle;"> -->
							<%-- 					</c:if> --%>
						</div>
					</div>
					<div style="width: 100%; border-bottom : 1px dotted gray; margin-bottom: 10px;">
						<div style="float: left; width: 47%;">
							<a
								href="${pageContext.request.contextPath }/minihome/${owner.id}/photo">
								사진첩 <font color="blue" style="font-size: 0.8em;">${count.photoTodayCount}
									/ ${count.photoCount}</font>
							</a>
							<c:if test="${count.photoTodayCount != 0 }">
								<img src="${pageContext.request.contextPath }/img/new.png"
									width="15" height="15"
									style="border: none; vertical-align: middle;">
							</c:if>
						</div>
						<div style="display: inline-block;">
							<a
								href="${pageContext.request.contextPath }/minihome/${owner.id}/visitors">
								방명록 <font color="blue" style="font-size: 0.8em;">${count.visitorsTodayCount}
									/ ${count.visitorsCount}</font>
							</a>
							<c:if test="${count.visitorsTodayCount != 0 }">
								<img src="${pageContext.request.contextPath }/img/new.png"
									width="15" height="15"
									style="border: none; vertical-align: middle;">
							</c:if>
						</div>
					</div>
				</div>
			</div>

			<div class="partTwo">
				<img src="${pageContext.request.contextPath }/img/miniroom.gif"
					width="100%" height="100%">
			</div>

			<form
				action="${pageContext.request.contextPath }/minihome/${owner.id}/friendcomment">
				<input type="hidden" name="writer" value="${userId}">
				<div class="partThree">
					<div style="float: left; width: 10%;">일촌평</div>
					<div style="display: inline-block; width: 90%; height: 21px;">
						<input class="friend-input" type="text" name="friendcomment"
							placeholder="일촌에게 하고 싶은 말을 남겨보세요~" required>
						<button id="friendComment_btn">확인</button>
					</div>
				</div>
			</form>
			<div class="friendaddComment"
				style="padding-left: 5px; padding-right: 5px;">
				<c:choose>
					<c:when test="${not empty friendCommentList}">
						<c:forEach var="friend" items="${friendCommentList}">
				·&nbsp;${friend.friendComment }&nbsp;&nbsp;
				<font size="2"> (<a
								href="${pageContext.request.contextPath}/minihome/${friend.writer}">
									&nbsp;${friend.writer}, <font color="blue">${friend.name }</font>&nbsp;)
							</a>
							</font>
							<font color="gray" size="1.7em">(${friend.date})&nbsp;&nbsp;</font>
							<a
								href="${pageContext.request.contextPath }/minihome/${friend.writer}">
								<i class="fa fa-home" aria-hidden="true"></i>
							</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<c:if test="${owner.id eq userId }">
								<a href="${pageContext.request.contextPath}/minihome/${owner.id }/friendcomment/delete/${friend.writer }/${friend.friendComment }">삭제</a>
							</c:if>
				<hr>
						</c:forEach>
					</c:when>
					<c:otherwise>
			소중한 첫 번째의 일촌평을 남겨보세요~
		</c:otherwise>
				</c:choose>
			</div>
		</div>

		<%@ include file="/WEB-INF/view/mini_template/footer.jsp"%>