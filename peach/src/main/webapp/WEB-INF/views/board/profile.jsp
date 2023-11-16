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
		
		color: #000;
	}
	.profile-imgbox {
		flex: 00 310px;
		text-align: center;
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
		width: 196px;
		text-align: center;
	}
	.profile-outDTbox {
		padding-left: 15px;
		padding-right: 10px;
		flex: 1;
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
		<div class="pp-balance">피치페이 잔액 : </div>
		<button>피치페이 충전</button>
		<button>피치페이 출금</button>
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
	  <div class="profile-name"><P>${member.me_nick}</P></div>
	  <c:if test="${user.me_num == member.me_num}">
		<li class="inner-item"><a href="<c:url value='/board/profilePass?pi_num=${proImg.pi_name}'/>">내 프로필 관리</a></li>
	  </c:if>
	 </div>
	 	<div class="profile-outDTbox">
			 <div class="profile-Detail">
			 	<div style="display:flex;">
			 		<div style="margin-right: 15px;">가입일 : ${user.me_date} </div><div style="margin-right: 15px;">판매 중 : ${salingAndTradingProducts.size()} </div><div style="margin-right: 15px;">판매 완료 : ${finishedProducts.size()}</div> <div style="margin-right: 15px;">당도 : ${user.me_sugar}</div> 
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
		<button id="sellbtn" class="selected" onclick="sell()">판매중</button>
		<button id="sellcbtn" class="sellbtn" onclick="sellc()">판매완료</button>
	</div>
		<div class="wrapper">
		<div id="sellbox">
		<c:forEach var="salingAndTradingProducts" items="${salingAndTradingProducts}">
					<div class="item-main-holder">
					<%-- a태그를 통해 해당 상품 번호의 상세정보로 경로 전달 --%>
					<a href="<c:url value='/saleboard/detail?sb_num=${salingAndTradingProducts.sb_num}' />" class="item-holder">
						<div class="image-holder">
							<c:choose>
								<c:when test="${salingAndTradingProducts.saleImageVOList.size() != 0 }">
									<img class="item" src="<c:url value='/resources/image/${salingAndTradingProducts.saleImageVOList.size() != 0 ? salingAndTradingProducts.saleImageVOList.get(0).si_thb_name :\"\" }'/>">
								</c:when>
								<c:otherwise>
									<img class="item" src="<c:url value='/resources/image/NoMainImage.png'/>">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="text-holder">
							<div class="title">
								${salingAndTradingProducts.sb_name}
							</div>	
							<div class="wish-name">
								<div class="price-holder">
									${salingAndTradingProducts.get_sb_price()}
								</div>			
								<div class="wish">
									<img src="<c:url value="/resources/image/wish-small.png"/>"> <span style="font-size:14px;">${salingAndTradingProducts.sb_wish}</span>
								</div>
							</div>
						</div>
						<div class="profile-date">
							<div class="profile">
								${salingAndTradingProducts.sb_sc_name}
							</div>	
							<div class="date">
								${salingAndTradingProducts.get_date()}
							</div>
						</div>
					</a>
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
	
		<c:forEach var="finishedProducts" items="${finishedProducts}">
					<div class="item-main-holder">
					<div class="item-holder">
						<div class="image-holder">
							<c:choose>
								<c:when test="${finishedProducts.saleImageVOList.size() != 0 }">
									<img class="item" src="<c:url value='/resources/image/${finishedProducts.saleImageVOList.size() != 0 ? finishedProducts.saleImageVOList.get(0).si_thb_name :\"\" }'/>">
								</c:when>
								<c:otherwise>
									<img class="item" src="<c:url value='/resources/image/NoMainImage.png'/>">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="text-holder">
							<div class="title">
								${finishedProducts.sb_name}
							</div>	
							<div class="wish-name">
								<div class="price-holder">
									${finishedProducts.get_sb_price()}
								</div>			
								<div class="wish">
									<img src="<c:url value="/resources/image/wish-small.png"/>"> <span style="font-size:14px;">${finishedProducts.sb_wish}</span>
								</div>
							</div>
						</div>
						<div class="profile-date">
							<div class="profile">
								${finishedProducts.sb_sc_name}
							</div>	
							<div class="date">
								${finishedProducts.get_date()}
							</div>
						</div>
					
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
const sellbtn = document.querySelector("#sellbtn");
const sellcbtn = document.querySelector("#sellcbtn");
	
function sell() {
	sellbtn.setAttribute("class", "selected");
	sellcbtn.setAttribute("class", "sellbtn");
	$("#sellcbox").hide();
	$("#sellbox").show();
}
function sellc() {
	sellcbtn.setAttribute("class", "selected");
	sellbtn.setAttribute("class", "sellbtn");
	$("#sellbox").hide();
	$("#sellcbox").show();
}


</script>

</body>
</html>