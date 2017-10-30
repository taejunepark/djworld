<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css?ver=3">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/each.css">
<html>

<head>
    <title></title>
    
    <style>
        /* 라디오 버튼 */
        
        .lt-radio {
            visibility: hidden;
        }
        
        .lt-radio-wrapper {
            position: relative;
            left: 2px;
            display: inline-block;
            float: left;
            padding-bottom: 20px;
        }
        
        .lt-radio-wrapper .lt-radio-label {
            padding-left: 5px;
        }
        
        .lt-radio-wrapper .lt-radio-label {
            border: 1px solid #aaa;
            cursor: pointer;
            position: absolute;
            width: 20px;
            padding-left: 0px;
            height: 20px;
            top: 0;
            left: 0px;
            border-radius: 4px;
            background: #fafafa;
        }
        
        .lt-radio-wrapper .lt-radio-label:after {
            border: 1px solid #aaa;
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
            filter: alpha(opacity=0);
            opacity: 0;
            content: '';
            position: absolute;
            width: 6px;
            height: 6px;
            background: transparent;
            top: 4px;
            left: 4px;
            border: 3px solid #333;
            border-radius: 6px;
        }
        
        .lt-radio-wrapper .lt-radio-label:hover::after {
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=30)";
            filter: alpha(opacity=30);
            opacity: 0.5;
        }
        
        .lt-radio:checked+.lt-radio-label:after {
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
            filter: alpha(opacity=100);
            opacity: 1;
        }

    </style>
    <script>
	    function cancel() {
			window.open('', '_self').close();
		}
    </script>
</head>

<body>
	<div class="empty-row"></div>
    <div style="margin: auto; text-align: center;">
        <div style="margin: auto; text-align: left; width: 70%; height: 100px; border-bottom: 2px solid gray">
            <font style="font-size: 2.5em;">밤 충전</font><br>
            <font style="font-size: 1.5em">현재 밤 :
                <font color="blue">${bam }</font>개</font>
        </div>
        <div style="margin: auto; padding-top: 30px; height: 30px; text-align: left; width: 70%;">
            밤 충전(밤은 10개 단위로 충전 가능합니다.)
        </div>
        <form action="pay" method="post">
            <div style="margin: auto;text-align: left; width: 70%;">
                <table width=100%; style="padding-left: 40px; padding-top: 10px; background: lightgray;">
                    <tr>
                        <td>
                            <span class="lt-radio-wrapper"> 
                                <input class="lt-radio" type="radio" name="bam" id="form-bam-10" value="10" />
                                <label for="form-bam-10" class="lt-radio-label"></label>
                                <label for="form-bam-10">10개(1,000원)</label>
                            </span>
                        </td>
                        <td>
                            <span class="lt-radio-wrapper"> 
                                <input class="lt-radio" type="radio" name="bam" id="form-bam-30" value="30" />
                                <label for="form-bam-30" class="lt-radio-label"></label>
                                <label for="form-bam-30">30개(3,000원)</label>
                            </span>
                        </td>
                        <td>
                            <span class="lt-radio-wrapper"> 
                                <input class="lt-radio" type="radio" name="bam" id="form-bam-50" value="50" />
                                <label for="form-bam-50" class="lt-radio-label"></label>
                                <label for="form-bam-50">50개(5,000원)</label>
                            </span>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <span class="lt-radio-wrapper"> 
                                <input class="lt-radio" type="radio" name="bam" id="form-bam-100" value="100" />
                                <label for="form-bam-100" class="lt-radio-label"></label>
                                <label for="form-bam-100">100개(10,000원)</label>
                            </span>
                        </td>
                        <td>
                            <span class="lt-radio-wrapper"> 
                                <input class="lt-radio" type="radio" name="bam" id="form-bam-300" value="300" />
                                <label for="form-bam-300" class="lt-radio-label"></label>
                                <label for="form-bam-300">300개(3,0000원)</label>
                            </span>
                        </td>
                        <td>
                            <span class="lt-radio-wrapper"> 
                                <input class="lt-radio" type="radio" name="bam" id="form-bam-500" value="500" />
                                <label for="form-bam-500" class="lt-radio-label"></label>
                                <label for="form-bam-500">500개(5,0000원)</label>
                            </span>
                        </td>
                    </tr>
                </table>
                <div style="height: 30px;"></div>
                <div style="text-align: center;">
                    <button class="form-btn" type="submit">결제</button>
                    <button class="form-btn" onclick="cancel()" >취소</button>
                </div>
            </div>
        </form>
    </div>
</body>
