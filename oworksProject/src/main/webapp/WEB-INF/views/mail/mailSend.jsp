<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>O Work's GroupWare</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
    div{box-sizing: border-box; }
    .mailWrap{margin: auto; height:700px; margin-top: 15px;}

    .wrap>div{width:100%;}
    #mailContent{height:100%;}

    #mailContent>div{height: 100%; float:left;}
    #content1{width: 40%;}
    #content2{width: 60%;}

    #content1>div{width: 99%; height: 100%;}

    #content1_1>div{width: 100%; float: left; }
    #mailTitle{height: 7%;}
	#mailSub{height:4.5%}
	#mailList{height: 82.5%;}
    #mailPage{height: 6%;}

	#mailSub>div{height: 100%; float: left;}
	#formSub_1{width: 88%;}
	#formSub_2{width: 12%;}

    #content2>div{width: 99.5%; height: 100%;}
    #content2_detail{width: 100%; float: left;}
    #mailBtn{height: 7%;}
    #mailDetail{height: 93%;}

    #mailBtn>div{height: 100%; float: left;}
    #mailSearch{width:86%;}
    #mailAct{width: 14%;}


    #mailDetail>div{width: 100%; float: left; }
    .viewTitle{height: 10%;}
    .viewSendEmp{height: 8%;}
    #viewContent{height: 82%;}

    .viewSendEmp>div{height: 100%; float: left;}
    .viewSendEmp1{width: 12%; font-weight: bold; }
    .viewSendEmp2{width: 67%;}
    .viewSendEmp3{width: 21%;}

    #viewContent>div{width: 100%; float: left;}
    .viewFile{height: 7%;  border-bottom: 1px solid #e8e8e8;}
    .viewDetail{height: 94%; }

 
    .fileTitle>div{height: 100%; float: left; margin-left: -3px; padding-top: 4px;}
    .titleName{width: 13%;}
    .titleNum{width: 82%; }
    .titleScroll{width:5%;}


    #content1_1, #content2_detail{
        border: 1px solid gray;
        box-shadow: 1px 2px 10px 1px rgb(193, 193, 193);
    }
	.formTitle{	
		display: flex;
        align-items: center;
        justify-content: center;
		background: #2574DB;
		color: white;
	}
    #formSub_2 button{
        height: 25px; 
        width: 36px; 
        font-size: 10px; 
        margin: 2px;
        background: rgb(185, 185, 185);
        border: none;
    }
    #formSub_2 button:hover{
        background: rgb(115, 115, 115);
    }
    #mailList, #mailDetail{
        font-size: 13px;
    }
    table tr td span{font-size: 12px; padding-right: 3px;}
    .mailDate{
        text-align: right; 
        padding-right: 5px; 
        border-left: hidden;
    }
    .attach{
        font-size: 17px; 
        color: rgb(100, 100, 100); 
        padding-right: 3px;
        
        
    }

	#pagingArea{width:fit-content;margin:auto; padding-top: 5px;}

    .pagination a{
        color: gray;
        transition: background-color .5s; 
    }
    #mailNoClick{
        display: block;
        text-align: center;
        margin-top: 45%;
        color: #696969;
    }
    .viewTitle{
        border-bottom: 1px solid #e8e8e8;
        font-size: 20px;
        padding: 20px 8px;
    }
    .viewSendEmp{
        border-bottom: 1px solid #c0c0c0;
        padding-top: 15px;
        padding-left: 9px;
    }
    .addFileArea a {
    font-size: 11px;
    font-weight: 400;
    color: #999;
    letter-spacing: -1px;
}      
    .viewDetail{
        padding: 10px 15px;
    }
    .viewFile{
        padding-top: 3.5px;
        padding-left: 9px;;
        color: #696969;
    }
    #fileTable{
        width: 595px;
        margin-left: -9px;
    }
    .secondForm{padding-top: 60px;}
    .imgBtn{
        cursor: pointer;
    }

    tbody tr:hover{
        background: rgba(150,210,255,0.1);
        cursor: pointer;
    }

    .titleName{
        color: black;
        padding-left: 3px;
    }
    #fileNum{
        color: #2574DB;
    }
    .fileList{
        width: 652px; 
        margin: -9px 0 0 -14px;
        padding: 3px 0 0 85px;
        background: #f1f1f1; 
    }
    .getFile{
        float: right; 
        padding-right: 22px;
        padding-top: 3px;
    }
    .getFile a{
        font-size: 15px;
        color: gray;
        text-decoration: none;
    }
    .attachArea{
        padding-top: 300px;
    }
    .okRead{
        background: rgb(253, 207, 0);
        border-radius: 10px;
        border-style: none;
        color: white;
        font-size: 11px;
        width: 36px;
        margin-right: 10px;
        
    }
    .noRead{
        background: rgb(202, 202, 202);
        border-radius: 10px;
        border-style: none;
        color: white;
        font-size: 11px;
        width: 60px;
    }
    ::placeholder{
        font-size: 12px;
        padding-left: 5px;
    }



