<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/infoHeader.jsp"%>
<style>

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
<div class="empty-row"></div>
<div class="area-70 center">
	<table class="table">

		<tr>
			<th style="border-bottom: 1px solid black" colspan="2"><div
					class="font-big">내 정보</div></th>
		</tr>
		<tr>
			<th>
				<div class="empty-row"></div>
			</th>
		</tr>
		<tr>
			<th width="30%">아이디</th>
			<th>${member.id }</th>
		</tr>
		<tr>
			<th width="30%">이름</th>
			<th>${member.name }</th>
		</tr>
		<tr>
			<th width="30%">전화번호</th>
			<th>${member.phone }</th>
		</tr>
		<tr>
			<th width="30%">생년월일</th>
			<th>${member.birth }</th>
		</tr>
		<tr>
			<th>이메일</th>
			<th>${member.email }</th>
		</tr>
		<tr>
			<th>밤</th>
			<th>${member.bam }</th>
		</tr>
		<tr>
			<th>가입일</th>
			<th>${member.date }</th>
		</tr>

	</table>
</div>


<%@ include file="/WEB-INF/view/template/footer.jsp"%>


