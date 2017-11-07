<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/view/mini_template/header.jsp" %>
<!--  -->    
<style>
	body {
		overflow: hidden;
		margin: 10px;
	}
	
	/* div{
		border: 3px solid black;
	} */
	
	#detail{
		width:100%;
		height:70%;
	}
	
	#menu_diary{
		color: blue;
	}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/S.E/js/HuskyEZCreator.js"></script>
<script>
     $(document).ready(function(){
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
        		 var html = $("#detail").val()
        		 $("#tmp").html(html)
        		 var img = $("#tmp img")
        		 var imgPath = new Array()
        		 if(img.length != 0) {
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
        		 }
         		 $("form").attr('action', '${pageContext.request.contextPath }/minihome/${owner.id }/diary_write').submit()
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
         
         $("#cancle_btn").click(function(){
        	 history.back()
         })
     })
</script>
                <div class="highlight">
					<form action="#" method="post">
						<input type="hidden" name="reg" value="${reg}">
						<textarea name="detail" id="detail" rows="10" cols="100"></textarea>
						<input type="button" value="등록" id="write_btn">
						<input type="button" value="취소" id="cancle_btn">
					</form>
                </div>
                
                <div id="tmp" style="display:none;">
                </div>
<%@ include file = "/WEB-INF/view/mini_template/footer.jsp" %>
