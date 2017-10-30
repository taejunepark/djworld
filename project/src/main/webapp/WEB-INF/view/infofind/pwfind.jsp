<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/template/infoFindHeader.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
</head>
<div class="empty-row"></div>
<div class="center area-40" >
	<table class="area-100" style="height: 500px;">
		<tr>
			<td style="height: 150px;">
				<div class="font-big"
					style="text-align: center; color: white; background-color: black;">
					비밀번호 찾기<br>Search Password
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="font-medium text-center" style="padding: 20px;">
					<font style="color: darkblue;">${id }</font>회원님의 등록된 메일 주소로<br> <font
						style="color: red;">임시 비밀번호를 발송</font>해드렸습니다.
				</div>
			</td>
		</tr>
		<tr>
			<td
				style="height: 40px; background-color: lightgray; border-top: 1px solid gray; border-bottom: 1px solid gray;">
				<div class="font-small text-center">
					등록된 메일 주소 : <font style="color: darkblue;">${email}</font>
				</div>
			</td>
		</tr>
		<tr>
			<td style="height: 15px;"></td>
		</tr>
		<tr>
			<td
				style="height: 40px; border-top: 1px solid gray; border-bottom: 1px solid gray;">
				<div>&gt;&nbsp;&nbsp;&nbsp;비밀번호 재설정 링크는 회원가입시의 이메일로 발송됩니다.</div>
			</td>
		</tr>
	</table>
</div>
<div style="height: 20px;"></div>
<div class="row text-center">
	<input type="button" class="form-btn" value="로그인"
		onclick="location.href='${pageContext.request.contextPath}/member/login'">
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>