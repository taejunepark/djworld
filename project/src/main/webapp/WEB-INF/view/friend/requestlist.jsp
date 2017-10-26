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
						<th>${member.gender }</th>
						<th>
							<a href="${pageContext.request.contextPath }/friend/agree/${member.id}" >수락하기</a>
							<a href="${pageContext.request.contextPath }/friend/disagree/${member.id}"" >거절하기</a>
						</th>
					</tr>
			</c:forEach>
		</table>
	</div>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>