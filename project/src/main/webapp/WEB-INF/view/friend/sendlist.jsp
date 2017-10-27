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
							<th>
								<a href="#" >요청 취소</a>
							</th>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<div class="text-center center">
					<h1>다른 사람에게 일촌 신청을 하지 않았습니다.</h1>
				</div>
			</c:otherwise>
			</c:choose>
	</div>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>