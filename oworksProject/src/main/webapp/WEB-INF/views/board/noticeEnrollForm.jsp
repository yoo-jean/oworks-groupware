<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- 썸머노트 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/summernote/summernote-lite.css">
<script src="${pageContext.servletContext.contextPath}/resources/summernote/summernote-lite.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  
<style>
    .content{
        width:80%;
        margin:auto;
    }
    .innerOuter{
        border:1px solid lightgray;
        width:100%;
        margin:auto;
        padding:5% 15%;
        background:white;
        border-radius: 6px;
    }
    
    #updateForm>table{width:100%;}
    #updateForm>table *{ margin:5px;}
</style>
</head>
<body>
	
    <!-- 이쪽에 메뉴바 포함 할꺼임 -->

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <br>

            <form id="updateForm" method="post" action="insert.no" enctype="">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="noticeTitle" value="${n.noticeTitle }" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="10002" name="empNo" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td>
                            <input type="file" id="upfile" class="form-control-file border" name="">
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="summernote" required name="noticeContent" id="content" style="resize:none;">${n.noticeContent }</textarea></th>
                    </tr>
                </table>
                <br>
                
				<!-- 썸머노트 script -->
				<script>
				$(document).ready(function() {
				
					var toolbar = [
						    // 글꼴 설정
						    ['fontname', ['fontname']],
						    // 글자 크기 설정
						    ['fontsize', ['fontsize']],
						    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
						    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
						    // 글자색
						    ['color', ['forecolor','color']],
						    // 표만들기
						    ['table', ['table']],
						    // 글머리 기호, 번호매기기, 문단정렬
						    ['para', ['ul', 'ol', 'paragraph']],
						    // 줄간격
						    ['height', ['height']],
						    // 그림첨부, 링크만들기, 동영상첨부
						    ['insert',['picture','link','video']],
						    // 코드보기, 확대해서보기, 도움말
						    ['view', ['codeview','fullscreen', 'help']]
						  ];
				
					var setting = {
				            height : 500,
				            minHeight : null,
				            maxHeight : null,
				            focus : true,
				            lang : 'ko-KR',
				            toolbar : toolbar,
				            callbacks : { //여기 부분이 이미지를 첨부하는 부분
				            onImageUpload : function(files, editor,
				            welEditable) {
				            for (var i = files.length - 1; i >= 0; i--) {
				            uploadSummernoteImageFile(files[i],
				            this);
				            		}
				            	}
				            }
				         };
				
				        $('.summernote').summernote(setting);
				        });
						

				</script>
				
                <div align="center">
                    <button type="button" class="btn btn-outline-dark btn-sm">취소하기</button>
                    <button type="submit" class="btn btn-dark btn-sm">작성하기</button>
                </div>
            </form>
        </div>
        <br><br>
    </div>
  
    <!-- 이쪽에 푸터바 포함할꺼임 -->
</body>
</html>