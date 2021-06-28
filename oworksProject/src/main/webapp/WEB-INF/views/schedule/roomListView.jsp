<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회의실예약</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
        #text2{font-weight: bold;}
        .listArea{
            border-top: 1px solid black; 
            border-bottom: 1px solid black;
            text-align: center;
            margin-top: 10px;
        }
        .listArea>tbody>tr:hover{
            cursor:pointer;
            background: rgba(37, 116, 219, 0.678);
            color: white;
        }
        .listArea>tbody>tr{height: 40px;}
        #head{background: rgb(237, 237, 237);}
        #top{height: 40px;}
        .modal{margin-top: 130px;}
    </style>
</head>
<body>
    <!-- 이쪽에 헤더바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

    <!-- 이쪽에 메뉴바 포함할꺼임 -->
    <%-- <jsp:include page=""/> --%>

     <div class="outer">
        <span id="text1">회의실 예약</span><hr>
        <span id="text2">2021-05-29 예약 가능한 회의실은 다음과 같습니다.</span>

        <br>
        <table class="listArea">
            <thead id="head">
                <tr id="top">
                    <th width="430">예약 시간</th>
                    <th width="370">예약 가능 상태</th>
                </tr>
            </thead>
            <tbody>   
                <tr>
                    <td><a data-toggle="modal" data-target="#reservationOk"><u>09:00 ~ 10:00</u></a></td>
                    <td style="color: grey;"><b>예약가능</b></td>
                </tr>
                <tr>
                    <td><a data-toggle="modal" data-target="#reservationOk"><u>10:00 ~ 11:00</u></a></td>
                    <td style="color: grey;"><b>예약가능</b></td>
                </tr>
                <tr>
                    <td><a data-toggle="modal" data-target="#reservationOk"><u>11:00 ~ 12:00</u></a></td>
                    <td style="color: grey;"><b>예약가능</b></td>
                </tr>
                <tr>
                    <td><a data-toggle="modal" data-target="#reservationOk"><u>12:00 ~ 13:00</u></a></td>
                    <td style="color: grey;"><b>예약가능</b></td>
                </tr>
                <tr>
                    <td><a data-toggle="modal" data-target="#reservationOk"><u>13:00 ~ 14:00</u></a></td>
                    <td style="color: grey;"><b>예약가능</b></td>
                </tr>
                <tr>
                    <td><a data-toggle="modal" data-target="#reservationOk"><u>14:00 ~ 15:00</u></a></td>
                    <td style="color: grey;"><b>예약가능</b></td>
                </tr>
                <tr>
                    <td><a data-toggle="modal" data-target="#reservationOk"><u>15:00 ~ 16:00</u></a></td>
                    <td style="color: grey;"><b>예약가능</b></td>
                </tr>
                <tr>
                    <td><a data-toggle="modal" data-target="#reservationOk"><u>16:00 ~ 17:00</u></a></td>
                    <td style="color: grey;"><b>예약가능</b></td>
                </tr>
                <tr>
                    <td>
                        <a data-toggle="modal" data-target="#reservationNo"><u>17:00 ~ 18:00</u></a></td>
                    <td style="color: rgb(240, 4, 51);"><b>예약불가능</b></td>
                </tr>
            </tbody>
        </table>
        

        <!-- 예약가능 시간 클릭시 뜨는 Modal -->
        <div class="modal" id="reservationOk">
            <div class="modal-dialog">
            <div class="modal-content"> 
    
            <!-- Modal Header --> 
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!--Modal body --> 
            <div class="modal-body" align="center">
            
             		<img src="images/reservationOk.png" width="55px" height="50" style="margin-bottom: 10px;"><br>
		         	<u><b style="color: rgba(37, 116, 219, 0.9);">예약가능</b>한 회의실 입니다.</u><br>
		         	<span>선택된 회의실을 예약하시겠습니까?</span> <br>
		            <br>	
		         	
		         <form action="enrollForm.mr" method="post">
                    <input type="hidden" name="예약하는회원" value="">
                    <input type="hidden" name="예약하는시간" value="">
		         	<button type="submit" class="btn btn-primary btn-sm"><b>예약하기</b></button>
                    <br><br>  
		         </form>
            </div>
        </div>
        </div>
        </div>   

        <!-- 예약불가능 시간 클릭시 뜨는 Modal -->
        <div class="modal" id="reservationNo">
            <div class="modal-dialog">
            <div class="modal-content"> 
            <!-- Modal Header --> 
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
    
            <!--Modal body --> 
            <div class="modal-body" align="center">
            
             		<img src="images/reservationNo.png" width="55px" height="50" style="margin-bottom: 10px;"><br>
		         	<u><b style="color: rgb(240, 4, 51)">예약불가능</b>한 회의실 입니다.</u><br>
		         	<span>예약가능 회의실을 다시 선택해주세요.</span> <br>
		            <br>	
		         	<button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal"><b>다시선택</b></button>
                    <br><br> 
            </div>
        </div>
        </div>
        </div>    

     </div>

    <script>
        
    </script>
</body>
</html>