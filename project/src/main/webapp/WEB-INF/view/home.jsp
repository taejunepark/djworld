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

table tr:last-child td {
	border-left: 1px solid white;
	border-right: 1px solid white;
	border-bottom: 1px solid white;
}

h1 {
	font-size: 2.5em;
	margin: 0px;
}

h2 {
	color: gray;
	font-size: 2.0em;
	margin: 0px;
}
/* 배너 전체 */
.banner {
	display: flex;
	flex-wrap: wrap;
	height: 450px;
}

/* 배너 설명문 */
.ba1 {
	padding-top: 100px;
	width: 60%;
	border: 1px solid white;
}

/* 배너 이미지 */
.ba2 {
	position: relative;
	flex-grow: 1;
	border: 1px solid white;
}

.ba2 img {
	position: absolute;
	left: 0;
	right: 0;
	margin-left: auto;
	margin-right: auto;
	top: 0;
	bottom: 0;
	margin-top: auto;
	margin-bottom: auto;
}
</style>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath }/js/swiper.js"></script>
<script>
	$(document)
			.ready(
					function() {
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

						//#searchForm을 전송하지 말고 Rest 방식으로 조합하여 전송하도록 수정
						$("#searchForm")
								.on(
										"submit",
										function() {
											event.preventDefault();//기본 이벤트 중지

											var key = $(this).find(
													"input[name=key]").val();
											if (key.length > 0) {
												location.href = "${pageContext.request.contextPath}/member/find/"
														+ key;
											}
										});
					});

	function window_open() {
		window_with = 500; //새창의 너비 
		window_height = 500; //새창의 높이 
		screen_width = screen.availWidth; //화면 너비 (해상도) 
		screen_height = screen.availHeight; //화면 높이 (해상도) 
		//새창의 위치 
		open_x = (screen_width - window_with) / 2;
		open_y = (screen_height - window_height) / 2;
		window.open("${pageContext.request.contextPath}/upload", "Window_open",
				"height=350; width=530; left=" + open_x + ", top=" + open_y);
	}
</script>

<c:set var="friend" value="${friend}"/>

<c:if test="${pwchange }">
	<script>
		alert('비밀번호 변경이 완료되었습니다.');
	</script>
</c:if>

<c:if test="${emailchange }">
	<script>
		alert('이메일 변경이 완료되었습니다.');
	</script>
</c:if>

<c:if test="${findFlag eq '실패'}">
	<script>
		alert('로그아웃 먼저 해주세요.');
	</script>
