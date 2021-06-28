<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사원상세</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        .outer{
            margin: auto;
            margin-top: 50px;
            margin-bottom: 20px;
            width:800px;
        }
        #text1{
            font-size:x-large; 
            font-weight: bold; 
            color: rgb(94, 94, 94);
        }
        table {
            border-collapse: separate;
            border-spacing: 0 15px;
            width: 800px;
        }
        #address{width: 600px;}
        .form-control, .custom-select{width: 200px;}
        .empEnrollForm tr{height: 40px;}

    </style>
</head>
<body>
    <!-- 이쪽에 헤더바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 이쪽에 메뉴바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

    <div class="outer">
        <span id="text1">사원상세</span><hr>
        <form action="" method="post" id="" enctype="multipart/form-data">	
			<table class="empEnrollForm">
				<tr>
					<th>사원번호</th>
					<td style="padding-right: 200px;">
                        &nbsp;&nbsp;&nbsp; 10001
                    </td>
                    <th style="width:40px;">근무상태</th>
					<td style="padding-right: 170px;">
                        &nbsp;&nbsp;&nbsp; 근무
                    </td>
                    
                    <td rowspan="2">
                        <!--사원이미지 미리보기할 img-->
                        <img id="image_section" width="100" height="115" style="border: 1px solid gray;" src="images/gildong.png"/>
                    </td>
                    
				</tr>
                
                <tr>
					<th>아이디</th>
					<td>
                        &nbsp;&nbsp;&nbsp; emp01
                    </td>
                    <th>비밀번호</th>
					<td>
                        &nbsp;&nbsp;&nbsp; ****
                    </td>
				</tr>
                <tr>
                    <th>이름</th>
					<td>
                        &nbsp;&nbsp;&nbsp; 홍길동
                    </td>
                    <th>이메일</th>
					<td>
                        &nbsp;&nbsp;&nbsp; emp01@oworks.com
                    </td>
				</tr>
                <tr>
					<th>부서</th>
					<td>
                        &nbsp;&nbsp;&nbsp; 개발부
                    </td>
                    
                    <th>직급</th>
					<td>
                        &nbsp;&nbsp;&nbsp; 대표이사
                    </td>
				</tr>
                <tr>
					<th>입사일</th>
					<td>
                        &nbsp;&nbsp;&nbsp; 2019-09-22
                    </td>
                    <th>퇴사일</th>
					<td>
                        &nbsp;&nbsp;&nbsp; 0000-00-00
                    </td>
				</tr>
                <tr>
					<th style="width:80px">주민번호</th>
					<td>
                        &nbsp;&nbsp;&nbsp; 901010-1001111
                    </td>
                    <th style="width:80px;">성별</th>
					<td>
                        &nbsp;&nbsp;&nbsp; 남자
                    </td>
				</tr>
                <tr>
					<th>휴대전화</th>
					<td>
                        &nbsp;&nbsp;&nbsp; 010-1111-2222
                    </td>
                    <th>사내전화</th>
					<td>
                        &nbsp;&nbsp;&nbsp; 1001
                    </td>
				</tr>
                <tr>
					<th>자택주소</th>
					<td colspan="3">
                        &nbsp;&nbsp;&nbsp; 경기도 광명시 123길 KH아파트 101동 301호
                    </td>
				</tr>
			</table>
            <br>
            <div id="btn" align="center">
                <a class="btn btn-primary btn-sm" href=""><b>수정</b></a>&nbsp;
                <a class="btn btn-danger btn-sm" href=""><b>삭제</b></a>&nbsp;
                <a class="btn btn-secondary btn-sm" href=""><b>취소</b></a>&nbsp;
            </div>

            </form>
           
    </div>

    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                
                reader.onload = function (e) {
                $('#image_section').attr('src', e.target.result);  
                }
                
                reader.readAsDataURL(input.files[0]);
                }
            }
            
            // 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행
            $("#file").change(function(){
                readURL(this);
            });

            function openZipSearch() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        $('[name=addr]').val(data.address);
                    }
                }).open();
            }
    </script>

    
</body>
</html>