<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/listHeader.jsp"%>
<html>
<style>
.findtable {
	border-collapse: collapse;
}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<div class="area-80 center">
	<div class="row center">
		<div class="empty-row"></div>
			<c:choose>
			<c:when test="${not empty list }">
				<table class="findtable center area-80">
					<c:forEach var="member" items="${list}">
						<tr>
							<th>${member.id}</th>
							<th>${member.name}</th>
							<th>${member.birth}</th>
							<th>${member.gender }</th>
							<th><a
								href="${pageContext.request.contextPath }/friend/agree/${member.id}">수락하기</a>
								<a
								href="${pageContext.request.contextPath }/friend/disagree/${member.id}"" >거절하기</a>
							</th>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<div class="text-center center">
					<h1>새로운 일촌 요청이 없습니다.</h1>
				</div>
			</c:otherwise>
			</c:choose>
	</div>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>