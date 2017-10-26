<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/template/friendFindHeader.jsp"%>
<html>
<style>
.findtable {
	border-collapse: collapse;
}

</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function() {
			//#searchForm을 전송하지 말고 Rest 방식으로 조합하여 전송하도록 수정
			$("#searchForm").on("submit",function() {
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

<div class="area-80 center">
	<div class="row center">
		<form id="searchForm">
			<div class="row inner-align-left center">
				<div style="width: 50%;" class="center">
					<input class="form-input" type="search" name="key"
						placeholder="아이디 혹은 번호입력" value="${param.key}">
				</div>
				<div>
					<input class="form-btn" type="submit" value="검색">
				</div>
			</div>
		</form>
		<div class="empty-row"></div>
		<table class="findtable center area-80">
			<c:forEach var="member" items="${list}">
					<tr>
						<th>${member.id}</th>
						<th>${member.name}</th>
						<th>${member.birth}</th>
						<th>${member.date}</th>
						<c:if test="${loginFlag }">
							<c:choose>
								<c:when test="${member.status eq '일촌 신청' }">
									<th>
										<a href="${pageContext.request.contextPath }/member/friendrequest/${member.id}">${member.status }</a>
									</th>
								</c:when>
								<c:when test="${member.status eq '요청 대기중' }">
									<th>
										<a onMouseOver="this.innerHTML='요청 목록 이동'" onMouseOut="this.innerHTML='요청 대기중'" 
											href="${pageContext.request.contextPath }/friend/requestlist">${member.status }</a>
									</th>
								</c:when>
								<c:when test="${member.status eq '신청 대기중' }">
									<th>
										<a onMouseOver="this.innerHTML='신청 취소'" onMouseOut="this.innerHTML='신청 대기중'"
											href="${pageContext.request.contextPath }/member/friendcancel/${member.id}">${member.status }</a>
									</th>
								</c:when>
								<c:when test="${member.status eq '일촌' }">
									<th>
										<a onMouseOver="this.innerHTML='일촌 끊기'" onMouseOut="this.innerHTML='일촌'" 
												href="${pageContext.request.contextPath }/friend/drop/${member.id}">${member.status }</a>
									</th>
								</c:when>
							</c:choose>
						</c:if>
						<th><a href="#"> <i class="fa fa-home" aria-hidden="true"></i></a>&nbsp;&nbsp;</th>
					</tr>
			</c:forEach>
		</table>
	</div>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>