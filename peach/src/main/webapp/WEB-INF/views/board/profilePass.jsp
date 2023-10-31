<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<style>


</style>
	<title>프로필 관리 접속시, 비밀번호 요구</title>
</head>
<body>
	<div class="imsi-box">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-12 custom-padding-right">
						<form action="<c:url value='/board/profilePass'/>" method="post">
							<div class="form-group">
								<h3>아이디 : ${user.me_id}</h3>
							</div>
							<label for="Ppassword">비밀번호:</label>
    						<input type="password" id="Ppassword" name="Ppassword">
    						<input type="submit" value="로그인">
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
