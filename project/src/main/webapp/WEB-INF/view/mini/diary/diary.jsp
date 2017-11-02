<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mini_template/header.jsp"%>
<style>
body {
	overflow: hidden;
	margin: 10px;
}
</style>
<script>
	$(document).ready(function() {
						init()
						$("select").change(function() {
							$(".dayArea").empty()
							dateChange()
						})

						$(".write_btn").click(function() {
							var date = select_date()
							$("input[name=reg]").val(date)
							$("#transfer").attr("action", "diary_write")
						})

						$(".edit_btn").click(function() {
							var date = select_date()
							$("input[name=reg]").val(date)
							$("input[name=detail]").val($(".area").html())
							$("#transfer").attr("action", "diary_edit")
						})

						function btnChange() {
							var test = $(".area").html()
							if (test === null || test === "") {
								showWrite()
							} else {
								showEdit()
							}
						}

						function showWrite() {
							$(".write_btn").css("display", "none");
							$(".edit_btn").css("display", "block");
						}

						function showEdit() {
							$(".write_btn").css("display", "block");
							$(".edit_btn").css("display", "none");
						}

						function select_date() {
							var year = $("#year").val().substr(2, 2)
							var month = $("#month").val().substr(0, 2)
							var day
							var btns = $(".dayArea").find("button")
							$
									.each(
											btns,
											function() {
												var flag = $(this).css(
														"background-color") === 'rgb(255, 0, 0)'
												if (flag)
													day = $(this).text()
											})
							var date = year + '-' + month + '-' + day
							return date
						}

						function init() {
							var today = new Date()
							var year = today.getFullYear()
							var month = today.getMonth() + 1 < 10 ? "0"
									+ today.getMonth() + 1
									: today.getMonth() + 1
							var lastDay = (new Date(year, month, 0)).getDate();
							addDayarea(lastDay)
							$("#year").find("#" + year).attr("selected", true)
							$("#month").find("#" + month)
									.attr("selected", true)

							var btns = $(".dayArea").find("button")
							var tmp = today.getDate()
							var day = tmp < 10 ? '0' + tmp : '' + tmp
							$.each(btns, function() {
								var flag = $(this).text() === day.toString()
								if (flag)
									$(this).css("background", "red")
							})
							var date = year + '-' + month + '-' + day
							printDetail(date)
						}

						function dateChange() {
							var year = $("#year").val().substr(0, 4)
							var month = $("#month").val().substr(0, 2)
							var lastDay = (new Date(year, month, 0)).getDate();
							addDayarea(lastDay)
							var btns = $(".dayArea").find("button")
							$.each(btns, function() {
								var flag = $(this).text() === lastDay
										.toString()
								if (flag)
									$(this).css("background", "red")
							})
							var date = year + '-' + month + '-' + lastDay
							printDetail(date)
						}

						function addDayarea(lastDay) {
							for (var i = 1; i <= lastDay; i++) {
								$(".dayArea").append(createBtn(i))

								if (i % 15 == 0)
									$(".dayArea").append(createGap())
							}
						}

						function createBtn(i) {
							var btn = $("<button/>")
							if (i < 10)
								i = "0" + i
							btn.text(i)
							btn.css('width', 30).css('background', 'none')
							btn.click(function() {
								$("button").css("background", "none")
								$(this).css("background", "red")
								var year = $("#year").val().substr(0, 4)
								var month = $("#month").val().substr(0, 2)
								var day = $(this).text()
								var date = year + '-' + month + '-' + day
								printDetail(date)
							})
							return btn
						}

						function printDetail(date) {
							$.ajax({
										url : $(location).attr('href') + '/'+ date,
										//contentType : "application/x-www-form-urlencoded; charset=UTF-8",
										success : function(res) {
											$(".area").html(res)
											var isData = $(".area").html();
											if (isData === null
													|| isData === "")
												showEdit()
											else
												showWrite()
										}
									})
						}

						function createGap() {
							return "<br><br>"
						}
					})
</script>
<aside>
	<a href="#">미정</a>
</aside>

<div class="highlight">
	<div class="dateArea">
		<select id="year">
			<c:forEach var="year" begin="1900" end="2017">
				<option id="${year}">${year}년</option>
			</c:forEach>
		</select> <select id="month">
			<c:forEach var="month" begin="1" end="12">

				<c:choose>
					<c:when test="${month < 10}">
						<c:set var="transMonth" value="0${month}" />
						<option id="${transMonth }">${transMonth}월</option>
					</c:when>
					<c:otherwise>
						<option id="${month }">${month}월</option>
					</c:otherwise>
				</c:choose>

			</c:forEach>
		</select>
	</div>

	<div class="dayArea"></div>

	<form action="#" id="transfer" method="post">
		<input type="hidden" name="editFlag" value="true">
		<input type="hidden" id="reg" name="reg">
		<input type="hidden" id="detail" name="detail">
		<div class="area"></div>

		<div class="btnArea">
			<button class="write_btn">등록</button>
			<button class="edit_btn">수정</button>
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/view/mini_template/footer.jsp"%>