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
		padding-bottom: 50px;
		min-width: 1000px;
		max-width: 1320px;
		display: flex;
		border-style: outset;
		border-width: 9px;
		border-color: ffd9eb;
		border-radius: 20px;
		background-color: #ffc2e0;
	}
	.profile-imgbox {
		flex: 00 310px;
		background-color: #ffe5f2;
		text-align: center;
		border-right: solid;
		border-width: 7px;
		border-color: ffd9eb;
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
		margin: 5px 0;
	}
	.profile-Detail {
		margin-top: 20px;
		flex: 1;
	
	}
	.profile-product {
		margin:0 auto; 
		min-width: 1000px;
		max-width: 1000px;
		display: flex;
	}
	.profile-product2 {
		margin:0 auto; 
		min-width: 1000px;
		max-width: 1000px;
		background-color: lime;
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
	  text-align: center;
	  background-color: lightgray;
	  padding: 5px;
	  border-radius: 10px;
	  display: flex;
	  flex: 1;
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
		width: 196px;
		text-align: center;
	}
	.profile-outDTbox {
		padding-left: 15px;
		padding-right: 10px;
		flex: 1;
		background-color: #ffe2ed;
		border-radius: 0 20px 20px 0;
	}
	.profile-product-detail-text {
		width: 630px;
		
	}
	li{
   		list-style:none;
  	}
	.sellbox{
		margin: auto;
		max-width: 1320px;
		display: flex;
		height: 50px;
	}
	.selected{
		flex: 1 1 0%;
		align-items: center;
		justify-content: center;
		border-top: 1px solid #ccc;
		border-right: 1px solid #ccc;
		border-left: 1px solid #ccc;
		border-bottom: 1px solid rgb(255, 255, 255);
		background-color: #fff;
		color: rgb(33, 33, 33);
		font-weight: 600;
	}
	.sellbtn{
		flex: 1 1 0%;
		align-items: center;
		justify-content: center;
		border-top: none;
		border-left: none;
		border-right: none;
		border-bottom: 1px solid #ccc;
		background-color: #f9f9f9;
		color: rgb(136, 136, 136);
	}
	.myBtn {
		background: inherit ; 
		border:none; 
		box-shadow:none; 
		border-radius:0; 
		padding:0; 
		overflow:visible; 
		cursor:pointer;
		margin-right: 5px;
	}
	.pftext{
		font-size: 30px;
	}
	.sellComBox{
		margin-left: 360px;
	}
	
	::before, ::after {
		box-sizing: border-box;
	}
	.wrapper {
		padding-top: 50px;
		max-width: 1320px; /* 최대 너비를 1035px로 고정 */
       	margin: 0 auto; /* 가운데 정렬 */
		margin-bottom: 40px;
		display: block;
	}
	#sellbox {
		display: flex;
		flex-wrap: wrap;
		justify-content: flex-start; /* 왼쪽 정렬 */
		align-items: stretch;
	}
	#sellcbox {
		display: flex;
		flex-wrap: wrap;
		justify-content: flex-start; /* 왼쪽 정렬 */
		align-items: stretch;
	}
	.item-main-holder{
       flex: 0 0 196px; /* 고정 너비 */
       margin-right: 12px;
       margin-left: 12px;
       margin-bottom: 12px;
       margin-top: 12px;
       box-sizing: border
	}
	.item-holder{
		border: 1px solid rgb(238, 238, 238);
		background: rgb(255, 255, 255);
		display: block;
		width: 196px;
	}
	a {
		color: rgb(33, 33, 33);
		text-decoration: none;
		cursor: pointer;
	}
	a:hover {
		text-decoration: none;
		color: #000;
		transition: 0.3s;
	}
	.image-holder {
		position: relative;
		width: 100%;
		height: 194px;
	}
	.image-holder img {
		width: 194px; height: 194px;
	}
	.text-holder {
		padding: 15px 15px;
		height: 80px;
		text-align: left;
	}
	.wish-name {
		display: flex;
		justify-content: space-between;
	}
	.wish {
		color: grey;
		text-align: right;
		min-width: 30px;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
		font-size: 15px;
	}
	.wish img {
		width: 14px;
		height: 14px;
	}
	.title {
		position: relative;
		font-size: 14px;
		font-weight: 400;
		padding-bottom: 15px;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
	}
	.profile-date {
		display: flex;
		padding: 9px 15px 9px 15px;
		-webkit-box-pack: justify;
		justify-content: space-between;
		-webkit-box-align: center;
		align-items: center;
		height: 40px;
	}
	.price-holder {
		font-size: 17px;
		font-weight: 700;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
	}
	.price-holder::after {
		content: "원";
		font-size: 13px;
		mergin-left: 3px;
	}
	.date {
		heigt: 40px;
		font-size: 12px;
		white-space: nowrap;
		color: rgb(102, 102, 102);
	}
	.profile {
		font-size: 12px;
		color: rgb(136, 136, 136);
	}
	
