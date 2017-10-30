<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>


<html>
    <head>
        <meta charset="UTF-8">
        <title>???님의 미니홈피</title>
        
        <style>
            a{
                text-decoration: none;
                color:black;
            }
            
            div{
            	/*border:1px solid black;
            	margin: 1px 0px;*/
            }
            
            /*전체 div class*/
            .mini{
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                width: 100%;
                height: 100%;
                border: 1px solid black;
            }
            
            /* Header div*/
            header{
                border: 1px dotted blue;
                text-align: right;
                width:100%;
                height: 3%;
                margin : 5px;
            }
            
            header > a{
                color: gray;
            }
            
            header > a :hover {
                background-color: yellow;
                color:red;
            }
            
            .info{
                display:flex;
                flex-wrap: wrap;
                border: 1px solid black;
                width: 100%;
                height: 5%;
                margin: 5px;
                padding: 5px;
            }
            
            .visit{
                border: 1px dotted blue;
                width: 15%;
                margin: 5px;
            }
            
            .title{
                flex-grow: 1;
                border: 1px dotted blue;
                margin: 5px;
            }
            
            /* 주요 Div */
            main{
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                width: 100%;
                height: 100%;
                border: 1px dotted blue;
                margin : 5px;
            }
            
            /* 사이드 Div */
            aside{
                display:flex;
                flex-wrap: wrap;
                border: 1px solid green;
                width: 15%;
                margin: 5px;
                padding: 5px;
            }
            
            /* Main Div */
            .highlight{
                display: flex;
                flex-direction: column;
                flex-wrap: nowrap;
                width: 75%;
                height: 100%;
                margin: 5px;
                padding: 5px;
            }
            
            .dateArea{
                height: 3%;
                margin: 5px;
                padding: 5px;
            }
            
            .dayArea{
                height: 15%;
                margin: 5px;
                padding: 5px;
            }
            
            .area{
                height: 83%;
                margin: 5px;
                padding: 5px;
            }
            
            /* .area textarea{
                width:100%;
                resize:none;
                padding: 1em;  /*prevents text jump on Enter keypress */
                padding-bottom: 0.2em;
                /*line-height: 1.6;*/
                height: 100%;
            } */
            
            .write{
                display: flex;
                height: 5%;
                margin: 5px;
                padding: 5px;
                flex-direction: row-reverse;
            }
            
            /* 우측 메뉴 Div */
            .menu{
                border: 1px dotted blue;
                flex-grow: 1;
                margin: 5px;
                padding: 5px;
            }
            
            .menu ul{
                list-style: none;
                margin: 2px -40px;
            }
        </style>
        <!-- jQuery를 사용하기 위한 CDN 설정 -->
        <script src="https://code.jquery.com/jquery-latest.js"></script>
        <script>
            $(document).ready(function(){
                init()
                $("select").change(function(){
                    $(".dayArea").empty()
                    change()
                })
                
                $(".write_btn").click(function(){
            		var year = $("#year").val().substr(2,2)
            		var month = $("#month").val().substr(0,2)
            		var day
                    var btns = $(".dayArea").find("button")
                    $.each(btns, function(){
                        var flag = $(this).css("background-color") === 'rgb(255, 0, 0)'
                        if(flag)
                            day = $(this).text()
                    })
                    var date = year + '-' + month + '-' + day
                    console.log("일 : " + date)
                    
                    location.href=$(location).attr('href') + '/diary_write/'+date
                })
                
                function init(){
                	var today = new Date()
                	var year = today.getFullYear()
                    var month = today.getMonth()+1 < 10?"0" + today.getMonth()+1:today.getMonth()+1
                	var day = today.getDate()
                    var lastDay = ( new Date(year, month, 0) ).getDate();
                    addDayarea(lastDay)
                    $("#year").find("#"+year).attr("selected", true)
                    $("#month").find("#"+month).attr("selected", true)
                    
                    var btns = $(".dayArea").find("button")
                    $.each(btns, function(){
                        var flag = $(this).text() === day.toString()
                        if(flag)
                            $(this).css("background", "red")
                    })
                    var date = year + '-' + month + '-' + day
                    printDetail(date)
                }
                
                function change(){
                	var year = $("#year").val().substr(0,4)
                    var month = $("#month").val().substr(0,2)
                    var lastDay = ( new Date(year, month, 0) ).getDate();
                	addDayarea(lastDay)
                }
                
                function addDayarea(lastDay) {
                	for(var i = 1; i <= lastDay; i++){
                        $(".dayArea").append(createBtn(i))
                        
                        if(i % 10 == 0)
                            $(".dayArea").append(createGap())
                    }
                }
                
                function createBtn(i){
                	var btn = $("<button/>")
                	if(i < 10)
                		i = "0" + i
               		btn.text(i)
                   	btn.css('width',30).css('background', 'none')
                	btn.click(function(){
                		$("button").css("background", "none")
                		$(this).css("background", "red")
                		var year = $("#year").val().substr(0,4)
                		var month = $("#month").val().substr(0,2)
                		var day = $(this).text()
                		var date = year + '-' + month + '-' + day
                		//ajax로 가져온 데이터 추가
                		printDetail(date)
                	})
                	return btn
                }
                
                function printDetail(date){
                	$.ajax({
            			url: $(location).attr('href') + '/' + date,
            			success : function(res){
            				$(".area").html(res)
            			}
            		})
                }
                
                function createGap(){
                	return "<br><br>"
                }
            })
        </script>
    </head>
    <body>
        <div class="mini">
            <header>
                <a class="header_a" href="#">내 홈피</a>
                <a class="header_a" href="#">바로 가기</a>
                <a class="header_a" href="#">로그인</a>
            </header>
            
            <div class="info">
                <div class="visit">
                    <span>Today 0 | </span>
                    <span>Total 1</span>
                </div>

                <div class="title">
                    <span>???님의 미니 홈피</span>
                </div>
            </div>
            
            <main>
                <aside>
                    <a href="#">미정</a>
                </aside>
                
                <div class="highlight">
                    <div class="dateArea">
                        <select id="year">
					        <c:forEach var="year" begin="1900" end="2017">
					            <option id="${year}">${year}년</option>
					        </c:forEach>
					    </select>
				                            
					    <select id="month">
					        <c:forEach var="month" begin="1" end="12">
					            
					            <c:choose>
					            	<c:when test="${month < 10}">
					            		<c:set var="transMonth" value="0${month}"/>
					            		<option id="${transMonth }">${transMonth}월</option>
					            	</c:when>
					            	<c:otherwise>
					            		<option id="${month }">${month}월</option>
					            	</c:otherwise>
					            </c:choose>
					            
					        </c:forEach>
					    </select>
                    </div>
                    
                    <div class="dayArea">
                        
                    </div>
                    
                    <div class="area">
                        ${text}
                    </div>
                    
                    <div class="write">
                        <button class="write_btn">등록</button>
                    </div>
                </div>
                
                <nav class="menu">
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath }/minihome/${id}">홈</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/minihome/${id}/diary">다이어리</a>
                        </li>
                        <li>
                            <a href="#">게시판</a>
                        </li>
                        <li>
                            <a href="#">사진첩</a>
                        </li>
                        <li>
                            <a href="#">게시판</a>
                        </li>
                    </ul>
                </nav>
            </main>
        </div>
    </body>
</html>
