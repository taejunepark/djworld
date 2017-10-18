<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/each.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/swiper.css">

<script>
	function pwCheck() {
		var input = document.querySelector("input[name=pw]");
		var regex = /^[\w!@#$%^&*()]{6,20}$/g;
		if (regex.test(input.value)) {
			input.style = "border:2px solid blue";
			return true;
		} else {
			input.style = "border:2px solid red";
			return false;
		}
	}
</script>

<div class="empty-row"></div>
<div class="area-60 center">
	<form action="edit" method="post">
		<table class="area-60 center font-small table-80">
			<tr>
				<th colspan="2" class="font-big">회원 정보 수정</th>
			</tr>
			<tr>
				<th width="20%">이름</th>
				<td><input class="form-input" type="text" name="name"
					placeholder="이름" value="${member.name}" readonly></td>
			</tr>
			<tr>
				<th class="area-30">아이디</th>
				<td><input class="form-input" type="text" name="id"
					placeholder="아이디" value="${member.id}" readonly></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input class="form-input" type="password" name="pw"
					placeholder="비밀번호" onblur="pwCheck()" required></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input class="form-input" type="text" name="birth"
					placeholder="생년월일" value="${member.birth}" readonly></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input class="form-input" type="text" name="phone"
					placeholder="전화번호" value="${member.phone}"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input class="form-input" type="text" name="email"
					placeholder="이메일" value="${member.email}"></td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="row text-center">
						<div class="inline">
							<input class="form-btn" type="submit" value="수정">
						</div>
					</div>
				</td>
			</tr>
		</table>
	</form>
</div>

