<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<head>

	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js"></script>
  
</head>
<body>
	<h1>회원가입</h1>
	<div class="container">
		<form action="<c:url value='/member/signup'/>" method="post">
			<div class="form-group">
				<input type="text" name="me_id" class="form-control" placeholder="아이디">
			</div>
			<button class="btn btn-outline-dark col-12" type="button" id="btn-check">아이디 중복체크</button>
			<div class="form-group">
				<input type="password" name="me_pw" class="form-control" placeholder="비밀번호" id="pw">
			</div>
			<div class="form-group">
				<input type="password" name="me_pw2" class="form-control" placeholder="비밀번호 확인">
			</div>
			<div class="form-group">
				<input type="text" name="me_name" class="form-control" placeholder="이름">
			</div>
			<div class="form-group">
				<input type="text" name="me_acc" class="form-control" placeholder="계좌번호">
			</div>
			<div class="form-group">
				<input type="text" name="me_phone" class="form-control" placeholder="핸드폰 번호">
			</div>
			<div class="form-group">
				<input type="text" name="me_nick" class="form-control" placeholder="닉네임">
			</div>
			<div class="form-group">
				<label>생년월일</label>
				<input type="date" class="form-control" name="me_birthday" placeholder="생년월일"> <br>
			</div>
			<button class="btn btn-success col-12">회원가입</button>
		</form>
	</div>
	<script type="text/javascript">
		let checkId = false;
		$('#btn-check').click(function(){
			//서버로 아이디를 전달=>Object로 id만 서버로 전송
			let id = $('[name=me_id]').val();
			if(id.trim() == ''){
				alert('아이디를 입력하세요.');
				return;
			}
			let idRegex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([\-.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if(!idRegex.test(id)){
				alert('이메일 형식이 아닙니다.')
				return false;
			}
			$.ajax({
				async : true,
				url : '<c:url value="/member/id/check"/>', 
				type : 'post', 
				data : {id : id}, 
				success : function (data){
					//서버에서 아이디 사용 가능여부를 알려주면 알림창으로 알려줌=>Object로 사용 가능/불가능만 알려주면 됨
					if(data){
						alert('사용 가능한 아이디입니다.');
						checkId = true;
					}else{
						alert('이미 사용중인 아이디입니다.')
					}
				}, 
				error : function(a,b,c){
					console.log(a);
					console.log(b);
					console.log(c);
				}
			});
		})
		$('form').submit(function(){
			if(!checkId){
				alert('아이디 중복 검사를 하세요.');
				return false;
			}
		})
		$('[name=me_id]').change(function(){
			checkId = false;
		})
		
		$(function(){
		    $("form").validate({
		        rules: {
		            me_id: {
		                required : true,
		                email : true
		            },
		            me_pw: {
		                required : true,
		                regex: /^\w{8,20}$/
		            },
		            me_pw2: {
		                required : true,
		                equalTo : pw //id가 pw인 요소와 값이 같은지 확인
		            },
		            me_email: {
		                required : true,
		                email : true
		            }
		        },
		        //규칙체크 실패시 출력될 메시지
		        messages : {
		            me_id: {
		                required : "필수로입력하세요",
		                email : "이메일 형식으로 입력하세요."
		            },
		            me_pw: {
		                required : "필수로입력하세요",
		                regex : "비번은 8~20자이며, 영문,숫자로 되어야 합니다."
		            },
		            me_pw2: {
		                required : "필수로입력하세요",
		                equalTo : "비밀번호와 일치하지 않습니다."
		            },
		            me_email: {
		                required : "필수로입력하세요",
		                email : "이메일 형식이 아닙니다."
		            }
		        },
		  		submitHandler : function(){
		  			if(!flag){
		  				alert('아이디 중복검사를 하세요.');
		  				return false;
		  			}
		  			return true;
		  		}
		    });
		})
		$.validator.addMethod(
		    "regex",
		    function(value, element, regexp) {
		        var re = new RegExp(regexp);
		        return this.optional(element) || re.test(value);
		    },
		    "Please check your input."
		);
	</script>
</body>
</html>
