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
				<div class="col-lg-8 col-12 custom-padding-right">
					<h1>신고페이지 메인</h1>
				</div>
				
			</div>
		</div>
	</section>
	
	
	
	
	
	<!-- <div class="container admin box-main">
		<nav class="admin-nav">
			<ul>
				<li><h2>1. 회원관리</h2></li>
				<li>2. 카테고리 추가 제거</li>
				<li>3. 신고기능관리</li>
			</ul>
		</nav>
		<div class="admin-content">
		내용확인
		</div>
	</div> -->

</body>
</html>