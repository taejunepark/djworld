<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/infoHeader.jsp"%>
<style>
.empty-row {
	height: 30px;
}

.correct {
	border: 2px solid blue;
}

.incorrect {
	border: 2px solid red;
}

input[type=text] {
	width: 90%;
	font-size: 20px;
	padding: 10px;
}

input[type=password] {
	width: 90%;
	font-size: 20px;
	padding: 10px;
}

input[type=submit] {
	width: 90%;
	font-size: 20px;
	padding: 10px;
	background-color: black;
	color: white;
	outline: none;
	border: none;
}

button {
	width: 90%;
	font-size: 20px;
	padding: 10px;
	background-color: white;
	border: 1px solid black;
	color: black;
}

.table {
	border: 1px solid black;
	width: 70%;
	padding: 20px;
	margin: auto;
	margin-bottom: 100px;
}

.gender {
	margin: auto;
	width: 90%;
}
</style>
<c:if test="${fail}">
		<script>alert('비밀번호가 맞지 않습니다.');</script>
	</c:if>
<c:choose>
	<c:when test="${pwFlag }" >
		<div class="empty-row"></div>
		<div class="area-70 center">
			<table class="table">

			<tr>
				<th style="border-bottom: 1px solid black" colspan="2"><div class="font-big">내 정보</div></th>
			</tr>
			<tr>
				<th>
					<div class="empty-row"></div>
				</th>
			</tr>
			<tr>
				<th width="30%">
					아이디
				</th>
				<th>
					${member.id }
				</th>
			</tr>
			<tr>
				<th><input type="password" name="pw" onblur="pwCheck();"
					placeholder="비밀번호">
					<div id="pwMSG"  style="padding-bottom: 5px;"></div>
					</th>
			</tr>
			<tr>
				<th><input type="password" id="pw2" onkeyup="pw2Check();"
					placeholder="비밀번호 확인">
					<div id="pw2MSG"  style="padding-bottom: 5px;"></div>
				</th>
			</tr>
			<tr>
				<th>
					<div class="empty-row"></div>
				</th>
			</tr>
			<tr>
				<th><input type="text" name="name" onblur="nameCheck();"
					placeholder="이름">
					<div id="nameMSG"  style="padding-bottom: 5px;"></div>
				</th>
			</tr>
			<tr>
				<th><input type="text"  id="email" name="email"  placeholder="본인 확인(이메일)">
					<div id="mailMSG"  style="padding-bottom: 5px;"></div>
				</th>
			</tr>
			<tr>
				<th>
			<tr>
				<td>
					<div class="gender">
						<div style="float: left; width: 50%;">
							<span class="lt-radio-wrapper"> <input class="lt-radio"
								type="radio" name="gender" id="form-gender-0" value="남자" /> <label
								for="form-gender-0" class="lt-radio-label"></label> <label
								for="form-gender-0">남자</label>
							</span>
						</div>
						<div style="float: left; width: 50%;">
							<span class="lt-radio-wrapper"> <input class="lt-radio"
								type="radio" name="gender" id="form-gender-1" value="여자" /> <label
								for="form-gender-1" class="lt-radio-label"></label> <label
								for="form-gender-1">여자</label>
							</span>
						</div>
					</div>
				</td>
			</tr>
			</th>
			</tr>
			<tr>
				<th><input type="text" name="birth"
					placeholder="생년월일(ex)19931105"></th>
			</tr>
			<tr>
				<th><input type="text" name="phone" placeholder="휴대폰 번호(11자리)">
				</th>
			</tr>
			<tr>
				<th>
					<div class="empty-row"></div>
				</th>
			<tr>
				<th><input type="submit" value="가입하기"></th>
			</tr>
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


