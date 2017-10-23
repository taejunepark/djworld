<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>DOM 수정</title>
        <link rel="stylesheet" type="text/css" href="css/common.css">
        <link rel="stylesheet" type="text/css" href="css/swiper.css">
        <!-- <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
        <style>
            a{
                text-decoration: none;
                color:black;
            }
            
            div{
            	border:1px solid black;
            	margin: 1px 0px;
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
            
            .profile{
                width: 100%;
                border: 1px dotted black;
                margin: 3px 0px;
                padding: 5px;
            }
            
            .hello{
                width: 100%;
                border: 1px dotted black;
                margin: 3px 0px;
                padding: 5px;
            }
            
            .edit{
                display: flex;
                flex-direction: row-reverse;
                width: 100%;
                border: 1px dotted black;
                margin: 3px 0px;
                padding: 5px;
            }
            
            .name{
                width: 100%;
                border: 1px dotted black;
                margin: 3px 0px;
                padding: 5px;
            }
            
            /* Main Div */
            .highlight{
                display: flex;
                flex-wrap: wrap;
                width: 75%;
                margin: 5px;
            }
            
            /* 새 게시물 관련 Div*/
            .partOne{
                display: flex;
                border: 1px dotted blue;
                width: 100%;
                height: 30%;
                margin: 5px;
                padding: 5px;
            }
            
            .partOne .left{
                border: 1px solid black;
                width: 40%;
            }
            
            .partOne .empty{
                border: 1px solid black;
                width: 10%;
            }
            
            .partOne .right{
                border: 1px solid black;
                width: 50%;
            }
            
            /* 임시 */
            .partTwo {
                border: 1px dotted blue;
                width: 100%;
                height: 40%;
                margin: 5px;
                padding: 5px;
            }
            
            /* 일촌평 관련 Div*/
            .partThree{
                border: 1px dotted blue;
                width: 100%;
                height: 15%;
                margin: 5px;
                padding: 5px;
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
        <script src="regex04.js"></script>
        <script>
            $(document).ready(function(){
                $("#comment_btn").click(function(){
                    $.ajax({
                        url:"comment",
                        type:"get",
                        data:{
                        	comment:$("#comment").val(),
                        },
                        success:function(res){
                            $("#addComment").prepend(res)
                        }
                    })
                    $("#comment").val("")
                })
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
                    <div class="profile">
                        <img src="${pageContext.request.contextPath }/img/aaa.jpg" width="150" height="150">
                    </div>
                    
                    <div class="hello">
                        <h3>
                            인사말<br>
                            만나서 방가워용
                            뿌잉뿌잉!
                        </h3>
                    </div>
                    
                    <div class="edit">
                        <a href="#">수정</a>
                    </div>
                    
                    <div class="name">
                        <h3>
                            기모띠(남)
                        </h3>
                    </div>
                </aside>
                
                <div class="highlight">
                    <div class="partOne">
                        <div class="left">
                            <font size="5">최근 게시물</font>
                            <hr>
                            다이어리 오늘도 난 아프다...
                            <br>
                            게시판 태준아...
                            <br>
                            사진첩 미안하다!!!!!
                        </div>
                        
                        <div class="empty"></div>
                        
                        <div class="right">
                            <br><br>
                            <a href="#">다이어리 0/0</a> &nbsp;&nbsp; <a href="#">사진첩 0/0</a><br>
                            <a href="#">공유 다이어리</a>&nbsp;&nbsp; <a href="#">게시판 0/0</a><br>
                            <a href="#">방명록 0/0</a>
                        </div>
                    </div>
                    
                    <div class="partTwo">
                        미정
                    </div>
                    
                    <div class="partThree">
                        <input type="text" id="comment" placeholder="입력" required>
                        <button id="comment_btn">완료</button>
                        <hr id="addComment">
                    </div>
                </div>
                
                <nav class="menu">
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath }/minihome/">홈</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/minihome/diary/">다이어리</a>
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





