</style>
</head>

<body>
	<jsp:include page="../common/mainHeader.jsp"/>
    <jsp:include page="../common/mainMenubar.jsp"/>

    <!-- 메인 -->
    <div class="mailWrap" style="position: absolute; left: 215px; top: 80px; width: 1100px;">
        <div id="mailContent">

            <!-- 메일 리스트 -->
            <div id="content1">
                <div id="content1_1">
                    <div class="formTitle" id="mailTitle">
                        <span style="font-size: 20px; font-weight: bold;"> 보낸 메일함 &nbsp;• </span> &nbsp; 
                        <span style="font-size: 17px;">&nbsp; <b>2</b> /15 </span>
                    </div>
                    <div id="mailSub" style="border-bottom: 1px solid gray;">
                        <div id="formSub_1">
                            <input type="checkbox" id="mail__all__check" style="margin: 9px;">
                        </div>
                        <div id="formSub_2">
                            <button align="right" type="button" class="btn btn-secondary btn-sm" >삭제</button>
                        </div>
                    </div>
                    <div id="mailList" > 
                        <table id="mailListTable" class="mailTable" border="1" style="width: 434px; height: 575px;" frame=void >
                            <tr>
                                <td align="center" style="width:30px; border-right: hidden;">
                                    <input type="checkbox" class="mail__checkbox">
                                </td>
                                <td>
                                    <b>홍길동</b><br> 
                                    확인하였습니다.
                                    
                                </td>
                                <td class="mailDate"> 
                                    <span class="viewDate">21.05.30</span><br>
                                    <button class="okRead" type="button" title="21.05.31 20:22:23">읽음</button>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width:30px; border-right: hidden;">
                                    <input type="checkbox" class="mail__checkbox">
                                </td>
                                <td>
                                    <b>김가나</b><br>
                                    요청하신 서류 보내드립니다.
                                </td>
                                <td class="mailDate"> 
                                    <span>21.05.30</span><br>
                                    <button class="noRead" type="button">읽지 않음</button>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width:30px; border-right: hidden;">
                                    <input type="checkbox" class="mail__checkbox">
                                </td>
                                <td>
                                    <b>김가나</b><br>
                                    요청하신 서류 보내드립니다.
                                </td>
                                <td class="mailDate"> 
                                    <span>21.05.30</span><br>
                                    <button class="okRead" type="button" title="21.05.31 20:22:23">읽음</button>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width:30px; border-right: hidden;">
                                    <input type="checkbox" class="mail__checkbox">
                                </td>
                                <td>
                                    <b>김가나</b><br>
                                    연락주세용~~~
                                </td>
                                <td class="mailDate"> 
                                    <span>21.05.30</span><br>
                                    <button class="okRead" type="button" title="21.05.31 20:22:23">읽음</button>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width:30px; border-right: hidden;">
                                    <input type="checkbox" class="mail__checkbox">
                                </td>
                                <td>
                                    <b>김가나</b><br>
                                    요청하신 서류 보내드립니다.
                                </td>
                                <td class="mailDate"> 
                                    <span>21.05.30</span><br>
                                    <button class="okRead" type="button" title="21.05.31 20:22:23">읽음</button>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width:30px; border-right: hidden;">
                                    <input type="checkbox" class="mail__checkbox">
                                </td>
                                <td>
                                    <b>김가나</b><br>
                                    요청하신 서류 보내드립니다.
                                </td>
                                <td class="mailDate"> 
                                    <span>21.05.30</span><br>
                                    <button class="noRead" type="button">읽지 않음</button>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width:30px; border-right: hidden;">
                                    <input type="checkbox" class="mail__checkbox">
                                </td>
                                <td>
                                    <b>김가나</b><br>
                                    요청하신 서류 보내드립니다.
                                </td>
                                <td class="mailDate"> 
                                    <span>21.05.30</span><br>
                                    <button class="okRead" type="button" title="21.05.31 20:22:23">읽음</button>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width:30px; border-right: hidden;">
                                    <input type="checkbox" class="mail__checkbox">
                                </td>
                                <td>
                                    <b>김가나</b><br>
                                    연락주세요~
                                </td>
                                <td class="mailDate"> 
                                    <span>21.05.30</span><br>
                                    <button class="noRead" type="button">읽지 않음</button>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width:30px; border-right: hidden;">
                                    <input type="checkbox" class="mail__checkbox">
                                </td>
                                <td>
                                    <b>김가나</b><br>
                                    요청하신 서류 보내드립니다.
                                </td>
                                <td class="mailDate"> 
                                    <span>21.05.30</span><br>
                                    <button class="noRead" type="button">읽지 않음</button>
                                </td>
                            </tr>
                            
                        </table>
                    </div>
                    <div id="mailPage" style="border-top: 1px solid gray;">
                        <div id="pagingArea">
                            <ul class="pagination pagination-sm">
                                <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
				
            </div>
    
            <!-- 메일 상세 조회 -->
            <div id="content2">
                <div id="content2_detail" >

                    <!-- 검색, 답장하기, 휴지통 -->
                    <div id="mailBtn" class="formTitle">
                        <div id="mailSearch" style="margin-top: 20px; margin-left: 6px; display: no;">
                            <input type="text" name="keyword" placeholder="메일검색" > 
                            <i id="searchBtn" title="검색" class="fa fa-search imgBtn" style="font-size:23px;"></i>
                        </div>
                        <div id="mailAct">
                            
                            <i id=cancleBtn title="발송취소" class="fa fa-times imgBtn" style="font-size:27px; "></i> &nbsp; &nbsp;
                            <i id="trashBtn" title="휴지통" class="fa fa-trash-o imgBtn" style="font-size:27px; margin-top: 10px;"></i>
                        </div>
                    </div>

                    <script>
                        $(document).ready(function(){
                            $("#replyBtn").on("click", function(){

                            });
                            $("#trashBtn").on("click", function(){

                            });
                        }); 
                    </script>

                    <!-- 메일 본문 -->
                    <div id="mailDetail">
                        <div class=viewTitle> 
                            
                            확인하였습니다.
                    
                        </div>
                        
                        <div class="viewSendEmp">
                            <div class="viewSendEmp1"> 받은 사원</div>
                            <div class="viewSendEmp2"> 홍길동(10015)</div>
                            <div class="viewSendEmp3"> 21-05-30(일) 20:17 </div>
                        </div>
                        
                        <div id="viewContent">

                            <!-- 첨부 파일 없을 때  <div class="viewFile"; style="display: none;">-->
                            <div class="viewFile" >
                                <div class="fileTitle" style="height: 34px;">
                                    <div class="titleName">첨부 파일</div>
                                    <div class="titleNum">
                                        <span id="fileNum">2개</span> 
                                        <span>(150KB)</span>
                                        <a href="" style="color: #696969; font-size: smaller; padding-left: 10px;">모두저장</a>
                                    </div>
                                    <div class="titleScroll" >
                                        <i id="scroll" class="fa fa-angle-down imgBtn" style="font-size:24px"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="viewDetail" >
                                <!-- 첨부파일 있을 때  -->
                                <div class="fileList" style="display: none;">
                                    <dl>
                                        <dd style="height: 25px; ">
                                            <span > 하반기 결산(2020).pdf </span> <span style="margin-left: 8px; font-size: 10px;">550MB</span> 
                                            <span class="getFile"><a href="#" class="fa fa-download"></a></span>
                                        </dd>
                                        
                                        <dd style="height: 25px; ">
                                            <span > 상반기 결산(2021).pdf </span> <span style="margin-left: 8px; font-size: 10px;">550MB</span> 
                                            <span class="getFile"><a href="#" class="fa fa-download"></a></span>
                                        </dd>
                                    </dl>
                                </div>

                                <!-- 메일 상세내용 -->
                                <p id="mailContentDetail" class="firstForm">

                                    확인 완료하였습니다. <br>
                                    그대로 진행해주세요.
                                </p>
                            </div>

                            
                        </div>

                        <!-- 선택한 메일 없을 때 -->
                        <div id=mailNoClick style="display: none;">
                            <i class="fa fa-envelope " style="font-size:50px; color: #9a9a9a; margin-bottom: 10px;"></i>
                            <p> 선택된 메일이 없습니다.</p>
                        </div>
                        

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 발송을 취소하면 네이버 수신자의 메일함에서 메일이 삭제됩니다.
    이 메일의 발송을 취소하시겠습니까? -->

    <script>
        $(document).ready(function(){
            $("#mail__all__check").off().on('click',function(){
                var checked = $(this).prop('checked');
                $(".mail__checkbox").each(function(){
                    $(this).prop('checked',checked);
                });
            });

            $("#scroll").click(function(){
                if($(".fileList").is(":visible")){
                    $(".fileList").slideUp();
                    $("#scroll").toggleClass("fa fa-angle-down fa fa-angle-up");
                }else{
                    $(".fileList").slideDown(); 
                    $("#scroll").toggleClass("fa fa-angle-up fa fa-angle-down"); 
                } 
            }); 
        });
    </script>


</body>
</html>