<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<style>
.findtable {
	border-collapse: collapse;
}

</style>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/each.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function(){
		//#searchForm을 전송하지 말고 Rest 방식으로 조합하여 전송하도록 수정
		$("#searchForm").on("submit", function(){
			event.preventDefault();//기본 이벤트 중지
			
			var key = $(this).find("input[name=key]").val();
			console.log(this);
			console.log(key);
			if(key.length > 0){
				location.href = 
					"${pageContext.request.contextPath}/member/find/"+key;
			}
		});
	});
</script>

<div class="area-80 center">
	<div class="row text-center font-big">일촌 찾기</div>
	<div class="row">
		<table class="findtable center area-80" border="1">
				<tr>
					<td colspan="5">
						<form id="searchForm">
						<div class="row inner-align-left">
							<div style="width: 100%;">
								<input class="form-input" type="search" name="key"
									placeholder="아이디 혹은 번호입력" value="${param.key}">
							</div>
							<div>
								<input class="form-btn" type="submit" value="검색">
							</div>
						</div>
						</form>
				</td>
				</tr>
			<tr>
				<th colspan="2"><div>사람들</div></th>
			</tr>
<!-- 			<tr class="center"> -->
<%-- 				<td width="30%"><img src="${pageContext.request.contextPath }/img/아이린.jpg" width="200px" height="200px"></td> --%>
<!-- 				<td>ㅋㅋㅋㅋ</td> -->
<!-- 			</tr> -->
				<c:forEach var="member" items="${list}">
					<tr>
						<th>${member.id}</th>
						<th>${member.name}</th>
						<th>${member.birth}</th>
						<th>${member.date}</th>
						<th>
							<a href="memberview/${member.id}">
	                            <i class="fa fa-eye" aria-hidden="true"></i>
	                        </a>
	                        <a href="memberdrop/${member.id }">
	                            <i class="fa fa-trash" aria-hidden="true"></i>
	                        </a>
                        </th>
					</tr>
				</c:forEach>
		</table>
	</div>
</div>
</html>
