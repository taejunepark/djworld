<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/infoHeader.jsp"%>
<style>
.infoTable body {
	background: #fafafa
		url(https://jackrugile.com/images/misc/noise-diagonal.png);
	color: #444;
	font: 100%/30px 'Helvetica Neue', helvetica, arial, sans-serif;
	text-shadow: 0 1px 0 #fff;
}

.infoTable strong {
	font-weight: bold;
}

.infoTable em {
	font-style: italic;
}

.infoTable {
	background: #f5f5f5;
	border-collapse: separate;
	box-shadow: inset 0 1px 0 #fff;
	font-size: 12px;
	line-height: 24px;
	margin: 30px auto;
	text-align: left;
	width: 50%;
}

.infoTable th {
	background: url(https://jackrugile.com/images/misc/noise-diagonal.png),
		linear-gradient(#777, #444);
	border-left: 1px solid #555;
	border-right: 1px solid #777;
	border-top: 1px solid #555;
	border-bottom: 1px solid #333;
	box-shadow: inset 0 1px 0 #999;
	color: #fff;
	font-weight: bold;
	padding: 10px 15px;
	position: relative;
	text-shadow: 0 1px 0 #000;
}

.infoTable th:after {
	background: linear-gradient(rgba(255, 255, 255, 0),
		rgba(255, 255, 255, .08));
	content: '';
	display: block;
	height: 25%;
	left: 0;
	margin: 1px 0 0 0;
	position: absolute;
	top: 25%;
	width: 100%;
}

.infoTable th:first-child {
	border-left: 1px solid #777;
	box-shadow: inset 1px 1px 0 #999;
}

.infoTable th:last-child {
	box-shadow: inset -1px 1px 0 #999;
}

.infoTable td {
	border-right: 1px solid #fff;
	border-left: 1px solid #e8e8e8;
	border-top: 1px solid #fff;
	border-bottom: 1px solid #e8e8e8;
	padding: 10px 15px;
	position: relative;
	transition: all 300ms;
}

.infoTable td:first-child {
	box-shadow: inset 1px 0 0 #fff;
}

.infoTable td:last-child {
	border-right: 1px solid #e8e8e8;
	box-shadow: inset -1px 0 0 #fff;
}

.infoTable tr {
	background: url(https://jackrugile.com/images/misc/noise-diagonal.png);
}

.infoTable tr:nth-child(odd) td {
	background: #f1f1f1
		url(https://jackrugile.com/images/misc/noise-diagonal.png);
}

.infoTable tr:last-of-type td {
	box-shadow: inset 0 -1px 0 #fff;
}

.infoTable tr:last-of-type td:first-child {
	box-shadow: inset 1px -1px 0 #fff;
}

.infoTable tr:last-of-type td:last-child {
	box-shadow: inset -1px -1px 0 #fff;
}

</style>
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


