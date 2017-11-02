<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>    
<html>
<head>
<meta charset="UTF-8">
<title>TJWorld</title>
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
		</header>
		<div class="info">
			<div class="visit">
				Total ${owner.total }
			</div>
			<div class="title">
				<span><font color="blue"  style="font-size: 1.5em;">${owner.name }의 미니 홈피</font></span>
			</div>
		</div>

		<main>