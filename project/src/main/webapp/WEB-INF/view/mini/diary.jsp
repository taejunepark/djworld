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
                flex-wrap: wrap;
                width: 850px;
                height: 600px;
                margin: 0px auto;
                border: 1px solid black;
            }
            
            /* Header div*/
            header{
                border: 1px dotted blue;
                text-align: right;
                width:100%;
                height: 20px;
                margin : 5px;
            }
            
            .header_a{
                color: gray;
            }
            
            .header_a :hover {
                background-color: yellow;
                color:red;
            }
            
            .visit{
                border: 1px solid black;
                width: 20%;
                height: 20px;
                margin: 5px;
                padding: 5px;
            }
            
            .tmp{
                flex-grow: 1;
                height: 20px;
                border: 1px solid black;
                margin: 5px;
                padding: 5px;
            }
            
            /* 주요 Div */
            main{
                display: flex;
                flex-wrap: wrap;
                width: 100%;
                height: 450px;
                border: 1px dotted blue;
                margin : 5px;
            }
            
            /* 사이드 Div */
            aside{
                display:flex;
                flex-wrap: wrap;
                border: 1px solid green;
                width: 20%;
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
            
            .info{
                width: 100%;
                border: 1px dotted black;
                margin: 3px 0px;
                padding: 5px;
            }
            
            /* Main Div */
            .highlight{
                display: flex;
                flex-wrap: wrap;
                width: 60%;
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
            
            <div class="visit">
                <span>Today 0 | </span>
                <span>Total 1</span>
            </div>
            
            <div class="tmp">
                <span>???님의 미니 홈피</span>
            </div>
            
            <main>
                
                
                <nav class="menu">
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath }/minihome/">홈</a>
                        </li>
                        <li>
                            <a href="diary">다이어리</a>
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










