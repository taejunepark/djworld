<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mini_template/header.jsp"%>
<style>
div{
	border: 3px solid black;
}
body {
	overflow: hidden;
	margin: 10px;
}

#title{
	font-size: 25px;
}

#reg{
	display:flex;
	flex-direction: row-reverse;
}

#detailArea{
	height: 70%;
}

input[name=reply]{
	width:95%;
}

#optionArea{
	display:flex;
	flex-direction: row-reverse;
}

#showArea{
	margin:0px auto;
	width: 100%;
	height: 80%;
}

</style>
<script>
	$(document).ready(function() {
		$("#write_btn").click(function(){
			location.href= "photo_write"
		})
	})
</script>

<c:choose>
	<c:when test="${not empty list}">
		<div class="highlight">
			<div id="titleArea">
				<label id="title">제목</label>
			</div>
			
			<div id="regArea">
				<p id="reg">작성일 : 2017-11-02 18:06:52</p>
				<p id="read">조회 수 : 0</p>
			</div>
			
			<div id="detailArea">
				내용~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			</div>
			
			<div id="replyArea">
				<input type="text" name="reply" placeholder="댓글을 입력해주세요">
				<button id="replyWrite_btn">입력</button>
			</div>
			
			<div id="optionArea">
				<button id="write_btn">등록</button>
				<button id="delete_btn">삭제</button>
				<button id="edit_btn">수정</button>
			</div>
		</div>
	</c:when>
	
	<c:otherwise>
		<div class="highlight">
			<div id="showArea">
				<font size="25">등록된 게시물이 없습니다!</font>
			</div>
			
			<div id="optionArea">
				<button id="write_btn">등록</button>
			</div>
		</div>
	</c:otherwise>
</c:choose>
<%@ include file="/WEB-INF/view/mini_template/footer.jsp"%>