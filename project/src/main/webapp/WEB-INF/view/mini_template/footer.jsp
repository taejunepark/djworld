<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="menu">
	<ul>
		<li><a href="${pageContext.request.contextPath }/minihome/${owner.id}">홈</a>
		</li>
		<li><a
			href="${pageContext.request.contextPath }/minihome/${owner.id}/diary">다이어리</a>
		</li>
		<li><a
			href="${pageContext.request.contextPath }/minihome/${owner.id}/visitors">방명록</a>
		</li>
		<li><a href="#">사진첩</a></li>
		<li><a href="#">게시판</a></li>
	</ul>
</nav>
</main>
</div>
</body>
</html>