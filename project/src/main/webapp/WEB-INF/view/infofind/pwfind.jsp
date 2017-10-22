<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/template/infoFindHeader.jsp"%>


<div class="empty-row"></div>
<div class="center area-70" style="height: 600px;">
	<div class="font-medium row" style="text-align: left;">비밀번호 찾기</div>
	<div class="empty-row"></div>
	<div class="empty-row"></div>
	<table>
		<c:choose>
			<c:when test="${empty temp} ">
				<tr>
					<th scope="row"><label for="name" style="margin-right: 10px;">
							<span>입력한 정보가 맞지 않습니다.</span>
					</label></th>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td scope="row">
						<div class="font-small row" style="text-align: center;">이메일로 보내드린 임시 비밀번호로 로그인하세요.</div>
					</td>
				</tr>

			</c:otherwise>
		</c:choose>
	</table>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>