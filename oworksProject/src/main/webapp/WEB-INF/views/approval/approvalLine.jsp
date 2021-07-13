<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="resources/css/approval/approvalLine.css">

<!-- JSTREE 스크립트-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

</head>
<body>
  <!--결재선 클릭시 생기는 div-->
  	
  <div class="portlet_tabpart02" >
    <div class="portlet_tabpart02_top">
      <p id="showAprLine">
        <span class="spanline">결재선</span>
      </p>
    </div>
  </div>

  <div class="approvallist">
    <div id="Lineinfo">
      <table>
        <tr >
          <td id="Lineinfo_td">
            <div class="port_tabpart01">
              <div class="portlet_tabpart01_top">
                <p>
                  <span>조직도</span>
                </p>
              </div>
            </div>

            <div id="organlinetab">
              <table style="margin-left: 0px;">
                <tbody style="margin-left: 0px;">
                  <tr>
                    <td style="vertical-align: top;">
                      <div id="treeview">
                        <div id="frametreeview">
                          <ul class="tree">
                            <li>
                              <input type="checkbox" id="root">
                              <label for="root">OWORKS</label>
                              <ul>
                                <li id= "btn1"><a onclick = "selectDepartmentList();">개발부</a></li>
                                <li id= "btn2"><a onclick = "selectDepartmentList();">인사부</a></li>
                                <li id= "btn3"><a onclick = "selectDepartmentList();">영업부</a></li>
                                <li id= "btn4"><a onclick = "selectDepartmentList();">기획부</a></li>
                                <li id= "btn5"><a onclick = "selectDepartmentList();">마케팅부</a></li>  
                              </ul>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </td>
                  </tr>
                   
                  <tr>
                    <td>
                      <div class="border_gray">
                        <div id="userlist">
                          <table id="lvuserlist"  class="mainlist_free">
                            <thead id="lvuserlist_thead">
                              <tr id="lvuserlist_th" selected="false">
                                <th width="80px">사원번호</th>
                                <th width="70px">성명</th>
                                <th width="100px">부서</th>
                                <th width="60px">직급</th>
                              </tr>
                            </thead>

                            <tbody>

                            </tbody>
                          </table>
                        </div>
                      </div>
                      
                    </td>
                  </tr>

                </tbody>
              </table>
            </div>
          </td>
		  
	      <!-- 부서사원들 ajax 조회 -->
	      <script>
            function selectDepartmentList(){
              $.ajax({
                url : "dlist.ap",
                dataType : "json",
                async : false, 
                success: function(list){
		        var value =  [];
                  $.each(list, function(i, obj){
                    if(obj.deptName == '개발부'){
                      
                      value += "<tr>"
                            + "<td class=empNo>" + obj.empNo + "</td>"
                            + "<td class=ename>" + obj.empName + "</td>"
                            + "<td class=dept>" + obj.deptName + "</td>"
                            + "<td class=job>" + obj.jobName + "</td>"
                            + "</tr>";
                            
                    }
                  })
                  
                  $("#lvuserlist tbody").html(value);
                  
                }, error:function(){
                  console.log("부서원 조회용 ajax 실패!");
                }
              });
            }
	  			
            $(function(){
              $(document).on("click", "#btn2", function(){
                $.ajax({
                  url : "dlist.ap",
                  success: function(list){
                    //console.log(list);
                    var value = "";
                    $.each(list, function(i, obj){
                      if(obj.deptName == '인사부'){
                        
                        value += "<tr>"
                              + "<td class=empNo>" + obj.empNo + "</td>"
                              + "<td class=ename>" + obj.empName + "</td>"
                              + "<td class=dept>" + obj.deptName + "</td>"
                              + "<td class=job>" + obj.jobName + "</td>"
                              + "</tr>";
                      }
                    })
                    
                    $("#lvuserlist tbody").html(value);
                    
                  }, error:function(){
                    console.log("부서원 조회용 ajax 실패!");
                  }
                });
              })
            })
			  	
            $(function(){
              $(document).on("click", "#btn3", function(){
                $.ajax({
                  url : "dlist.ap",
                  success: function(list){
                    //console.log(list);
                    var value = "";
                    $.each(list, function(i, obj){
                      if(obj.deptName == '영업부'){
                        
                        value += "<tr>"
                              + "<td class=empNo>" + obj.empNo + "</td>"
                              + "<td class=ename>" + obj.empName + "</td>"
                              + "<td class=dept>" + obj.deptName + "</td>"
                              + "<td class=job>" + obj.jobName + "</td>"
                              + "</tr>";
                      }
                    })
                    
                    $("#lvuserlist tbody").html(value);
                    
                  }, error:function(){
                    console.log("부서원 조회용 ajax 실패!");
                  }
                });
              })
            })
			  	
            $(function(){
              $(document).on("click", "#btn4", function(){
                $.ajax({
                  url : "dlist.ap",
                  success: function(list){
                    //console.log(list);
                    var value = "";
                    $.each(list, function(i, obj){
                      if(obj.deptName == '기획부'){
                        
                        value += "<tr>"
                              + "<td class=empNo>" + obj.empNo + "</td>"
                              + "<td class=ename>" + obj.empName + "</td>"
                              + "<td class=dept>" + obj.deptName + "</td>"
                              + "<td class=job>" + obj.jobName + "</td>"
                              + "</tr>";
                      }
                    })
                    
                    $("#lvuserlist tbody").html(value);
                    
                  }, error:function(){
                    console.log("부서원 조회용 ajax 실패!");
                  }
                });
              })
            })
			  	
            $(function(){
              $(document).on("click", "#btn5", function(){
                $.ajax({
                  url : "dlist.ap",
                  success: function(list){
                    //console.log(list);
                    var value = "";
                    $.each(list, function(i, obj){
                      if(obj.deptName == '마케팅부'){
                        
                        value += "<tr>"
                              + "<td class=empNo>" + obj.empNo + "</td>"
                              + "<td class=ename>" + obj.empName + "</td>"
                              + "<td class=dept>" + obj.deptName + "</td>"
                              + "<td class=job>" + obj.jobName + "</td>"
                              + "</tr>";
                      }
                    })
                    
                    $("#lvuserlist tbody").html(value);
                    
                  }, error:function(){
                    console.log("부서원 조회용 ajax 실패!");
                  }
                });
              })
            })

   	   	  </script>
		  
          		  
		  	  
          <td id="sarrowtd">
            <span id="sarrow">
              <br>
              <br>
              <br>
              <br>
              <a class="btn btn-outline-primary btn-sm" style="font-size: 12px; font-weight: bold;" onclick="approvalLine();" id="approvalLine">결재</a>
              <br>
              <br>
              <a class="btn btn-outline-primary btn-sm" style="font-size: 12px; font-weight: bold;" onclick="referLine();" id="referLine">참조</a>
              <br>
              <br>
              <br>
              <br>
              <br>
            </span>
          </td>
          
          
          <td id="rightapp">
            <table id="tempTb" style="margin-left: 0px;">
              <tbody>
                <tr>
                  <td style="vertical-align: top;">
                    <h2 class="h2_dot">결재선 리스트
                      <div style="text-align:right; margin-top: -23px;">
                          <span>
                            <img src="" alt="">
                          </span>
                        </img>
                      </div>
                    </h2>

                    <div class="border_gray">
                      <div id="aprline">
                        <table id="lvaprline">
                          <thead id="lvaprline_thead">
                            <tr>
                              <th width="55px">순번</th>
                              <th width="140px">성명</th>
                              <th width="70px">직급</th>
                              <th width="150px">부서</th>
                              <th width="140px">결재유형</th>
                              <th width="90px">결재상태</th>
                            </tr>
                          </thead>
                          <tbody id="lvaprlineBody">
                            <tr>
                              <td align="left" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" name=1 id="num" value=1>1</td>
                              <td align="left" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${loginEmp.empName }</td>
                              <td align="left" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${loginEmp.jobName }</td>
                              <td align="left" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${loginEmp.deptName }</td>
                              <td align="left" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">결재</td>
                              <td>대기</td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </td>
                </tr>

                <tr>
                  <td class="appstar">

                  </td>
                </tr>

                <tr>
                  <td>
                      <h2 class="h2_dot" style="vertical-align: top;">참조</h2>
                      <div class="border_gray">
                        <div id="tbline">
                          <table>
                            <thead>
                              <tr>
                                <th width="150px">성명</th>
                                <th width="150px">직급</th>
                                <th width="280px">부서</th>
                              </tr>
                            </thead>
                            <tbody id = "referBody">

                            </tbody>
                          </table>
                        </div>
                      </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
         
        
        <!-- ajax로 불러온 데이터 부서원 클릭시 css 변경 및 리스트 이동-->
          	<script>
          		var empNo = "";
            	var name = "";
            	var dept = ""
            	var job = ""
            	var num = 1;
            	$(document).on("click", "#lvuserlist tbody tr", function(){
            	
            		empInfo = $(this).text();
            		empNo = $(this).children(".empNo").html();
            		name = $(this).children(".ename").html();
            		dept = $(this).children(".dept").html();
            		job = $(this).children(".job").html();
				
                	$(this).css("cursor", "pointer");
                	$(this).css('background-color', 'gray');
                	$(this).css('color', 'white');
            	
          		});

    			
     	   		var tdArr = new Array(['${loginEmp.empName}', '${loginEmp.jobName}', '${loginEmp.deptName}', '${loginEmp.empNo}', '결재', '대기']);
		   		var lineInfo = new Array();
		   		var addEmpNo = new Array([${loginEmp.empNo}]);
		   		var addEmpName = new Array(['${loginEmp.empName}']);
		   		var addJob = new Array(['${loginEmp.jobName}']);
		   		var lineNo = new Array();	// 사원번호 담기
		   		var lineName = new Array(); // 사원이름 담기
		   		var lineJob = new Array();  // 직급이름 담기
		   		//var apname = "";			
           		
		   		<!--결재선에 넣기 -->
		   		function approvalLine(){
                	var objRow;
                	objRow = document.all("lvaprlineBody").insertRow();

                	objRow.innerHTML = ++num;
                
	                var objCell_name = objRow.insertCell();                
					objCell_name.innerHTML = name;
				
	                var objCell_job = objRow.insertCell();   
	                objCell_job.innerHTML = job; 
	                
	                var objCell_dept = objRow.insertCell();
	                objCell_dept.innerHTML = dept;
					
	                var objCell_type = objRow.insertCell();
	                objCell_type.innerHTML = '결재';
	                
	                var objCell_status = objRow.insertCell();
					objCell_status.innerHTML = '대기';   
					
					var empInfo = [name, job, dept, empNo, '결재', '대기'];
					
					var i = 0;
					for(var i=0; i<empInfo.length; i++){
						lineNo = parseInt(empInfo[3]);
						lineName = empInfo[0];
						lineJob = empInfo[1];
					}
					
					// 부서원 정보 배열에 담기
					tdArr.push(empInfo);
					// 사원번호 배열에 담기
					addEmpNo.push(lineNo);
					// 사원이름 담기
					addEmpName.push(lineName);
					// 직급이름 담기
					addJob.push(lineJob);
					
					/* 선택된 결재자수 만큼만 배열에 담기
					for(var i=0; i<tdArr.length; i++){
						lineInfo = tdArr[i];
						console.log("test : " + lineInfo);
					}
					*/
					
          		}
         		
           		var referInfo = new Array();
           		var referAdd = new Array();
           		var referNo =[];					// 참조하는 사원번호 배열로 담기
           		var referName = new Array();		// 참조하는 사원이름 배열로 담기
           		var refer = new Array();
           		var lineReferNo = new Array();		// 참조하는 사원번호
           		var lineReferName = new Array();	// 참조하는 사원이름
           		
           		<!-- 참조선에 넣기 -->
           		function referLine(){
                	var objRow;
                	objRow = document.all("referBody").insertRow();

                	objRow.innerHTML = name;
                
	                var objCell_job = objRow.insertCell();   
	                objCell_job.innerHTML = job; 
	                
	                var objCell_dept = objRow.insertCell();
	                objCell_dept.innerHTML = dept;
					
					var referInfo = [name, job, dept, empNo];
					
					var i = 0;
					for(var i=0; i<empInfo.length; i++){
						lineReferNo = parseInt(referInfo[3]);
						lineReferName = referInfo[0];
					}
					
					
					// 부서원 정보 배열에 담기
					referAdd.push(referInfo);
					// 사원번호 배열에 담기
					referNo.push(lineReferNo);
					// 사원이름 배열에 담기
					referName.push(lineReferName);
					
					/*
					for(var i=0; i<referAdd.length; i++){
						refer = referAdd[i];
						console.log("refertest : " + refer);
					}
					*/
           		}
        	</script>
      </table>
    </div>
  </div> 
</body>
</html>