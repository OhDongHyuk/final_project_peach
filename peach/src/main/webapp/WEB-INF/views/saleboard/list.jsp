<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>스프링</title>
	<%--css--%>
	<style>
		*, ::before, ::after {
			box-sizing: border-box;
		}
		.wrapper {
			width: 1035px;
			margin: auto;
			margin-top: 20px;
			margin-bottom: 20px;
		}
		.list-container {
			display: flex;
			flex-wrap: wrap;
		}
		.item{
			width: 196px;
			margin-right: 11px;
			margin-bottom: 11px;
		}
		.item-holder{
			border: 1px solid rgb(238, 238, 238);
			background: rgb(255, 255, 255);
			display: block;
		}
		.item-holder:hover{
			color: black;
		}
		a {
		color: rgb(33, 33, 33);
		text-decoration: none;
		cursor: pointer;
		}
		.image-holder {
			position: relative;
			width: 100%;
			height: 194px;
		}
		.img {
			width: 194px; height: 194px;
		}
		.text-holder {
			padding: 15px 10px;
			height: 80px;
			text-align: right;
		}
		.wish-name {
			display: flex;
			justify-content: space-between;
		}
		.wish {
			color: grey;
		}
		.title {
			position: relative;
			font-size: 14px;
			padding-bottom: 20px;
			text-overflow: ellipsis;
			white-space: nowrap;
			overflow: hidden;
		}
		.profile-date {
			display: flex;
			border-top: 1px  solid rgb(238, 238, 238);
			padding: 9px 5px 9px 5px;
			-webkit-box-pack: justify;
			justify-content: space-between;
			-webkit-box-align: center;
			align-items: center;
			height: 40px;
		}
		.price-holder {
			font-size: 16px;
			font-weight: 600;
			text-overflow: ellipsis;
			white-space: nowrap;
			overflow: hidden;
		}
		.price-holder::after {
			content: "원";
			font-size: 13px;
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
</head>
<body>
	<h1>상품리스트</h1>
	<div class="wrapper">
		<div class="list-container">
			<%-- forEach를 통해 판매상품 리스트를 컨트롤러에서 가져와서 출력 --%>
			<c:forEach items="${dbBoardList}" var="boards">
				<div class="item">
					<%-- a태그를 통해 해당 상품 번호의 상세정보로 경로 전달 --%>
					<a href="<c:url value='/saleboard/detail?sb_num=${boards.sb_num}' />" class="item-holder">
						<div class="image-holder">
							<img src="" class="img">
						</div>
						<div class="text-holder">
							<div class="wish-name">
								<div class="wish">
									&#9825; <span style="font-size:14px;">${boards.sb_wish}</span>
								</div>
								<div class="title">
									${boards.sb_name}
								</div>				
							</div>
							<div class="price-holder">
								${boards.get_sb_price(boards.sb_price)}
							</div>
						</div>
						<div class="profile-date">
							<div class="profile">
								${boards.sb_me_nickname}
							</div>	
							<div class="date">
								${boards.sb_date}
							</div>
						</div>
					</a>
				</div>			
			</c:forEach>
		</div>
	</div>
</body>
</html>
