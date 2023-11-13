<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .co_de {
            font-family: 'Arial', sans-serif;
            margin: 20px;
            width: 750px;
             margin: 0 auto;
        }

        .CDdiv {
            margin-bottom: 10px;
        }

        .co_de_title {
            font-size: 24px;
            font-weight: bold;
        }

        .co_de_info {
            font-size: 14px;
            color: #666;
        }

        .co_de_write {
            border: 1px solid black;
            margin-bottom: 20px;
            height: 300px;
        }

        .co_de_comment {
            border: 1px solid black;
            height: 60px;
        }

        .CDbtn {
            width: 80px;
            height: 40px;
            /* 필요한 스타일 추가 */
        }
    </style>
    <title>커뮤니티 세부 정보</title>
</head>
<body>
	<br>
	<div class="co_de CDdiv">
	    <div class="co_de_title CDdiv">제목: ${detail.co_title}</div>
	    <div class="co_de_info CDdiv">작성자: ${writer.me_nick} | 작성일: ${detail.co_date}</div>
	    <div class="co_de_write">
	 	  	<!-- 글 내용 -->
	 	   <c:if test="${empty detail.co_info}">
      		  <p>내용이 없습니다.</p>
   		   </c:if>
	   	 		<div class="co_de_content CDdiv">${detail.co_info}</div>
		</div>
		<c:if test="${not empty reList}">
		    <div class="co_de_comments">
		        <c:forEach var="reList" items="${reList}">
		            <div class="co_de_comment">
		                작성자: ${reList.replyWriter}
		                내용: ${reList.re_info}
		            </div>
		        </c:forEach>
		    </div>
		</c:if>
		<br>
		<form action="<c:url value='/board/communityDetail'/>" method="post" enctype="multipart/form-data">
		    <div class="form-group">
			<textarea id="summernote" name="re_info" class="form-control" rows="4"></textarea>
			</div>
			<input type="hidden" name="co_num" value="${detail.co_num}">
			<button class="CDbtn">등록</button>
		</form>
	    <button class="report-button">신고</button>
	</div>

    <!-- summernote 초기화 스크립트 -->
    <script>
        $(document).ready(function() {
            $('#summernote').summernote();
        });
    </script>
</body>
</html>
