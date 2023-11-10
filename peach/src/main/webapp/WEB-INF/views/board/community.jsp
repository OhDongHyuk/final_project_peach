<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<style>
	.community-category {

	 	justify-content: center;
	 	width: 100px;
	}

	.community-title{
		text-align: center;
	}
	
	.community-list{
		 display: flex;
         width: 800px;
         height: 600px;
         border: 1px solid black;
         margin: 0 auto;
	}
	.form-control{
		width: 400px;
	}
	.Cbtn{
		width: 60px;
		height: 30px;
		text-align: center;
		line-height: 30px;
		border-radius: 5px;
		margin-left: 1020px;
		margin-top: 10px;
		margin-bottom: 20px;
		background-color: gray;
	}
	.CTR{
		text-align: center;
	}
</style>
<title>피치 게시판</title>
</head>
<body>
	<br>
	<br>
	<h1 class="community-title">피치 게시판</h1>
	<div class="community-category">
		<ul class="pagination pagination">
		<li class="page-item"><a class="page-link" href="#">전체</a></li>
		  <li class="page-item"><a class="page-link" href="#">소모임</a></li>
		  <li class="page-item"><a class="page-link" href="#">맛집탐방</a></li>
		  <li class="page-item"><a class="page-link" href="#">무료나눔</a></li>
		</ul>
	</div>
	<br>
	
	<!-- 수정필요(커뮤니티용 cri 추가) -->
	<form action="<c:url value='/board/community'/>" method="get">
		<div class="com-group mb-3 d-flex justify-content-center">
			<select class="cc-control mb-1" name="t">
				<option value="all" <c:if test="${cpm.cri.t == 'all'}">selected</c:if>>전체</option>
				<option value="total" <c:if test="${cpm.cri.t == 'total'}">selected</c:if>>제목 + 내용</option>
				<option value="writer" <c:if test="${cpm.cri.t == 'writer'}">selected</c:if>>작성자</option>
			</select>
			<input type="text" class="form-control" name="s" value="${cpm.cri.s}">
			<button class="btn btn-outline-dark">검색</button>
		</div>
	</form>
	
	<div class="community-list">
	<table class="table table-Secondary table-hover">
		<thead>
			<tr class="CTR">
				<th>${communityALLList}</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>추천</th>
				<th>조회수</th>
				<th>댓글수</th>
			</tr>
		</thead>
		<tbody>
			 <c:forEach items="${list}" var="list">						
				<tr class="CTR">
					<td>${list.co_num}</td>
					<!--communityList 추가 필요-->
					<td><a href="<c:url value='/board/communityList/${community.co_num}'/>">${list.co_title }</a></td>
					<td>${list.me_nick}</td>
					<td>${list.co_date}</td>
					<td>${list.co_like}</td>
					<td>${list.co_views}</td>
					<td>${list.co_reply}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<ul class="pagination justify-content-center">
		<c:if test="${cpm.prev}">
			<li class="page-item">
				<a class="page-link" 
					href="<c:url value='/board/community${cpm.cri.getUrl(cpm.startPage-1) }'/>">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${cpm.startPage}" end="${cpm.endPage}" var="i">
			<li class="page-item <c:if test='${cpm.cri.page == i }'>active</c:if>">
				<a class="page-link" 
					href="<c:url value='/board/community${cpm.cri.getUrl(i)}'/>">${i}</a>
			</li>
		</c:forEach>
		<c:if test="${cpm.next}">
			<li class="page-item">
				<a class="page-link" 
					href="<c:url value='/board/community${cpm.cri.getUrl(cpm.endPage+1) }'/>">다음</a>
			</li>
		</c:if>
	</ul>
	<a href="<c:url value='/board/communityInsert'/>" class="Cbtn"><P style="color:black">글쓰기</P></a>
</body>
</html>
