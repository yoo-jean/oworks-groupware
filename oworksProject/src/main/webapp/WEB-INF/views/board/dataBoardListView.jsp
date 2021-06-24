<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자료실 리스트</title>
    <!-- css & 폰트 -->
    <link rel="stylesheet" href="dataBoard.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
    

    <!-- 부트스트랩 : 아이콘 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


</head>
<body>
    <!-- 헤더바 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 메뉴바 -->
    <%-- <jsp:include page=""/> --%>


    <div class="main">

        <!-- 글이 없을 경우 -->
        <!--
        <h3 class="title">자료실</h3>
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
                <th width="15%">글 번호</th>
                <th width="40%">제목</th>
                <th width="18%">작성자</th>
                <th width="15%">등록일</th>
                <th width="12%">조회수</th>
            </tr>
            <tr>
                <td colspan="5">작성된 글이 없습니다. 글을 작성해 주세요!</td>
            </tr>
        </table>    
        -->

        <!-- 글이 있을 경우 -->
        <h3 class="title">자료실</h3>
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
                <th width="15%">글 번호</th>
                <th width="40%">제목</th>
                <th width="18%">작성자</th>
                <th width="15%">등록일</th>
                <th width="12%">조회수</th>
            </tr>

            <tr>
                <td>10</td>
                <td>
                    <a href="">[필수][인사팀] kh 연락처입니다. 다운 필수.</a>
                </td>
                <td>이혜빈</td>
                <td>2021-06-01</td>
                <td>123</td>
            </tr>
            <tr>
                <td>9</td>
                <td>
                    <a href="">[필수][인사팀] kh 연락처입니다. 다운 필수.</a>
                </td>
                <td>이혜빈</td>
                <td>2021-06-01</td>
                <td>123</td>
            </tr>            <tr>
                <td>8</td>
                <td>
                    <a href="">[필수][인사팀] kh 연락처입니다. 다운 필수.</a>
                </td>
                <td>이혜빈</td>
                <td>2021-06-01</td>
                <td>123</td>
            </tr>            <tr>
                <td>7</td>
                <td>
                    <a href="">[필수][인사팀] kh 연락처입니다. 다운 필수.</a>
                </td>
                <td>이혜빈</td>
                <td>2021-06-01</td>
                <td>123</td>
            </tr>            <tr>
                <td>6</td>
                <td>
                    <a href="">[필수][인사팀] kh 연락처입니다. 다운 필수.</a>
                </td>
                <td>이혜빈</td>
                <td>2021-06-01</td>
                <td>123</td>
            </tr>            <tr>
                <td>5</td>
                <td>
                    <a href="">[필수][인사팀] kh 연락처입니다. 다운 필수.</a>
                </td>
                <td>이혜빈</td>
                <td>2021-06-01</td>
                <td>123</td>
            </tr>            <tr>
                <td>4</td>
                <td>
                    <a href="">[필수][인사팀] kh 연락처입니다. 다운 필수.</a>
                </td>
                <td>이혜빈</td>
                <td>2021-06-01</td>
                <td>123</td>
            </tr>            <tr>
                <td>3</td>
                <td>
                    <a href="">[필수][인사팀] kh 연락처입니다. 다운 필수.</a>
                </td>
                <td>이혜빈</td>
                <td>2021-06-01</td>
                <td>123</td>
            </tr>            <tr>
                <td>2</td>
                <td>
                    <a href="">[필수][인사팀] kh 연락처입니다. 다운 필수.</a>
                </td>
                <td>이혜빈</td>
                <td>2021-06-01</td>
                <td>123</td>
            </tr>            <tr>
                <td>1</td>
                <td>
                    <a href="">[필수][인사팀] kh 연락처입니다. 다운 필수.</a>
                </td>
                <td>이혜빈</td>
                <td>2021-06-01</td>
                <td>123</td>
            </tr>
        </table>


        <!-- 버튼(로그인한 회원) -->
        <div id="btn" align="right">
            <a class="btn btn-outline-primary btn-sm" href="">글 작성</a>
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


    </div>



</body>
</html>