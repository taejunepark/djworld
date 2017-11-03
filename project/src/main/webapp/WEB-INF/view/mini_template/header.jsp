<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>    
<html>
<head>
<title>DJWorld</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/minihome.css?ver=3">
<%-- <link href="${pageContext.request.contextPath }/css/ko_KR/smart_editor2.css?ver=2" rel="stylesheet" type="text/css"> --%>
<link href="${pageContext.request.contextPath }/css/ko_KR/smart_editor2.css?ver=2" rel="stylesheet" type="text/css">
<!-- jQuery를 사용하기 위한 CDN 설정 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	function sendCheck() {
		event.preventDefault();

		var input = document.querySelector("textarea[id=visitorArea]");
		if (input.value == "") {
			alert("내용을 적어주세요.");
			return;
		}
		//전송
		var form = document.querySelector("form");
		form.submit();
	}
	function replyeditHandler(no, writer){
        var text = $("#replydetail"+no).html().trim();
        var area = $("<textarea style='overflow: hidden;' rows='2' cols='40'></textarea>");
        if($(".replyedit"+no).text() === "수정"){
        	$("#replydetail"+no).empty();
        	area.addClass("replyeditDetail"+no).text(text);
        	$("#replydetail"+no).append(area);
        	$(".replydate"+no).css("display","none");
            $(".replyedit"+no).text("완료");
        }
        else{
            var text = $(".replyeditDetail"+no).val();
            $(".replyeditDetail"+no).empty();
            $(".replyeditDetail"+no).text(text);
        	$.ajax({
        		url: "${pageContext.request.contextPath}/replyedit/"+no+"/"+writer,
        		type: "post",
        		data:{
        			detail : text
        		},
        		success:function(detail){
        			$("#replydetail"+no).empty();
        			$("#replydetail"+no).html(detail);
        			$(".replydate"+no).css("display","block");
        		},
        		 err:function(err){
					 console.log("실패");
				}
        	});
            $(".replyedit"+no).text("수정");
        }
    }	
</script>
</head>
<body>
	<div class="mini">
		<header>
			<a class="header_a" href="${pageContext.request.contextPath }/minihome/${userId}">내 홈피</a>
			<c:if test="${!friendCheck }">
				<font color="gray" >&nbsp;|&nbsp;일촌맺기</font>
			</c:if>
		</header>
		<div class="info">
			<div class="visit">
				Total ${owner.total }
			</div>
			<div class="title">
				<font color="blue"  style="font-size: 1.5em;">${owner.name }의 미니 홈피</font>
			</div>
		</div>

		<main>
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