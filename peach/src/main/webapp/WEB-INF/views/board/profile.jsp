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
		min-width : 100px; min-height : 100px;
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
	.empty_product{
		border: solid 1px;
		border-color: black;
		height: 50px;
		width: 200px;
		text-align: center;
	}
	.empty_product_box{
		margin-left: 150px;
	}
	.custom-modal {
		  display: none;
		  position: fixed;
		  z-index: 1;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  overflow: auto;
		  background-color: rgba(0, 0, 0, 0.4);
		}
		
		.custom-modal .modal-content {
		  background-color: rgb(247, 247, 247);
		  margin: 15% auto;
		  border: 1px solid #888;
		  width: 420px;
		  padding: 20px;
		  text-align: center;
		  border-radius: 8px;
		  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
		}
		
		.custom-modal .modal-header h2 {
		  font-size: 24px;
		  font-weight: bold;
		}
		
		.custom-modal .modal-body {
		  margin-top: 20px;
		}
		
		.custom-modal .report-reason {
		  border: 1px solid #ccc;
		  border-radius: 4px;
		  resize: none;
		}
		
		.custom-modal .report-button,
		.custom-modal .cancel-button {
		  padding: 10px 20px;
		  font-size: 16px;
		  cursor: pointer;
		  border: none;
		  border-radius: 5px;
		  margin-right: 10px;
		}
		
		.custom-modal .report-button {
		  background-color: #ff5733;
		  color: white;
		}
		
		.custom-modal .report-button:hover {
		  background-color: #ff4500;
		}
		
		.custom-modal .cancel-button {
		  background-color: #ccc;
		  color: #333;
		}
		
		.custom-modal .cancel-button:hover {
		  background-color: #999;
		}
		
		.custom-modal .close {
		  position: absolute;
		  top: 10px;
		  right: 10px;
		  cursor: pointer;
		  font-size: 24px;
		}
		
		.custom-modal .close:hover,
		.custom-modal .close:focus {
		  color: black;
		  text-decoration: none;
		  cursor: pointer;
		}
		.report-text-area {
			text-align: left;
			margin-top: 20px;
		}
		.modal-body{
			margin-left: auto;
			margin-right: auto;
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
		<form action="" method="get">
			<button>피치페이 내역 조회</button>
		</form>
	</div>
	  </c:if>
	<br/>
	<div class="profile-container">
	 <div class="profile-imgbox">
	 <c:if test="${proImg == null}">
	  	<img src="<c:url value='/resources/image/NoMainImage.png'/>" class="example">
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
			 			<c:if test="${!empty profile.pf_text && !empty profile.pf_text.replaceAll('<[^>]*>', '').replaceAll('&nbsp;', '').replaceAll(' ', '').trim()}">
			 				<p class="pftext">${profile.pf_text}</p>
			 			</c:if>
			 			<c:if test="${empty profile.pf_text || empty profile.pf_text.replaceAll('<[^>]*>', '').replaceAll('&nbsp;', '').replaceAll(' ', '').trim()}">
			 				<p class="pftext">소개글 내용이 없습니다.</p>
			 			</c:if>
					</div>
			 	</form>
			 </div>
		 </div>
	</div>
	<br>
	<div class="sellbox">
		<button onclick="sell()">판매중</button>
		<button onclick="sellc()">거래중</button>
		<button onclick="sellComBuy()">구매완료</button>
		<button onclick="sellComSell()">판매완료</button>
	</div>
	<br>
	<div id="sellbox">
		<c:forEach var="sellAll" items="${salingProducts}" >
			<div class="profile-product">
				<div class="profile-product-list">
					<c:if test="${not empty sellAll.si_name}">
					    <img src="<c:url value='/trade/${sellAll.si_name}'/>" class="example2"/>
					</c:if>
					<c:if test="${empty sellAll.si_name}">
					    <img src="<c:url value='/resources/image/NoMainImage.png'/>" class="example2">
					</c:if>
					<div class="profile-product-detail">
						<div class="profile-product-detail-text">
			    			[제품명 : <a href="<c:url value='/saleboard/detail?sb_num=${sellAll.sb_num}'/>">${sellAll.sb_name}</a>] [카테고리 : ${sellAll.sb_sc_num}]  [게시일 : ${sellAll.sb_date}] 
			    		</div>
			    		<c:if test="${user.me_num == member.me_num }">
						<div class="profile-product-detail-btn">
							<button class="myBtn" onclick="dateUp(${sellAll.sb_num})">끌어올리기</button>
							<a class="myBtn" href="/peach/saleboard/detail?sb_num=${sellAll.sb_num}">
							    수정
							</a>
							<button class="myBtn" onclick="deletePD(${sellAll.sb_num})">삭제</button>
						</div>
						</c:if>
					</div>		
				</div>
			</div>	
		</c:forEach>
		<c:if test="${empty salingProducts}">
			<div class="empty_product_box">
				<p class="empty_product">판매중인 상품이 없습니다.</p>
			</div>
		</c:if>
	</div>
	<div id="sellcbox">
		<c:forEach var="proceeding" items="${proceeding}">
			<div class="profile-product">
				<div class="profile-product-list">
					<c:if test="${not empty proceeding.si_name}">
						<img src="<c:url value='/trade/${proceeding.si_name}'/>" class="example2"/>
					</c:if>
					<c:if test="${empty proceeding.si_name}">
						<img src="<c:url value='/resources/image/NoMainImage.png'/>" class="example2">
					</c:if>
						<div class="profile-product-detail">
						<div class="profile-product-detail-text">
			    			[제품명 : <a href="<c:url value='/saleboard/detail?sb_num=${proceeding.sb_num}'/>">${proceeding.sb_name}</a>] [카테고리 : ${proceeding.sb_sc_num}]  [게시일 : ${proceeding.sb_date}] 
			    		</div>	
					</div>
					<c:if test="${proceeding.tq_me_num == user.me_num}">
						<div>
							<p>구매중</p>
						</div>
					</c:if>	
					<c:if test="${proceeding.sb_me_num == user.me_num}">
						<div>
							<p>판매중</p>
						</div>
					</c:if>			
				</div>
			</div>
		</c:forEach>
		<c:if test="${empty proceeding}">
			<div>
				<p class="empty_product">거래중인 상품이 없습니다.</p>
			</div>
		</c:if>
	</div>	
	<div id="sellComBuy">
		<c:forEach var="buy" items="${meNumBuy}">
		<div class="profile-product">
			<div class="profile-product-list">
				<c:if test="${not empty buy.si_name}">
					<img src="<c:url value='/trade/${buy.si_name}'/>" class="example2"/>
				</c:if>
				<c:if test="${empty buy.si_name}">
					 <img src="<c:url value='/resources/image/NoMainImage.png'/>" class="example2">
				</c:if>
				<div class="profile-product-detail">
					
					<div class="profile-product-detail-text">
		    			[제품명 : <a href="<c:url value='/saleboard/detail?sb_num=${buy.sb_num}'/>">${buy['sb_name']}</a>] [카테고리 : ${buy['sb_sc_num']}]  [게시일 : ${buy['sb_date']}] 
		    		</div>
		    		<c:if test="${user.me_num == member.me_num }">
					<div class="profile-product-detail-btn">
					</div>
					</c:if>
				</div>
			</div>
		</div>
		</c:forEach>
		<c:if test="${empty meNumBuy}">
			<div>
				<p class="empty_product">거래완료된 상품이 없습니다.</p>
			</div>
		</c:if>
	</div>	
	<div id="sellComSell">
		<c:forEach var="buy" items="${meNumSel}">
		<div class="profile-product2">
			<div class="profile-product-list">
				<c:if test="${not empty buy.si_name}">
					<img src="<c:url value='/trade/${buy.si_name}'/>" class="example2"/>
				</c:if>
				<c:if test="${empty buy.si_name}">
					 <img src="<c:url value='/resources/image/NoMainImage.png'/>" class="example2">
				</c:if>
				<div class="profile-product-detail">
					
					<div class="profile-product-detail-text">
		    			[제품명 : <a href="<c:url value='/saleboard/detail?sb_num=${buy.sb_num}'/>">${buy['sb_name']}</a>] [카테고리 : ${buy['sb_sc_num']}]  [게시일 : ${buy['sb_date']}] 
		    		</div>
		    		<c:if test="${user.me_num == member.me_num }">
					<div class="profile-product-detail-btn">
						<button type="button" class="report-post" id="openReportModalBtn" data-num="${buy.sb_num}">당도 남기기</button>
					</div>
					</c:if>
				</div>
			</div>
		</div>
		</c:forEach>
		<c:if test="${empty meNumSel}">
			<div>
				<p class="empty_product">판매완료된 상품이 없습니다.</p>
			</div>
		</c:if>
	</div>	
</div>	
<div id="reportPostModal" class="custom-modal">
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <div class="modal-header">
	      <h2>당도 남기기</h2>
	    </div>
	    <div class="modal-body">
	      <p>당도는 1점부터 10점까지 매길 수 있습니다.</p>
	      <div class="report-text-area">
		      <textarea id="reportReason" class="report-reason" placeholder="1~10"></textarea>      
	      </div>
	    </div>
	    <div class="modal-footer">
	      <button class="report-button" onclick="reportPost()">확인</button>
	      <button class="cancel-button" onclick="closeReportModal()">취소</button>
	    </div>
	  </div>
	</div>
<br>
<br>
<script>
let sb_num = 0;
const reportPostModal = document.getElementById("reportPostModal");
const openReportModalBtns = document.querySelectorAll(".report-post");
const closeReportModalBtn = document.querySelector(".custom-modal .close");

[].forEach.call(openReportModalBtns, function(button){
	 console.log("버튼 클릭됨");
	button.addEventListener("click", function () {
		console.log(button);
		if('${user.me_id}' == '') {
			if(confirm('로그인하시겠습니까?')){
				location.href = '<c:url value="/member/login"/>'
			}
			return;
		}
	  	reportPostModal.style.display = "block";
	  	sb_num = $(this).data('num');
	});	
});

openReportModalBtn.addEventListener("click", function () {
	if('${user.me_id}' == '') {
		if(confirm('로그인하시겠습니까?')){
			location.href = '<c:url value="/member/login"/>'
		}
		return;
	}
  	reportPostModal.style.display = "block";
});

closeReportModalBtn.addEventListener("click", function () {
  reportPostModal.style.display = "none";
});		

window.addEventListener("click", function (event) {
  if (event.target === reportPostModal) {
    reportPostModal.style.display = "none";
  }
});

function reportPost() {

	const reportReason = document.getElementById("reportReason").value;

  	if (reportReason.trim() === "") {
   		alert("당도를 입력하세요.");
   		return;
	}
  	
	let data = {
		sl_sb_num : sb_num,
		sl_sugar : reportReason,
	};
	ajaxJsonToJson(
			  false,
			  'post',
			  'sugar',
			  data,
			  (data) => {
			    alert("당도를 매겼습니다.\n당도 점수: " + reportReason);
			    console.log(data.msg);
			    document.getElementById("reportReason").value = '';
			    closeReportModal(); // Close the modal after reporting
			  },
			    () => {
			    	
			    	console.log("실패");
			    }
			);
	}
function closeReportModal() {
	  reportPostModal.style.display = "none";
	}






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
	$("#sellcbox").hide();
	$("#sellbox").show();
	$("#sellComSell").hide();
	$("#sellComBuy").hide();
	$("#sellComBox").hide();
}
function sellc() {
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