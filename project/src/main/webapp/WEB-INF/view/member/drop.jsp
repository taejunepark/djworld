<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/infoHeader.jsp"%>
<div class="empty-row"></div>
<div class="area-70 center">
	<form action="${pageContext.request.contextPath }/member/drop" method="post">
		<table class="area-70 center"
			style="height: 700px;">
			<tr>
				<th colspan="2" style="background-color: black;">
					<div class="font-medium text-cetner"
						style="color: white; margin-bottom: 20px">회원 탈퇴</div>
				</th>
			</tr>
			<tr>
				<th colspan="2">
					<div class="font-small text-left">
						한 번 탈퇴한 아이디는 다시 사용할 수 없습니다.<br>
						본인여부를 확인하기 위해서 등록된 회원정보를 입력해주세요.
					</div>
				</th>
			</tr>
			<tr>
				<td class="font-medium">이름</td>
				<th class="font-small">${member.name}(${member.id})</th>
			</tr>
			<tr>
				<td class="font-medium">비밀번호</td>
				<th>
					<div>
						<input class="form-input"  type="password" name="pw" required>
					</div>
				</th>
			</tr>
			<tr>
				<td class="font-medium">휴대폰 번호</td>
				<th><div><input class="form-input" type="text" name="phone" required></div></th>
			</tr>
			<tr>
				<td colspan="2"><input class="form-btn area-100" type="submit"
					value="확인" style="margin-bottom: 10px;"> <input
					class="form-btn area-100" type="button" value="취소"
					style="background-color: white; color: black;"
					onclick="location.href=${pageContext.request.contextPath}/">
				</td>
			</tr>
		</table>
	</form>
</div>


<%@ include file="/WEB-INF/view/template/footer.jsp"%>