<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<style>
</style>
<title></title>
</head>
<body>
	<div>제목 : ${Detail.co_title}</div>
	<div>작성자 : </div>
	<div>작성일 : ${Detail.co_date}</div>
	<div>${Detail.co_info}</div>
	<div>댓글</div>
	<button>신고</button>
</body>
</html>
