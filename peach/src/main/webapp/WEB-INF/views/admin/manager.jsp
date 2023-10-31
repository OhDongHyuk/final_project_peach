<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.admin {
	min-height: 800px;
}

.box-main {
	border: 3px solid black;
}

.popupBtn {
	width: 100%;
	height: 100%;
	background-color: white;
	border: none;
}

.modalWrap {
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	display: none;
}

.modalBody {
	width: 500px;
	height: 300px;
	padding: 30px 30px;
	margin: 0 auto;
	border: 1px solid #777;
	background-color: #fff;
	margin: 100px;
}

.closeBtn {
	float: right;
	font-weight: bold;
	color: #777;
	font-size: 25px;
	cursor: pointer;
}
</style>
</head>
<body>
	<header class="header navbar-area">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 col-md-6 col-12">
					<div class="nav-inner">
						<nav class="navbar navbar-expand-lg">
							<button class="navbar-toggler mobile-menu-btn" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="toggler-icon"></span> <span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse sub-menu-bar"
								id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav ms-auto">
									<li class="nav-item"><a
										href="<c:url value='/admin/home'/>" class="active"
										aria-label="Toggle navigation">메인페이지로</a></li>
									<li class="nav-item"><a class="dd-menu collapsed"
										href="<c:url value='/admin/manager'/>"
										aria-label="Toggle navigation">회원관리</a></li>
									<li class="nav-item"><a class="dd-menu collapsed"
										href="<c:url value='/admin/category'/>"
										aria-label="Toggle navigation">카테고리관리</a></li>
									<li class="nav-item"><a class="dd-menu collapsed"
										href="<c:url value='/admin/report'/>"
										aria-label="Toggle navigation">신고게시판관리</a></li>
								</ul>
							</div>


							<!-- navbar collapse -->
						</nav>
						<!-- End Navbar -->
					</div>
				</div>
			</div>
		</div>
	</header>



	<section class="hero-area">
		<div class="container admin">
			<div class="row">
				<h2>회원관리</h2>
				<table class="table">
					<thead style="height: 50px">
						<tr>
							<th>회원 번호</th>
							<th>ID</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>닉네임</th>
							<th>포인트</th>
							<th>권한</th>
							<th>가입날짜</th>
							<th>당도</th>
							<th>계정상태</th>
							<th>지역(대분류)</th>
							<th>은행</th>
							<th>수정</th>

						</tr>
					</thead>
					<c:forEach items="${mbList}" var="mbList">
						<tbody>
							<tr>
								<td>${mbList.me_num}</td>
								<td>${mbList.me_id}</td>
								<td>${mbList.me_name}</td>
								<td>${mbList.me_phone}</td>
								<td>${mbList.me_nick}</td>
								<td>${mbList.me_point}</td>
								<td>${mbList.me_au}</td>
								<td>${mbList.me_date}</td>
								<td>${mbList.me_sugar}</td>
								<td>${mbList.statementVO.st_name}</td>
								<td>${mbList.cityVO.ci_large}</td>
								<td>${mbList.bankVO.bk_name}</td>
								<td><div class="btnWrap">
										<button type="button" class="popupBtn">수정하기</button>
									</div>
									<div class="modalWrap">
										<div class="modalBody">
											<span class="closeBtn"></span>
											<form action="<c:url value='/admin/manager'/>" method="post">
												<input type="hidden" name="me_num" value="${mbList.me_num}">
												<select class="form-control" name="me_st_num">
													<c:forEach items="${StateTypeList}" var="List">
														<option value="${List.st_num }">${List.st_name }</option>
													</c:forEach>
												</select>
												<button>완료</button>
											</form>
										</div>
									</div></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>
	<button class="button--open">Open Modal</button>
	<div class="modal--bg hidden">
		<div class="modal">
			<p class="modal__text">Modal</p>
			<button class="button--close">X</button>
		</div>
	</div>




	<script type="text/javascript">
	$('.popupBtn').click(function(){
		$(this).parent().next().show();	
	})
	$('.closeBtn').click(function() {
		$(this).parents('.modalWrap').hide();
	})
	/* $(window).click(function(){
		a = e;
		b = $(this)
		console.log(e.target == $(this))
		if(e.target == this){
			$('.closeBtn').click() 	
		}
	})	 */
		/* window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		} */
	let a;
	let b;
	</script>

</body>
</html>