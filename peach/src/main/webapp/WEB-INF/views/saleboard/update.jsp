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
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<div class="insert-container">
		<div class="wrapper">
				
				<ul class="image-preview">
					<li class="upload" style="background-image:url('<c:url value='/resources/image/upload.png' />')"></li>
					<c:forEach items="${board.saleImageVOList }" var="image">
					<li class="image-list" id="image${image.si_num}">
						<img src="<c:url value='/resources/image/${image.si_name}'/>" data-file="${image.si_name}">
						<button class="close-btn" id="id${image.si_num }" onclick="deleteOriginal(${image.si_num})"type="button" data-num="${image.si_num}"></button>
					</li>
					</c:forEach>
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
			      close.setAttribute('onclick', 'deleteFile(' + fileNo + ')');
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
			    const list = document.getElementsByClassName('image-list');
			    
			    function clickfunction(){
			    	const filebutton = document.querySelector('#no' + fileNo);
			    	filebutton.click();
			    }
			    
			    upload.addEventListener('click', ()=> clickfunction());
			    
			    
				
				/* 첨부파일 추가 */
				function addFile(obj){
				    var maxFileCnt = 4;   // 첨부파일 최대 개수
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
				}

				function deleteOriginal(num) {
					  let si_num = document.querySelector("#id" + num).getAttribute('data-num');
				      document.getElementById('sb_me_num').insertAdjacentHTML('afterend', '<input type="hidden" name="delFiles" value="'+si_num+'">');
				      document.querySelector("#image" + num).remove();
				}
			  </script>
		</div>
	<form action="<c:url value='/saleboard/update'/>" method="post" enctype="multipart/form-data">
		<input type="file" class="real-upload" accept="image/*" onchange="addFile(this);" id="no0" name="files">
		<input type="hidden" name="sb_num" value="${board.sb_num }">
		<input type="hidden" name="sb_me_num" value="${board.sb_me_num }" id="sb_me_num">
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