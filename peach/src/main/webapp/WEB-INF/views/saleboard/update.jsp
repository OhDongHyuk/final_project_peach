<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>스프링</title>
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
</style>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<h1>판매하기</h1>
	<div class="insert-container">
		<div class="wrapper">
			<input type="file" class="real-upload" accept="image/*" required>
			<ul class="image-preview">
				<li class="upload" style="background-image:url('<c:url value='/resources/image/upload.png' />')"></li>
			</ul>
			<script>
			    function getImageFiles(e) {
			      const uploadFiles = [];
			      const files = e.currentTarget.files;
			      const imagePreview = document.querySelector('.image-preview');
			      const docFrag = new DocumentFragment();
			      
			      if (list.length >= 4){
			    	  alert('이미지는 최대 4개까지만 등록 가능합니다.');
			    	  return
			      }
			
			      // 파일 타입 검사
			      [...files].forEach(file => {
			        if (!file.type.match("image/.*")) {
			          alert('이미지 파일만 업로드가 가능합니다.');
			          return
			        }
			
			        // 파일 갯수 검사
			        if ([...files].length < 4) {
			          uploadFiles.push(file);
			          const reader = new FileReader();
			          reader.onload = (e) => {
			            const preview = createElement(e, file);
			            imagePreview.appendChild(preview);
			            preview.children[1].addEventListener('click', () => imagePreview.removeChild(preview));
			            
			          };
			          reader.readAsDataURL(file);
			        }
			      });
			    }
			
			    function createElement(e, file) {
			      const li = document.createElement('li');
			      const close = document.createElement('button');
			      const img = document.createElement('img');
			      li.setAttribute('class', 'image-list');
			      img.setAttribute('src', e.target.result);
			      img.setAttribute('data-file', file.name);
			      close.setAttribute('class', 'close-btn');
			      close.setAttribute('type', 'button');
			      
			      li.appendChild(img);
			      li.appendChild(close);
			      
			
			      return li;
			    }
			
			    const realUpload = document.querySelector('.real-upload');
			    const upload = document.querySelector('.upload');
			    const list = document.getElementsByClassName('image-list');
			    
			    
			    upload.addEventListener('click', () => realUpload.click());
			
			    realUpload.addEventListener('change', getImageFiles);
			    
			    //deleteFile[0].addEventListener('click', () => console.log('abc'));
			  </script>
		</div>
	<form action="<c:url value='/saleboard/update'/>" method="post">
		<input type="hidden" name="sb_num" value="${board.sb_num }">
		<input type="hidden" name="sb_me_num" value="${board.sb_me_num }">
		<div class="form-group">
			<label>제목</label>
			<input type="text" class="form-control" name="sb_name" value="${board.sb_name }">
		</div>
		<div class="form-group">
			<label>카테고리</label>
			<select name="sb_sc_num" class="custom-select">
				<option selected value="${board.sb_sc_num }">${board.sb_sc_name}</option>
			    <c:forEach items="${dbCategory}" var="dbCategory">
			    	<c:if test="${dbCategory.sc_num != board.sb_sc_num}">
			    		<option value="${dbCategory.sc_num}">${dbCategory.sc_name}</option>
			    	</c:if>
			    </c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label>가격</label>
			<input type="text" class="form-control" name="sb_price" placeholder="숫자만 입력하세요." value="${board.sb_price }">
		</div>
		<div class="form-group">
			<label>설명</label>
			<textarea id="summernote" name="sb_info" class="form-control" rows="10">${board.sb_info}</textarea>
		</div>
		<button class="btn btn-outline-success col-12">등록</button>
	</form>
	</div>
	<script>
      $('#summernote').summernote({
        placeholder: '물품에 대한 자세한 설명을 작성하여주세요.',
        tabsize: 2,
        height: 300
      });
    </script>
</body>
</html>
