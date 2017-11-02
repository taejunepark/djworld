<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mini_template/header.jsp"%>
<script>
	$(document).ready(function() {
		$("#comment_btn").click(function() {
			$.ajax({
				url : "comment",
				type : "get",
				data : {
					comment : $("#comment").val(),
				},
				success : function(res) {
					$("#addComment").prepend(res)
				}
			})
			$("#comment").val("")
		})

		$("input[type=submit]").on("click", function() {
			event.preventDefault();
			var result = false;
			if($(this).val() === "삽입"){
				var input = $("<input/>").val(text);
				$(this).before(input);
				$(this).val("완료");
			}
			else if($(this).val() === "수정"){
                var text = $(this).prev().text();
                var input = $("<input/>").val(text);
                $(this).prev().remove();
                $(this).before(input);
                $(this).val("완료");
            }
            else{
                var text = $(this).prev().val();
                var div = $("<div/>").addClass("message").text(text);
                $(this).prev().remove();
                $(this).before(div);
                $(this).val("수정");
                $("#comment").val($(".message").text())
                result = true;
            }
            if(result){
                var form = document.querySelector("form");
        		form.submit();
            }
        });
	});
</script>
<aside>
	<div class="profile" style="height: 200px;">
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
	<form action="${pageContext.request.contextPath }/minihome/${id}/minicomment" method="post">
		<div id="hello" class="hello" style="height: 200px;">
			<input type="hidden" id="comment" name="comment"> 
			<div id="message" class="message">${message }</div>
			<c:choose>
				<c:when test="${id eq userId && message != null}">
					<input type="submit" class="edit_hello" value="수정">
					<input type="hidden" name="type" value="update">
				</c:when>
				<c:when test="${id eq userId && message == null}">
					<input type="submit" class="edit_hello" value="삽입">
				<input type="hidden" name="type" value="insert">
				</c:when>
			</c:choose>
		</div>
	</form>
	<div class="text-center">
		<h3>──history──</h3>
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
				<option value="${pageContext.request.contextPath }/minihome/${friend.id }">${friend.name }</option>
			</c:forEach>
		</select>
	</div>
</aside>

<div class="highlight">
	<div class="partOne">
		<div class="left">
			<div>
				<font size="5">최근 게시물</font>
				<hr>
			</div>
			<div>
				<font size="3">최근 2주간 새 게시물이 없습니다.<br>
				소식이 뜸한 친구에게<br>
				마음의 한마디 남기세요.</font>
			</div>
		</div>

		<div class="right" style="display:inline-block; ">
			<div style="float: left; height:170px; width:45%;">
				<a href="#">다이어리 0/0</a><br><br>
				<a href="#">공유 다이어리 0/0</a><br><br>
				<a href="#">게시판 0/0</a><br>
			</div>
			<div style="display: inline-block; height:170px; width:45%;">
			 	<a href="#">사진첩 0 / 0</a><br><br>
			 	<a href="${pageContext.request.contextPath }/minihome/${owner.id}/visitors">방명록</a> 0 / ${count.visitorsCount}
			</div>
		</div>
	</div>

	<div class="partTwo">
		<img src="${pageContext.request.contextPath }/img/miniroom.gif"
			width="100%" height="100%">
	</div>

	<div class="partThree">
		<div style="float: left; width: 10%;">일촌평</div>
		<div style="display: inline-block; width: 90%;">
			<font size="7"><input class="friend-input" type="text"
				id="comment" placeholder="입력" required></font>
			<button id="comment_btn">확인</button>
		</div>
	</div>
	<div class="addComment">일촌평을 남겨주세요~</div>
</div>

<%@ include file="/WEB-INF/view/mini_template/footer.jsp"%>
