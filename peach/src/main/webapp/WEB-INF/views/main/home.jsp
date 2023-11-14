<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<title>스프링</title>
<style>
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
.side-bar{
	float: right;
	position: sticky;
}

</style>
</head>
<body>
	


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
										<a href="<c:url value='/'/>" class="btn">Shop Now</a>
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
										<a href="<c:url value='/'/>" class="btn">Shop Now</a>
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
										<a class="btn" href="<c:url value='/'/>">Shop Now</a>
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
						<h2>오늘의 상품</h2>
						<p>자세한 내용 / 문구 입력</p>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- Start Single Product -->
				<c:forEach items="${prList}" var="pr">
					<div class="col-lg-3 col-md-6 col-12">
						<div class="single-product">
							<a href="<c:url value='/saleboard/detail?sb_num=${pr.sb_num}'/>"
								target="_self">
								<div class="product-image">
								<c:choose>
									<c:when test="${pr.saleImageVOList.size() != 0 }">
										<img class="item" width="100%" height="194" src="<c:url value='/resources/image/${pr.saleImageVOList.size() != 0 ? pr.saleImageVOList.get(0).si_name :\"\" }'/>">
									</c:when>
									<c:otherwise>
										<img class="item" width="100%" height="auto" src="<c:url value='/resources/image/NoMainImage.png'/>">
									</c:otherwise>
								</c:choose>
								</div>
								<div class="product-info">
									<span class="category">${pr.saleCategoryVO.sc_name}</span>
									<h4 class="title">${pr.sb_name}</h4>
									<div class="item-info">${pr.sb_info}</div>
									<div class="price">
										<span>${pr.get_sb_price()} </span>
									</div>
								</div>
							</a>
						</div>

						<!-- End Single Product -->
					</div>
					</a>
				</c:forEach>

				<!-- End Single Product -->
			</div>
		</div>
	</section>
	<!-- End Trending Product Area -->


	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/tiny-slider.js"></script>
	<script src="resources/js/glightbox.min.js"></script>
	<script src="resources/js/main.js"></script>
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
		
		$('.wish').click(function(){
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


</body>
</html>
