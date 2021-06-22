<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사원수정</title>
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
        .form-control, .custom-select{width: 190px;}
    </style>
</head>
<body>
    <!-- 이쪽에 헤더바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 이쪽에 메뉴바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

    <div class="outer">
        <span id="text1">사원수정</span><hr>
        <form action="" method="post" id="" enctype="multipart/form-data">	
			<table>
				<tr>
					<th>사원번호</th>
					<td>
                        <input type="text" class="form-control" id="empNo" name="empNo" required readonly value="10001">
                    </td>
                    <th style="width:40px;">근무상태</th>
					<td style="padding-top: 10px;">
                        <input type="radio" name="empStatus" id="Y" value="Y" checked>
                        <label for="Y">근무</label>&emsp;&emsp;
                        <input type="radio" name="empStatus" id="N" value="N">
                        <label for="N">퇴사</label><br>
                    </td>
                    <td rowspan="2">
                        <!--사원이미지 미리보기할 img-->
                        <img id="image_section" width="100" height="115" style="border: 1px solid gray;" src="images/gildong.png"/>
                    </td>
				</tr>
                <tr>
					<th>아이디</th>
					<td>
                        <input type="text" class="form-control" id="empId" name="empId" required value="emp01">
                    </td>
                    <th>비밀번호</th>
					<td>
                        <input type="password" class="form-control" id="empPwd" name="empPwd" required value="1000">
                    </td>
				</tr>
                <tr>
                    <th>이름</th>
					<td>
                        <input type="text" class="form-control" id="empName" name="empName" value="홍길동">
                    </td>
                    <th>이메일</th>
					<td>
                        <input type="email" class="form-control" id="email" name="email" required value="emp01@oworks.com">
                    </td>
                    <td style="padding-left: 15px;">
                        <input type="file" name="file" id="file" style="display:none"/>
                        <a class="btn btn-outline-dark btn-sm" href="javascript:void(0);" onclick="document.all.file.click()"><b>사진수정</b></a>
                    </td>
				</tr>
                <tr>
					<th>부서</th>
					<td>
                        <select class="custom-select" id="deptCode" name="deptCode">
                            <option value="D1">개발부</option>
                            <option value="D2">인사부</option>
                            <option value="D3">영업부</option>
                            <option value="D4">기획부</option>
                            <option value="D5">마케팅</option>
                        </select>
                    </td>
                    
                    <th>직급</th>
					<td>
                        <select class="custom-select" id="jobCode" name="jobCode">
                            <option value="J1">대표이사</option>
                            <option value="J2">부장</option>
                            <option value="J3">과장</option>
                            <option value="J4">대리</option>
                            <option value="J5">사원</option>
                        </select>
                    </td>
				</tr>
                <tr>
					<th>입사일</th>
					<td>
                        <input type="date" class="form-control" id="hireDate" name="hireDate" required value="2019-09-22">
                    </td>
                    <th>퇴사일</th>
					<td>
                        <input type="date" class="form-control" id="retireDate" name="retireDate">
                    </td>
				</tr>
                <tr>
					<th style="width:80px">주민번호</th>
					<td>
                        <input type="text" class="form-control" id="birthNo" name="birthNo" required value="901010-1001111">
                    </td>
                    <th style="width:80px;">성별</th>
					<td style="padding-top: 10px;">
                        <input type="radio" name="gender" id="Male" value="M" checked>
                        <label for="Male">남자</label>&emsp;&emsp;
                        <input type="radio" name="gender" id="Female" value="F">
                        <label for="Female">여자</label><br>
                    </td>
				</tr>
                <tr>
					<th>휴대전화</th>
					<td>
                        <input type="tel" class="form-control" id="phone" name="phone" required maxlength="13" value="010-1111-2222">
                    </td>
                    <th>사내전화</th>
					<td>
                        <input type="tel" class="form-control" id="empPhone" name="empPhone" maxlength="4" required value="1001">
                    </td>
				</tr>
                <tr>
					<th>자택주소</th>
					<td colspan="3">
                        <input type="text" class="form-control" id="address" name="address" value=" 경기도 광명시 123길 KH아파트 101동 301호">
                    </td>
                    <td>
                        <a class="btn btn-primary btn-sm" href="javascript:void(0);" onclick="openZipSearch(this)"><b>주소검색</b></a>
                    </td>
				</tr>
			</table>
            <br>
            <div id="btn" align="center">
                <a class="btn btn-primary btn-sm" href=""><b>수정</b></a>&nbsp;
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
                        $('[name=address]').val(data.address);
                    }
                }).open();
            }
    </script>

    
</body>
</html>