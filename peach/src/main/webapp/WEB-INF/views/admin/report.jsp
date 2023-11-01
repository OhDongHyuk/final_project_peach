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

#btnWrap {
	
}

#popupBtn {
	width: 150px;
	height: 50px;
	padding: 10px 5px;
}

#modalWrap {
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

#modalBody {
	width: 500px;
	height: 300px;
	padding: 30px 30px;
	margin: 0 auto;
	border: 1px solid #777;
	background-color: #fff;
}

#closeBtn {
	float: right;
	font-weight: bold;
	color: #777;
	font-size: 25px;
	cursor: pointer;
}
</style>
</head>
<body>
	
	<section class="hero-area">
		<div class="container admin">
			<div class="row">
				<div class="col-lg-8 col-12 custom-padding-right"></div>

				<div id="btnWrap">
					<button type="button" id="popupBtn" name="popupBtn">모달 팝업
						띄우기</button>
					<button type="button" id="popupBtn1" name="popupBtn">모달 팝업
						띄우기</button>
					<button type="button" id="popupBtn2" name="popupBtn">모달 팝업
						띄우기</button>
					<button type="button" id="popupBtn" name="popupBtn1">모달 팝업
						띄우기</button>
					<button type="button" id="popupBtn" name="popupBtn2">모달 팝업
						띄우기</button>
					<button type="button" id="popupBtn" name="popupBtn3">모달 팝업
						띄우기</button>
				</div>

				<div id="modalWrap">
					<div id="modalBody">
						<span id="closeBtn"></span>
						<p>modal-popup 입니다.</p>
					</div>
				</div>




			</div>
		</div>
	</section>

	<script type="text/javascript">
	
	$("button[id^='rep_delete']").on('click',function(){
		
	
	}
		const btn = document.querySelector ('#popupBtn');
		const modal = document.getElementById('modalWrap');
		const closeBtn = document.getElementById('closeBtn');

		btn.onclick = function() {
			modal.style.display = 'block';
		}
		closeBtn.onclick = function() {
			modal.style.display = 'none';
		}

		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>




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