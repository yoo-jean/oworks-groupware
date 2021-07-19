<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>사내 채팅</title>
    
        <!-- css & 폰트 -->
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
    	
    	<style>

    	div a button{box-sizing: border-box;}

		.wrap1{
            margin: auto;
            margin-top: 50px;
		    height:700px;
		    width:1000px;
		    display:flex;
		    align-items:center;
		    border:1px solid rgb(218, 218, 218);
		    padding: 10px;
		    font-family: 'Noto Sans KR', sans-serif;
		}
		
		.wrap1>div{width: 100%;}
		
		.leftBox{width:30%; height:680px; float:left;}
		.rightBox{width:68%; height:680px;float: right; }
		
		
		.leftBox>div{width:100%;float:left;}
		.leftBox_1{height:8%; }
		.leftBox_2{height:6%; }
		.leftBox_3{height:86%;}
		
		.rightBox>div{width:100%; float:left;}
		.rightBox_1{height:10%;}
		.rightBox_2{height:70%;}
		.rightBox_3{height:15%;}
		
		
		.leftBox_1>button{
		    width:100%; 
		    height:95%; 
		    line-height: 2.5;
		    font-size: 16px;
		    font-weight: bold;
		
		}
		
		.leftBox_2>div, a{
		    float:left; 
		    margin-right: 2px; 
		    margin-top: 6px;
		}
		
		.leftBox_3>.chatList{width:100%; float:left;}
		.leftBox_3>.chatList>div, a{float:left;}
		.chatList{
		    text-align: center; 
		    line-height: 3.5; 
		    padding-top: 5px;
		    padding-bottom: 5px;
		    margin:0px; 
		    border-bottom: 1px solid rgb(218, 219, 219);
		}
		.chatList:hover{
		    background-color: rgb(233, 238, 240);
		    cursor: pointer;
		}
		.chatList_1{
		    height:50px; 
		    width:8%;
		    border-radius: 200px;
		}
		.chatList_2{ 
		    height:50px;
		    width: 66%;
		    text-align: left;
		    margin-left: 10px;
		    font-weight: 500;
		}
		.chatList_count>span{
		    font-size: 12px;
		    padding:6px;
		    border-radius: 300px;
		    color:white;
		    background-color: rgb(251, 25, 25);
		}
		.chatList_3>button{
		    font-size: 12px;
		    text-align: center;
		    line-height: 5;
		    height:50px;
		    width:10%;
		    font-weight: bolder;
		    background-color: transparent !important;
		    background-image: none !important;
		    border-color: transparent;
		    border: none;
		    color: #FFFFFF;
		    
		}
		.chatList_3>button:hover{
		    cursor: pointer;
		    text-decoration: line-through;
		    color:tomato;
		    font-weight: bolder;
		}
		
		.rightBox_1{
		    text-align: center;
		    line-height: 3.5;
		    font-size: 18px;
		    font-weight: bolder;
		}
		.messageBoxL .message_bubble{
		    background-color: rgb(236, 234, 234);
		    padding:10px;
		    line-height: 3.6;
		    border-radius: 12px;
		    margin-right: 5px;
		    margin-left:5px;
		    font-size: 16px;
		}
		.messageBoxR .message_bubble{
		    background-color: rgb(20, 125, 246);
		    color: white;
		    padding:10px;
		    line-height: 3.6;
		    border-radius: 12px;
		    margin-right: 5px;
		    margin-left:5px;
		    font-size: 16px;
		}
		.messageBoxL{
			padding-left:10px;
		}
		.messageBoxR{
			text-align:right;
			padding-right:10px;
		}
		
		.rightBox_2{margin-top: 20px;}
		.rightBox_3{width:100%;}
		.typing{width:80%; height:100%; float:left;}
		#message_content{
		    width:99%; 
		    height:100%;
		    text-align: left;
		    resize: none;
		}
		.typingB{width:20%; height:100%; float:right;}
		.typingB>button{
		    width:100%;
		    height:100%;
		}
		
		.modal{font-family: 'Noto Sans KR', sans-serif;}
		.table th{background-color:rgb(3, 119, 251);
		color:rgb(255, 255, 255);}
		
		#pagingArea{
		    margin: auto;
		    width:fit-content;
		}
    	</style>
    </head>
