<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>O Work's GroupWare</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    
    <style>
    *{
            margin: 0;
            padding: 0;
            text-decoration: none;
            box-sizing: border-box;
        }
        body{
            min-height: 100vh;
            background-image: linear-gradient(140deg, rgba(255, 255, 255, 0.945),#2574DB);
        }
        .wrap{height: 700px;}
        .wrap>div{width: 100%; float: left;}
        .loginBody{height: 95%;}
        .loginFooter{height: 5%;}

        .loginBody{
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .loginFooter{
            background-color: rgb(245,247,252);
            text-align: right;
            padding-top: 7px;
            padding-right: 10px;
            font-size: 11.2px;
        }
        
    ::placeholder{font-size: 12px;}
    
    .mybtn{
        width:140px;
        height:40px;
        padding:0;
        display:inline; 
        border-radius: 4px; 
        background: #2574DB;
        color: #fff;
        margin-top: 20px;
        border: solid 2px #2574DB;
        transition: all 0.5s ease-in-out 0s;
    }
    .mybtn:hover .mybtn:focus {
        background: white;
        color: #2574DB;
        text-decoration: none;
    }
</style>
</head>
<body>
    <div class="wrap">
        <div class="loginBody">

                <div id="findPwd" class="w3-content w3-container w3-margin-top">
                    <div class="w3-container w3-card-4 w3-auto" style="width: 382px;height: 456.3px; background-color: white; border-radius: 5px;">
                        <div class="w3-center w3-large w3-margin-top">
                            <h3>???????????? ??????</h3>
                        </div>
                        <div>
                            <br>
                            <p>
                                <label>?????????</label>
                                <input class="w3-input" type="text" id="empId" name="empId" placeholder="???????????? ???????????????" required>
                            </p>
                            <p>
                                <label>?????????</label>
                                <input class="w3-input" type="text" id="empEmail" name="empEmail" placeholder="????????? ?????????????????? ???????????????" required>
                            </p>
                            <br>
                            <p style="color: gray; font-size: 13px; text-align: center;">
                                * ????????? ????????? ????????? ????????? ???????????? ????????? ???????????????. <br><br>
                                ????????? ????????? ???????????? ??????????????????.
                                
                            </p>
                            <p class="w3-center">
                                <button type="button" id="findBtn" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">??????</button> &nbsp;
                                <button type="button" onclick="history.go(-1);" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">???????????????</button>
                            </p>
                        </div>
                    </div>
                </div>
                
                <script type="text/javascript">
                $(document).on('click','#findBtn',function(){
                    findAct();
                })
                function findAct(){
                    var empId = $("#empId").val();
                    var empEmail = $("#empEmail").val();
                    if(empId==""){
                        alert("???????????? ???????????? ???????????????!");
                        $("#empId").focus();
                        return;
                    }
                    if(empEmail==""){
                        alert("????????? ????????? ???????????? ???????????????!");
                        $("#empEmail").focus();
                        return;
                    }
                }
            </script>


       
        </div>

        <div class="loginFooter">
            <p>Copyright (c) <strong>O Work's COMPANY</strong> All Rights Reserved.</p>
        </div>


    


    </div>
</body>
</html>