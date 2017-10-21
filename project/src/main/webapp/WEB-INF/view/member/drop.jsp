<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>
<div class="empty-row"></div>
<div class="area-100 center">
	
	<form action="drop" method="post">
		<table class="pwtable area-50 center">
			<thead>
				<tr>
					<th colspan="2" class="font-medium">회원 탈퇴</th>
				</tr>
				<tr>
					<th colspan="2" style="height: 20px"></th>
				</tr>
				<tr>
					<th colspan="2" class="font-min" style="text-align: left;">본인여부를
						확인하기 위해서 등록된 회원정보를 입력해주세요.</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th class="font-small">이름</th>
					<td class="font-small">${member.name}(${member.id})</td>
				</tr>
				<tr>
					<th class="font-small">비밀번호</th>
					<td><input type="password" name="pw" required></td>
				</tr>
				<tr>
					<th class="font-small">핸드폰 번호</th>
					<td><input type="text" name="phone" required></td>
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


<%@ include file="/WEB-INF/view/template/footer.jsp"%>