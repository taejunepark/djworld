<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file = "/WEB-INF/view/mini_template/header.jsp" %>
 <script>
 	function visitorsEdit(){
 		var detail = document.querySelector("#detail");
 		var text = detail.innerHTML;
 		var area = $("<textarea/>");
 		area.text(text);
 		detail.after(area);
 	}
 </script>
		<aside>
			<a href="#">미정</a>
		</aside>
		<div class="highlight">
			<c:if test="${userId != owner.id }">
			<form action="${pageContext.request.contextPath }/minihome/${owner.id }/visitors"
				method="post" onsubmit="sendCheck()">
				<input type="hidden" name="writer" value="${userId }">
				<table class="visitorTable">
					<tr>
						<td class="center">
							<div class="text-center">
								<c:choose>
			                        <c:when test="${user.profile != null}">
										<img src="${pageContext.request.contextPath }/file/${user.profile}"
											width="100" height="100">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath }/img/프로필.jpg"
											width="100" height="100">
									</c:otherwise>
								</c:choose>
							</div>
						</td>
						<td class="center area-80">
							<div class="text-center area-100" style="height: 100px;">
								<textarea id="visitorArea" name="detail"
									class="area-100 height-100"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="text-right">
								<button>확인</button>
							</div>
						</td>
					</tr>
				</table>
			</form>
			</c:if>
			<table class="visitorListTable">
				<c:forEach var="list" items="${list }">
					<tr style="background-color: lightgray">
						<td colspan="2" style="border-top: 1px solid gray;">
							<div style="padding-left: 20px;" class="text-left row">
								no.${list.no }&nbsp;&nbsp; ${list.name }님&nbsp;
								<a href="${pageContext.request.contextPath }/minihome/${list.writer}"> <i class="fa fa-home" aria-hidden="true"></i></a>&nbsp;&nbsp;
								<font style="font-size:0.7em">(${list.time })</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
									<c:when test="${list.writer eq userId }">
										<font style="font-size:0.8em">
											<a href="#">비밀로 하기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
											<a onclick="visitorsEdit();">수정</a>&nbsp;&nbsp;|&nbsp;&nbsp;
											<a href="${pageContext.request.contextPath }/minihome/${owner.id}/visitors/delete/${list.no}">삭제</a>&nbsp;&nbsp;
										</font>
									</c:when>
									<c:when test="${userId eq owner.id }">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<font style="font-size:0.8em">
											<a href="${pageContext.request.contextPath }/minihome/${owner.id}/visitors/delete/${list.no}">삭제</a>&nbsp;&nbsp;
									 		<a href="#">신고</a>&nbsp;&nbsp;
								 		</font>
									 </c:when>
								</c:choose>
							</div>
						</td>
					</tr>
					<tr>
						<td width="120px" style="padding-left: 10px;">
							<div class="text-left">
								<c:choose>
			                        <c:when test="${list.profile != null}">
										<img src="${pageContext.request.contextPath }/file/${list.profile}"
											width="100" height="100">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath }/img/프로필.jpg"
											width="100" height="100">
									</c:otherwise>
								</c:choose>
							</div>
						</td>
						<td class="center">
							<div id="detail" style="padding-left: 10px; margin: auto, 0px;">${list.detail }</div>
						</td>
					</tr>
					<tr>
						<td algin="center" colspan="2">
							<table class="area-100" style="background-color:#FAFAFA;">
								<c:if test="${not empty list.reply }">
									<c:forEach var="reply" items="${list.reply}">
										<tr height="40">
											<td width="20%">
												<div style="padding-left: 10px;" class="row text-left font-small">
													<font color="blue">${reply.name}</font>
												</div>
											</td>
											<td>
												<div class="inner-align-left">
													<div>
														${reply.web}&nbsp;&nbsp;<font color="gray" size="1.7em">(${reply.time})</font>&nbsp;&nbsp;
													</div>
													<c:if test="${loginFlag && userId eq reply.writer}">
														<div class="text-right right">
															<a href="#">수정</a> <a href="#">삭제</a>
														</div>
													</c:if>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</td>
					</tr>
					<tr style="background-color: lightgray;">
						<td colspan="2" style="height: 100%; padding-top: 5px;">
							<form action="${pageContext.request.contextPath }/reply" method="post"
								style="margin-bottom: 5px;">
								<input type="hidden" name="writer" value="${userId}">
								<input	type="hidden" name="parent" value="${list.no}">
								<input type= "hidden" name="friend" value="${owner.id }">
								<div class="inner-align-left">
									<div class="area-100" style="padding-left: 20px;">
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
												<input type="submit" value="등록" style="font-size: 15px; padding: 5px;">
											</c:when>
											<c:otherwise>
												<input type="submit" value="등록" style="font-size: 15px; padding: 5px;" disabled>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</form>
						</td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
				</c:forEach>
			</table>
		</div>

<%@ include file = "/WEB-INF/view/mini_template/footer.jsp" %>
