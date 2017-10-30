<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/template/infoFindHeader.jsp"%>

<div class="empty-row"></div>
<div class="center area-50" style="border: 1px solid black;">
	<div class="font-medium"
		style="text-align: center; color: white; background-color: black;">아이디
		찾기</div>
	<div class="empty-row"></div>
	<div class="font-small row" style="text-align: left;">개인정보 도용에 대한
		피해방지를 위하여 아이디 끝 두 자리는 ** 처리합니다.</div>
	<div class="empty-row"></div>
	<table class="area-100">
		<tr>
			<th>
				<div class="font-medium"
					style="text-align: center; color: white; background-color: black;">아이디
				</div>
			</th>
			<th>
				<div class="font-medium"
					style="text-align: center; color: white; background-color: black;">가입일
				</div>
			</th>
		</tr>
		<tr>
			<td>
				<div class="font-medium" style="text-align: center;">${id }</div>
			</td>
			<td>
				<div class="font-medium" style="text-align: center;">${reg }</div>
			</td>
		</tr>
	</table>
</div>
<div style="height:20px;"></div>
<div class="row text-center">
	<input type="button" class="form-btn" value="로그인"
		onclick="location.href='${pageContext.request.contextPath}/member/login'">
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>