</c:if>

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
								<th colspan="5">
									<div class="row center inner-align-left"
										style="border-right: 1px solid white">
										<div class="area-30" style="padding-left: 15px;">
											<a href="#"> <c:choose>
													<c:when test="${profile != null}">
														<img
															src="${pageContext.request.contextPath }/file/${profile}"
															width="100%" height="100">
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath }/img/프로필.jpg"
															width="100%" height="100">
													</c:otherwise>
												</c:choose>
											</a>
										</div>
										<div class="area-60" style="padding-left: 15px;">
											<h3>${name }님환영합니다</h3>
											<!-- 										<form action="upload" method="post" enctype="multipart/form-data" -->
											<!-- 										 onClick="window.open(this.href, '', 'width=300, height=300, top=10%, left=200'); return false;"> -->
											<button onClick="window_open()">프로필 설정</button>
											<!-- 										</form> -->
										</div>
									</div>
								</th>
							</tr>
							<tr>
								<th colspan="3" style="height: 50px;"><a href="minihome"
									onClick="window.open(this.href, '', 'width=900, height=600, top=10%, left=200'); return false;">내
										홈피 가기</a></th>
								<th colspan="2"><a
									href="${pageContext.request.contextPath}/member/logout">로그아웃</a></th>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th colspan="5" style="height: 100px;">
									<button class="form-btn area-40"
										onclick="location.href='${pageContext.request.contextPath}/member/login'">로그인</button>
								</th>
							</tr>
							<tr class="font-small" style="height: 50px;">
								<th colspan="3"><a
									href="${pageContext.request.contextPath }/info/infofind/id">아이디/비밀번호
										찾기</a></th>
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
									<c:if test="${loginFlag }">
										<div class="swiper-slide">
											<a href="${pageContext.request.contextPath }/friend/list">일촌목록</a>
										</div>
									</c:if>
									<div class="swiper-slide">
										<a
											href="${pageContext.request.contextPath }/member/pwcheck/info">내
											정보</a>
									</div>
									<div class="swiper-slide">
										<a href="${pageContext.request.contextPath }/member/find">친구찾기</a>
									</div>
									<div class="swiper-slide">
										<a href="#">고객센터</a>
									</div>
									<div class="swiper-slide">
										<a href="#">공지사항</a>
									</div>
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

					<tr>
						<td colspan="5">
							<form id="searchForm">
								<div class="row inner-align-left">
									<div style="width: 100%;">
										<input class="form-input" type="search" name="key"
											placeholder="아이디 혹은 번호입력">
									</div>
									<div>
										<input class="form-btn" type="submit" value="검색">
									</div>
								</div>
							</form>
						</td>
					</tr>
				</table>
				<table class="friend-table" border="1">
					<c:choose>
						<c:when test="${friend == null }">
							<tr style="height: 50px">
								<th colspan="3">친구를 추가해보세요!</th>
							</tr>
							<tr style="height: 250px">
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</c:when>
						<c:otherwise>
							<tr style="height: 50px">
								<c:forEach var="friend" items="${friend }">
									<th>${friend.name }</th>
								</c:forEach>
							</tr>
							<tr style="height: 250px">
								<c:forEach var="friend" items="${friend }">
									<c:choose>
										<c:when test="${friend.profile != null}">
											<th>
												<div>
													<img 	src="${pageContext.request.contextPath }/file/${friend.profile}"
														width="300" height="200">
												</div>
											</th>
										</c:when>
										<c:otherwise>
											<th>
												<div>
													<img src="${pageContext.request.contextPath }/img/프로필.jpg"
														width="300" height="200">
												</div>
											</th>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tr>
						</c:otherwise>
					</c:choose>

				</table>

				<br>
			</div>
		</aside>

		<!-- 중단 영역 -->
		<main>
		<div class="empty-row"></div>
		<hr>
		<div class="empty-row"></div>
		<div class="banner">
			<div class="ba1 text text-left">
				<h1 style="color: black;">
					　　　　평생 함께할 친구들과 함께<br>
					　　　　소중한 인연인 동료들과 함께<br>
					　　　　하나밖에 없는 가족들과 함께<br>
				</h1><br><br>
				<h2>　　　공유 다이어리를 이용하여 추억을 쌓아보아요!</h2>
			</div>
			<div class="ba2">
				<img src="${pageContext.request.contextPath }/img/일기.jpg"
					class="area-100 height-100">
			</div>
		</div>
		<div class="empty-row"></div>
		<hr>
		<div class="empty-row"></div>
		<div class="banner">
			<div class="ba2">
				<img src="${pageContext.request.contextPath }/img/공간.jpg"
					class="area-100 height-100">
			</div>
			<div class="ba1 text text-left">
				<h1 style="color: gray;">
					　 나만의 <font color="black">공간</font><br>
					　　　　　　　　나만의 <font color="black">쉼터</font><br>
					　　　　　　　　　　　　　　　　나만의 <font color="black">세상</font>
				</h1>
				<br><br>
				<h2>　　　　　　DJworld에서 지금부터 만들어보세요!</h2>

			</div>

		</div>
		<div class="empty-row"></div>
		<hr>
		<div class="empty-row"></div>
		<div class="empty-row"></div>
		<div class="bt">
			<div class="bt1">
				<img src="${pageContext.request.contextPath }/img/customer.png"
					class="area-70 height-80">
			</div>
			<div class="bt1" style="border-left: 1px solid gray; border-right: 1px solid gray;">
				<a href="${pageContext.request.contextPath }/info/infofind/id">
					<img src="${pageContext.request.contextPath }/img/비번.png"
					class="area-70 height-80">
				</a>
			</div>
			<div class="bt1">
				<img src="${pageContext.request.contextPath }/img/미니미.png"
					class="area-70 height-80">
			</div>
		</div>
		<div class="empty-row"></div>

		<%@ include file="/WEB-INF/view/template/footer.jsp"%>