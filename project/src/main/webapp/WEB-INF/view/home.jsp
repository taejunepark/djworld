<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>

<head>
<title></title>
<!-- 디자인 코드를 작성하는 공간 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/each.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/swiper.css">
</head>
<style>
/* 로그인 테이블 하단 메뉴 */
.swiper-container {
	/*        border: 1px solid black;*/
	width: 100%;
	height: 100px;
}

.swiper-slide {
	margin-top: 40px;
}

.bt1 .text {
	position: absolute;
	left: 0;
	right: 0;
	margin-left: auto;
	margin-right: auto;
	top: 30px;
	bottom: 0;
	margin-top: auto;
	margin-bottom: auto;
}

table tr:last-child td {
	border-left: 1px solid white;
	border-right: 1px solid white;
	border-bottom: 1px solid white;
}
</style>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath }/js/swiper.js"></script>
<script>
	$(document).ready(function() {
		//.swiper-container에 swiper를 적용
		var slider = new Swiper(".swiper-container", {
			pagination : ".swiper-pagination", //페이징 표시대상
			paginationClickable : true, //페이지 이동을 클릭으로 가능하게 설정

			nextButton : ".swiper-button-next", //다음버튼
			prevButton : ".swiper-button-prev", //이전버튼

			grabCursor : true, //커서 모양을 움켜쥐는 것으로 교체
			//전환 애니메이션 설정
			slidesPerView : "3" //숫자 또는 "auto"
		//                    coverflow:{
		//                        rotate:0,//회전시의 각도
		//                        stretch:-10//밀리는 거리 : 높이면 붙는다
		//                       
		//                    }
		});
	});
</script>


<body>
	<!-- 페이지 영역 시작 -->
	<div class="page">
		<!-- 상단 영역 -->
		<header>
			<div class="title">
				<table>
					<tr>
						<th><a href="${pageContext.request.contextPath}"> <img
								src="${pageContext.request.contextPath }/img/naver2.png"
								class="img-height-1"></a></th>

						<th class="font-big">DJWorld</th>
					</tr>
				</table>
			</div>
		</header>

		<!-- 사이드 메뉴 -->
		<aside>
			<div class="aside">
				<table class="logintable" border="1">
					<c:choose>
						<c:when test="${loginFlag }">
							<tr>
								<th colspan="5" style="height: 100px;">
									<h1>${userId }님환영합니다</h1>
								</th>
							</tr>
							<tr>
								<th colspan="3" style="height: 50px;"><a href="#">내 홈피
										가기</a></th>
								<th colspan="2"><a
									href="${pageContext.request.contextPath}/member/logout">로그아웃</a></th>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th colspan="5" style="height: 100px;">
									<button class="area-40" style="height: 40px"
										onclick="location.href='${pageContext.request.contextPath}/member/login'">로그인</button>
								</th>
							</tr>
							<tr class="font-small" style="height: 50px;">
								<th colspan="3"><a href="${pageContext.request.contextPath }/info/infofind/code=id">아이디/비밀번호 찾기</a></th>
								<th colspan="2"><a
									href="${pageContext.request.contextPath }/member/register">회원가입</a></th>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr style="height: 80px; margin-bottom: 10px;">
						<th colspan="5" class="font-small">
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<!-- 1장의 이미지 영역 -->
									<div class="swiper-slide">
										<a href="minihome"
											onClick="window.open(this.href, '', 'width=1000, height=600, top=200, left=500'); return false;">내
											홈피</a>
									</div>
									<div class="swiper-slide">
										<a href="${pageContext.request.contextPath }/member/info">내
											정보</a>
									</div>
									<div class="swiper-slide">
										<a href="${pageContext.request.contextPath }/member/find">친구찾기</a>
									</div>
									<div class="swiper-slide">고객센터</div>
								</div>
								<!-- swiper-wrapper 끝 -->

								<!-- 이전 / 다음 추가 -->
								<div class="swiper-button-next"
									style="background-image: url(${pageContext.request.contextPath }/img/right.png);"></div>
								<div class="swiper-button-prev"
									style="background-image: url(${pageContext.request.contextPath }/img/left.png);"></div>
							</div>
						</th>
					</tr>

					<form action="member/find" >
						<tr>
							<td colspan="5">
								<div class="row inner-align-left">
									<div style="width:100%;">
										<input class="form-input" type="search" name="key"
											placeholder="아이디 혹은 번호입력" value="${param.key }">
									</div>
									<div>
										<input class="form-btn" type="submit" value="검색">
									</div>
								</div>
							</td>
						</tr>
					</form>
				</table>

				<table class="friend-table" border="1">
					<tr style="height: 50px">
						<th>엄마</th>
						<th>짱구</th>
						<th>흰둥이</th>
					</tr>
					<tr style="height: 250px">
						<th><img
							src="${pageContext.request.contextPath }/img/mom.jpg"
							class="img-width-3 img-height-2"></th>
						<th><img src="${pageContext.request.contextPath }/img/짱구.jpg"
							class="img-width-3 img-height-2"></th>
						<th><img
							src="${pageContext.request.contextPath }/img/흰둥이.jpg"
							class="img-width-3 img-height-2"></th>
					</tr>
				</table>
				<br>
			</div>
		</aside>

		<!-- 중단 영역 -->
		<main>
		<div class="banner">
			<div class="ba1">
				<h1>설명</h1>
			</div>
			<div class="ba2">
				<img
					src="${pageContext.request.contextPath }/img/%EB%A7%88%EC%95%BD.png"
					class="area-70 height-80">
			</div>
		</div>
		<br>
		<div class="banner">
			<div class="ba2">
				<img src="${pageContext.request.contextPath }/img/채연.png"
					class="area-70 height-80">
			</div>
			<div class="ba1">
				<h1>설명</h1>
			</div>

		</div>
		<div class="empty-row"></div>
		<div class="bt">
			<div class="bt1">
				<img src="${pageContext.request.contextPath }/img/customer.png"
					class="area-70 height-80">
				<!--
                    <div class="text-center center text font-small">
                        <h1>고객센터</h1>
                    </div>
-->
			</div>
			<div class="bt1">
				<img src="${pageContext.request.contextPath }/img/idpw.jpg"
					class="area-70 height-80">
			</div>
			<div class="bt1">
				<img src="${pageContext.request.contextPath }/img/ring.jpg"
					class="area-70 height-80">
			</div>
		</div>

		<%@ include file="/WEB-INF/view/template/footer.jsp"%>