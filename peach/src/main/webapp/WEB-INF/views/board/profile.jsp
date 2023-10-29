<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>프로필</title>
</head>
<style>
	.profile-container {
		margin:0 auto; 
		min-width: 1000px;
		max-width: 1000px;
		display: flex;
		border-style: dashed;
		border-width: 1px;
		border-color: gray;
		border-radius: 20px;
	}
	.profile-imgbox {
		flex: 00 310px;
		background-color: aqua;
		text-align: center;
		border-right: dashed;
		border-width: 1px;
		border-color: gray;
		border-radius: 20px 0 0 20px;
	}
	.btn-profile {
		width: 150px;
		margin: 15px auto;
	}
	.example {
		height: 120px;
		width: 120px;
		margin: 15px auto;
		margin-top: 50px;
	}
	.profile-name {
		margin: 15px 0;
	}
	.profile-Detail {
		
		flex: 1;
	
	}
	.profile-product {
		margin:0 auto; 
		min-width: 1000px;
		max-width: 1000px;
		background-color: green;
		display: flex;
		border-style: dashed;
		border-width: 1px;
		border-color: gray;
		border-radius: 20px;
	}
	.profile-product-list{
		display:flex;
		flex-direction:row;
		align-items: center;
		padding: 20px;
		
	}
	.example2 {
		height: 100px;
		width: 100px;
		margin-right: 40px;
	}
	.btn-pc {
		margin-top: 10px;
	}
	.pp-box {
	  position: absolute;
	  top: 140px;
	  right: 50px;
	  background-color: lightgray;
	  padding: 5px;
	  border-radius: 10px;
	}
	.pp-balance {
		display: inline;
	}
	.all-profile {
		
	}
	.profile-product-detail{
		display:flex;
		flex-direction:row;
	}
	.profile-product-detail-btn{
		position: relative;
		width: 200px;
	}
	.profile-outDTbox {
		padding-left: 15px;
		padding-right: 10px;
		flex: 1;
		background-color: yellow;
		border-radius: 0 20px 20px 0;
	}
	.profile-product-detail-text {
		width: 630px;
		
	}
</style>
<body>
<div class="all-profile">
	<div class="pp-box">
		<div class="pp-balance">피치페이 잔액 : </div>
		<button>피치페이 충전</button>
		<button>피치페이 출금</button>
	</div>
	<br/>
	<div class="profile-container">
	 <div class="profile-imgbox">
	  <img src="<c:url value='/resources/img/3.png'/>" class="example">
	  <div class="profile-name"><P>${user.me_id}</P></div>
	  <button class="btn-profile" type="button" onclick="location.href='/peach/board/profile_management'">내 프로필 관리</button>
	 </div>
	 	<div class="profile-outDTbox">
			 <div class="profile-Detail">
			 	<div class="profile-namebox">
			 		<div class="profile-name"><P>${user.me_id}</P></div>
			 	</div>
			 	<br/>
			 	<div style="display:inline;">
			 		가입일 : ${user.me_date} 판매 중 : <text>${salingProducts.size()+tradingProducts.size()}</text> 판매 완료 : ${finishedProducts.size()}<text>${ss}</text> 당도 : <text>${user.me_sugar}</text> 
			 	</div>
			 	<br/>
			 	<form action="<c:url value='/board/profile'/>" method="post" enctype="multipart/form-data">
			 		<div class="form-group">
						<h1>소개글</h1>
					</div>
			 	</form>
			 </div>
		 </div>
	</div>
	<br>
	<c:forEach var="products" items="${products}">
	<div class="profile-product">
		<div class="profile-product-list">
			<img src="<c:url value='/resources/img/3.png'/>" class="example2">
			<div class="profile-product-detail">
				<div class="profile-product-detail-text">
	    			[제품명 : ${products.sb_name}] [카테고리 : ${products.sb_sc_num}]  [게시일 : ${products.sb_date}] 
	    		</div>
				<div class="profile-product-detail-btn">
					<button>끌어올리기</button>
					<button>수정</button>
					<button>삭제</button>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>
</div>	
<script>
	
</script>
</body>
</html>
