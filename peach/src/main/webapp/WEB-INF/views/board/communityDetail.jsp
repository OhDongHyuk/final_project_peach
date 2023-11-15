<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .co_de {
            font-family: 'Arial', sans-serif;
            margin: 20px auto;
            width: 750px;
        }

        .CDdiv {
            margin-bottom: 10px;
        }

        .co_de_title {
            font-size: 24px;
            font-weight: bold;
        }

        .co_de_info {
            font-size: 14px;
            color: #666;
        }

        .co_de_write {
            border: 1px solid black;
            margin-bottom: 20px;
            height: 500px;
        }

        .co_de_comment {
            border: 1px solid black;
            height: 60px;
            display: flex;
        }

        .CDbtn {
            width: 80px;
            height: 40px;
            /* 필요한 스타일 추가 */
        }
        .reply_writer{
        	border-right: 1px solid black;
        	width: 100px;
        	display: flex;
			justify-content: center;
			align-items: center;
        }
        .edit{
      	    height: 30px;
        	width: 50px;
        }
        .report-button1{
        	height: 30px;
        	width: 50px;
        }
         .report-button2{
        	height: 30px;
        	width: 50px;
        	margin-left: auto;
        	margin-top:10px;
        }
        	.custom-modal {
		  display: none;
		  position: fixed;
		  z-index: 1;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  overflow: auto;
		  background-color: rgba(0, 0, 0, 0.4);
		}
		
		.custom-modal .modal-content {
		  background-color: rgb(247, 247, 247);
		  margin: 15% auto;
		  border: 1px solid #888;
		  width: 420px;
		  padding: 20px;
		  text-align: center;
		  border-radius: 8px;
		  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
		}
		
		.custom-modal .modal-header h2 {
		  font-size: 24px;
		  font-weight: bold;
		}
		
		.custom-modal .modal-body {
		  margin-top: 20px;
		}
		
		.custom-modal .report-reason {
		  width: 100%;
		  padding: 10px;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		  resize: none;
		  height: 200px;
		}
		
		.custom-modal .report-button,
		.custom-modal .cancel-button {
		  padding: 10px 20px;
		  font-size: 16px;
		  cursor: pointer;
		  border: none;
		  border-radius: 5px;
		  margin-right: 10px;
		}
		
		.custom-modal .report-button {
		  background-color: #ff5733;
		  color: white;
		}
		
		.custom-modal .report-button:hover {
		  background-color: #ff4500;
		}
		
		.custom-modal .cancel-button {
		  background-color: #ccc;
		  color: #333;
		}
		
		.custom-modal .cancel-button:hover {
		  background-color: #999;
		}
		
		.custom-modal .close {
		  position: absolute;
		  top: 10px;
		  right: 10px;
		  cursor: pointer;
		  font-size: 24px;
		}
		
		.custom-modal .close:hover,
		.custom-modal .close:focus {
		  color: black;
		  text-decoration: none;
		  cursor: pointer;
		}
		.report-text-area {
			text-align: left;
			margin-top: 20px;
		}
		.maxtext {
			color: grey;
			font-size: 13px;
		}
		
			.custom-modal2 {
		  display: none;
		  position: fixed;
		  z-index: 1;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  overflow: auto;
		  background-color: rgba(0, 0, 0, 0.4);
		}
		
		.custom-modal2 .modal-content {
		  background-color: rgb(247, 247, 247);
		  margin: 15% auto;
		  border: 1px solid #888;
		  width: 420px;
		  padding: 20px;
		  text-align: center;
		  border-radius: 8px;
		  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
		}
		
		.custom-modal2 .modal-header h2 {
		  font-size: 24px;
		  font-weight: bold;
		}
		
		.custom-modal2 .modal-body {
		  margin-top: 20px;
		}
		
		.custom-modal2 .report-reason {
		  width: 100%;
		  padding: 10px;
		  border: 1px solid #ccc;
		  border-radius: 4px;
		  resize: none;
		  height: 200px;
		}
		
		.custom-modal2 .report-button,
		.custom-modal2 .cancel-button {
		  padding: 10px 20px;
		  font-size: 16px;
		  cursor: pointer;
		  border: none;
		  border-radius: 5px;
		  margin-right: 10px;
		}
		
		.custom-modal2 .report-button {
		  background-color: #ff5733;
		  color: white;
		}
		
		.custom-modal2 .report-button:hover {
		  background-color: #ff4500;
		}
		
		.custom-modal2 .cancel-button {
		  background-color: #ccc;
		  color: #333;
		}
		
		.custom-modal2 .cancel-button:hover {
		  background-color: #999;
		}
		
		.custom-modal2 .close {
		  position: absolute;
		  top: 10px;
		  right: 10px;
		  cursor: pointer;
		  font-size: 24px;
		}
		
		.custom-modal2 .close:hover,
		.custom-modal2 .close:focus {
		  color: black;
		  text-decoration: none;
		  cursor: pointer;
		}
    </style>
    <title>커뮤니티 세부 정보</title>
