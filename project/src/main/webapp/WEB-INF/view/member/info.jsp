<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/infoHeader.jsp"%>

<div class="empty-row"></div>
<div class="area-70 center">
	<table class="infoTable">
		<thead>
			<tr>
				<th colspan="2"><div class="font-medium row text-center">내 정보</div></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><strong>아이디</strong></td>
				<td>${member.id }</td>
			</tr>
			<tr>
				<td><strong>이름</strong></td>
				<td>${member.name }</td>
			</tr>
			<tr>
				<td><strong>생년월일</strong></td>
				<td>${member.birth }</td>
			</tr>
			<tr>
				<td><strong>이메일</strong></td>
				<td>${member.email }</td>
			</tr>
			<tr>
				<td><strong>밤</strong></td>
				<td>${member.bam }</td>
			</tr>
			<tr>
				<td><strong>가입일</strong></td>
				<td>${member.date }</td>
			</tr>
		</tbody>
	</table>
</div>


<%@ include file="/WEB-INF/view/template/footer.jsp"%>


