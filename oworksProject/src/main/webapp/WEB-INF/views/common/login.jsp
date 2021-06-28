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
            font-size: 12px;
        }

        #logoImg{
            width: 250px;
            height: 90px;
            margin-left: 10px;
            
        }
        #loginText {
            font-size: 12px;
            text-align: center;
            color: rgb(63, 62, 62);
            margin-bottom: 20px;
        }
        

        ::placeholder{font-size: 12px;}

        .inputText{
            border-bottom: 2px solid #0e2d57;
            position: relative;

        }
        .inputText input{
            font-size: 13px;
            color: white;
            border: none;
            width: 100%;
            outline: none;
            background: none;
            padding-left: 7px;
            height: 25px;
        }
        .loginBtn{
            display: block;
            width: 180px;
            height: 40px;
            border: none;
            background: #2574DB;
            color: white;
            outline: none;
            cursor: pointer;
            border-radius: 10px;
            border: solid 2px #2574DB;
            


        }
        .loginBtn:hover {
            background: white;
            color:#2574DB;
            font-size: 16px;
            font-weight:500;
            text-decoration: none;
            transition: background-color .5s; 

        }

        .check{
            font-size: 13px;
            padding-left: 7px;
            margin-top: -5px;
                    }

    </style>
    <script>
        function onFocusCursor(id){
		    document.getElementById(id).focus();
	    }
    </script>
</head>
<body>
    <div class="wrap">
        <div class="loginBody">
            <form action="login.emp" method="post" id="loginForm" >
            	
                <div id="loginImg">
                    <input type="image" id="logoImg" src="${pageContext.servletContext.contextPath }/resources/images/common/logo.png">
                </div>
                <div id="loginText">
                    <p>
						O Work's 그룹웨어입니다.<br />
						그룹웨어 시스템을 이용하시려면 로그인을 하시기 바랍니다.
					</p>
                </div>

                  <div id="loginContent">
                    <p class="inputText" onclick="onFocusCursor('empId')"> 
                    <input type="text" name="empId" id="empId" placeholder="ID 입력" size="28px" >
                    </p>
                    <p class="inputText" onclick="onFocusCursor('empPwd')">
                        <input type="password" name="empPwd" id="empPwd" placeholder="PASSWORD 입력" size="28px" >
                    </p>
                    <p class="check">
                        <input type="checkbox" id="rememberId" class="save_chk" value="rememberId" > <label for="rememberId">ID 저장</label>
                    </p>
                </div>

                <div id="loginBtnArea" style="padding-left: 55px; ">
                    <input type="button" id="loginBtn" class="loginBtn" value="LOGIN"  >
                </div>

                <div id="findPwdText">
                    <a href="findPwd.emp" style="color: rgb(65, 65, 65); cursor:pointer; font-size: small; margin-left: 110px;">비밀번호 찾기</a>
                </div>
            </form>
            
            <script type="text/javascript">
                $(document).on('click','#loginBtn',function(){
                    loginAct();
                })
                function loginAct(){
                    var empId = $("#empId").val();
                    var empPwd = $("#empPwd").val();
                    if(empId==""){
                        alert("아이디가 입력되지 않았습니다!");
                        $("#empId").focus();
                        return;
                    }
                    if(empPwd==""){
                        alert("비밀번호가 입력되지 않았습니다!");
                        $("#empPwd").focus();
                        return;
                    }
                    $.ajax({
        				url:"login.emp",
        				data:{empId:empId,empPwd:empPwd},
        				type: "POST",
        				success:function(data){
        					if(data=="fail"){
        						alert("로그인에 실패하였습니다.\n아이디 비밀번호를 확인해주세요!");
        					}else{
        						console.log(data);
        						alert(data + "님, 어서오세요 :D");
        						location.href='main.emp';
        					}
        				}
        			});
                }
                
               
            $("#empId").keydown(function(key) {
     	           if (key.keyCode == 13) {
     	        	   $("#empPwd").focus();
     	           }
               });

            $("#empPwd").keydown(function(key) {
                if (key.keyCode == 13) {
             	   loginAct();
                }
           });

                	
               
            </script>
        </div>
        
        

        <div class="loginFooter">
            <p>Copyright (c) <strong>O Work's COMPANY</strong> All Rights Reserved.</p>
        </div>


    


    </div>
</body>
</html>