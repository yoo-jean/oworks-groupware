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

<!-- include summernote css/js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous" defer></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" defer>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous" defer></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet" defer>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js" defer></script>

<!--자동완성  -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    
<style>
    body{
        color: #696969;

    }
    .mailWrap{
        width: 80%;
        margin: auto;
    }
    table tr th{
        text-align: center;
    }
    .mailText{
        width: 700px;
    }
    .mailTable{
        height: 140px;
    }
    .subBtn{
            width: 70px;
            height: 35px;
            border: none;
            background: #2574DB;
            color: white;
            outline: none;
            cursor: pointer;
            border-radius: 4px;
            border: solid 2px #2574DB;
            text-align: center;
        }
        .subBtn:hover {
            background: white;
            color:#2574DB;
            font-weight:500;
            text-decoration: none;
        }

</style>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
    <jsp:include page="../common/mainMenubar.jsp"/>

    <!-- 메인 -->
    <div class="mailWrap" style="position: absolute; left: 215px; top: 80px; width: 1100px;"><br style="clear: both;">
        <h2 style="margin-bottom: 30px;"><u>메일 작성</u></h2>
        
        <div class="mailContent">
            <form action="" id="mailForm" method="post" enctype="multipart/form-data" autocomplete="off">
                
                <div class="mailData" style="margin-bottom: 10px;">
                    <table class="mailTable">
                        <tr >
                            <th style="width: 110px;">제목</th>
                            <td style="width: 800px;"><input type="text" class="mailText" id="mailTitle" name="mailTitle" placeholder="제목을 입력해주세요" required></td>
                        </tr>
                        <tr>
                            <th>받는 사원</th>
                            <td><input type="text" class="mailText" id="rempNo" name="rempNo" value="" placeholder="받는 사원을 입력해주세요."></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="checkbox" id="mailToMe" name="mailtoMe"><label for="mailToMe" > &nbsp; 나에게 메일 쓰기</label></td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td><input type="file" id="mailFile" name="mailFile" multiple="multiple" class="mail_input"></td>
                        </tr>
                    </table>
                    
                </div>

            

                <div class="mailData">
                    <textarea id="summernote" name="editordata"></textarea>
                </div>
                <br>

                <div class="mailBtn" align="center">
                    <button type="submit" class="btn btn-primary subBtn">전송</button>
                    <button type="button" class="btn btn-secondary" style=" width: 70px; height: 35px;">취소</button>
                </div>                

            </form>
        </div>
        <script>
            $(document).ready(function() {
			      $('#summernote').summernote({
			    	  toolbar: [
			    		    ['style', ['bold', 'italic', 'underline', 'clear']],
			    		    ['font', ['strikethrough']],
			    		    ['fontsize', ['fontsize']],
			    		    ['color', ['color']],
			    		    ['para', ['ul', 'ol', 'paragraph']],
			    		    ['height', ['height']],
			    		    ['Insert',['picture','link','video','table']],
			    		    ['Misc',['codeview']]
			    		  ],
			    	disableDragAndDrop: true,
			    	placeholder: '내용을 입력해주세요.',
			        height: 400,
			        minHeight: 400,
			        focus: true,
			        callbacks: {
			        	onImageUpload: function(files, editor, welEditable) {
				            for (var i = files.length - 1; i >= 0; i--) {
				            	sendFile(files[i], this);
				            }
				        }
	               }
			      });
			    });
        </script>
        



    </div>

    
    
	<script>
    	$(document).ready(function() {
        	$('#summernote').summernote();
    	});

	</script>   
</body>
</html>