<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>마이페이지 관리</title>
</head>
<style>
	.insert-container {
		width: 1100px;
		margin: auto;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
 	li {
      list-style: none;
      position: relative;
    }

    img {
      width: 200px;
      height: 200px;
		
    }
	close {
	
	}
    .real-upload {
      display: none;
    }

    .upload {
      width: 200px;
      height: 200px;
      cursor: pointer;
    }

    .image-preview {
      width: 1600px;
      height: 200px;
      display: flex;
      gap: 20px;
      margin-left: 40%;
    }
    .close-btn {
    	width: 1.5rem;
	    height: 1.5rem;
	    background-position: center center;
	    background-repeat: no-repeat;
	    background-size: 12px 12px;
	    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxwYXRoIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIKICAgICAgICBkPSJNNi44NDggNmwzLjc3Ni0zLjc3NmEuNi42IDAgMSAwLS44NDgtLjg0OEw2IDUuMTUgMi4yMjQgMS4zNzZhLjYuNiAwIDAgMC0uODQ4Ljg0OEw1LjE1MiA2IDEuMzc2IDkuNzc1YS42LjYgMCAxIDAgLjg0OC44NDlMNiA2Ljg0OGwzLjc3NiAzLjc3NmEuNTk4LjU5OCAwIDAgMCAxLjAyNC0uNDI1LjYuNiAwIDAgMC0uMTc2LS40MjRMNi44NDggNnoiIC8+Cjwvc3ZnPg==);
	    background-color: rgb(25, 25, 25);
	    opacity: 0.3;
	    border-radius: 50%;
	    position: absolute;
	    top: 0.5rem;
	    right: 0.5rem;
	    border: none;
    }
    .form-group-e{
    	width : 400px;
    	margin-left: 30.5%;
    }
    .qwe{
    	margin-left: 38%;
    	font-weight: bold;
    }

