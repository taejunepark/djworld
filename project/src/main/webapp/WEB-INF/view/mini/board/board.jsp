<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mini_template/header.jsp"%>
<style>
div {
	/* 	border: 3px solid black; */
}

body {
	overflow: hidden;
	margin: 10px;
}

#menu_board {
	color: blue;
}

table {
	width: 100%;
}
</style>

<script>
	$(document).ready(function() {
	})
</script>

<div class="highlight">
	<div class="center" style="width: 80%;">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th width="60%">제목</th>
					<th>작성자</th>
					<th>조회</th>
					<th>작성일</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<th>1</th>
					<th>항기무[1]</th>
					<th>김대원</th>
					<th>0</th>
					<th>2017-11-03</th>
				</tr>
			</tbody>
			
			<tfoot>
				<tr>
					<th colspan="5"><button>작성</button></th>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
<%@ include file="/WEB-INF/view/mini_template/footer.jsp"%>