<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>???님의 미니홈피</title>
        <link rel="stylesheet" type="text/css" href="css/common.css">
        <link rel="stylesheet" type="text/css" href="css/swiper.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        
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
            
            .month{
                height: 3%;
                margin: 5px;
                padding: 5px;
            }
            
            .date{
                height: 3%;
                margin: 5px;
                padding: 5px;
            }
            
            .area{
                height: 83%;
                margin: 5px;
                padding: 5px;
            }
            
            .area textarea{
                width:100%;
                resize:none;
                padding: 1em;  /*prevents text jump on Enter keypress */
                padding-bottom: 0.2em;
                /*line-height: 1.6;*/
                height: 100%;
            }
            
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
        <script src="regex04.js"></script>
        <script>
            $(document).ready(function(){
                $(".write_btn").click(function(){
                    location.href='diary_write'
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
                    <a href="#">미정</a>
                </aside>
                
                <div class="highlight">
                    <div class="month">
                        <label>
                            2017년 10월 
                            <i class="fa fa-calendar-o" aria-hidden="true"></i>
                        </label>
                    </div>
                    
                    <div class="date">
                        1 2 3 7 10 22 30
                    </div>
                    
                    <div class="area">
                        <textarea readonly></textarea>
                    </div>
                    
                    <div class="write">
                        <button class="write_btn">등록</button>
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
































