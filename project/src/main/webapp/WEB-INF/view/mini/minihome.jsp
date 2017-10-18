<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>DOM ����</title>
        <link rel="stylesheet" type="text/css" href="css/common.css">
        <link rel="stylesheet" type="text/css" href="css/swiper.css">
        <style>
            a{
                text-decoration: none;
                color:black;
            }
            
            .mini{
                display: flex;
                flex-wrap: wrap;
                width: 100%;
                height: 100%;
                margin: 0px auto;
                border: 1px solid black;
            }
            
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
            
            main{
                display: flex;
                flex-wrap: wrap;
                width: 100%;
                height: 450px;
                border: 1px dotted blue;
                margin : 5px;
            }
            
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
            
            .highlight{
                display: flex;
                flex-wrap: wrap;
                width: 60%;
                margin: 5px;
            }
            
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
            
            .partTwo {
                border: 1px dotted blue;
                width: 100%;
                height: 40%;
                margin: 5px;
                padding: 5px;
            }
            
            .partThree{
                border: 1px dotted blue;
                width: 100%;
                height: 15%;
                margin: 5px;
                padding: 5px;
            }
            
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
        <!-- jQuery�� ����ϱ� ���� CDN ���� -->
        <script src="https://code.jquery.com/jquery-latest.js"></script>
        <script src="regex04.js"></script>
        <script>
            
        </script>
    </head>
    <body>
        <div class="mini">
            <header>
                <a class="header_a" href="#">�� Ȩ��</a>
                <a class="header_a" href="#">�ٷ� ����</a>
                <a class="header_a" href="#">�α���</a>
            </header>
            
            <div class="visit">
                <span>Today 0 | </span>
                <span>Total 1</span>
            </div>
            
            <div class="tmp">
                <span>???���� �̴� Ȩ��</span>
            </div>
            
            <main>
                <aside>
                    <div class="profile">
                        <img src="img/aaa.jpg" width="150" height="150">
                    </div>
                    
                    <div class="hello">
                        <h3>
                            �λ縻
                            ������ �氡����
                            ���׻���!
                        </h3>
                    </div>
                    
                    <div class="edit">
                        <a href="#">����</a>
                    </div>
                    
                    <div class="info">
                        <h3>
                            ����(��)
                        </h3>
                    </div>
                </aside>
                
                <div class="highlight">
                    <div class="partOne">
                        <div class="left">
                            <font size="5">�ֱ� �Խù�</font>
                            <hr>
                            ���̾ ���õ� �� ������...
                            <br>
                            �Խ��� ���ؾ�...
                            <br>
                            ����ø �̾��ϴ�!!!!!
                        </div>
                        
                        <div class="empty"></div>
                        
                        <div class="right">
                            <br><br>
                            <a href="#">���̾ 0/0</a> &nbsp;&nbsp; <a href="#">����ø 0/0</a><br>
                            <a href="#">���� ���̾</a>&nbsp;&nbsp; <a href="#">�Խ��� 0/0</a><br>
                            <a href="#">���� 0/0</a>
                        </div>
                    </div>
                    
                    <div class="partTwo">
                        ����
                    </div>
                    
                    <div class="partThree">
                        ������
                    </div>
                </div>
                
                <nav class="menu">
                    <ul>
                        <li>
                            <a href="#">Ȩ</a>
                        </li>
                        <li>
                            <a href="#">���̾</a>
                        </li>
                        <li>
                            <a href="#">�Խ���</a>
                        </li>
                        <li>
                            <a href="#">����ø</a>
                        </li>
                        <li>
                            <a href="#">�Խ���</a>
                        </li>
                    </ul>
                </nav>
            </main>
        </div>
    </body>
</html>