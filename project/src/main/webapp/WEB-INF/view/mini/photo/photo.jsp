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

#info {
	background-color: #F2F2F2;
}

#info p {
	/* display:block; */
	
}

#menu_photo {
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
			location.href= "photo_write"
		})
		
		$("#delete_btn").click(function(){
			var nos = $("#no").text()
			console.log(nos)
		})
	})
</script>
<aside>
	<div class="profile" style="height: 170px;">
		<c:choose>
			<c:when test="${owner.profile != null}">
				<img src="${pageContext.request.contextPath }/file/${owner.profile}"
					width="150" height="150">
			</c:when>
			<c:otherwise>
				<img src="${pageContext.request.contextPath }/img/프로필.jpg"
					width="150" height="150">
			</c:otherwise>
		</c:choose>
	</div>
	<form
		action="${pageContext.request.contextPath }/minihome/${owner.id}/minicomment"
		method="post">
		<div id="hello" class="hello">
			<input type="hidden" id="comment" name="comment">
			<div id="message" class="message">${message }</div>
		</div>
	</form>
	<div style="height: 40px;"></div>
	<div class="text-center">
		<h3>──&nbsp;history&nbsp;──</h3>
	</div>
	<div class="name text-center">
		<h3>
			${owner.name}
			<c:if test="${owner.gender eq '남자'}">(♂)</c:if>
			<c:if test="${owner.gender eq '여자'}">(♀)</c:if>
		</h3>
		<select name="friend-list" style="width: 95%;"
			onchange="if(this.value) location.href=(this.value);">
			<option value="">파도타기</option>
			<c:forEach var="friend" items="${friendList }">
				<option
					value="${pageContext.request.contextPath }/minihome/${friend.id }">${friend.name }</option>
			</c:forEach>
		</select>
	</div>
</aside>
<div class="highlight">
	<c:if test="${owner.id eq userId }">
		<div class="center text-right" style="width: 80%; margin-bottom: 10px;">
			<button id="write_btn"  class="upload">사진 올리기</button>
		</div>
	</c:if>
	<c:choose>
		<c:when test="${not empty list}">
			<div class="center" style="width: 80%;">
				<c:forEach var="p" items="${list}">
					<div id="titleArea">
						<p id="no" style="display: none;">${p.no }</p>${p.title }
					</div>

					<div id="info">
						<font style="font-size: 0.9em;"> 작성 일 : ${p.reg }
							&nbsp;&nbsp;&nbsp; <%-- 						댓글 수 : ${p.replycount } --%>
						</font>
					</div>

					<div id="detailArea">${p.detail }</div>
					
					<c:if test="${owner.id eq userId }">
						<div id="optionArea">
							<a id="delete_btn${p.no }">삭제</a>&nbsp;|&nbsp; <a id="e	dit_btn${p.no }">수정</a>
						</div>
					</c:if>

					<div id="replyArea" style="background-color: #FAFAFA;">
						<table class="area-100" style="background-color: #FAFAFA;">
							<c:if test="${not empty p.reply }">
								<c:forEach var="reply" items="${p.reply}">
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
								type="hidden" name="parent" value="${p.no}"> <input
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
				</c:forEach>
			</div>
		</c:when>

		<c:otherwise>
			<div style="height:50px;"></div>
			<div class="center text-center" style="border: 1px solid gray; border-radius: 10px; width:80%;">
				<img src="${pageContext.request.contextPath }/img/photo.jpg" width="100%">
				<font style="font-size: 1.2em;">시간이 지나면 남는건 사진뿐, <font color="chocolate;">소중한 추억</font>을 쌓아보세요.</font>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<%@ include file="/WEB-INF/view/mini_template/footer.jsp"%>