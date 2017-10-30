<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>홈페이지 팝니다.</title>
<!-- 디자인 코드를 작성하는 공간 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css?ver=2">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/each.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<!-- 페이지 영역 시작 -->
	<div class="page">
		<!-- 상단 영역 -->
		<header style="text-align: left">
			<div class="title">
				<table>
					<tr>
						<th><a href="${pageContext.request.contextPath}/"> 
						<img
								src="${pageContext.request.contextPath }/img/naver2.png"
								class="img-height-1"></a></th>
						
						<th class="font-big">일촌 찾기</th>
					</tr>
				</table>
			</div>
		</header>

		<!-- 메뉴 영역 -->
		<nav>
			<a href="${pageContext.request.contextPath}" class="left"><font color="white">홈</font></a>
			<c:choose>
				<c:when test="${!loginFlag}">
					<a href="${pageContext.request.contextPath}/member/register"
						class="left"><font color="white">회원가입</font></a>
					<a href="${pageContext.request.contextPath}/member/find" 
						class="left"><font color="white">친구 찾기</font></a>
					<a href="#"  class="left">
						<font color="white">고객센터</font></a>
					<a href="${pageContext.request.contextPath}/member/login"
						class="right"><font color="white">로그인</font></a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/member/find" 
							class="left"><font color="white">일촌 찾기</font></a>
					<a href="${pageContext.request.contextPath}/friend/list" 
						class="left"><font color="white">일촌 목록</font></a>
					<a href="#"  class="left">
						<font color="white">고객센터</font></a>
					<a href="${pageContext.request.contextPath}/member/logout"
						class="right"><font color="white">로그아웃</font></a>
				</c:otherwise>
			</c:choose>
		</nav>
		<!-- 중단 영역 -->
		<main>