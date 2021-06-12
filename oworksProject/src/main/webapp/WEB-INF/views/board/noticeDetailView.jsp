<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/board/noticeDetailView.css">

</head>
<body>
	 <!-- 이쪽에 메뉴바 포함 할꺼임 -->

    <br><br>
    <div class="Article">
        <div class="article_wrap">
            <div class="ArticleTopBtns">
                <div class="left_area">
                	<!-- 본인일 경우에만 수정 삭제 가능 -->
                    <button type="button" class="btn btn-dark btn-sm">수정</button>
                    <button type="button" class="btn btn-dark btn-sm">삭제</button>
                </div>

                <div class="right_area">
                    <button type="button" class="btn btn-outline-primary btn-sm">이전</button>
                    <button type="button" class="btn btn-outline-primary btn-sm">목록</button>
                    <button type="button" class="btn btn-outline-primary btn-sm">다음</button>
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
                        <div class="box_left">
                            <div class="like_article">
                                <img src="${pageContext.servletContext.contextPath }/resources/images/board/emptyHeart.png" style="width: 20px;">
                                <em>좋아요</em>
                                <em>0</em>
                            </div>
                        </div>

                        <div class="box_right">
                            <div class="social_article">
                                <img src="${pageContext.servletContext.contextPath }/resources/images/board/common.png" style="width: 20px;">
                                <em>공유</em>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    
    <!-- 이쪽에 푸터바 포함할꺼임 -->

</body>
</html>