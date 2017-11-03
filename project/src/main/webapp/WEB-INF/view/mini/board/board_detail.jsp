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
#titleArea {
	font-size: 25px;
	background-color: lightgray;
	border-top: 1px solid gray;
}

#reg {
	display: flex;
	flex-direction: row-reverse;
}

input[name=reply] {
	width: 95%;
}

#optionArea {
	display: flex;
	flex-direction: row-reverse;
}

#detailArea{
	min-height: 500px;
}

#info {
	background-color: #F2F2F2;
}

#menu_board {
	color: blue;
}

#edit_btn {
	cursor: pointer;
}

#delete_btn {
	cursor: pointer;
}

.upload{
	background-color: black;
	color: white;
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
<c:when test="${not empty board}">
	<div class="center" style="width: 80%;">
		<div id="titleArea">
			${board.title }
		</div>

		<div id="info">
			<font style="font-size: 0.9em;"> 작성 일 : ${board.reg }
				&nbsp;&nbsp;&nbsp;
			</font>
		</div>

		<div id="detailArea">${board.detail }</div>
			
		<c:if test="${owner.id eq userId }">
			<div id="optionArea">
				<a href="${pageContext.request.contextPath }/minihome/${owner.id}/board_delete/${board.no}">삭제</a>&nbsp;|&nbsp;
				<a href="${pageContext.request.contextPath }/minihome/${owner.id}/board_edit/${board.no}">수정</a>
			</div>
		</c:if>

			<div id="replyArea" style="background-color: #FAFAFA;">
				<table class="area-100" style="background-color: #FAFAFA;">
					<c:if test="${not empty board.replyList }">
						<c:forEach var="reply" items="${board.replyList}">
							<tr height="50">
								<td width="20%">
									<div style="padding-left: 10px;"
										class="row text-left font-small">
										<font color="blue">${reply.name}</font>
									</div>
								</td>
								<td>
									<div class="inner-align-left">
										<div id="replydetail${reply.no }" style="float: left;">
											${reply.web}</div>
										<div class="replydate${reply.no }"
											style="display: inline-block;">
											&nbsp;&nbsp; <font color="gray" size="1.7em">(${reply.time})</font>&nbsp;&nbsp;
										</div>
										<c:if test="${loginFlag && userId eq reply.writer}">
											<div class="text-right right" style="width: 60px;">
												<a style="font-size: 4;" id="replyedit"
													class="replyedit${reply.no }"
													onclick="replyeditHandler(${reply.no}, '${reply.writer }')">수정</a>
												<a style="font-size: 4;"
													href="${pageContext.request.contextPath }/replydelete/${reply.no}/${owner.id}">삭제</a>
											</div>
										</c:if>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			<div style="background-color: lightgray; padding: 5px;">
				<form action="${pageContext.request.contextPath }/reply"
					method="post" style="margin-bottom: 5px;">
					<input type="hidden" name="writer" value="${userId}"> <input
						type="hidden" name="parent" value="${board.no}"> <input
						type="hidden" name="friend" value="${owner.id }">
					<div class="inner-align-left">
						<div class="area-100" style="padding-left: 10px;">
							<c:choose>
								<c:when test="${loginFlag}">
									<textarea name="detail" rows="3" class="area-90"
										placeholder="댓글 내용 입력" required></textarea>
								</c:when>
								<c:otherwise>
									<textarea name="detail" rows="3" class="area-90"
										placeholder="로그인 후 이용하실 수 있습니다" required disabled></textarea>
								</c:otherwise>
							</c:choose>
						</div>
						<div style="padding-right: 10px; padding-top: 5px;">
							<c:choose>
								<c:when test="${loginFlag}">
									<input type="submit" value="등록"
										style="font-size: 15px; padding: 5px;">
								</c:when>
								<c:otherwise>
									<input type="submit" value="등록"
										style="font-size: 15px; padding: 5px;" disabled>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</form>
			</div>
			<div style="height: 20px;"></div>
			<div style="height: 20px;">
				<hr>
			</div>
	</div>
</c:when>
			
			<c:otherwise>
				<table border="1">
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
								<button id="write_btn">글 작성하기</button>
							</th>
						</tr>
					</tfoot>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<%@ include file="/WEB-INF/view/mini_template/footer.jsp"%>