</style>
<body>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<br>
	<br>
	<h1 class="qwe">마이페이지 관리</h1>

	<br>
	<div class="insert-container">
		<div class="wrapper">
				<ul class="image-preview">
				<c:if test="${pi_num == ''}">
				<li class="upload" style="background-image:url('<c:url value='/resources/image/upload.png' />')"></li>
				</c:if>
					<c:if test="${pi_num != ''}">
						<li class="upload" style="background-image:url('<c:url value='/resources/image/upload.png' />'); display: none;"></li>
						<li class="image-list" id="file0">
							<img alt="" src="<c:url value='/img/${pi_num}' />" >
							<button class="close-btn" type="button" onclick="deleteOriginal(0)"></button>
						</li>
					</c:if>
				</ul>
			<script>
					
				let fileNo = 1;
			
			    function createElement(e, file) {
			      
			      const li = document.createElement('li');
			      const close = document.createElement('button');
			      const img = document.createElement('img');
			      li.setAttribute('class', 'image-list');
			      li.setAttribute('id', "file" + fileNo)
			      img.setAttribute('src', e.target.result);
			      img.setAttribute('data-file', file.name);
			      close.setAttribute('class', 'close-btn');
			      close.setAttribute('type', 'button');
			      close.setAttribute('onclick', 'deleteFile('+fileNo+')')

			      
			      li.appendChild(img);
			      li.appendChild(close);
			      
			      fileNo++;
			      
			      return li;
			    }
			
			    function createFileTag(){
			    	const fileTag = document.querySelector('#no' + fileNo);
			    	const fi = document.createElement('input');
			    	fi.setAttribute('type', 'file');
			        fi.setAttribute('class', 'real-upload');
			        fi.setAttribute('accept', 'image/*');
			        fi.setAttribute('onchange', 'addFile(this);');
			        fi.setAttribute('id', "no" + (fileNo + 1));
			        fi.setAttribute('name', 'files');
			        fileTag.after(fi);
			    	
			    }

			    const realUpload = document.querySelector('.real-upload');
			    const upload = document.querySelector('.upload');
			    
			    function clickfunction(){
			    	const filebutton = document.querySelector('#no' + fileNo);
			    	filebutton.click();
			    }
			    
			    upload.addEventListener('click', ()=> clickfunction());
			    
			    
			    
				
				/* 첨부파일 추가 */
				function addFile(obj){
				    var maxFileCnt = 1;   // 첨부파일 최대 개수
				    var attFileCnt = document.querySelectorAll('.image-list').length;    // 기존 추가된 첨부파일 개수
				    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
				    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
				    const imagePreview = document.querySelector('.image-preview');
				
				    // 첨부파일 개수 확인
				    if (curFileCnt > remainFileCnt) {
				        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
				    }
				
				    for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {
				
				        const file = obj.files[i];
				
				        // 첨부파일 검증
				        if (validation(file)) {
				            // 파일 배열에 담기
				            var reader = new FileReader();
							reader.onload = (e) => {
			            		createFileTag();
			            		const preview = createElement(e, file);
			           			imagePreview.appendChild(preview);
			           			upload.style.display = "none";
			            	};
			          		reader.readAsDataURL(file);
				            
				        } else {
				            continue;
				        }
				    }
				    // 초기화
				    //document.querySelector("input[type=file]").value = "";
				}
				
				/* 첨부파일 검증 */
				function validation(obj){
				    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
				    if (obj.name.length > 100) {
				        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
				        return false;
				    } else if (obj.size > (100 * 1024 * 1024)) {
				        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
				        return false;
				    } else if (obj.name.lastIndexOf('.') == -1) {
				        alert("확장자가 없는 파일은 제외되었습니다.");
				        return false;
				    } else if (!fileTypes.includes(obj.type)) {
				        alert("첨부가 불가능한 파일은 제외되었습니다.");
				        return false;
				    } else {
				        return true;
				    }
				}
				
				/* 첨부파일 삭제 */
				function deleteFile(num) {
				    document.querySelector("#file" + num).remove();
				    document.querySelector("#no" + num).remove();
				    upload.style.display = "block";
				}
				
				function deleteOriginal(num) {
				    document.querySelector("#file" + num).remove();
				    document.querySelector("#no" + num).remove();
				    upload.style.display = "block";
				}
				

			  </script>
		</div>
		<!-- enctype="multipart/form-data" -->
	<form action="<c:url value='/board/profileMN'/>" method="post" enctype="multipart/form-data" >
		<input type="file" class="real-upload" accept="image/*" onchange="addFile(this);" id="no0" name="Original">
		<input type="file" class="real-upload" accept="image/*" onchange="addFile(this);" id="no1" name="files">
		<div class="form-group-e">
			<br>
			<label>닉네임</label>
			<input type="text" class="form-control" name="me_id" value="${user.me_id}" placeholder="변경할 닉네임을 입력하세요.">
		</div>
		<div class="form-group-e">
			<label>비밀번호</label>
			<input type="password" class="form-control" name="me_pw" value="${user.me_pw}" placeholder="변경할 비밀번호를 입력하세요.">
		</div>
		<br>
		<div class="form-group-e">
			<label>[거래가능 지역]</label>
			
			<br>
			<div class="form-group">
				<label>시/도</label>
				<select name="large" class="form-control">
					<option value="0">시/도 선택</option>
					<c:forEach items="${large}" var="name">
						<option>${name.ci_large}</option>	
					</c:forEach>
				</select>
			</div>
			<div class="medium-box">
				<label>시/군/구</label>
				<select name="medium" class="form-control">
					<option value="0">시/군/구 선택</option>
				</select>
			</div>
			<div class="small-box">
				<label>읍/면/동</label>
				<select name="me_ci_num" class="form-control">
					<option value=0>읍/면/동 선택</option>
				</select>
			</div>
			<p>*읍/면/동까지 선택하지 않으면 수정되지 않습니다.</p>
		</div>
		<div class="form-group">
			<label>소개글</label>
			<textarea id="summernote" name="pf_text" class="form-control" rows="10"></textarea>
		</div>
		<button class="btn btn-outline-success col-12">등록</button>
	</form>
	</div>
	<script>
	$(document).ready(function () {
        $(".medium-box").hide();
        $(".small-box").hide();
    });
	
      $('#summernote').summernote({
        placeholder: '소개글 내용.',
        tabsize: 2,
        height: 300
      });
      
      $('[name=large]').change(function(){
    	    $(".medium-box").show();
			let largeName = $(this).val();
			//medium태그에 넣을 option태그
			let str = '<option value="0">시/군/구 선택</option>';
			//시도를 선택하세요를 선택하면
			if(largeName == 0){
				$('[name=medium]').html(str);
				$('[name=me_ci_num]').html('<option value="0">읍/면/동 선택</option>');
				return;
			}
			$.ajax({
				async : false,
				url : '<c:url value="/board/medium"/>', 
				type : 'post', 
				data : {large : largeName}, 
				success : function (data){
					for(medium of data){
						str += `<option>\${medium.ci_medium}</option>`
					}
					$('[name=medium]').html(str);
					$('[name=me_ci_num]').html('<option value="0">읍/면/동 선택</option>');
				}, 
				error : function(a,b,c){
					console.log(a);
					console.log(b);
					console.log(c);
				}
			});
		})
		
		$('[name=medium]').change(function(){
			 $(".small-box").show();
			let mediumName = $(this).val();
			//medium태그에 넣을 option태그
			let str = '<option value="0">읍/면/동 선택</option>';
			//시도를 선택하세요를 선택하면
			if(mediumName == 0){
				$('[name=me_ci_num]').html(str);
				return;
			}
			$.ajax({
				async : false,
				url : '<c:url value="/board/small"/>', 
				type : 'post', 
				data : {medium : mediumName}, 
				success : function (data){
					for(small of data){
						console.log(data)
						str += `<option value="\${small.ci_num}">\${small.ci_small}</option>`
					}
					$('[name=me_ci_num]').html(str);
				}, 
				error : function(a,b,c){
					console.log(a);
					console.log(b);
					console.log(c);
				}
			});
		})
    </script>
</body>
</html>