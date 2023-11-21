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
	
	.co_city {
		text-align: center;
	}
	
	.community-title{
		text-align: center;
		color: #ff007f; /* 분홍색 계열의 글자색 */
	}
	
	.community-list{
         width: 800px;
         margin: 0 auto;
         background-color: #ffe6f7; /* 분홍색 계열의 배경색 */
	}
	.form-control{
		width: 400px;
		height: auto;
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
		background-color: #ff007f; /* 분홍색 계열의 배경색 */
		color: white;
	}
	.CTR{
		text-align: center;
		 background-color: #ffd9eb; /* 분홍색 계열의 배경색 */
	}
	.CTR2{
		text-align: center;
		 background-color: #ffccdd; /* 분홍색 계열의 배경색 */
	}

	.community_item{
		 display: flex;
  		 justify-content: center;
	}
	.comList{
		display: flex;
    	padding-left: 0;
   	    list-style: none;
   	    border-radius: 0.25rem;
	}
	.cc-control{
		height: auto;

	}
	.form-control{
		width: 400px;
		height: auto;
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
		background-color: #ff007f; /* 분홍색 계열의 배경색 */
		color: white;
	}
	.CTR{
		text-align: center;
		 background-color: #ffd9eb; /* 분홍색 계열의 배경색 */
	}
	.CTR2{
		text-align: center;
		 background-color: #ffccdd; /* 분홍색 계열의 배경색 */
	}

	.community_item{
		 display: flex;
  		 justify-content: center;
	}
	.comList{
		display: flex;
    	padding-left: 0;
   	    list-style: none;
   	    border-radius: 0.25rem;
	}
	.cc-control{
		height: auto;

	}
	.post-item{
		width: 800px;
		border-bottom: 1px solid #ccc;
		color: grey;
		margin-bottom: 15px;
	}
	.item-category{
		background: #f76076;
		padding: 1px 5px;
		border-radius: 5px;
		width: max-content;
		color: #fff;
		font-size: 13px;
	}
	.item-title{
		color: #000;
		font-size: 18px;
	}
	.item-content{
		font-size: 16px;
	}
	.item-like-comment{
	}
	.item-others-box{
		margin-bottom: 10px;
		display: flex;
	}
	.item-others{
		margin-right: auto;
	}
	a {
		text-decoration: none;
		color: #000;
	}
	a:hover {
		text-decoration: none;
		cursor: pointer;
		color: #000;
	}
</style>
<title>피치 게시판</title>
</head>
<body>
	<br>
	<br>
	<h1 class="community-title">우리동네 게시판</h1>
	<br>
	<p class="co_city">${list[0].ci_large} ${list[0].ci_medium} ${list[0].ci_small}</p>
	<br>
	<br>
		<form action="<c:url value='/board/community'/>" method="get">
			<div class="com-group mb-5 d-flex justify-content-center">
				<select class="cc-control" name="c">
					<option value="선택">선택</option>
					<option value="소모임" <c:if test="${cpm.cri.c == 'small'}">selected</c:if>>소모임</option>
					<option value="맛집탐방" <c:if test="${cpm.cri.c == 'restaurant'}">selected</c:if>>맛집탐방</option>
					<option value="무료나눔" <c:if test="${cpm.cri.c == 'share'}">selected</c:if>>무료나눔</option>
				</select>
				<select class="cc-control" name="t">
					<option value="all" <c:if test="${cpm.cri.t == 'all'}">selected</c:if>>전체</option>
					<option value="total" <c:if test="${cpm.cri.t == 'total'}">selected</c:if>>제목 + 내용</option>
					<option value="writer" <c:if test="${cpm.cri.t == 'writer'}">selected</c:if>>작성자</option>
				</select>
				<input type="text" class="form-control" name="s" value="${cpm.cri.s}">
				<button class="btn btn-outline-dark">검색</button>
			</div>
		</form>
	
		<div class="community_item">
			<div class="community-list">
			<c:if test="${not empty list}">
			<c:forEach items="${list}" var="list">	
				<a href="<c:url value='communityDetail/${list.co_num }'/>">
				<div class="post-item">
					<div class="item-category">
						${list.cc_name}
					</div>
					<div class="item-title">
						${list.co_title }
					</div>
					<div class="item-content">
						${list.co_info }
					</div>
					<div class="item-others-box">
						<div class="item-others">
							${list.me_nick } · 2일전 · 조회 ${list.co_views}						
						</div>
						<div class="item-like-comment">
							추천 ${list.co_like} · 댓글 ${list.co_reply}
						</div>
					</div>
				</div>
				</a>
				</c:forEach>
				</c:if>
				<c:if test="${empty list}">
							<h1>등록된 게시물이 없습니다.</h1>
				</c:if>
			</div>
		</div>			
	<ul class="pagination justify-content-center comList">
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
	<a href="<c:url value='/board/communityInsert'/>" class="Cbtn">글쓰기</a>
</body>
<script>
	<!-- 
	$('[name=co_category]').change(function(){
		 
	});-->
	
</script>
</html>