<body>
    <!-- 헤더바 -->
    <jsp:include page="../common/mainHeader.jsp"/>

    <!-- 메뉴바 -->
    <%-- <jsp:include page=""/> --%>

    <div class="wrap1">
        <div class="contents">
            <div class="leftBox">
                <div class="leftBox_1">
                    <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal2"> 채팅방 만들기</button>
                </div>
                <div class="leftBox_2">
                    <div><input type="text" class="form-control form-control-sm" placeholder="채팅방 제목을 입력하세요" style="width: 245px;"  name="keyword" value=""></div>
                    <a class="btn btn-outline-primary btn-sm" href="">검색</a>
                </div>
                
	                <div style="overflow:scroll; width:100%; height:85%;"> 
	                
	                <div class="leftBox_3" >
			                <c:forEach var="ch" items="${ list }">
		                <c:forEach var="cp" items="${ chatPersonList }">
			                	<c:if test="${ loginEmp.empNo eq cp.chatPerson && cp.chatNo eq ch.chatNo}">
					                    <div class="chatList">
					                        <div class="chatList_1">
					                            <span style="visibility" class="no">${ ch.chatNo }</span>
					                        </div>
					                        <div class="chatList_2">${ ch.chatName }</div>
					                        <div class="chatList_count">
					                        	<span>3</span>
					                        </div>
					                        <div class="chatList_3">
					                            <button type="button" data-toggle="modal" data-target="#myModal">❌</button>
					                        </div>
					                    </div>
				                 </c:if>
				             </c:forEach>  
		                </c:forEach>
		            </div>
				</div>
            </div>


            <div class="rightBox">

                <div class="rightBox_1">
                    <p id="chatRoomTitle"> OWORKS MESSAGE </p>
                    <hr>
                </div>
                
	            <div class="rightBox_2" id="rightBox_2" style="overflow:scroll; width:100%;">
		            <c:if test="${ empty loginEmp }">
						<script type="text/javascript">
						  alert("로그인 후 이용해 주세요.");
						  location.href="/oworks/";
						</script>
					</c:if>
					
					<div class="messageBoxL">
						<span class="message_bubble">오워크스 채팅 서비스입니다 🦊 </span>
						<span class="message_time"> 11:30am </span>
						<span class="message_read" style="color:grey"> 읽음 </span>
					</div>
					<div class="messageBoxR">
						<span class="message_read" style="color:grey"> 읽음 </span>
						<span class="message_time"> 11:30am </span>
						<span class="message_bubble">상대방을 초대하여 대화를 나누세요! 🐰</span>
					</div>
	            </div>
					
				<div class="rightBox_3">
		            <div class="typing">
		                <textarea class="form-control" name="message_content" id="message_content" placeholder="대화방을 클릭하여 대화를 시작하세요" readonly></textarea> 
		            </div>
		            <div class="typingB">
		                <button type="submit" class="btn btn-outline-secondary" disabled>대화방 클릭</button>
		            </div>
				</div>
            </div>
            
			<script>
			$(".chatList").click(function(){
				
				var no = $(this).find(".no").text();			// 클릭한 대화방 번호
				//console.log(no);
				var loginEmp = ${ loginEmp.empNo };
				//console.log(loginEmp);							// 로그인한 사람 사번
				var name = $(this).find(".chatList_2").text(); 	// 클릭한 대화방 이름
				
				$("#chatRoomTitle").text(name);
				
				change();
				
				$("#ee").val(no);
				
				
				$.ajax({
					url : "blist.ch",
					data : {chatNo : no},
					success : function(list){
						console.log(list);
						
						var value="";
						
						$.each(list, function(i, obj){
							'채팅 환영'
							if(obj.bubbleReceive == '${loginEmp.empNo}' && obj.bubbleMaker != '${loginEmp.empNo}'){
								value += '<div class="messageBoxL">'
								  	  +		'<span class="message_bubble">' + obj.bubbleContent + '</span>'
								 	  +		'<span class="message_time">' + obj.createTime + '</span>'
								 	  +		'<span class="message_read" style="color:grey"> 읽음 </span>'
								 	  +	'</div>'
								 	  
							}else if(obj.bubbleReceive == '${loginEmp.empNo}' && obj.bubbleMaker == '${loginEmp.empNo}'){
								value += '<div class="messageBoxR">'
									  +		'<span class="message_read" style="color:grey"> 읽음 </span>'
									  +		'<span class="message_time">' + obj.createTime + '</span>'
								 	  +		'<span class="message_bubble">' + obj.bubbleContent + '</span>'
								 	  +	'</div>'
							};
							
							$(".rightBox_2").html(value);
							
						})
					}, error : function(){
						console.log();
					}
				
				})
				
			})
				
			function change(){
				var a = '';
					a += '<div class="typing">'
				      + '<textarea class="form-control" name="message_content" id="message_content" placeholder="메시지를 입력하세요"></textarea>' 
		              + '</div>'
		              + '<div class="typingB">'
		              + '<button type="submit" class="btn btn-outline-primary" id="subB">전송하기</button>'
		              + '<input type="hidden" id="ee" value="ㅇㅇㅇ">'
		              + '</div>'
		              
		        $(".rightBox_3").html(a);
		              
		              
				$("#subB").click(function() {
					
					var no0 = $(this).next().val();
					var no = parseInt(no0);
					console.log(no);		// 현 채팅방 번호
					if($("#message_content").val().trim().length != 0){
						
						$.ajax({
							url : "insert.ch",
							data : {
								refChatNo : no,
								bubbleMaker :
							}
						})

					    
					}else {
						alertify.alert("공백 외의 메시지를 입력해 주세요");
					}
					
				    
	
				});
			}
				
				



			
			
			
			
			</script>
			
			<script langauge="javascript">
				var counter = 0;
				window.setInterval("refreshDiv()", 5000);
				function refreshDiv(){
				counter = counter + 1;
				}	
			</script>


        </div>


    </div>

    <!-- 삭제 모달 -->              
        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
            <div class="modal-content">
                    
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">채팅방 나가기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                        
                <!-- Modal body -->
                <div class="modal-body">
                    정말 채팅방을 나가시겠습니까?
                </div>
                        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <a class="btn btn-danger btn-sm" href="">나가기</a>
                    <button type="reset" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                </div>
                      
            </div>
            </div>
        </div>


        <!-- 채팅방 만들기 모달 -->              
        <!-- The Modal -->
        <div class="modal" id="myModal2">
            <div class="modal-dialog">
            <div class="modal-content">
                    
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">채팅방 만들기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                        
                <!-- Modal body -->
                <div class="modal-body">
                    <table class="table" width="100%;" style="text-align:center">
                        <tr>
                            <th width="15%">선택</th>
                            <th width="29%">이름</th>
                            <th width="28%">부서</th>
                            <th width="28%">직급</th>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>
                        <tr>
                            <td><input type="checkBox"></td>
                            <td>강가나</td>
                            <td>개발팀</td>
                            <td>대리</td>
                        </tr>

                    </table>

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
                </div>
                        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" data-dismiss="modal">초대하기</button>
                    <button type="reset" class="btn btn-secondary" data-dismiss="modal">취소</button>
                </div>
                      
            </div>
            </div>
        </div>

</body>
</html>