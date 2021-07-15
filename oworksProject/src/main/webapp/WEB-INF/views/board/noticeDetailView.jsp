<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/board/noticeDetailView.css">

<!-- 링크API -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

</head>
<body>
    
    <div class="Article">
		<jsp:include page="../common/mainHeader.jsp"/>
   		
   		<div id="content">
   		<jsp:include page="../common/mainMenubar.jsp"/>
        
	        <div class="article_wrap" style="position: absolute; left: 400px; top: 150px;">
	            <div class="ArticleTopBtns">
	                <div class="left_area">
	                	<!-- 본인일 경우에만 수정 삭제 가능 -->
	                	<c:if test="${loginEmp.empName == n.empName }">
	                    	<a onclick="postFormSubmit(1);" class="btn btn-dark btn-sm" style="color: white;">수정</a>
	                    	<a onclick="postFormSubmit(2);" class="btn btn-dark btn-sm" style="color: white;">삭제</a>
	                    </c:if>
	                </div>
					
					<form id="postForm" action = "" method="post">
						<input type = "hidden" name = "nno" value = "${n.noticeNo }">
					</form>
					
					<script>
						function postFormSubmit(num){
							if(num == 1){
								$("#postForm").attr("action", "updateForm.no").submit();
							}else{
								var message = confirm('삭제하시겠습니까?');
								if(message){
									$("#postForm").attr("action", "delete.no").submit();
								}
							}
						}
					</script>				
					
	                <div class="right_area">
	                    <a type="button" class="btn btn-outline-primary btn-sm" href="detail.no?nno=${n.noticeNo-1}">이전</a>
	                    <a type="button" class="btn btn-outline-primary btn-sm" href="list.no">목록</a>
	                    <a type="button" class="btn btn-outline-primary btn-sm" href="detail.no?nno=${n.noticeNo+1}">다음</a>
	                </div>
	                
	            </div>
	            <br><br>
	            <div class = "noticeTable">
	                <div class ="theader">
	                    <div class="noticeTitle">
	                        <h3>${n.noticeTitle }</h3>
	                    </div>
	
	                    <div class="writeInfo">
	                        <img src="${pageContext.servletContext.contextPath }/resources/images/board/user.png" class = "thumb">
	                        <div class = "profile_area">
	                            <div class = "profile_info">
	                                <div class="nick">
	                                    <a id="noticeWriter" href="#" class="nickname">${n.empName }</a>
	                                </div>
	                            </div>
	
	                            <div class = "article_info">
	                                <span>${n.enrollDate }</span>
	                                <span>조회 ${n.noticeCount }</span>
	
	                            </div>
	                        </div>
	                    </div>
	                    
	                </div>
	
	                <br>
	
	                <div class="tbody">
	                    <div class="article_viewer">
	                        <div class="contentRenderer">
	                            <div>
	                                <p>${n.noticeContent }</p>
	                            </div>
	                        </div>
	                    </div>
						
						
	                    <div class="replyBox">
							<!-- 게시글 좋아요 버튼 -->
	                        <div class="box_left">
	                            <div class="like_article">
	                            	<c:choose>
		                            	<c:when test = "${empty loginEmp }">
		                                	<img id = "heart" onclick = "alert('로그인 후 이용가능한 서비스 입니다')" src="${pageContext.servletContext.contextPath }/resources/images/board/emptyHeart.png" style="width: 20px;">
		                                </c:when>
		                                <c:when test = "${count == 0}">
		                                	<img id = "heart" onclick = "likeBoard();" src="${pageContext.servletContext.contextPath }/resources/images/board/emptyHeart.png" style="width: 20px;">
		                                </c:when>
		                                <c:otherwise>
		                                	<img id = "heart" onclick = "likeDelete();" src="${pageContext.servletContext.contextPath }/resources/images/board/fullHeart.png" style="width: 20px;">
		                                </c:otherwise>
	                                </c:choose>
	                                
	                                <span>좋아요</span> <em id="rcount">0</em>
	                            </div>
	                        </div>
							
							<!-- 게시글 공유 버튼 -->
	                        <div class="box_right">
	                            <div class="social_article">
	                                <a id="kakao-link-btn" href="javascript:sendLink()"><img src="${pageContext.servletContext.contextPath }/resources/images/board/common.png" style="width: 20px;"></a>
	                                <span>공유</span>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <!-- 좋아요 버튼 사용하는 script -->
	                    <script>
	                    function likeBoard(){
	                    	$.ajax({
	                    		url : "likeInsert.no",
	                    		type : "post",
	                    		async : false,
	                    		data : {
	                    			noticeNo : ${n.noticeNo},
	                    			empNo : ${loginEmp.empNo}
	                    		},
	                    		success : function(status){
	                    			if(status == "success"){ // 좋아요 성공
	                    				$("#heart").attr("src", '${pageContext.servletContext.contextPath }/resources/images/board/fullHeart.png');
	                    				$("#heart").attr("onclick", "likeDelete();");
	                    			}
	                    		}, error:function(){
	                    			console.log("좋아요 기능 통신 실패!");
	                    		}
	                    	})
	                    }
	                    
	                    function likeDelete(){
	                    	$.ajax({
	                    		url : "likeDelete.no",
	                    		type : "post",
	                    		async : false,
	                    		data : {
	                    			noticeNo : ${n.noticeNo},
	                    			empNo : ${loginEmp.empNo}
	                    		},
	                    		success : function(status){ // 좋아요 취소
	                    			$("#heart").attr("src", '${pageContext.servletContext.contextPath }/resources/images/board/emptyHeart.png');
	                    			$("#heart").attr("onclick", "likeBoard();")
	                    		}, error : function(){
	                    			console.log("좋아요 취소 통신 실패!");
	                    		}
	                    	})
	                    }
	                    
	                    $(document).ready(function(){
	                    	$.ajax({
	                    		url : "allLike.no",
	                    		type : "post",
	                    		async : false,
	                    		data : {
	                    			noticeNo : ${n.noticeNo},
	                    		},
	                    		success : function(list){
	                    			$("#rcount").text(list.length);
	                    		}, error:function(){
	                    			console.log("좋아요 기능 통신 실패!");
	                    		}
	                    	})
	                    })
	                    </script>
	                    
	                    <!-- 카카오 링크 API -->
	                    <script type='text/javascript'>
						//<![CDATA[
						//  사용할 앱의 JavaScript 키를 설정해 주세요.
							Kakao.init('b3f42236a7cb5c476eb8c97d6f2625a7');
					    // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
						    Kakao.Link.createDefaultButton({
		  			        container: '#kakao-link-btn',
							objectType: 'feed',
							content: {
						        title: '${n.noticeTitle}',
						        imageUrl:'${pageContext.servletContext.contextPath }/resources/images/common/logo.png',
						        link: {
						          mobileWebUrl: window.location.href,
						          webUrl: window.location.href
						        }
						    },
						    buttons: [
						      {
						        title: '웹으로 보기',
						        link: {
						        webUrl: window.location.href
						        }
						      }
						    ]
							});
						//]]>
						</script>
	                </div>
	            </div>
	        </div>
        </div>
    </div>

</body>
</html>