<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/template/listHeader.jsp"%>
<html>

<style>
	.btn {width: 80px; height: 40px; line-height: 40px; display: inline-block; border-radius: 4px; border: 1px solid rgba(0,0,0,0.7); box-shadow: inset 0 4px 6px rgba(255,255,255,0.3), inset 0 0 2px rgba(255,255,255,0.3), 0 2px 2px rgba(0,0,0,0.15); -webkit-transition: all 0.3s ease; }
.btn-accept { 
background-color: rgb(100,142,49);
background-image: -moz-linear-gradient(top,  rgba(100,142,49,1) 0%, rgba(57,93,15,1) 100%);
background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(100,142,49,1)), color-stop(100%,rgba(57,93,15,1)));
background-image: -webkit-linear-gradient(top,  rgba(100,142,49,1) 0%,rgba(57,93,15,1) 100%);
background-image: -o-linear-gradient(top,  rgba(100,142,49,1) 0%,rgba(57,93,15,1) 100%);
background-image: -ms-linear-gradient(top,  rgba(100,142,49,1) 0%,rgba(57,93,15,1) 100%);
background-image: linear-gradient(to bottom,  rgba(100,142,49,1) 0%,rgba(57,93,15,1) 100%);
}
.btn-accept:hover { background: rgba(100,142,49,1); }
.btn-accept:active { background: rgba(57,93,15,1); box-shadow: inset 0 0 3px rgba(0,0,0,0.5); }
.btn-decline { 
background-color: rgb(203,90,90);
background-image: -moz-linear-gradient(top,  rgba(203,90,90,1) 0%, rgba(141,62,62,1) 100%);
background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(203,90,90,1)), color-stop(100%,rgba(141,62,62,1)));
background-image: -webkit-linear-gradient(top,  rgba(203,90,90,1) 0%,rgba(141,62,62,1) 100%);
background-image: -o-linear-gradient(top,  rgba(203,90,90,1) 0%,rgba(141,62,62,1) 100%);
background-image: -ms-linear-gradient(top,  rgba(203,90,90,1) 0%,rgba(141,62,62,1) 100%);
background-image: linear-gradient(to bottom,  rgba(203,90,90,1) 0%,rgba(141,62,62,1) 100%);
}
.btn-decline:hover { background: rgba(203,90,90,1); }
.btn-decline:active { background: rgba(141,62,62,1); box-shadow: inset 0 0 3px rgba(0,0,0,0.5); }


.icon { background: url(https://s.cdpn.io/6035/notification_icons.png) no-repeat; display: inline-block; margin-top: 12px; }
.icon-arrow { width:  19px; height: 15px; background-position: 0 0; }
.icon-x { width: 15px; height: 15px; background-position: -19px 0; }
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<div class="empty-row"></div>
<c:choose>
			<c:when test="${not empty list }">
		<table class="find-table center area-60" border="1">
			<tr style="height: 50px;">
				<th>프로필</th>
				<th width="150px">아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>상태</th>
			</tr>
			<c:forEach var="member" items="${list}">
				<tr>
					<td >
						<div class="text-center">
							<c:choose>
								<c:when test="${member.profile != null}">
									<img class=" image-hover img-square-round"
										src="${pageContext.request.contextPath }/file/${member.profile}"
										width="100" height="100">
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath }/img/프로필.jpg"
										width="100" height="100">
								</c:otherwise>
							</c:choose>
						</div>
					</td>
					<td>${member.id}</td>
					<td width="100">${member.name}</td>
					<td>${member.birthPrint}</td>
					<td width="400">
						<div>
							<a href="${pageContext.request.contextPath }/friend/agree/${member.id}" 
								class="btn btn-accept"><span class="icon icon-arrow"></span></a>
							<a href="${pageContext.request.contextPath }/friend/disagree/${member.id}"
								class="btn btn-decline"><span class="icon icon-x"></span></a>
						</div>
					</td>
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
<div class="empty-row"></div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>