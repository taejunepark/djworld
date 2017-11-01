<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/view/mini_template/header.jsp" %>    
<style>
	body {
		overflow: hidden;
		margin: 10px;
	}
	
	div{
		border: 3px solid black;
	}
	
	#detail{
		width:100%;
		height:70%;
	}
</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/S.E/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
                <aside>
                    <a href="#">미정</a>
                </aside>
                
                <div class="highlight">
					<form action="#" method="post">
						<input type="hidden" name="editFlag" value="${editFlag}">
						<input type="hidden" name="reg" value="${reg}">
						<textarea name="detail" id="detail" rows="10" cols="100">${detail }</textarea>
						<input type="button" value="등록" id="write_btn">
						<input type="button" value="취소" id="cancle_btn">
					</form>
                </div>
<%@ include file = "/WEB-INF/view/mini_template/footer.jsp" %>        
