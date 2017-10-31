<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/view/mini_template/header.jsp" %>
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
                <aside>
                    <div class="profile">
                    <c:choose>
                        <c:when test="${owner.profile != null}">
							<img src="${pageContext.request.contextPath }/file/${owner.profile}"
								width="150" height="150">
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath }/img/프로필.jpg"
								width="150" height="150">
						</c:otherwise>
					</c:choose>
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
                            
                        </div>
                        
                        <div class="right">
                            <a href="#">다이어리 0/0</a> &nbsp;&nbsp; <a href="#">사진첩 0/0</a><br>
                            <a href="#">공유 다이어리</a>&nbsp;&nbsp; <a href="#">게시판 0/0</a><br>
                            <a href="${pageContext.request.contextPath }/minihome/${owner.id}/visitors">방명록 0/0</a>
                        </div>
                    </div>
                    
                    <div class="partTwo">
                        <img src="${pageContext.request.contextPath }/img/miniroom.gif" width="100%" height="100%">
                    </div>
                    
                    <div class="partThree">
                       <div style="float:left; width:10%;">일촌평</div>
                       <div style="display: inline-block; width:90%;">
                       		<font size="7"><input class="friend-input" type="text" id="comment" placeholder="입력" required></font>
                       		<button id="comment_btn">확인</button>
                       	</div> 
                    </div>
                    <div class="addComment">
                    	일촌평을 남겨주세요~
                    </div>
                </div>
                
<%@ include file = "/WEB-INF/view/mini_template/footer.jsp" %>





