</style>
<body>
<div class="all-profile">
	<c:if test="${user.me_num == member.me_num }">	
	<div class="pp-box">
		<div class="pp-balance">피치페이 잔액 : '${user.me_point}' </div>
		<button>피치페이 충전</button>
		<form action="<c:url value='/board/profilePay'/>" method="get">
			<button>피치페이 출금</button>
		</form>
	</div>
	  </c:if>
	<br/>
	<div class="profile-container">
	 <div class="profile-imgbox">
	 <c:if test="${proImg == null}">
	  	<img src="<c:url value='/resources/img/3.png'/>" class="example">
	  </c:if>
	  <c:if test="${proImg != null}">
	  	<img src="<c:url value='/img/${proImg.pi_name}'/>" class="example">
	  </c:if>
	  <div class="profile-name"><P style="color: black; font-weight: bold;">${member.me_nick}</P></div>
	  <c:if test="${user.me_num == member.me_num}">
		<li class="inner-item"><a href="<c:url value='/board/profilePass?pi_num=${proImg.pi_name}'/>">내 프로필 관리</a></li>
	  </c:if>
	 </div>
	 	<div class="profile-outDTbox">
			 <div class="profile-Detail">
			 	<div class="profile-namebox">
			 		<div class="profile-name"><P style="color: black; font-weight: bold;">${member.me_nick}</P></div>
			 	</div>
			 	<br/>
			 	<div style="display:inline;">
			 		가입일 : ${user.me_date} 판매 중 : <text>${salingAndTradingProducts.size()}</text> 판매 완료 : ${finishedProducts.size()}<text>${ss}</text> 당도 : <text>${user.me_sugar}</text> 
			 	</div>
			 	<br/>
			 	<form action="<c:url value='/board/profile'/>" method="post" enctype="multipart/form-data">
			 		<br>
			 		<div class="form-group">
			 			<p class="pftext">${profile.pf_text}소개글입니다.</p>
					</div>
			 	</form>
			 </div>
		 </div>
	</div>
	<br>
	<div class="sellbox">
		<button onclick="sell()">판매중</button>
		<button onclick="sellc()">거래중</button>
		<button onclick="sellCom()">거래완료</button>
	</div>
	<div id="sellComBox" class="sellComBox">
		<br>
		<button onclick="sellComBuy()">구매완료</button>
		<button onclick="sellComSell()">판매완료</button>
		<br>
	</div>
	<br>
	<div id="sellbox">
		<c:forEach var="salingAndTradingProducts" items="${salingProducts}">
		<div class="profile-product">
			<div class="profile-product-list">
				<img src="<c:url value='/resources/img/3.png'/>" class="example2">
				<div class="profile-product-detail">
					
					<div class="profile-product-detail-text">
		    			[제품명 : ${salingAndTradingProducts.sb_name}] [카테고리 : ${salingAndTradingProducts.sb_sc_num}]  [게시일 : ${salingAndTradingProducts.sb_date}] 
		    		</div>
		    		<c:if test="${user.me_num == member.me_num }">
					<div class="profile-product-detail-btn">
						<button class="myBtn" onclick="dateUp(${salingAndTradingProducts.sb_num})">끌어올리기</button>
						<button class="myBtn">수정</button>
						<button class="myBtn" onclick="deletePD(${salingAndTradingProducts.sb_num})">삭제</button>
					</div>
					</c:if>
				</div>			
				</c:forEach>
				</div>
	<div id="sellcbox">
		<c:forEach var="finishedProducts" items="${tradingProducts}">
		<div class="profile-product2">
			<div class="profile-product-list">
				<img src="<c:url value='/resources/img/3.png'/>" class="example2">
				<div class="profile-product-detail">
					
				</div>	
				<c:if test="${user.me_num == member.me_num }">
					<div class="profile-product-detail-btn">
						<button class="myBtn">수정</button>
						<button class="myBtn" onclick="deletePD(${finishedProducts.sb_num})">삭제</button>
					</div>
					</c:if>
				</div>		
				</c:forEach>
	</div>	
		</div>	
	</div>	
	<div id="sellComBuy">
		<c:forEach var="buy" items="${meNumBuy}">
		<div class="profile-product">
			<div class="profile-product-list">
				<img src="<c:url value='/resources/img/3.png'/>" class="example2">
				<div class="profile-product-detail">
					
					<div class="profile-product-detail-text">
		    			[제품명 : ${buy['sb_name']}] [카테고리 : ${buy['sb_sc_num']}]  [게시일 : ${buy['sb_date']}] 
		    		</div>
		    		<c:if test="${user.me_num == member.me_num }">
					<div class="profile-product-detail-btn">
						
					</div>
					</c:if>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>	
	<div id="sellComSell">
		<c:forEach var="buy" items="${meNumSel}">
		<div class="profile-product2">
			<div class="profile-product-list">
				<img src="<c:url value='/resources/img/3.png'/>" class="example2">
				<div class="profile-product-detail">
					
					<div class="profile-product-detail-text">
		    			[제품명 : ${buy['sb_name']}] [카테고리 : ${buy['sb_sc_num']}]  [게시일 : ${buy['sb_date']}] 
		    		</div>
		    		<c:if test="${user.me_num == member.me_num }">
					<div class="profile-product-detail-btn">
						
					</div>
					</c:if>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>	
