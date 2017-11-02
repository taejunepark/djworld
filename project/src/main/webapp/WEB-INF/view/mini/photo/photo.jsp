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

#titleArea{
	font-size: 25px;
	display:flex;
	flex-direction:row;
	flex-wrap:no-wrap;
}

#reg{
	display:flex;
	flex-direction: row-reverse;
}

#detailArea{
	height: 500px;
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
#info{
	display:flex;
	flex-direction:row;
	flex-wrap:wrap;
}

#info p{
	/* display:block; */
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

<c:choose>
	<c:when test="${not empty list}">
		<div class="highlight">
			<c:forEach var="p" items="${list}">
				<div id="titleArea">
					<p id="no" style="display:none;">${p.no }</p><p>${p.title }</p>
				</div>
				
				<div id="info">
					<p>작성 일 : </p><p>${p.reg }</p> 
					<p>조회 수 : </p><p>${p.read }</p>
					<p>댓글 수 : </p><p>${p.reply }</p>
				</div>
				
				<div id="detailArea">
					${p.detail }
				</div>
				
				<div id="replyArea">
					<input type="text" name="reply" placeholder="댓글을 입력해주세요">
					<button id="replyWrite_btn">입력</button>
				</div>
				
				<div id="optionArea">
					<button id="delete_btn">삭제</button>
					<button id="edit_btn">수정</button>
				</div>
			</c:forEach>
		<button id="write_btn">등록하기</button>
		</div>
	</c:when>
	
	<c:otherwise>
		<div class="highlight">
			<div id="showArea">
				<font size="25">등록된 게시물이 없습니다!</font>
			</div>
			
			<div id="optionArea">
				<button id="write_btn">등록하기</button>
			</div>
		</div>
	</c:otherwise>
</c:choose>
<%@ include file="/WEB-INF/view/mini_template/footer.jsp"%>