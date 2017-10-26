<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/view/template/infoFindHeader.jsp"%>
<style>
div {
	/* 	border: 1px solid black;  */
	
}
</style>

<div class="empty-row"></div>
<div class="center area-70" style="height: 600px;">
	<c:choose>
		<c:when test="${code eq 'id'}">
			<div class="font-medium row" style="text-align: left;">아이디 찾기</div>
			<div class="empty-row"></div>
			<div class="font-small row" style="text-align: left;">
				회원 가입 시 선택한 본인 인증 수단을 선택하여 아이디를 찾을 수 있습니다. <br>회원가입 후 실명인증을 한
				회원에 한하여 본인인증 정보를 통한 아이디 검색이 가능합니다. <br>본인 인증 시 제공되는 정보는 인증 이외의
				용도로 이용 또는 저장하지 않습니다.
			</div>
			<div class="empty-row"></div>
			<form action="${pageContext.request.contextPath }/info/infofind/code=id" method="post">
				<div class="font_medium row" style="margin: 20px; font-size: 2.0em">내 정보로 찾기</div>
				<div>
					<table>
						<tr>
							<th scope="row"><label for="name" style="margin-right: 10px;"> <span>이름</span>
							</label></th>
							<td><input type="text" name="name" class="form-input"
								id="name" style="ime-mode: active;"></td>
						</tr>
						<tr>
							<th scope="row" class="td-email"><label for="user	_email" style="margin-right: 10px;">
									<span>이메일</span>
							</label></th>
							<td><input type="text" name="email" class="form-input"
								id="email" style="ime-mode: inactive;"></td>
						</tr>
					</table>
					<div style="margin-top: 20px">
						<span>
							<button class="form-btn" type="submit"">아이디 찾기</button>
						</span>
					</div>
				</div>
			</form>
		</c:when>
		<c:otherwise>
			<div class="font-medium row" style="text-align: left;">비밀번호 찾기</div>
			<div class="empty-row"></div>
			<div class="font-small row" style="text-align: left;">
				회원 가입 시 선택한 본인 인증 수단을 선택하여 아이디를 찾을 수 있습니다. <br>회원가입 후 실명인증을 한
				회원에 한하여 본인인증 정보를 통한 아이디 검색이 가능합니다. <br>본인 인증 시 제공되는 정보는 인증 이외의
				용도로 이용 또는 저장하지 않습니다.
			</div>
			<div class="empty-row"></div>
			<form action="${pageContext.request.contextPath }/info/infofind/code=pw" method="post"">
				<div class="font_medium row" style="margin: 20px; font-size: 2.0em">내 정보로 찾기</div>
				<div>
					<table>
						<tr>
							<th scope="row"><label for="id" style="margin-right: 10px;"> <span>아이디</span>
							</label></th>
							<td><input type="text" name="id" class="form-input"
								id="id" style="ime-mode: active;"></td>
						</tr>
						<tr>
							<th scope="row"><label for="name" style="margin-right: 10px;"> <span>이름</span>
							</label></th>
							<td><input type="text" name="name" class="form-input"
								id="name" style="ime-mode: active;"></td>
						</tr>
						<tr>
							<th scope="row" class="td-email"><label for="user	_email" style="margin-right: 10px;">
									<span>이메일</span>
							</label></th>
							<td><input type="text" name="email" class="form-input"
								id="email" style="ime-mode: inactive;"></td>
						</tr>
					</table>
					<div style="margin-top: 20px">
						<span>
							<button class="form-btn" type="submit">찾기</button>
						</span>
					</div>
				</div>
			</form>
		</c:otherwise>
	</c:choose>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>