</div>	
<br>
<br>
<script>
function dateUp(sb_num){
	$.ajax({
	    type: 'POST',
	    url: '<c:url value="/board/dateUp"/>',
	    data: { sb_num: sb_num },
	    success: function(data) {
	    	location.reload();
	    },
	    error: function(a) {
	        alert('끌어올리기 실패');
	        console.log(a);
	    }
	});
	
}
function deletePD(sb_num){
	var ans = confirm('삭제하시겠습니까?');
	if (ans) {
		$.ajax({
			type: 'POST',
			url: '<c:url value="/board/delete"/>', // 맞게 URL 수정
			data: { sb_num: sb_num },
			success: function (data) {
				location.reload();
			},
			error: function (a) {
				alert('삭제 실패');
				console.log(a);
			}
		});
	}
}

$("#sellcbox").hide();
$("#sellComBox").hide();
$("#sellComBuy").hide();
$("#sellComSell").hide();

function sell() {
	sellbtn.setAttribute("class", "selected");
	sellcbtn.setAttribute("class", "sellbtn");
	$("#sellcbox").hide();
	$("#sellbox").show();
	$("#sellComSell").hide();
	$("#sellComBuy").hide();
	$("#sellComBox").hide();
}
function sellc() {
	sellcbtn.setAttribute("class", "selected");
	sellbtn.setAttribute("class", "sellbtn");
	$("#sellbox").hide();
	$("#sellcbox").show();
	$("#sellComSell").hide();
	$("#sellComBuy").hide();
	$("#sellComBox").hide();
}
function sellCom() {
	$("#sellbox").hide();
	$("#sellcbox").hide();
	$("#sellComBox").show();
}
function sellComBuy() {
	$("#sellbox").hide();
	$("#sellcbox").hide();
	$("#sellComBuy").show();
	$("#sellComSell").hide();
}
function sellComSell() {
	$("#sellbox").hide();
	$("#sellcbox").hide();
	$("#sellComBuy").hide();
	$("#sellComSell").show();
}

</script>

</body>
</html>