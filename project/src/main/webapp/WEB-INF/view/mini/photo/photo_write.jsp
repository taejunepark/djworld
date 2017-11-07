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
   		 oEditors[0].exec("UPDATE_CONTENTS_FIELD", [])
   		 var res = createSrcs()
   		 console.log(res)
   		 if(res){
   			 if($("input[name=title]").val().length==0){
   				 alert("제목 입력 바랍니다.")
   				 return
   			 }
   				 
   			$("form").attr('action', '${pageContext.request.contextPath }/minihome/${owner.id }/photo_write').submit()
   		 }else{
   			 $("form").submit(function(){
   				 event.preventDefault()
   			 })
   		 }
        })
       	 
       	 function createSrcs(){
       		// Textarea에 있는 값 저장
       		var html = $("#detail").val()
       		console.log(html)
       		// Textarea에 있는 값을 숨겨둔 div(id=tmp)에 삽입
       		$("#tmp").html(html)
       		console.log($("#tmp").html())
       		// tmp_div에 있는 이미지 태그들 가져옴
       		var img = $("#tmp img")
       		console.log(img.length)
       		if(img.length==0){
       			alert("이미지 등록 바랍니다")
       			return false
       		}
       		
       		var imgPath = new Array()
			var tmp = img[0].getAttribute('src')
   		 	var basePath = ''
   		 
   		 	for(var i = 0; i < 5; i++) {
   			 	basePath += tmp.substring(0, tmp.indexOf('/') + 1)
       		 	tmp = tmp.substring(tmp.indexOf('/') + 1)
   		 	}
		     
   		 	for(var i = 0; i < img.length; i++){
   			 	var src = img[i].getAttribute('src')
   			 	src = src.substring(basePath.length)
   			 	src = src.substring(0, src.lastIndexOf('.'))
   			 	imgPath.push(src)
   		 	}
   		 	var input = $("<input/>")
   		 	input.attr('type', 'hidden').attr('name','srcs').val(imgPath)
   		 	$("form").append(input)
       		return true
       	 }
	})
</script>

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

<div id="tmp" style="display:none;"></div>
	
<%@ include file="/WEB-INF/view/mini_template/footer.jsp"%>