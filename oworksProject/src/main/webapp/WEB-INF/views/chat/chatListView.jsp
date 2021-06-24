<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>사내 채팅</title>
    
        <!-- css & 폰트 -->
        <link rel="stylesheet" href="chatListView.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
    
        <!-- 부트스트랩 : 아이콘 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
    
        <!-- 부트스트랩 : 모달 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    </head>
<body>
    <!-- 헤더바 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 메뉴바 -->
    <%-- <jsp:include page=""/> --%>

    <div class="wrap">
        <div class="content">
            <div class="leftBox">
                <div class="leftBox_1">
                    <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal2"> 채팅방 만들기</button>
                </div>
                <div class="leftBox_2">
                    <div><input type="text" class="form-control form-control-sm" placeholder="채팅방 제목을 입력하세요" style="width: 245px;"  name="keyword" value=""></div>
                    <a class="btn btn-outline-primary btn-sm" href="">검색</a>
                </div>
                <div class="leftBox_3" >
                    <div class="chatList"> <!-- 클릭 이벤트 걸기 -->
                        <div class="chatList_1">
                            <img src="../../../resources/images/chat/profile.png" alt="">
                        </div>
                        <div class="chatList_2">매일 야식 먹고 싶은 사람들</div>
                        <div class="chatList_count"><span>3</span></div>
                        <div class="chatList_3">
                            <button type="button" data-toggle="modal" data-target="#myModal">❌</button>
                        </div>
                    </div>
                    <div class="chatList"> <!-- 클릭 이벤트 걸기 -->
                        <div class="chatList_1">
                            <img src="../../../resources/images/chat/profile.png" alt="">
                        </div>
                        <div class="chatList_2">매일 야식 먹고 싶은 사람들</div>
                        <div class="chatList_count"><span>3</span></div>
                        <div class="chatList_3">
                            <button type="button" data-toggle="modal" data-target="#myModal">❌</button>
                        </div>
                    </div>
                    <div class="chatList"> <!-- 클릭 이벤트 걸기 -->
                        <div class="chatList_1">
                            <img src="../../../resources/images/chat/profile.png" alt="">
                        </div>
                        <div class="chatList_2">매일 야식 먹고 싶은 사람들</div>
                        <div class="chatList_count"><span>3</span></div>
                        <div class="chatList_3">
                            <button type="button" data-toggle="modal" data-target="#myModal">❌</button>
                        </div>
                    </div>
                </div>
            </div>


            <div class="rightBox">

                <div class="rightBox_1">
                    <p>매일 야식 먹고 싶은 사람들</p>
                    <hr>
                </div>
                <div class="rightBox_2">
                    <div class="messageBoxL">
                        <span class="message_bubble">오늘 야식 추천 좀</span>
                        <span class="message_time">21:29</span>
                        <span class="message_read">읽음</span>
                    </div>
                    <div class="messageBoxR" align="right">
                        <span class="message_read">읽음</span>
                        <span class="message_time">21:29</span>
                        <span class="message_bubble">음....</span>
                        
                    </div>
                    <div class="messageBoxR" align="right">
                        <span class="message_read">읽음</span>
                        <span class="message_time">21:29</span>
                        <span class="message_bubble">그럼 나 대신 지코바 먹어 주라</span>
                    </div>
                    <div class="messageBoxL">
                        <span class="message_bubble">지코바? 존맛이지</span>
                        <span class="message_time">21:29</span>
                        <span class="message_read">읽음</span>
                    </div>
                    <div class="messageBoxR" align="right">
                        <span class="message_read">읽음</span>
                        <span class="message_time">21:29</span>
                        <span class="message_bubble">근데 뿌링클 순살도 좋음</span>
                    </div>
                </div>
                <div class="rightBox_3">
                    <div class="typing">
                        <textarea name="message_content" id="message_content" placeholder="채팅을 입력해 보세요!"></textarea> 
                    </div>
                    <div class="typingB">
                        <button type="submit" class="btn btn-outline-primary">전송하기</button>
                    </div>
                </div>

            </div>

        </div>


    </div>

    <!-- 삭제 모달 -->              
        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
            <div class="modal-content">
                    
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">채팅방 나가기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                        
                <!-- Modal body -->
                <div class="modal-body">
                    정말 채팅방을 나가시겠습니까?
                </div>
                        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <a class="btn btn-danger btn-sm" href="">나가기</a>
                    <button type="reset" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                </div>
                      
            </div>
            </div>
        </div>


        <!-- 채팅방 만들기 모달 -->              
        <!-- The Modal -->
        <div class="modal" id="myModal2">
            <div class="modal-dialog">
            <div class="modal-content">
                    
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">채팅방 만들기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                        
                <!-- Modal body -->
                <div class="modal-body">
                    <table class="table" width="100%;" style="text-align:center">
                        <tr>
                            <th width="15%">선택</th>
                            <th width="29%">이름</th>
                            <th width="28%">부서</th>
                            <th width="28%">직급</th>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>

                    </table>

                    <!-- 페이징 -->
                    <div id="pagingArea">
                        <ul class="pagination">
                        <li class="page-item disabled"><a class="page-link" href="#"><<</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item disabled"><a class="page-link" href="#">>></a></li>
                    </ul>
                </div>
                </div>
                        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" data-dismiss="modal">초대하기</button>
                    <button type="reset" class="btn btn-secondary" data-dismiss="modal">취소</button>
                </div>
                      
            </div>
            </div>
        </div>

</body>
</html>