<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mini_template/header.jsp"%>
<style>
div{
/* 	border: 3px solid black; */
}
body {
	overflow: hidden;
	margin: 10px;
}

#titleArea{
	display:flex;
}

input[name=title]{
	flex-grow:1;
}

#detailArea{
	height: 90%;
}

#optionArea{
	margin: 0px auto;
}
#detail{
	width:100%;
	height:90%;
}

#menu_photo{
	color: blue;
}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/S.E/js/HuskyEZCreator.js"></script>
<script>
	$(document).ready(function() {
		var oEditors = [];
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "detail",
            sSkinURI: "${pageContext.request.contextPath}/S.E/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        });
        
        $("#write_btn").click(function(){
       	 if(validation()){
       		 oEditors[0].exec("UPDATE_CONTENTS_FIELD", [])
       		 // Textarea에 있는 값 저장
       		 var html = $("#detail").val()
       		 // Textarea에 있는 값을 숨겨둔 div(id=tmp)에 삽입
       		 $("#tmp").html(html)
       		 // tmp_div에 있는 이미지 태그들 가져옴
       		 var img = $("#tmp img")
       		 // 배열 변수 생성
       		 var imgPath = new Array()
       		 // 이미지의 src 파일 이름 앞 부분 잘라낼 변수
       		 var basePath = 'http://localhost:8080/project/multiupload/'
       		 for(var i = 0; i < img.length; i++){
       			 // img[i]번방의 src 경로 추출
       			 var src = img[i].getAttribute('src')
       			 // 파일 이름 앞부분 잘라냄
       			 src = src.substring(basePath.length)
       			 // 파일 이름 뒤의 확장자 제거
       			 src = src.substring(0, src.lastIndexOf('.'))
       			 // 파일 이름만 남은 src를 배열에 추가
       			 imgPath.push(src)
       		 }
       		 // input 태그 생성
       		 var input = $("<input/>")
       		 // <input type="hidden" name="srcs" value="imgPath">로 설정
       		 input.attr('type', 'hidden').attr('name','srcs').val(imgPath)
       		 // form에 추가
       		 $("form").append(input)
       		 $("form").attr('action', '${pageContext.request.contextPath }/minihome/${owner.id }/photo_write').submit()
       	 }
       	 
       	 function validation() {
           	 var contents = $.trim(oEditors[0].getContents())
           	 if(contents === '<p>&nbsp<p>' || contents === '') {
           		 alert("내용을 입력하세요")
           		 $("#detail").focus()
           		 return false
           	 }
           	 return true
            }
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
		<form action="${pageContext.request.contextPath }/minihome/${owner.id}/minicomment" method="post">
			<div id="hello" class="hello">
				<input type="hidden" id="comment" name="comment"> 
				<div id="message" class="message">
							${message }
				</div>
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
	<form action="#" method="post">
		<div id="titleArea">
			<input type="text" name="title" placeholder="제목을 입력하세요" required>
		</div>
		
		<div id="detailArea">
			<textarea name="detail" id="detail" rows="10" cols="100"></textarea>
		</div>
		
		<div id="optionArea">
			<button id="write_btn">완료</button>
			<button id="delete_btn" onclick="location.href='${pageContext.request.contextPath}/minihome/${userId }/photo'">취소</button>
		</div>
	</form>
</div>
	
<%@ include file="/WEB-INF/view/mini_template/footer.jsp"%>