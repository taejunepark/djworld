<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/infoHeader.jsp"%>
<div class="empty-row"></div>
<div class="empty-row"></div>

<c:choose>
<c:when test="${result }">
	<div class="center text-center">
			<h1 class="font-color-blue">그동안 이용해 주셔서 감사합니다</h1>
			<h3>더 나은 대준월드로 찾아뵙도록 하겠습니다.</h3>
			<button class="form-btn" onclick="location.href='${pageContext.request.contextPath}/'">홈으로</button>
	</div>
</c:when>
<c:otherwise>
	<div class="center text-center">
			<h1 class="font-color-blue">정보가 맞지 않습니다.</h1>
			<h3>다시 입력해 주세요.</h3>
			<button class="form-btn" onclick="location.href='${pageContext.request.contextPath}/member/drop'">돌아가기</button>
	</div>
</c:otherwise>
</c:choose>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>