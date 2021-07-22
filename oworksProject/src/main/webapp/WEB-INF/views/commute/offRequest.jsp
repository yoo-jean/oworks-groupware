<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>O work's - 휴가신청서</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- alertify 관련 --------------------------------------------------- -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
<style>
    /*테이블 관련 스타일*/
    button {
        float: right;
        width: 80px;
        height: 35px;
    }
    .offApproval {
        float: right;
        text-align: center;
        font-size: 13px;
        width: 250px;
    }
    .offRequest, .offEmployee{
        text-align: center;
        font-size: 13px;
        width: 100%;
    }
    .offList>tbody>tr:hover{
        background: rgba(241, 196, 15, 0.329);
        cursor:pointer;
    }
    th, td {
        padding: 5px;
        border-bottom: 1px solid #ddd;
    }
    th {
        height: 30px;
        background-color: lightgray;
    }
    td {
        height: 35px;
    }
</style>
</head>
<body>
	<!-- 전체 화면 -->
    <div class="wrap">
    
	<!-- 헤더바 -->
	<jsp:include page="../common/mainHeader.jsp"/>
	
        <!-- 본문 전체 -->
        <div id="content">
            <!-- 좌측 메뉴바 -->
			<jsp:include page="../common/mainMenubar.jsp"/>

            <!-- 우측 본문 -->
            <div id="content_2">
                
                <h4>휴가 신청서</h4>
				
				<form id="insertOff" method="post" action="insert.off">
					<input type="hidden" name="empNo" value="${ loginEmp.empNo }">
	                <button type="submit" class="btn btn-primary">기안</button>
	
	                <br><br>
	
	                <table class="offApproval">
	                    <tr>
	                        <th>신청상태</th>
	                        <th>결      재</th>
	                    </tr>
	                    <tr>
	                        <td></td>
	                        <td></td>
	                    </tr>
	                </table>
	
	                <br>
	
	                <table class="offRequest" text-align="center">
	                    <tr>
	                        <th>소속/직위</th>
	                        <td>${ loginEmp.deptName } &#47; ${ loginEmp.jobName }</td>
	                    </tr>
	                    <tr>
	                        <th>신청자</th>
	                        <td>${ loginEmp.empName }</td>
	                    </tr>
	                    <tr>
	                        <th>신청구분</th>
	                        <td>
	                            <select name="offCateNo" required>
	                                <option value="" selected disabled hidden>휴가구분</option>
	                                <option value="1">병가</option>
	                                <option value="2">경조사</option>
	                                <option value="3">출산</option>
	                                <option value="4">예비군</option>
	                                <option value="5">보건</option>
	                                <option value="6">연차</option>
	                            </select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>휴가 시작일</th>
	                        <td><input name="offStart" type="date" value="offStart" required></td>
	                    </tr>
	                    <tr>
	                        <th>휴가 종료일</th>
	                        <td><input name="offEnd" type="date" value="offEnd" max="2021-12-31" required></td>
	                    </tr>
	                    <tr>
	                        <th>신청 사유</th>
	                        <td><textarea name="offPurpose" cols="80" rows="3" style="resize: none;">${ c.offPurpose }</textarea></td>
	                    </tr>
	                </table>
	            </form>

                <br><br>

                <h5>연차 현황</h5>
                <table class="offEmployee">
                    <tr>
                        <th>발생연차</th>
                        <th>사용연차</th>
                        <th>잔여연차</th>
                        <th>기준일</th>
                    </tr>
                    <tr>
						<td>20</td>
                        <td>3</td>
                        <td>17</td>
                        <td>2021-07-21</td>
                    </tr>
                </table>
              

            </div>

        </div>


    </div>


    


    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
</body>
</html>