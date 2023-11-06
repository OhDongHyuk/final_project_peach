<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<header class="header navbar-area">
	<!-- 헤더 미드 -->
	<!-- Start Header Middle -->
	<div class="header-middle">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-3 col-md-3 col-7"></div>
				<div class="col-lg-5 col-md-7 d-xs-none">
					<!-- Start Main Menu Search -->
					<div class="main-menu-search">
						<!-- navbar search start -->
						<form action="/peach/saleboard/list" method="get">
							<div class="navbar-search search-style-5">
								<div class="search-select">
									<div class="select-position">
										<select id="select1" name="type">
											<option value="0"
												<c:if test="${pm.cri.type == '0' }">selected</c:if>>전체</option>
											<option value="sb_name"
												<c:if test="${pm.cri.type == 'sb_name' }">selected</c:if>>제목</option>
											<option value="sb_info"
												<c:if test="${pm.cri.type == 'sb_info' }">selected</c:if>>내용</option>
										</select>
									</div>
								</div>
								<div class="search-input" style="display: flex;">
									<input type="text" class="form-control" name="search"
										value="${pm.cri.search}">
									<div class="search-btn ">

										<button class="lni lni-search-alt">
											<i class=""></i>
										</button>
									</div>
								</div>
							</div>
						</form>
						<!-- navbar search Ends -->
					</div>
					<!-- End Main Menu Search -->
				</div>
				<div class="col-lg-4 col-md-2 col-5">
					<div class="middle-right-area">
						<div class="nav-hotline">
							<h3>${user.me_nick }님환영합니다.</h3>
						</div>
						<div class="navbar-cart">
							<div class="cart-items">
								<a href="javascript:void(0)" class="main-btn"> <i
									class="lni lni-heart" style="margin-top: 10px"></i> <span
									class="total-items">찜목록</span>
								</a>
								<!-- Shopping Item -->
								<div class="shopping-item">
									<div class="dropdown-cart-header">
										<span>찜 리스트</span>
									</div>
									<c:forEach items="${wishList }" var="wish">
										<ul class="shopping-list">
											<li><a href="javascript:void(0)" class="remove"
												title="Remove this item"><i class="lni lni-close"></i></a>
												<div class="cart-img-head">
													<a class="cart-img" href="javascript:void(0)"><img
														src="<c:url value='/img/${pr.saleImageVOList.size() != 0 ? pr.saleImageVOList.get(0).si_name :\"\" }'/>"
														alt="#"></a>
												</div>
												<div class="content">
													<h4>
														<a
															href="<c:url value='/saleboard/detail?sb_num=${wish.saleBoardVO.sb_num}'/>">
															${wish.saleBoardVO.sb_name }</a>
													</h4>
													<p class="quantity">
														<span class="amount">${wish.saleBoardVO.sb_price }</span>
													</p>
												</div></li>
										</ul>
									</c:forEach>
								</div>
								<!--/ End Shopping Item -->
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- 헤더 마지막 -->
	<!-- Start Header Bottom -->
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-8 col-md-6 col-12">
				<div class="nav-inner">
					<!-- Start Mega Category Menu -->
					<!-- 카테고리 적는곳 -->
					<div class="mega-category-menu">
						<span class="cat-button"><i class="lni lni-menu"></i>카테고리</span>
						<ul class="sub-category">
							<c:forEach items="${categoryList}" var="category">
								<li><a
									href="<c:url value='/saleboard/${category.sc_num}'/>">${category.sc_name }</a></li>
							</c:forEach>
						</ul>
					</div>
					<!-- End Mega Category Menu -->
					<!-- Start Navbar -->
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
								<li class="nav-item"><a href="<c:url value='/'/>"
									class="active" aria-label="Toggle navigation">Home</a></li>
							</ul>
						</div>

						<!-- navbar collapse -->
					</nav>
					<!-- End Navbar -->
				</div>
			</div>
		</div>
	</div>
	<!-- End Header Bottom -->
</header>
<!-- End Header Area -->


<script type="text/javascript">
		
		
		$('.wish').click(function(){
			console.log(1)
			let data = {
				wi_me_num : '${user.me_num}',
				wi_sb_num : '${board.sb_num}',
			};
			ajaxJsonToJson(false, 'post', '/saleboard/wish', data, (data)=>{
				if(data.isWish == 0){
					alert('찜을 취소하였습니다.');		
				}
				diplayWishBtn(data.isWish);
				$('.wish-text').text("찜 " + data.board.sb_wish);
			})
		})
		function diplayWishBtn(isWish){
			
				$('.wish-type').text("찜취소");
				$('.wish').removeClass("add");
				$('.wish').addClass("cancel");
				$('.wish img').attr("src", "<c:url value='/resources/image/wish-filled.png'/>");
			
		}
		
	</script>