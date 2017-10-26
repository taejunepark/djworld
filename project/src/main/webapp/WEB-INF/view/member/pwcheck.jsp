<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/infoHeader.jsp"%>

<c:if test="${pwFlag}">
	<script>
		alert('비밀번호가 맞지 않습니다.');
	</script>
</c:if>

<c:if test="${pathFlag}">
	<script>
		alert('잘못된 경로입니다.');
	</script>
</c:if>


<div class="empty-row"></div>
		<div class="area-100 center">
			<form action="${path }" method="post">
				<table class="pwtable area-50 center">
					<thead>
						<tr>
							<th colspan="2" class="font-medium">본인 확인</th>
						</tr>
						<tr>
							<th colspan="2"  style="height: 20px"> </th>
						</tr>
						<tr>
							<th colspan="2" class="font-min" style="text-align:left;">개인 정보를 위해 비밀번호를 입력해주세요.</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="font-small">비밀번호</th>
							<td><input type="password" name="pw"></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="2"><input type="submit" value="확인"
								class="form-btn">
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>