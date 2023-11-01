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
    #moption{
    	display : none;
    }
    #soption{
    	display : none;
    }
</style>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<br>
	<br>
	<h1 class="qwe">마이페이지 관리</h1>

	<br>
	<div class="insert-container">
		<div class="wrapper">
				
				<ul class="image-preview">
					<li class="upload" style="background-image:url('<c:url value='/resources/image/upload.png' />')"></li>
				</ul>
			<script>
					
				let fileNo = 0;
			
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
			  </script>
		</div>
	<form action="<c:url value='/board/profileMN'/>" method="post" enctype="multipart/form-data">
		<input type="file" class="real-upload" accept="image/*" onchange="addFile(this);" id="no0" name="files">
		<div class="form-group-e">
			<br>
			<label>닉네임</label>
			<input type="text" class="form-control" name="me_id" value="${user.me_id}" placeholder="변경할 닉네임을 입력하세요.">
		</div>
		<div class="form-group-e">
			<label>비밀번호</label>
			<input type="text" class="form-control" name="me_pw" placeholder="변경할 비밀번호를 입력하세요.">
		</div>
		<div class="form-group-e">
			<label>거래가능 지역</label>
			<br>
			<select name="me_ci_num" class="custom-select" onchange="largeChange()">
				<option selected>시</option>
			    <c:forEach items="${largeCategory}" var="largeCategory">
			    	<option value="${largeCategory.ci_large}">${largeCategory.ci_large}</option>
			    </c:forEach>
			</select>
			<c:if test="${mediumCategory != null}">
			<select name="me_ci_num" class="custom-select" id="moption" onchange="mediumChange()">
				<option selected>구</option>
			    <c:forEach items="${mediumCategory}" var="mediumCategory">
			    	<option value="${mediumCategory.ci_medium}">${mediumCategory.ci_medium}</option>
			    </c:forEach>
			</select>
			</c:if>
			<select name="me_ci_num" class="custom-select" id="soption">
				<option selected>동</option>
			    <c:forEach items="${cityCategory}" var="cityCategory">
			    	<option value="${cityCategory.ci_num}">${cityCategory.ci_small}</option>
			    </c:forEach>
			</select>
			<br>
		</div>
		<div class="form-group">
			<label>소개글</label>
			<textarea id="summernote" name="sb_info" class="form-control" rows="10"></textarea>
		</div>
		<button class="btn btn-outline-success col-12">등록</button>
	</form>
	</div>
	<script>
      $('#summernote').summernote({
        placeholder: '소개글 내용.',
        tabsize: 2,
        height: 300
      });
      
      function largeChange () {
    	  var moption = document.getElementById("moption");
    	  moption.style.display = "block";
    	  
    	  
      }
      
      
      function mediumChange() {
    	  var soption = document.getElementById("soption");
    	  soption.style.display = "block";
    	  
    	  
	}
    </script>
</body>
</html>
