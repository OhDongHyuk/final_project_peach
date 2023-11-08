<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<style>
	.community-category {
	 	margin-left: 37%;
	}

	.pagination{

	}

	ul.Cpagination {
	  display: flex;
	  flex-direction: row; 
	  list-style: none; 
	}
		
	ul.Cpagination li {
	   margin-right: 10px; 
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
		<ul class="Cpagination pagination">
		<li class="Cpage-item"><a class="Cpage-link" href="#">전체</a></li>
		  <li class="Cpage-item"><a class="Cpage-link" href="#">소모임</a></li>
		  <li class="Cpage-item"><a class="Cpage-link" href="#">맛집탐방</a></li>
		  <li class="Cpage-item"><a class="Cpage-link" href="#">무료나눔</a></li>
		</ul>
	</div>
	<br>
	
	<!-- 수정필요(커뮤니티용 cri 추가) -->
	<form action="<c:url value='/board/list'/>" method="get">
		<div class="com-group mb-3 d-flex justify-content-center">
			<select class="cc-control mb-1" name="t">
				<option value="all" <c:if test="${pm.cri.t == 'all'}">selected</c:if>>전체</option>
				<option value="total" <c:if test="${pm.cri.t == 'total'}">selected</c:if>>제목 + 내용</option>
				<option value="writer" <c:if test="${pm.cri.t == 'writer'}">selected</c:if>>작성자</option>
			</select>
			<input type="text" class="form-control" name="s" value="${pm.cri.s}">
			<button class="btn btn-outline-dark">검색</button>
		</div>
	</form>
	
	<div class="community-list">
	<table class="table table-Secondary table-hover">
		<thead>
			<tr class="CTR">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>추천</th>
				<th>댓글수</th>
			</tr>
		</thead>
		<tbody>						
			<!-- var==꺼냈을 때 이름 -->
			<c:forEach items="${list}" var="board" varStatus="vs">
				<tr>
					<td>${pm.totalCount - vs.index}</td>
					<td><a href="<c:url value='/board/detail/${board.bo_num }'/>">${board.bo_title }</a></td>
					<td>${board.bo_me_id }</td>
					<td>${board.bo_up }/${board.bo_down }</td>
					<td>${board.bo_views}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<a href="<c:url value='/board/communityInsert'/>" class="Cbtn"><P style="color:black">글쓰기</P></a>

</body>
</html>
