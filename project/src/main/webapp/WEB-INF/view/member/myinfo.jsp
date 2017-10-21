<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>

<c:if test="${fail}">
		<script>alert('비밀번호가 맞지 않습니다.');</script>
	</c:if>
<c:choose>
	<c:when test="${pwFlag }" >
		<div class="empty-row"></div>
		<div class="area-50 center">
			<table class="table area-50 center" border="1">
				<thead>
					<tr>
						<th colspan="2" class="font-medium">회원 정보</th>
					</tr>

				</thead>
				<tbody>
					<tr>
						<th width="20%">이름</th>
						<td>${member.name}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${member.id}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${member.phone}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${member.email}</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${member.birth}</td>
					</tr>
					<tr>
						<th>밤</th>
						<td>${member.bam}</td>
					</tr>

					<tr>
						<th>가입일</th>
						<td>${member.date}</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2"><input class="form-btn" type="button"
							value="정보수정" onclick="location.href='edit';"> 
						</th>
					</tr>
				</tfoot>
			</table>
		</div>
	</c:when>
	<c:otherwise>
		<div class="empty-row"></div>
		<div class="area-100 center">
			<form action="info" method="post">
				<table class="pwtable area-50 center">
					<thead>
						<tr>
							<th colspan="2" class="font-medium">본인 확인</th>
						</tr>
						<tr>
							<th colspan="2"  style="height: 20px"> </th>
						</tr>
						<tr>
							<th colspan="2" class="font-min" style="text-align:left;">개인 정보를 위해 비밀번호를 입력해주세요.</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="font-small">아이디</th>
							<td class="font-small">${member.id}</td>
						</tr>
						<tr>
							<th class="font-small">비밀번호</th>
							<td><input type="password" name="pw"></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="2"><input type="submit" value="확인"
								class="form-btn">
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</c:otherwise>
</c:choose>


<%@ include file="/WEB-INF/view/template/footer.jsp"%>


