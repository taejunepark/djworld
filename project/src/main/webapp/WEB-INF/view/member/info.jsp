<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/infoHeader.jsp"%>
	
<style>
	.infoTable{
 		border-bottom: 1px solid black; 
	}
	.infoTable th{
		height: 70px;
	}
</style>
	
<div class="area-100 center">
	<table class="infoTable area-30 center">
			<tr>
				<th colspan="2">
					<div class="font-big text-center" style="background-color: black; color: white;">
						내 정보
					</div>
			</th>
			</tr>
			<tr>
				<th class="font-medium">아이디</th>
				<td class="font-small ">${member.id }</td>
			</tr>
			<tr>
				<th class="font-medium">이름</th>
				<td class="font-small ">${member.name }</td>
			</tr>
			<tr>
				<th class="font-medium">생년월일</th>
				<td class="font-small ">${member.birth }</td>
			</tr>
			<tr>
				<th class="font-medium">이메일</th>
				<td class="font-small ">${member.email }</td>
			</tr>
			<tr>
				<th class="font-medium">밤</th>
				<td class="font-small ">${member.bam }</td>
			</tr>
			<tr>
				<th class="font-medium">가입일</th>
				<td class="font-small ">${member.date }</td>
			</tr>
	</table>
</div>


<%@ include file="/WEB-INF/view/template/footer.jsp"%>


