<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/template/listHeader.jsp"%>
<html>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document)
			.ready(
					function() {
						//#searchForm을 전송하지 말고 Rest 방식으로 조합하여 전송하도록 수정
						$("#searchForm")
								.on(
										"submit",
										function() {
											event.preventDefault();//기본 이벤트 중지

											var key = $(this).find(
													"input[name=key]").val();
											if (key.length > 0) {
												location.href = "${pageContext.request.contextPath}/member/find/"
														+ key;
											}
										});
					});
</script>
<div class="empty-row"></div>
<c:choose>
	<c:when test="${not empty result }">
		<table class="find-table center area-60" border="1">
			<tr
				style="border-left: 1px solid white; border-right: 1px solid white;">
				<td colspan="6"
					style="border-left: 1px solid white; border-right: 1px solid white; border-top: 1px solid white;">
					<form id="searchForm">
						<div class="row inner-align-left">
							<div style="width: 100%;">
								<input class="form-input" type="search" name="key"
									placeholder="아이디 혹은 번호입력" style="height: 49px;">
							</div>
							<div>
								<input class="form-btn" type="submit" value="검색">
							</div>
						</div>
					</form>
				</td>
			</tr>
			<tr style="height: 50px;">
				<th>프로필</th>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>상태</th>
				<th>미니홈피</th>
			</tr>
			<c:forEach var="member" items="${list}">
				<tr>
					<td width="100">
						<div class="text-center">
							<c:choose>
								<c:when test="${member.profile != null}">
									<img class=" image-hover img-square-round"
										src="${pageContext.request.contextPath }/file/${member.profile}"
										width="100" height="100">
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath }/img/프로필.jpg"
										width="100" height="100">
								</c:otherwise>
							</c:choose>
						</div>
					</td>
					<td>${member.id}</td>
					<td>${member.name}</td>
					<td>${member.birthPrint}</td>
					<td><a onMouseOver="this.innerHTML='일촌 끊기'"
						onMouseOut="this.innerHTML='일촌'"
						href="${pageContext.request.contextPath }/friend/drop/${member.id}">일촌</a>
					</td>
					<td><a href="#"> <i class="fa fa-home" aria-hidden="true"></i></a>&nbsp;&nbsp;</td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		<div class="text-center center">
			<h1>일촌이 존재하지 않습니다.</h1>
		</div>
	</c:otherwise>
</c:choose>
<div class="empty-row"></div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>