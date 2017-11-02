<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/mini_template/header.jsp"%>
<style>
body {
	overflow: hidden;
	margin: 10px;
}
#menu_diary{
	color: blue;
}
</style>
<script>
	$(document).ready(function() {
		// 다이어리 최초 누를 경우 실행될 함수
		init()
		
		// select 태그의 변화가 있을 때 실행
		$("select").change(function() {
			$(".dayArea").empty()
			dateChange()
		})
	
		// 등록 버튼 눌렸을 경우 실행
		$("#write_btn").click(function() {
			var date = select_date()
			$("input[name=reg]").val(date)
			$("#transfer").attr("action", "diary_write")
		})
		
		// 수정 버튼 눌렸을 경우 실행
		$("#edit_btn").click(function() {
			var date = select_date()
			$("input[name=reg]").val(date)
			$("input[name=detail]").val($(".area").html())
			$("#transfer").attr("action", "diary_edit")
		})
		
		// 삭제 버튼 눌렸을 경우 실행
		$("#delete_btn").click(function() {
			if(confirm("정말로 삭제하시겠습니까?")) {
				var date = select_date()
				$("input[name=reg]").val(date)
				$("#transfer").attr("action", "diary_delete")
			}else
				return
		})
		
		// day를 눌렀을 경우 실행할 함수
		function btnChange() {
			var check = $(".area").html()
			if (check === null || check === "") {
				hideWrite()
			} else {
				hideED()
			}
		}
		
		// 해당 요일에 정보가 있을 경우 '수정 / 삭제' 버튼만 보이도록 설정하는 함수
		function hideWrite() {
			$("#write_btn").css("display", "none");
			$("#edit_btn").css("display", "block");
			$("#delete_btn").css("display", "block");
		}

		// 해당 요일에 정보가 없을 경우 '등록' 버튼만 보이도록 설정하는 함수
		function hideED() {
			$("#write_btn").css("display", "block");
			$("#edit_btn").css("display", "none");
			$("#delete_btn").css("display", "none");
		}
		
		// 선택된 date를 반환해주는 함수 (YY-MM-dd 패턴으로 반환)
		function select_date() {
			var year = $("#year").val().substr(2, 2)
			var month = $("#month").val().substr(0, 2)
			var day
			var btns = $(".dayArea").find("button")
			$.each(btns, function() {
				var flag = $(this).css("background-color") === 'rgb(255, 0, 0)'
				if (flag)
					day = $(this).text()
			})
			var date = year + '-' + month + '-' + day
			return date
		}
		
		// 다이어리를 눌렀을 때 초기화할 함수
		function init() {
			var today = new Date()
			var year = today.getFullYear()
			var month = today.getMonth() + 1 < 10 ? "0"
					+ today.getMonth() + 1
					: today.getMonth() + 1
			// 해당 년, 월의 마지막 날짜 (28, 29, 30, 31)을 구하는 명령
			var lastDay = (new Date(year, month, 0)).getDate();
			addDayarea(lastDay) // 1~lastDay의 개수만큼 버튼 생성하여 <div>에 삽입
			// $(select id='year').find('#'+현재 년(2017)).selected되게 변경
			$("#year").find("#" + year).attr("selected", true)
			// $(select id='month').find('#'+현재 월(11)).selected되게 변경
			$("#month").find("#" + month).attr("selected", true)
			
			// dayArea에 있는 모든 버튼 저장
			var btns = $(".dayArea").find("button")
			// 현재 일 저장
			var tmp = today.getDate()
			// 10일 이하면 0붙여서 저장 1 => 01
			var day = tmp < 10 ? '0' + tmp : '' + tmp
			// forEach문
			$.each(btns, function() {
				// flag = 버튼의 Text가 금일과 완전 일치하는지 판단하여 저장
				var flag = $(this).text() === day.toString()
				if (flag) // 버튼과 Text가 완전 일치하다면
					// background-color를 red로 변경
					$(this).css("background", "red")
			})
			// date = 2017 - 11 - 02로 변경
			var date = year + '-' + month + '-' + day
			// 해당 date의 detail을 Ajax를 이용해 <div class="area">에 찍음
			printDetail(date) 
		}
		
		// select 변경될 경우 제일 마지막 날짜 버튼 빨간색으로 활성화하고 detail 출력 함수
		function dateChange() {
			var year = $("#year").val().substr(0, 4)
			var month = $("#month").val().substr(0, 2)
			var lastDay = (new Date(year, month, 0)).getDate();
			addDayarea(lastDay)
			var btns = $(".dayArea").find("button")
			$.each(btns, function() {
				var flag = $(this).text() === lastDay.toString()
				if (flag)
					$(this).css("background", "red")
			})
			var date = year + '-' + month + '-' + lastDay
			printDetail(date)
		}
		
		// 해당 월의 마지막 날짜를 받아서 개수만큼 버튼 만들어찍음
		// 15개마다 <br><br>
		function addDayarea(lastDay) {
			for (var i = 1; i <= lastDay; i++) {
				$(".dayArea").append(createBtn(i))

				if (i % 15 == 0)
					$(".dayArea").append(createGap())
			}
		}
		
		// 버튼 태그 생성 함수
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
		
		// Ajax를 이용하여 Detail 가져와서 <div class="area">에 찍는 함수
		function printDetail(date) {
			$.ajax({
				url : $(location).attr('href') + '/'+ date,
				//contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(res) {
					$(".area").html(res)
					var isData = $(".area").html();
					if (isData === null
							|| isData === "")
						hideED()
					else
						hideWrite()
				}
			})
		}
		
		// 2줄 내리는 함수
		function createGap() {
			return "<br><br>"
		}
	})
</script>


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
			<button id="write_btn">등록</button>
			<button id="delete_btn">삭제</button>
			<button id="edit_btn">수정</button>
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/view/mini_template/footer.jsp"%>