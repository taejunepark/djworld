<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="menu">
	<ul>
		<li><a id="menu_home"
			href="${pageContext.request.contextPath }/minihome/${owner.id}">홈</a>
		</li>

		<li><a id="menu_diary"
			href="${pageContext.request.contextPath }/minihome/${owner.id}/diary">다이어리</a>
		</li>

		<!-- 		<li> -->
		<!-- 			<a href="#">공유 다이어리</a> -->
		<!-- 		</li> -->

		<li><a id="menu_photo"
			href="${pageContext.request.contextPath }/minihome/${owner.id}/photo">사진첩</a>
		</li>

		<!-- 		<li> -->
		<!-- 			<a href="#">게시판</a> -->
		<!-- 		</li> -->

		<li><a id="menu_visitors"
			href="${pageContext.request.contextPath }/minihome/${owner.id}/visitors">방명록</a>
		
		<li>
			<a id="menu_board" href ="${pageContext.request.contextPath }/minihome/${owner.id}/board">게시판</a>
		</li>
		
		<li>
			<a id="menu_visitors" href="${pageContext.request.contextPath }/minihome/${owner.id}/visitors">방명록</a>
		</li>
	</ul>
</nav>
</main>
</div>
</body>
</html>