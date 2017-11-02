<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mini_template/header.jsp"%>
<style>
form{
	margin: 0px;
}
#menu_home{
	color: blue;
}
.boardcount-left{
	border-bottom: 1px dotted gray;
	border-right: 1px dotted gray;
	padding: 3px 0px;
	text-align: center;
}
.boardcount-right{
	border-bottom: 1px dotted gray;
	padding: 3px 0px;
	text-align: center;
}
</style>
<script>
	$(document).ready(function() {

		$("input[type=submit]").on("click", function() {
			event.preventDefault();
			var result = false;
			if($(this).val() === "삽입"){
				var input = $("<textarea rows='4' cols='20'></textarea>").val(text);
				$(this).before(input);
				$(this).val("완료");
			}
			else if($(this).val() === "수정"){
                var text = $(this).prev().text();
                var input = $("<textarea rows='4' cols='20'></textarea>").val(text);
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
	<form action="${pageContext.request.contextPath }/minihome/${owner.id}/minicomment" method="post">
		<div id="hello" class="hello">
			<input type="hidden" id="comment" name="comment"> 
			<div id="message" class="message">
						${message }
			</div>
			<c:choose>
				<c:when test="${owner.id eq userId && message != null}">
					<input type="submit" class="edit_hello" value="수정">
					<input type="hidden" name="type" value="update">
				</c:when>
				<c:when test="${owner.id eq userId && message == null}">
					<input type="submit" class="edit_hello" value="삽입">
				<input type="hidden" name="type" value="insert">
				</c:when>
			</c:choose>
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
				<option value="${pageContext.request.contextPath }/minihome/${friend.id }">${friend.name }</option>
			</c:forEach>
		</select>
	</div>
</aside>

<div class="highlight">
	<div class="partOne">
		<div class="left">
			<div>
				<font size="3">최근 게시물</font>
				<hr>
			</div>
			<div>
				<div>사진첩</div>
				<div>다이어리</div>
				<div>방명록</div>
			</div>
		</div>

		<div class="right center" style="display:inline-block; ">
			<div style="width:100%">
				<div style="float:left; width:47%;">
					<a href="${pageContext.request.contextPath }/minihome/${owner.id}/diary">
					다이어리 <font color="blue" style="font-size: 0.8em;">${count.diaryTodayCount} / ${count.diaryCount}</font></a>
				</div>
				<div style="display:inline-block;">
					<a href="#">
					게시판 <font color="blue" style="font-size: 0.8em;">0 / 0</font></a>
				</div>
			</div>
			<div style="width:100%;">
				<div style="float:left; width:47%;">
			 		<a href="${pageContext.request.contextPath }/minihome/${owner.id}/photo">
			 			사진첩 <font color="blue" style="font-size: 0.8em;">${count.photoTodayCount} / ${count.photoCount}</font>
			 		</a>
			 	</div>
			 	<div style="display:inline-block;">
			 		<a href="${pageContext.request.contextPath }/minihome/${owner.id}/visitors">
			 			방명록 <font color="blue" style="font-size: 0.8em;">${count.visitorsTodayCount} / ${count.visitorsCount}</font>
			 		</a>
			 	</div>
			</div>
		</div>
	</div>

	<div class="partTwo">
		<img src="${pageContext.request.contextPath }/img/miniroom.gif"
			width="100%" height="100%">
	</div>

	<form action="${pageContext.request.contextPath }/minihome/${owner.id}/friendcomment">
	<input type="hidden" name="writer" value="${userId}">
	<div class="partThree">
		<div style="float: left; width: 10%;">일촌평</div>
		<div style="display: inline-block; width: 90%; height:21px;">
			<input class="friend-input" type="text"  name="friendcomment" placeholder="일촌에게 하고 싶은 말을 남겨보세요~" required>
			<button id="friendComment_btn">확인</button>
		</div>
	</div>
	</form>
	<div class="friendaddComment" style="padding-left: 5px; padding-right: 5px; ">
		<c:choose>
		<c:when test="${not empty friendCommentList}">
			<c:forEach var="friend" items="${friendCommentList}">
				·&nbsp;${friend.friendComment }&nbsp;&nbsp;
				<font size="2">
					(<a href="${pageContext.request.contextPath}/minihome/${friend.writer}">
						&nbsp;${friend.writer}, <font color="blue">${friend.name }</font>&nbsp;)
					</a> 
				</font>
				 <font color="gray" size="1.7em">(${friend.date})&nbsp;&nbsp;</font>
				 <a href="${pageContext.request.contextPath }/minihome/${friend.writer}"> <i class="fa fa-home" aria-hidden="true"></i></a>&nbsp;&nbsp;
				<hr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			소중한 첫 번째의 일촌평을 남겨보세요~
		</c:otherwise>
		</c:choose>
	</div>
</div>

<%@ include file="/WEB-INF/view/mini_template/footer.jsp"%>