</head>
<body>
	<br>
	<div class="co_de CDdiv">
	    <div class="co_de_title CDdiv">제목: ${detail.co_title}</div>
	    <div class="co_de_info CDdiv">작성자: ${writer.me_nick} | 작성일: ${detail.co_date}</div>
	    <c:if test="${user.me_num == writer.me_num}">
	    	<form action="<c:url value='/board/communityEdit/${detail.co_num}'/>" method="get">
        		<button class="edit" type="submit">수정</button>
   			 </form>
	    </c:if>
	    <c:if test="${user != null}">
	    <c:if test="${user.me_num != writer.me_num}">
			<div class="profile-right">
				<div class="profile-right-box">
					<button type="button" class="report-post" id="openReportModalBtn">게시물 신고하기</button>
				</div>
			</div>
		</c:if>
		</c:if>
	    <div class="co_de_write">
	 	  	<!-- 글 내용 -->
	 	   <c:if test="${coImage != null}">
	  		  <img src="<c:url value='/img/${coImage.ci_name}'/>" class="co_img">
	 	   </c:if>
	 	   <c:if test="${empty detail.co_info}">
      		  <p>내용이 없습니다.</p>
   		   </c:if>
	   	 		<div class="co_de_content CDdiv">${detail.co_info}</div>
		</div>
		<c:if test="${user.me_num != writer.me_num}">
		<c:if test="${user.me_num != null}">
			<button class="co_like" onclick="likeCommunity()">추천</button>
		</c:if>
		</c:if>
		<br>
		<br>
		<c:if test="${not empty reList}">
		    <div class="co_de_comments">
		        <c:forEach var="reList" items="${reList}">
		            <div class="co_de_comment">
		            	<div class="reply_writer">
		            		${reList.replyWriter}
		            	</div>
		                	${reList.re_info}
						<div class="report-button2">
							<c:if test="${reList.replyWriter != user.me_nick}">
								<div class="profile-right">
									<div class="profile-right-box">
										<c:if test= "${user != null}">
										<button type="button" class="report-post" id="openReportModalBtn2" data-num="${reList.re_num }">신고</button>
										</c:if>
									</div>
								</div>
							</c:if>
						</div>
		            </div>
		        </c:forEach>
		    </div>
		</c:if>
		<br>
		<form action="<c:url value='/board/communityDetail'/>" method="post" enctype="multipart/form-data">
		    <div class="form-group">
				<textarea id="summernote" name="re_info" class="form-control" rows="4"></textarea>
			</div>
			<input type="hidden" name="co_num" value="${detail.co_num}">
			<button class="CDbtn">등록</button>
		</form>
	</div>
	
	<div id="reportPostModal" class="custom-modal">
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <div class="modal-header">
	      <h2>신고하기</h2>
	    </div>
	    <div class="modal-body">
	      <p>신고 내용을 작성해주세요.</p>
	      <p>최대한 자세하게 기재해주셔야 원활한 신고 처리가 가능합니다.</p>
	      <div class="report-text-area">
		      <p class="maxtext">* 최대 500자 제한</p>
		      <textarea id="reportReason" class="report-reason" placeholder="신고 이유를 입력하세요" maxlength="500"></textarea>						      
	      </div>
	    </div>
	    <div class="modal-footer">
	      <button class="report-button" onclick="reportPost()">신고</button>
	      <button class="cancel-button" onclick="closeReportModal()">취소</button>
	    </div>
	  </div>
	</div>
	<div id="reportPostModal2" class="custom-modal2">
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <div class="modal-header">
	      <h2>신고하기</h2>
	    </div>
	    <div class="modal-body">
	      <p>신고 내용을 작성해주세요.</p>
	      <p>최대한 자세하게 기재해주셔야 원활한 신고 처리가 가능합니다.</p>
	      <div class="report-text-area">
		      <p class="maxtext">* 최대 500자 제한</p>
		      <textarea id="reportReason2" class="report-reason" placeholder="신고 이유를 입력하세요" maxlength="500"></textarea>						      
	      </div>
	    </div>
	    <div class="modal-footer">
	      <button class="report-button" onclick="reportPost2()">신고</button>
	      <button class="cancel-button" onclick="closeReportModal2()">취소</button>
	    </div>
	  </div>
	</div>

    <script>
        $(document).ready(function() {
            $('#summernote').summernote();
        });
        
        function likeCommunity() {
            // 게시물 번호
            var coNum = "${co_num}"; 
            // Ajax 요청
            $.ajax({
                type: "POST",
                url: "/peach/board/communityDetail/"+coNum,
                data: {},
                success: function(response) {
                    if (response === true) {
                        alert("추천 성공");
                    } else {
                        alert("추천은 한 번만 가능합니다.");
                    }
                },
                error: function(error) {
                    alert("추천 실패");
                }
            });
        }
        
        const reportPostModal = document.getElementById("reportPostModal");
		const openReportModalBtn = document.getElementById("openReportModalBtn");
		const closeReportModalBtn = document.querySelector(".custom-modal .close");
		
		openReportModalBtn.addEventListener("click", function () {
			if('${user.me_id}' == '') {
				if(confirm('로그인하시겠습니까?')){
					location.href = '<c:url value="/member/login"/>'
				}
				return;
			}
		  	reportPostModal.style.display = "block";
		});
		
		closeReportModalBtn.addEventListener("click", function () {
		  reportPostModal.style.display = "none";
		});		

		window.addEventListener("click", function (event) {
		  if (event.target === reportPostModal) {
		    reportPostModal.style.display = "none";
		  }
		});
		
		function reportPost() {
			
			if('${user.me_num}' == '${writer_me_num}'){
				alert("본인의 게시물은 신고가 불가합니다.");
				return;
			}
			
			const reportReason = document.getElementById("reportReason").value;

		  	if (reportReason.trim() === "") {
		   		alert("신고 이유를 입력하세요.");
		   		return;
			}
		  	
			let data = {
				key : '${co_num}',
				info : reportReason,
				table : 'community'
			};
			ajaxJsonToJson(
					  false,
					  'post',
					  'report',
					  data,
					  (data) => {
					    alert("게시물을 신고했습니다.\n신고 사유: " + reportReason);
					    console.log(data.msg);
					    document.getElementById("reportReason").value = '';
					    closeReportModal(); // Close the modal after reporting
					  },
					    () => {
					    	
					    	console.log("실패");
					    }
					);
			}
		function closeReportModal() {
			  reportPostModal.style.display = "none";
			}
	
		let re_num = 0;
		const reportPostModal2 = document.getElementById("reportPostModal2");
		const openReportModalBtn2 = document.querySelectorAll("#openReportModalBtn2");
		const closeReportModalBtn2 = document.querySelector(".custom-modal2 .close");
		
		[].forEach.call(openReportModalBtn2, function(button){
			button.addEventListener("click", function () {
				console.log(button);
				if('${user.me_id}' == '') {
					if(confirm('로그인하시겠습니까?')){
						location.href = '<c:url value="/member/login"/>'
					}
					return;
				}
			  	reportPostModal2.style.display = "block";
			  	re_num = $(this).data('num');
			});	
		});
		
		closeReportModalBtn2.addEventListener("click", function () {
		  reportPostModal2.style.display = "none";
		});		

		window.addEventListener("click", function (event) {
		  if (event.target === reportPostModal) {
		    reportPostModal2.style.display = "none";
		  }
		});
		
		function reportPost2() {
			
			const reportReason2 = document.getElementById("reportReason2").value;

		  	if (reportReason2.trim() === "") {
		   		alert("신고 이유를 입력하세요.");
		   		return;
			}
		  	
			let data = {
				key : re_num,
				info : reportReason2,
				table : 'reply'
			};
			ajaxJsonToJson(
					  false,
					  'post',
					  'report',
					  data,
					  (data) => {
					    alert("게시물을 신고했습니다.\n신고 사유: " + reportReason2);
					    console.log(data.msg);
					    document.getElementById("reportReason2").value = '';
					    closeReportModal(); 
					  },
					    () => {
					    	
					    	console.log("실패");
					    }
					);
			}
		function closeReportModal2() {
			  reportPostModal2.style.display = "none";
			}
		
    </script>
</body>
</html>
