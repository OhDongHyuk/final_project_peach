<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<header class="header navbar-area">
	<!-- 헤더 탑-->
	<div class="topbar">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-4 col-md-4 col-12">
					<div class="top-left">
						<ul class="menu-top-link">

						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-12">
					<div class="top-middle">
						<ul class="useful-links">
							<li><a href="<c:url value='/'/>">Home</a></li>
							<li><a href="<c:url value='/'/>">중고 거래</a></li>
							<li><a href="<c:url value='/'/>">피치 게시판</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-12">
					<div class="top-end">
						<div class="user">
							<i class="lni lni-user"></i> Hello
						</div>
						<ul class="user-login">
							<c:if test="${user == NULL}">
								<li class="inner-item"><a
									href="<c:url value='/member/signup' />">회원가입</a></li>
								<li class="inner-item"><a
									href="<c:url value='/member/login'/>">로그인</a></li>
							</c:if>
							<c:if test="${user != NULL }">
								<li class="inner-item"><a href="<c:url value='/member/logout'/>">로그아웃</a></li>
								<li class="inner-item"><a href="<c:url value='/board/profile'/>">마이페이지</a></li>
								<li class="inner-item"><a href="<c:url value='/saleboard/insert'/>">제품등록</a></li>
							</c:if>
							<c:if test="${user != null && user.me_au == 'admin' }">
								<li class="inner-item"><a href="<c:url value='/'/>">관리자 메뉴</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</header>


</header>