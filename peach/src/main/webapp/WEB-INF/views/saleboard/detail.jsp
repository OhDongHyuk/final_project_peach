<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>스프링</title>
	<style>
		.modal {
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
		
		.modal-content {
		  background-color: rgb(247, 247, 247);
		  margin: 15% auto;
		  border: 1px solid #888;
		  width: 420px;
		  height: 506px;
		}
		.modal-image {
		    display: block;
		    margin: 30px auto;
		    border-style: none;
		}
		.modal-text1{
			font-size: 20px;
		    line-height: 1.5;
		    margin-bottom: 15px;
		    text-align: center;
		    font-weight: bold;
		}
		.modal-text2{
			line-height: 1.5;
		    margin-bottom: 35px;
		    text-align: center;
		}
		
		.button-container {
		  display: flex;
		  flex-direction: column;
		  margin-top: 35px;
		  margin-bottom: 20px;
		}
		
		.rectangle-button {
		  width: 100%;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		}
		
		.red-button button, .pink-button button {
		  border: none;
		  padding: 10px 0;
		  cursor: pointer;
		  font-size: 16px;
		  color: white;
		  font-weight: bold;
		  width: 280px; /* 버튼 길이 */
		  height: 38px; /* 버튼 높이 */
		  transition: background-color 0.3s;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  border-radius: 8px; /* 버튼의 모서리를 부드럽게 설정 */
		}
		
		.red-button button {
		  background-color: red; /* 빨간색 배경색 */
		  margin-bottom: 10px;
		}
		
		.pink-button button {
		  background-color: pink; /* 분홍색 배경색 */
		}
		
		/* 호버 효과 */
		.red-button button:hover {
		  opacity: 0.8;
		}
		
		.pink-button button:hover {
		  opacity: 0.8;
		}
		.customer-center-container {
			padding: 3.5rem 2rem 1.5rem;
		    font-size: 12px;
		    line-height: 1.5;
		    color: rgb(153, 153, 153);
		}	
		.customer-center-container p{
		    width: 100%;
		    border-top: 1px solid rgb(229, 229, 229);
		    padding-top: 1rem;
		    font-size: 12px;
    	}			
		.close {
		  position: absolute;
		  top: 10px;
		  right: 10px;
		  cursor: pointer;
		  font-size: 24px;
		}		
		
		.close:hover,
		.close:focus {
		  color: black;
		  text-decoration: none;
		  cursor: pointer;
		}
		
		
		.container1 {
			color: black;
			width: 900px;
			margin: auto;
			
		}
		.image-box {
			display: flex;
			height: 600px;
			align-items:center;
			justify-content:center;
		}
		.image-slide-right {
			position: absolute; 
			margin-right: 50px;
			right: 0;
		  	top:50%;
		  	-webkit-transform: translateY(-50%);
		  	transform: translateY(-50%);
			cursor: pointer;
			outline: none;
			width: 11px;
			height: 21px;
		    border: none;
		    background: url(https://d1unjqcospf8gs.cloudfront.net/assets/home/articles/icon-slider-right-134c53f44716c3bef227ec30da385b4b09c9c068d339a617a23093718f379d02.svg) no-repeat;
		}
		.image-slide-right:hover {
			background: url(https://d1unjqcospf8gs.cloudfront.net/assets/home/articles/icon-slider-right-hover-c71a5a4d1745bf59f056660eadc57e451f619b5bddaff0c9fdf2f8e3b4d955f8.svg) no-repeat;
		}
		.image-slide-left {
			position: absolute; 
			margin-left: 50px;
			left: 0;
		  	top:50%;
		  	-webkit-transform: translateY(-50%);
		  	transform: translateY(-50%);
			cursor: pointer;
			outline: none;
			width: 11px;
			height: 21px;
		    border: none;
		    background: url(https://d1unjqcospf8gs.cloudfront.net/assets/home/articles/icon-slider-left-4c0e713bfa2cd12bd959e6dd9ef456cd6fc094953c41e605f6b9a59bc1680686.svg) no-repeat;
		}
		.image-slide-left:hover {
			background: url(https://d1unjqcospf8gs.cloudfront.net/assets/home/articles/icon-slider-left-hover-bbda49cc160e798261c2dd4894cc623d0118a701fbb705546fc06de658ce3996.svg) no-repeat;
		}
		.image {
			height: 100%;
			width: 100%;
		}
		.profile-box {
			height: 42px;
			margin-top: 12px;
			margin-bottom: 12px;
			display: flex;
			justify-content: space-between;
			border-bottom: 1px solid #e9ecef;
		}
		.content-box {
			padding: 20px 0;
			margin: 0 auto;
			border-bottom: 1px solid #e9ecef;
		}
		.title {
			margin-top: 10px;
			font-size: 20px;
			font-weight: 600;
			line-height: 1.5;
			letter-spacing: -0.6px;
		}
		.category-date {
			margin-top: 4px;
			font-size: 13px;
			line-height: 1.46;
			letter-spacing: -0.6px;
			color: #868e96;
		}
		.price {
			font-size: 18px;
			font-weight: bold;
			margin-top: 4px;
			line-height: 1.76;
			letter-spacing: -0.6px;
		}
		.price::after {
			content: "원";
			font-size: 16px;
			margin-left: 4px;
		}
		.content {
			font-size: 17px;
			line-height: 1.6;
			letter-spacing: -0.6px;
			margin: 16px 0;
			word-break: break-all;
		}
		.wish-text {
			font-size: 13px;
			line-height: 1.46;
			letter-spacing: -0.6px;
			color: #868e96;
		}
		.button-box {
			display: flex;
			justify-content: center;
			margin-top: 20px;
			margin-bottom: 20px;
		}
		.wish {
			margin-left: 5px;
			margin-right: 5px;
			width: 176px; height: 56px;
			font-weight: 700;
			border: none;
			color: rgb(255, 255, 255);
		}
		.wish.add {
			background: rgb(204, 204, 204);
		}
		.wish.cancel {
			background: rgb(51, 51, 51);
		}
		.wish-type {
			font-weight: 700;
			color: rgb(255, 255, 255);
		}
		.chat {
			margin-left: 5px;
			margin-right: 5px;
			width: 176px; height: 56px;
			font-weight: 700;
			background: rgb(255, 164, 37);
			border: 1px solid rgb(243, 150, 20);
			color: rgb(255, 255, 255);
		}
		.pay {
			margin-left: 5px;
			margin-right: 5px;
			width: 176px; height: 56px;
			font-weight: 700;
			background: rgb(247, 0, 0);
			border: 1px solid rgb(223, 0, 0);
			color: rgb(255, 255, 255);
		}
		.kind {
			position: relative;
			width: 100%;
			height: 650px;
		}
		.kind_slider {
		  border:1px solid #e9ecef;
		  margin-left: 138px; 
		  width:600px;
		  height: 600px;
		  position: relative;
		  overflow: hidden;
		}
		.kind_slider .slides { 
		  position: absolute; 
		  left: 0;
		  top: 0;
		  width: 600px;
		}
		.kind_slider .slides li {
		  float:left;
		}
		.kind_slider img {
		  width: 600px;
		  height: 600px;
		}
		.slide_pagination {
		  /* layout */
		  display: flex;
		  gap: 5px;
		
		  /* position */
		  position: absolute;
		  /* left:50%, translateX(-50%)를 하면 가로 가운데로 위치시킬 수 있다. */
		  left: 50%;
		  transform: translateX(-50%);
		}
		.slide_pagination > li {
		  /* 현재 슬라이드가 아닌 것은 투명도 부여 */
		  color: #e2e2e2;
		  cursor: pointer;
		  font-size: 25px;
		}
		.slide_pagination > li.active {
		  /* 현재 슬라이드 색상은 투명도 없이 */
		  color: black;
		}
	</style>
</head>
<body>
	<h1>상품상세페이지</h1>
	<div class="container1">
		<div class="kind">
			<div class="kind_slider">
			    <ul class="slides">
			    <c:choose>
					<c:when test="${board.saleImageVOList.size() != 0 }">			    
			        	<c:forEach items="${board.saleImageVOList}" var="saleImage">
		       				 <li><img src="<c:url value='/resources/image/${saleImage.si_name }'/>"/></li>
		      			</c:forEach>
		      		</c:when>
		      		<c:otherwise>
		      			<li><img src="<c:url value='/resources/image/NoMainImage.png'/>"/></li>
		      		</c:otherwise>
		      	</c:choose>
			    </ul>
			</div>
		    <ul class="slide_pagination"></ul>
		  	<div class="arrow">
		      <button class="image-slide-left"></button>
		      <button class="image-slide-right"></button>
		 	</div>
		</div>
		<div class="profile-box">
			<div class="profile-left">
				<img src="" class="profile-thumnail">
				<div class="profile-name">${board.sb_me_nickname}</div>
			</div>
			<div class="profile-right">
				<div class="profile-right-box">
					<span class="profile-sweetness-text">당도</span>
					<span class="profile-sweetness">${board.sb_me_sugar}</span>
				</div>
			</div>
		</div>
		<div class="content-box">
			<p class="title">${board.sb_name}</p>
			<p class="category-date">${board.sb_sc_name} | ${board.sb_date}</p>
			<p class="price">${board.get_sb_price(board.sb_price)}</p>
			<p class="content">${board.sb_info}</p>
			<p class="wish-text">찜 ${board.sb_wish}</p>
		</div>
		<div class="button-box">
			<c:choose>
				<c:when test="${user != null && user.me_num == board.sb_me_num }">
					<button type="button" onClick="location.href='<c:url value='/saleboard/update?sb_num=${board.sb_num }'/>'" class="chat">수정하기</button>
					<button type="button" onClick="location.href='<c:url value='/saleboard/delete?sb_num=${board.sb_num }'/>'" class="pay">삭제하기</button>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${wishCheck == 1 }">
							<button type="button" class="wish cancel"><img src="<c:url value='/resources/image/wish-filled.png'/>" width="16px" height="16px"> <span class="wish-type">찜취소</span></button>
						</c:when>
						<c:otherwise>
							<button type="button" class="wish add"><img src="<c:url value='/resources/image/wish.png'/>" width="16px" height="16px"> <span class="wish-type">찜하기</span></button>
						</c:otherwise>
					</c:choose>
					
					<button type="button" onClick="location.href='<c:url value='/chat/chat?sb_num=${board.sb_num}'/>'" class="chat">대화하기</button>
					<button id="openModalBtn" type="button" class="pay">피치페이</button>
					<div id="myModal" class="modal">
					  <div class="modal-content">
					    <span class="close">&times;</span>
					   	<img class="modal-image" width="30" height="34" src="<c:url value='/resources/img/peachmark.png'/>">
					    <div class="modal-text1">피치마켓에서 중고거래 시작하기</div>
					    <div class="modal-text2">간편하게 상품을 확인하세요</div>
					    <div class="button-container">
					      <div class="rectangle-button red-button">
					        <button>직거래</button>
					      </div>
					      <div class="rectangle-button pink-button">
					        <button>피치페이거래</button>
					      </div>
					    </div>
					    <div class="customer-center-container">
					    	<p>
					    		도움이 필요하면 
					    		<a href="daed124@naver.com">이메일</a>
					    		또는 고객센터
					    		<b>1611-7474</b>
					    		로 문의 부탁드립니다.
					    		<br>
					    		고객센터 운영시간: 09~18시 (점심시간 12~13시, 주말/공휴일 제외)
					    	</p>
					    </div>
					  </div>
					</div>

				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script type="text/javascript">
			window.onload = function() {
			const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
			const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들
			let currentIdx = 0; //현재 슬라이드 index
			const slideCount = slideImg.length; // 슬라이드 개수
			const prev = document.querySelector('.image-slide-left'); //이전 버튼
			const next = document.querySelector('.image-slide-right'); //다음 버튼
			const slideWidth = 600; //한개의 슬라이드 넓이
			const slideMargin = 0; //슬라이드간의 margin 값

			//전체 슬라이드 컨테이너 넓이 설정
			slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

			function moveSlide(num) {
			  slides.style.left = -num * 600 + 'px';
			  currentIdx = num;
			}
			
			const pagination = document.querySelector(".slide_pagination");

			for (let i = 0; i < slideCount; i++) {
			  if (i === 0) pagination.innerHTML += `<li class="active">•</li>`;
			  else pagination.innerHTML += `<li>•</li>`;
			}

			const paginationItems = document.querySelectorAll(".slide_pagination > li");
			console.log(paginationItems);

			prev.addEventListener('click', function () {
			  /*첫 번째 슬라이드로 표시 됐을때는 
			  이전 버튼 눌러도 아무런 반응 없게 하기 위해 
			  currentIdx !==0일때만 moveSlide 함수 불러옴 */

			  if (currentIdx !== 0) {
				  paginationItems.forEach((i) => i.classList.remove("active"));
				  paginationItems[currentIdx - 1].classList.add("active");
				  moveSlide(currentIdx - 1);
			  }
			});

			next.addEventListener('click', function () {
			  /* 마지막 슬라이드로 표시 됐을때는 
			  다음 버튼 눌러도 아무런 반응 없게 하기 위해
			  currentIdx !==slideCount - 1 일때만 
			  moveSlide 함수 불러옴 */
			  if (currentIdx !== slideCount - 1) {
			    paginationItems.forEach((i) => i.classList.remove("active"));
			    paginationItems[currentIdx + 1].classList.add("active");
			    moveSlide(currentIdx + 1);
			  }
			});
		}
	
	
		$('.wish').click(function(){
			if('${user.me_id}' == '') {
				//alert('로그인한 회원만 이용이 가능합니다.');
				if(confirm('로그인하시겠습니까?')){
					location.href = '<c:url value="/member/login"/>'
				}
				return;
			}
			let data = {
				wi_me_num : '${user.me_num}',
				wi_sb_num : '${board.sb_num}',
			};
			ajaxJsonToJson(false, 'post', '/saleboard/wish', data, (data)=>{
				if(data.isWish == 0){
					alert('찜을 취소하였습니다.');		
				}else {
					alert('찜을 하였습니다.');
				}
				diplayWishBtn(data.isWish);
				$('.wish-text').text("찜 " + data.board.sb_wish);
			})
		})
		
		
		
		function diplayWishBtn(isWish){
			if(isWish == 0){
				$('.wish-type').text("찜하기");
				$('.wish').removeClass("cancel");
				$('.wish').addClass("add");
				$('.wish img').attr("src", "<c:url value='/resources/image/wish.png'/>");
			}else {
				$('.wish-type').text("찜취소");
				$('.wish').removeClass("add");
				$('.wish').addClass("cancel");
				$('.wish img').attr("src", "<c:url value='/resources/image/wish-filled.png'/>");
			}
		}
		// 모달 열기 버튼
		const openModalBtn = document.getElementById("openModalBtn");

		// 모달 요소
		const modal = document.getElementById("myModal");

		// 모달 열기 버튼 클릭 시 이벤트
		openModalBtn.addEventListener("click", function() {
		  modal.style.display = "block";
		});

		// 모달 닫기 버튼 또는 바깥 영역 클릭 시 모달 닫기
		const closeModal = document.querySelector(".close");
		window.addEventListener("click", function(event) {
		  if (event.target === modal) {
		    modal.style.display = "none";
		  }
		});

		closeModal.addEventListener("click", function() {
		  modal.style.display = "none";
		});
	</script>
</body>
</html>
