<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>외부 주소록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="address.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>
    <!-- 헤더바 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 메뉴바 -->
    <%-- <jsp:include page=""/> --%>

    <body>
        <div class="main">
        <!-- 외부 주소록 비었을 때 
        <h3 class="title">사내 주소록</h3>
        <br>
        <br>
        <form class="searchForm" action="어쩌고.ad">
            <div class="search">
                <select class="custom-select custom-select-sm">
                    <option value="name">저장명</option>
                    <option value="company">회사</option>
                    <option value="dept">부서</option>
                </select>
            </div>
            <div>
                <input type="text" class="form-control form-control-sm" name="keyword" value="">
            </div>
            <a class="btn btn-outline-primary btn-sm" href="">검색</a>
        </form>

        <table frame="hsides" rules="rows" class="table">
            <tr>
                <th width="7%">번호</th>
                <th width="10%">즐겨찾기</th>
                <th width="12%">저장명</th>
                <th width="20%">이메일</th>
                <th width="17%">휴대전화</th>
                <th width="14%">회사/소속</th>
                <th width="10%">부서</th>
                <th width="10%">직급</th>
            </tr>
            <tr>
                <td colspan="8">주소록이 비었습니다. 주소록을 추가해 주세요!</td>
            </tr>
        </table>
    -->        


    <!-- 외부 주소록에 값 있을 때 -->
            <h3 class="title">외부 주소록</h3>
            <br>
            <br>
            <form class="searchForm" action="어쩌고.ad">
                <div class="search">
                    <select class="custom-select custom-select-sm">
                        <option value="name">이름</option>
                        <option value="dept">부서</option>
                        <option value="job">직급</option>
                    </select>
                </div>
                <div>
                    <input type="text" class="form-control form-control-sm" name="keyword" value="">
                </div>
                <a class="btn btn-outline-primary btn-sm" href="">검색</a>
            </form>
    
            <table frame="hsides" rules="rows" class="table">
                <tr>
                    <th width="7%">번호</th>
                    <th width="10%">즐겨찾기</th>
                    <th width="10%">저장명</th>
                    <th width="19%">이메일</th>
                    <th width="15%">휴대전화</th>
                    <th width="13%">회사/소속</th>
                    <th width="10%">부서</th>
                    <th width="8%">직급</th>
                    <th width="8%"></th>
                </tr>

                <tr>
                    <td>1</td>
                    <td><span id="fav_status">💛</span></td>
                    <td>김은형</td>
                    <td>kimu@naver.com</td>
                    <td>010-7372-4722</td>
                    <td>kh 아카데미</td>
                    <td>디자인팀</td>
                    <td>대리</td>
                    <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">수정</a></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td><span id="fav_status">💛</span></td>
                    <td>김은형</td>
                    <td>kimu@naver.com</td>
                    <td>010-7372-4722</td>
                    <td>kh 아카데미</td>
                    <td>디자인팀</td>
                    <td>대리</td>
                    <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">수정</a></td>
                </tr>
                <tr>
                    <td>3</td>
                    <td><span id="fav_status">💛</span></td>
                    <td>김은형</td>
                    <td>kimu@naver.com</td>
                    <td>010-7372-4722</td>
                    <td>kh 아카데미</td>
                    <td>디자인팀</td>
                    <td>대리</td>
                    <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">수정</a></td>
                </tr>
                <tr>
                    <td>4</td>
                    <td><span id="fav_status">🤍</span></td>
                    <td>김은형</td>
                    <td>kimu@naver.com</td>
                    <td>010-7372-4722</td>
                    <td>kh 아카데미</td>
                    <td>디자인팀</td>
                    <td>대리</td>
                    <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">수정</a></td>
                </tr>
                <tr>
                    <td>5</td>
                    <td><span id="fav_status">🤍</span></td>
                    <td>김은형</td>
                    <td>kimu@naver.com</td>
                    <td>010-7372-4722</td>
                    <td>kh 아카데미</td>
                    <td>디자인팀</td>
                    <td>대리</td>
                    <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">수정</a></td>
                </tr>
                <tr>
                    <td>6</td>
                    <td><span id="fav_status">🤍</span></td>
                    <td>김은형</td>
                    <td>kimu@naver.com</td>
                    <td>010-7372-4722</td>
                    <td>kh 아카데미</td>
                    <td>디자인팀</td>
                    <td>대리</td>
                    <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">수정</a></td>
                </tr>
                <tr>
                    <td>7</td>
                    <td><span id="fav_status">🤍</span></td>
                    <td>김은형</td>
                    <td>kimu@naver.com</td>
                    <td>010-7372-4722</td>
                    <td>kh 아카데미</td>
                    <td>디자인팀</td>
                    <td>대리</td>
                    <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">수정</a></td>
                </tr>
                <tr>
                    <td>8</td>
                    <td><span id="fav_status">🤍</span></td>
                    <td>김은형</td>
                    <td>kimu@naver.com</td>
                    <td>010-7372-4722</td>
                    <td>kh 아카데미</td>
                    <td>디자인팀</td>
                    <td>대리</td>
                    <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">수정</a></td>
                </tr>
                <tr>
                    <td>9</td>
                    <td><span id="fav_status">🤍</span></td>
                    <td>김은형</td>
                    <td>kimu@naver.com</td>
                    <td>010-7372-4722</td>
                    <td>kh 아카데미</td>
                    <td>디자인팀</td>
                    <td>대리</td>
                    <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">수정</a></td>
                </tr>
                <tr>
                    <td>10</td>
                    <td><span id="fav_status">🤍</span></td>
                    <td>김은형</td>
                    <td>kimu@naver.com</td>
                    <td>010-7372-4722</td>
                    <td>kh 아카데미</td>
                    <td>디자인팀</td>
                    <td>대리</td>
                    <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">수정</a></td>
                </tr>
            </table>

            <!-- 버튼(로그인한 회원) -->
            <div id="btn" align="right">
                <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#myModal">
                    주소록 추가
                </button>
            </div>


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
           
            <br clear="both"><br>


            <!-- 모달 -->              
                <!-- The Modal -->
                <div class="modal" id="myModal">
                    <div class="modal-dialog">
                      <div class="modal-content">
                      
                        <!-- Modal Header -->
                        <div class="modal-header">
                          <h4 class="modal-title">외부 주소록 추가</h4>
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        
                        <!-- Modal body -->
                        <div class="modal-body">
                          저장명  &nbsp; &nbsp; &nbsp;<input type="text" name="name" placeholder="김예시" maxlength="6"><br><br>
                          이메일  &nbsp; &nbsp; &nbsp;<input type="email" name="email" placeholder="123@a.com" maxlength="33"><br><br>
                          휴대전화 &nbsp; <input type="text" name="phone" placeholder="010-1111-2222" maxlength="13"><br><br>
                          회사소속 &nbsp; <input type="text" name="company" placeholder="오스워크" maxlength="16"><br><br>
                          부서  &nbsp; &nbsp; &nbsp; &nbsp; <input type="text" name="dept" placeholder="개발팀" maxlength="16"><br><br>
                          직급  &nbsp; &nbsp; &nbsp; &nbsp; <input type="text" name="job" placeholder="대리" maxlength="16"><br><br>

                        </div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                          <button type="submit" class="btn btn-primary" data-dismiss="modal">등록</button>
                          <button type="reset" class="btn btn-danger" data-dismiss="modal">취소</button>
                        </div>
                        
                      </div>
                    </div>
                </div>

                <!-- 수정 모달 -->              
                <!-- The Modal -->
                <div class="modal" id="myModal2">
                    <div class="modal-dialog">
                      <div class="modal-content">
                      
                        <!-- Modal Header -->
                        <div class="modal-header">
                          <h4 class="modal-title">외부 주소록 수정</h4>
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        
                        <!-- Modal body -->
                        <div class="modal-body">
                          저장명  &nbsp; &nbsp; &nbsp;<input type="text" name="name" value="${1}" placeholder="김예시" maxlength="6"><br><br>
                          이메일  &nbsp; &nbsp; &nbsp;<input type="email" name="email" value="${1}" placeholder="123@a.com" maxlength="33"><br><br>
                          휴대전화 &nbsp; <input type="text" name="phone" value="${1}" placeholder="010-1111-2222" maxlength="13"><br><br>
                          회사소속 &nbsp; <input type="text" name="company" value="${1}" placeholder="오스워크" maxlength="16"><br><br>
                          부서  &nbsp; &nbsp; &nbsp; &nbsp; <input type="text" name="dept" value="${1}" placeholder="개발팀" maxlength="16"><br><br>
                          직급  &nbsp; &nbsp; &nbsp; &nbsp; <input type="text" name="job" value="${1}" placeholder="대리" maxlength="16"><br><br>

                        </div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                          <a class="btn btn-primary btn-sm" href="">수정</a>
                          <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                          <a class="btn btn-danger btn-sm" href="">삭제</a>
                        </div>
                        
                      </div>
                    </div>
                </div>

                <script>
                    $(function() {
                      $('#fav_status').click( function() {
                        if( $(this).val() == '🤍' ) {
                          $(this).val('💛');
                        }
                        else {
                          $(this).val('🤍');
                        }
                      });
                    });
                    </script>


        </div>



</body>
</html>