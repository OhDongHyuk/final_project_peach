<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>

<title>스프링</title>
</head>
<body>
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
							<div class="navbar-search search-style-5">
								<div class="search-select">
									<div class="select-position">
										<select id="select1">
											<option selected>All</option>
											<option value="1">제목으로 검색</option>
											<option value="2">내용으로 검색</option>
											<option value="3">동네이름으로 검색</option>
										</select>
									</div>
								</div>
								<div class="search-input">
									<input type="text" placeholder="Search">
								</div>
								<div class="search-btn">
									<button>
										<i class="lni lni-search-alt"></i>
									</button>
								</div>
							</div>
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
								<!-- 찜목록 구현 -->
								<div class="wishlist">
									<a href="#"> <i class="lni lni-heart"></i> <span
										class="total-items">0</span>
									</a>
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
									<li><a href="<c:url value='/sale/${category.sc_num}'/>">${category.sc_name }</a></li>
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
									<li class="nav-item"><a href="index.html" class="active"
										aria-label="Toggle navigation">Home</a></li>
									<li class="nav-item"><a class="dd-menu collapsed"
										href="javascript:void(0)" data-bs-toggle="collapse"
										data-bs-target="#submenu-1-2"
										aria-controls="navbarSupportedContent" aria-expanded="false"
										aria-label="Toggle navigation">Pages</a>
										<ul class="sub-menu collapse" id="submenu-1-2">
											<li class="nav-item"><a href="about-us.html">About
													Us</a></li>
											<li class="nav-item"><a href="faq.html">Faq</a></li>
											<li class="nav-item"><a href="login.html">Login</a></li>
											<li class="nav-item"><a href="register.html">Register</a></li>
											<li class="nav-item"><a href="mail-success.html">Mail
													Success</a></li>
											<li class="nav-item"><a href="404.html">404 Error</a></li>
										</ul></li>
									<li class="nav-item"><a href="contact.html"
										aria-label="Toggle navigation">Contact Us</a></li>
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


	<section class="hero-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-12 custom-padding-right">
					<div class="slider-head">
						<!-- Start Hero Slider -->
						<div class="hero-slider">
							<!-- Start Single Slider -->
							<div class="single-slider"
								style="background-image: url(resources/img/slider-bg1.jpg);">
								<div class="content">
									<h2>
										<span>No restocking fee ($35 savings)</span> M75 Sport Watch
									</h2>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
										sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua.</p>
									<h3>
										<span>Now Only</span> $320.99
									</h3>
									<div class="button">
										<a href="product-grids.html" class="btn">Shop Now</a>
									</div>
								</div>
							</div>
							<!-- End Single Slider -->
							<!-- Start Single Slider -->
							<div class="single-slider"
								style="background-image: url(resources/img/slider-bg2.jpg);">
								<div class="content">
									<h2>
										<span>Big Sale Offer</span> Get the Best Deal on CCTV Camera
									</h2>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
										sed do eiusmod tempor incididunt ut labore et dolore magna
										aliqua.</p>
									<h3>
										<span>Combo Only:</span> $590.00
									</h3>
									<div class="button">
										<a href="product-grids.html" class="btn">Shop Now</a>
									</div>
								</div>
							</div>
							<!-- End Single Slider -->
						</div>
						<!-- End Hero Slider -->
					</div>
				</div>
				<div class="col-lg-4 col-12">
					<div class="row">
						<div class="col-lg-12 col-md-6 col-12 md-custom-padding">
							<!-- Start Small Banner -->
							<div class="hero-small-banner"
								style="background-image: url('resources/img/slider-bnr.jpg');">
								<div class="content">
									<h2>
										<span>New line required</span> iPhone 12 Pro Max
									</h2>
									<h3>$259.99</h3>
								</div>
							</div>
							<!-- End Small Banner -->
						</div>
						<div class="col-lg-12 col-md-6 col-12">
							<!-- Start Small Banner -->
							<div class="hero-small-banner style2">
								<div class="content">
									<h2>Weekly Sale!</h2>
									<p>Saving up to 50% off all online store items this week.</p>
									<div class="button">
										<a class="btn" href="product-grids.html">Shop Now</a>
									</div>
								</div>
							</div>
							<!-- Start Small Banner -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Start Trending Product Area -->
	<section class="trending-product section" style="margin-top: 12px;">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2>Trending Product</h2>
						<p>There are many variations of passages of Lorem Ipsum
							available, but the majority have suffered alteration in some
							form.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- Start Single Product -->
				<c:forEach items="${list }" var="saleBoard">
					<div class="col-lg-3 col-md-6 col-12">
						<div class="single-product">
							<div class="product-image">
								<img src="resources/img/slider-bg2.jpg" alt="#">
								<div class="button">
									<a href="product-details.html" class="btn"><i
										class="lni lni-cart"></i> Add to Cart</a>
								</div>
							</div>
							<div class="product-info">
								<span class="category">${saleBoard.sb_sc_num}</span>
								<h4 class="title">
									<a href="product-grids.html">${saleBoard.sb_name}</a>
								</h4>
								<ul class="review">
									<li><i class="lni lni-star-filled"></i></li>
									<li><i class="lni lni-star-filled"></i></li>
									<li><i class="lni lni-star-filled"></i></li>
									<li><i class="lni lni-star-filled"></i></li>
									<li><i class="lni lni-star"></i></li>
									<li><span>4.0 Review(s)</span></li>
									<span>/ 좋아요 ${saleBoard.sb_wish} </span>
								</ul>
								<div class="item-info">
								${saleBoard.sb_info}
								</div>
								<div>
								
								</div>
								<div class="price">
								<span>${saleBoard.sb_price}원</span>
								</div>
								<%-- 	<span>${saleBoard.sb_num}</span> <span>${saleBoard.sb_name}</span>
									<span>${saleBoard.sb_info}</span> <span>${saleBoard.sb_price}</span>
									<span>${saleBoard.sb_wish}</span> <span>${saleBoard.sb_me_num}</span>
									<span>${saleBoard.sb_ss_num}</span> <span>${saleBoard.sb_sc_num}</span>
									<span>${saleBoard.sb_date}</span> --%>
							</div>
						</div>

						<!-- End Single Product -->
					</div>
				</c:forEach>

				<!-- End Single Product -->
			</div>
		</div>
	</section>
	<!-- End Trending Product Area -->

	<!-- Start Shipping Info -->
	<section class="shipping-info">
		<div class="container">
			<ul>
				<!-- Free Shipping -->
				<li>
					<div class="media-icon">
						<i class="lni lni-delivery"></i>
					</div>
					<div class="media-body">
						<h5>Free Shipping</h5>
						<span>On order over $99</span>
					</div>
				</li>
				<!-- Money Return -->
				<li>
					<div class="media-icon">
						<i class="lni lni-support"></i>
					</div>
					<div class="media-body">
						<h5>24/7 Support.</h5>
						<span>Live Chat Or Call.</span>
					</div>
				</li>
				<!-- Support 24/7 -->
				<li>
					<div class="media-icon">
						<i class="lni lni-credit-cards"></i>
					</div>
					<div class="media-body">
						<h5>Online Payment.</h5>
						<span>Secure Payment Services.</span>
					</div>
				</li>
				<!-- Safe Payment -->
				<li>
					<div class="media-icon">
						<i class="lni lni-reload"></i>
					</div>
					<div class="media-body">
						<h5>Easy Return.</h5>
						<span>Hassle Free Shopping.</span>
					</div>
				</li>
			</ul>
		</div>
	</section>
	<!-- End Shipping Info -->

	<script type="text/javascript">
		//========= Hero Slider 
		tns({
			container : '.hero-slider',
			slideBy : 'page',
			autoplay : true,
			autoplayButtonOutput : false,
			mouseDrag : true,
			gutter : 0,
			items : 1,
			nav : false,
			controls : true,
			controlsText : [ '<i class="lni lni-chevron-left"></i>',
					'<i class="lni lni-chevron-right"></i>' ],
		});

		//======== Brand Slider
		tns({
			container : '.brands-logo-carousel',
			autoplay : true,
			autoplayButtonOutput : false,
			mouseDrag : true,
			gutter : 15,
			nav : false,
			controls : false,
			responsive : {
				0 : {
					items : 1,
				},
				540 : {
					items : 3,
				},
				768 : {
					items : 5,
				},
				992 : {
					items : 6,
				}
			}
		});
	</script>


</body>
</html>
