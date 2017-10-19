<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/template/infoheader.jsp"%>


<div class="empty-row"></div>
<div class="center area-70" style="height: 600px;">
	<div class="font-medium row" style="text-align: left;">아이디 찾기</div>
	<div class="empty-row"></div>
	<div class="font-small row" style="text-align: left;">개인정보 도용에 대한
		피해방지를 위하여 아이디 끝 두 자리는 ** 처리합니다.</div>
	<div class="empty-row"></div>
	<table>
		<c:choose>
			<c:when test="${empty id} ">
				<tr>
					<th scope="row"><label for="name" style="margin-right: 10px;">
							<span>입력한 정보의 아이디가 존재하지 않습니다.</span>
					</label></th>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th scope="row"><label for="name" style="margin-right: 10px;">
							<span>아이디</span>
					</label></th>
					<td><label> <span> ${id} </span>
					</label> <span>${reg}</span></td>
				</tr>

			</c:otherwise>
		</c:choose>
	</table>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>