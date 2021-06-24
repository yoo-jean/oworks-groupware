<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사내 주소록</title>

    <!-- css & 폰트 -->
    <link rel="stylesheet" href="address.css">
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

    <div class="main">
        <!-- 사내 주소록 비었을 때 
        <h3 class="title">사내 주소록</h3>
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
                <th width="11%">사원번호</th>
                <th width="10%">사원명</th>
                <th width="20%">이메일</th>
                <th width="10%">사내전화</th>
                <th width="17%">휴대전화</th>
                <th width="12%">부서</th>
                <th width="12%">직급</th>
                <th width="8%"></th>
            </tr>
            <tr>
                <td colspan="9">주소록이 비었습니다. 주소록을 추가해 주세요!</td>
            </tr>
        </table>
    -->        


    <!-- 사내 주소록에 값 있을 때 -->

        <h3 class="title">사내 주소록</h3>
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
                <th width="11%">사원번호</th>
                <th width="10%">사원명</th>
                <th width="20%">이메일</th>
                <th width="10%">사내전화</th>
                <th width="17%">휴대전화</th>
                <th width="12%">부서</th>
                <th width="12%">직급</th>
                <th width="8%"></th>
            </tr>

            <tr>
                <td>10001</td>
                <td>홍길동</td>
                <td>emp01@oworks.com</td>
                <td>1001</td>
                <td>010-1111-2222</td>
                <td>개발부</td>
                <td>대표이사</td>
                <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">삭제</a></td>
            </tr>
            <tr>
                <td>10001</td>
                <td>홍길동</td>
                <td>emp01@oworks.com</td>
                <td>1001</td>
                <td>010-1111-2222</td>
                <td>개발부</td>
                <td>대표이사</td>
                <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">삭제</a></td>
            </tr>
            <tr>
                <td>10001</td>
                <td>홍길동</td>
                <td>emp01@oworks.com</td>
                <td>1001</td>
                <td>010-1111-2222</td>
                <td>개발부</td>
                <td>대표이사</td>
                <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">삭제</a></td>
            </tr>
            <tr>
                <td>10001</td>
                <td>홍길동</td>
                <td>emp01@oworks.com</td>
                <td>1001</td>
                <td>010-1111-2222</td>
                <td>개발부</td>
                <td>대표이사</td>
                <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">삭제</a></td>
            </tr>
            <tr>
                <td>10001</td>
                <td>홍길동</td>
                <td>emp01@oworks.com</td>
                <td>1001</td>
                <td>010-1111-2222</td>
                <td>개발부</td>
                <td>대표이사</td>
                <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">삭제</a></td>
            </tr>
            <tr>
                <td>10001</td>
                <td>홍길동</td>
                <td>emp01@oworks.com</td>
                <td>1001</td>
                <td>010-1111-2222</td>
                <td>개발부</td>
                <td>대표이사</td>
                <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">삭제</a></td>
            </tr>
            <tr>
                <td>10001</td>
                <td>홍길동</td>
                <td>emp01@oworks.com</td>
                <td>1001</td>
                <td>010-1111-2222</td>
                <td>개발부</td>
                <td>대표이사</td>
                <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">삭제</a></td>
            </tr>
            <tr>
                <td>10001</td>
                <td>홍길동</td>
                <td>emp01@oworks.com</td>
                <td>1001</td>
                <td>010-1111-2222</td>
                <td>개발부</td>
                <td>대표이사</td>
                <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">삭제</a></td>
            </tr>
            <tr>
                <td>10001</td>
                <td>홍길동</td>
                <td>emp01@oworks.com</td>
                <td>1001</td>
                <td>010-1111-2222</td>
                <td>개발부</td>
                <td>대표이사</td>
                <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">삭제</a></td>
            </tr>
            <tr>
                <td>10001</td>
                <td>홍길동</td>
                <td>emp01@oworks.com</td>
                <td>1001</td>
                <td>010-1111-2222</td>
                <td>개발부</td>
                <td>대표이사</td>
                <td><a class="deleteBtn" data-toggle="modal" data-target="#myModal2" style="color:white">삭제</a></td>
            </tr>
        </table>

        <!-- 버튼(로그인한 회원) -->
        <div id="btn" align="right">
            <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#myModal">
                주소록 추가
            </button>
        </div>

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
           
        <br clear="both"><br>


        <!-- 주수록 추가 모달 -->              
            <!-- The Modal -->
            <div class="modal" id="myModal">
                <div class="modal-dialog">
                <div class="modal-content">
                    
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">사내 주소록 추가</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                        
                    <!-- Modal body -->
                    <div class="modal-body">
                        추가할 사원 번호 : <input type="text" name="empNo" placeholder="ex)10001" maxlength="5"><br><br>
                        * 사원 번호를 입력하시면 사원 정보가 자동으로 등록됩니다
                    </div>
                        
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" data-dismiss="modal">등록</button>
                        <button type="reset" class="btn btn-danger" data-dismiss="modal">취소</button>
                    </div>
                      
                </div>
                </div>
            </div>



            <!-- 주소록 삭제 모달 -->              
            <!-- The Modal -->
            <div class="modal" id="myModal2">
                <div class="modal-dialog">
                <div class="modal-content">
                    
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">주소록 삭제</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                        
                    <!-- Modal body -->
                    <div class="modal-body">
                        정말 주소록을 삭제하시겠습니까?
                    </div>
                        
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <a class="btn btn-danger btn-sm" href="">삭제</a>
                        <button type="reset" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                    </div>
                      
                </div>
                </div>
            </div>


    </div>

</body>
</html>