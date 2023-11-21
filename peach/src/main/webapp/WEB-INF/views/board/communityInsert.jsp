<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<style>
	.Cinsert{
		height: 800px;
		width: 750px;
		text-align: center;
		margin-left: 280px;
		margin-top: 30px
	}
</style>
<title>게시글 등록</title>
</head>
<body>
	<div class="Cinsert">
	<h1>게시글 등록</h1>
		<br>
		<form action="<c:url value='/board/communityInsert'/>" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<input class="form-control" placeholder="제목" name="co_title">
			</div>
			<p>*제목은 반드시 입력해야 합니다.</p>
			<select name="CICategory" class="form-control">
			<option value="0">카테고리 선택</option>
			<c:forEach var="CCNames" items="${CCNames}" varStatus="status">
   				 <option value="${CCNames}">${CCNames}</option>
			</c:forEach>
			</select>
			<p>*카테고리는 반드시 선택해야 합니다.</p>
			<br>
			<div class="form-group">
				<textarea class="form-control" placeholder="내용" name="co_info" style="min-height: 400px"></textarea>
			</div>
			<input type="file" class="form-control" name="fileList">
			<br>
			<button class="btn btn-danger">게시글 등록</button>
		</form>
	</div>
</body>
</html>
