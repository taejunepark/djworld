<%-- <%@page import="home.model.MemberDAO"%> --%>
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
	href="${pageContext.request.contextPath }/css/each.css?ver=2">
</head>
<body>
	<!-- 페이지 영역 시작 -->
	<div class="page">
		<!-- 상단 영역 -->
		<header style="text-align: left">
			<div class="title">
				<table>
					<tr>
						<th><a href="${pageContext.request.contextPath}"> 
						<img
								src="${pageContext.request.contextPath }/img/naver2.png"
								class="img-height-1"></th>
						</a>
						<th class="font-big">회원가입</th>
					</tr>
				</table>
			</div>
		</header>

		<!-- 메뉴 영역 -->
		<nav>
			<a href="${pageContext.request.contextPath}" class="left"><font color="white">홈</font></a>
			<c:choose>
				<c:when test="${loginFlag}">
					<a href="${pageContext.request.contextPath}/member/info"
						class="left"><font color="white">내 정보</font></a>
						<a href="${pageContext.request.contextPath}/member/pwcheck/pwchange"
						class="left"><font color="white">비밀번호 변경</font></a>
						<a href="${pageContext.request.contextPath}/member/emailchange"
						class="left"><font color="white">이메일 변경</font></a>
					<a href="${pageContext.request.contextPath}/member/drop"
						class="left"><font color="white">회원탈퇴</font></a>
					<a href="#" class="left"><font color="white">고객센터</font></a>
					<c:if test="${adminFlag}">
						<a href="${pageContext.request.contextPath}/admin/home"
							class="left"><font color="white">관리자 메뉴</font></a>
					</c:if>
					<a href="${pageContext.request.contextPath}/member/logout"
						class="right"><font color="white">로그아웃</font></a>
				</c:when>
			</c:choose>
		</nav>
		<!-- 중단 영역 -->
		<main>