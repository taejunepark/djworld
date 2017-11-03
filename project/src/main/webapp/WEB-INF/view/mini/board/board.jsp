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
		$("#write_btn").click(function(){
			location.href= "board_write"
		})
	})
</script>

<div class="highlight">
	<div class="center" style="width: 80%;">
		<c:choose>
			<c:when test="${not empty boardList}">
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
						<c:forEach var="b" items="${boardList }">
							<tr>
								<th>${b.no }</th>
								<td>
									<a href="${pageContext.request.contextPath}/minihome/${owner.id}/board_detail/${b.no}">
										${b.title } [${b.reply }]
									</a>
								</td>
								<th>${b.writer }</th>
								<th>${b.read }</th>
								<th>${b.date }</th>
							</tr>
						</c:forEach>
					</tbody>
					
					<tfoot>
						<tr>
							<th colspan="5">
								<button id="write_btn">등록</button>
							</th>
						</tr>
					</tfoot>
				</table>
			</c:when>
			
			<c:otherwise>
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
							<th colspan="5">
								<font size="25px">등록된 게시물이 없습니다!</font>
							</th>
						</tr>
					</tbody>
					
					<tfoot>
						<tr>
							<th colspan="5">
								<button id="write_btn">등록</button>
							</th>
						</tr>
					</tfoot>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<%@ include file="/WEB-INF/view/mini_template/footer.jsp"%>