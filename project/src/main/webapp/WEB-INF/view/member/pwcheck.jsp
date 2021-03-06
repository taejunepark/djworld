<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/infoHeader.jsp"%>

<script>
function sendCheck() {
	//폼의 전송을 중지하고 검사한 뒤에 합격이면 전송한다

	//기본 이벤트를 중지시키는 명령
	event.preventDefault();
	
	var pw = $("input[name=pw]").val();
    var encrypt = SHA256(pw);
    $("input[name=pw]").val(encrypt);
    
    var form = document.querySelector("form");
	form.submit();
}
</script>

<c:if test="${pwFlag}">
	<script>
		alert('비밀번호가 맞지 않습니다.');
	</script>
</c:if>

<c:if test="${pathFlag}">
	<script>
		alert('잘못된 경로입니다.');
	</script>
</c:if>

<div class="empty-row"></div>
<div class="center area-50" style="border: 1px solid black;">
	<div class="font-medium"
		style="text-align: center; color: white; background-color: black;">본인
		확인</div>
	<div class="empty-row"></div>
	<div class="font-small row" >개인정보를 위해
		비밀번호를 입력해주세요.</div>
	<div class="empty-row"></div>
	<form action="${pageContext.request.contextPath }/member/pwcheck/${path}" 
		method="post"  onsubmit="sendCheck();">
		<table class="area-100">
			<tr>
				<th>
					<div class="font-medium" style="text-align: left;">비밀번호</div>
				</th>
				<td><input class="form-input" type="password" name="pw" required></td>
			</tr>
		</table>
	</form>
</div>
<div style="height: 20px;"></div>
<div class="row text-center">
	<input type="button" class="form-btn" value="확인"
		onclick="location.href='${pageContext.request.contextPath}/member/login'">
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>