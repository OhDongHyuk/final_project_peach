<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>스프링</title>
	<style>
		.container {
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
			cursor: pointer;
			margin-left: 10px;
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
			cursor: pointer;
			margin-right: 10px;
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
	</style>
</head>
<body>
	<h1>상품상세페이지</h1>
	<div class="container">
		<div class="image-box">
			<button class="image-slide-left"></button>
			<img src="" class="image">
			<button class="image-slide-right"></button>
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
					
					<button type="button" class="chat">대화하기</button>
					<button type="button" class="pay">피치페이</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script type="text/javascript">
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
		
	</script>
</body>
</html>
