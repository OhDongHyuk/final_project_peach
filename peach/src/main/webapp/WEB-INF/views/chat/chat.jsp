<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>스프링</title>
<!-- 메세지 전송 아이콘(종이비행기) 때문에 필요 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>
<style>
body, html {
    height: 100%;
    margin: 0;
    font-family: Arial, sans-serif;
}
.badge{
	margin-left: 15px;
}
.message-content-read-mine{
	display: flex;
	justify-content: flex-end;
}
.message-content-read-yours {
	display: flex;
	justify-content: flex-start;
}
.main-container {
    display: flex;
    height: 100%;
    margin: 0 auto;
}

.chat-list {
    flex: 1;
    background-color: #f4f4f4;
    border-right: 1px solid #e0e0e0;
    padding: 10px;
    overflow-y: scroll;
    min-width: max-content;
}

.chat-list-box {
    margin-bottom: 15px;
}

.chat-option {
    font-weight: bold;
    margin-bottom: 10px;
}

.chat-room {
    display: flex;
    margin-bottom: 10px;
    align-items: center;
    border-bottom: 1px solid #e0e0e0
}
.chat-room:hover {
	background-color: #dbdbdb;
}
.chat-room.active {
	background-color: #dbdbdb;
}
.prifle-pic img {
    max-width: 50px;
    border-radius: 50%;
    margin-right: 10px;
}

.chat-name {
    display: flex;
    flex-direction: column;
    width: 200px;
}

.chat-title, .chat-content-content, .chat-content-date {
    margin-bottom: 5px;
}
.chat-title {
	
}

.chat-content-content {
	font-size: 16px;
	font-weight: bold;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}
.chat-content-date{
	text-align: right;
	font-size: 13px;
}

.message-area {
    flex: 3;
    display: flex;
    flex-direction: column;
    padding: 10px;
    background-color: #fff;
}

.message-area-list {
	height: 100%;
    overflow-y: scroll;
}

.product-box {
	position: sticky;
    top: 0;
    z-index: 1; /* Make sure it's on top of the messages */
    display: flex;
    padding: 10px;
    border-bottom: 1px solid #e0e0e0;
    align-items: center;
    background-color: #fff;
}

.product-image {
    flex: 1;
    background-color: #e0e0e0;
    height: 80px;
    margin-right: 10px;
}

.product-price-and-title {
    flex: 3;
}
.product-price {
	font-size: 20px;
	font-weight: bold;
	color: #000;
}
.product-title {
	font-size: 16px;
}
.product-price::after {
			content: "원";
			font-size: 15px;
			margin-left: 3px;
		}
.message-box {
    flex-grow: 1;
    overflow-y: auto;
    margin-bottom: 10px;
    display: flex;         /* Add this line to make it a flex container */
    flex-direction: column; /* Add this line to make the direction column */
}

/* New styles */
.message-mine {
    align-self: flex-end;
}

.message-yours {
    align-self: flex-start;
}
.message-content {
    background-color: #e6f7ff;
    padding: 10px;
    border-radius: 5px;
    text-align: right;
    font-size: 16px;
}

.message-yours .message-content {
    background-color: #f1f1f1;
}

.date.mine {
    font-size: 0.8em;
    color: #888;
    text-align: right;
}
.date.yours {
    font-size: 0.8em;
    color: #888;
    text-align: left;
}

.message-sender {
    display: flex;
    align-items: center;
    border-top: 1px solid #e0e0e0;
    padding: 10px 0;
}

.message-sender-box {
	display: flex;
	justify-content: space-between;
	width: 100%;
}

.message-sender {
    flex-grow: 1;
    margin-right: 10px;
    font-size: 20px;
}
.message-sender{
	flex-grow: 1;
    padding: 10px 15px;
    margin-left: 10px;
    border: none;
    background-color: #f1f1f1;
    border-radius: 20px;
    color: #fff;
    outline: none;
}
.message-typing{
	width: 100%;
	margin-right: 20px;
}
.message-typing-box{
	border: none;
	background-color: transparent;
	width: 100%;
}	

.message-send-button {
	border: none;
    width: 36px;
    height: 36px;
    cursor: pointer;
    background-image: url("https://ifh.cc/g/LCy9h2.png");
    background-repeat: no-repeat;
    background-size: contain;
    background-position: center;
    background-color: transparent;
}
.col-2 {
	margin-left: auto;
}
textarea {
	appearance: none;
    outline: none;
    border: none;
    line-height: 1.2;
    font-size: 20px;
    background: transparent;
    width: 100%;
    height: 100px;
    letter-spacing: -0.5px;
    overflow-y: scroll;
    padding: 0px 13px 0px 16px;
    resize: none;
    box-sizing: border-box;

}
.scroll-container {
    display: flex;
    flex-direction: column;
}
</style>
</head>

<body>
	<div class="main-container" sbNum="${sb_num }">
		<div class="chat-list">
			<div class="chat-list-box">
			</div>
		</div>
		<div class="message-area" id="message-area">
			<div class="message-area-list">
			</div>
			<div class="message-sender">
			</div>
		</div>
	</div>
	<script type="text/javascript">
		const sb_num = $('.main-container').attr('sbNum');
		Number(sb_num);
		console.log(sb_num);
		
		function createKeydownHandler(ch_num) {
		    return function(event) {
		        keydown(event, ch_num);
		    };
		}

		function keydown(event, ch_num){
			 if (event.key === 'Enter' && !event.shiftKey) {
			       //시프트+엔터누르면 줄바꿈
			        event.preventDefault();
			        SendMessage(ch_num);
			    }
		}
		// 가장 처음 메세지 리스트를 가져온다.
		const FirstMessageList = function(sb_num){
			$.ajax({
				url:"/peach/chat/chat-list?sb_num="+sb_num,
				method:"get",
				data:{
				},
				success:function(data){
					console.log("메세지 리스트 리로드 성공");
					
					$('.chat-list-box').html(data);
					
					// 메세지 리스트중 하나를 클릭했을 때
					$('.chat-room').on('click', function(){
						//alert('room : '+ $(this).attr('room'));
						let ch_num = $(this).attr('chNum');
						console.log(ch_num);
						
						// 선택한 메세지빼고 나머지는 active 효과 해제하기
						$('.chat-room').not('.chat-room.chat-room'+ch_num).removeClass('active');
						// 선택한 메세지만 active 효과 주기
						$('.chat-room'+ch_num).addClass('active');
						
						let send_msg = "";
						send_msg += "	<div class='message-sender-box'>";
						send_msg += "		<div class='message-typing' id='message'>";
						send_msg += "			<input type='text' placeholder='메시지를 입력하세요.' class='message-typing-box'></input>";
						send_msg += "		</div>";
						send_msg += "		<button type='button' class='message-send-button'></button>";
						send_msg += "			</div>";
						send_msg += "		</div>";
	
						// 메세지 입력, 전송 칸을 보인다.
						$('.message-sender').html(send_msg);
						
						// 메세지 전송버튼을 눌렀을 때
						$('.message-send-button').on('click',function(){
							
							// 메세지 전송 함수 호출
							SendMessage(ch_num);
							
						});
						//엔터키로 메시지 전
						const handler = createKeydownHandler(ch_num);
						$("#message").off('keydown').on('keydown', handler);
						
						// 메세지 내용을 불러오는 함수 호출
						MessageContentList(ch_num);
						
					});
					if(sb_num != 0){
						$('#sbNum'+sb_num).addClass('active');
						const ch_num = $('#sbNum'+sb_num).attr('chNum');
						
						let send_msg = "";
						send_msg += "	<div class='message-sender-box'>";
						send_msg += "		<div class='message-typing' id='message'>";
						send_msg += "			<input type='text' placeholder='메시지를 입력하세요.' class='message-typing-box'></input>";
						send_msg += "		</div>";
						send_msg += "		<button type='button' class='message-send-button'></button>";
						send_msg += "			</div>";
						send_msg += "		</div>";
	
						// 메세지 입력, 전송 칸을 보인다.
						$('.message-sender').html(send_msg);
						// 메세지 전송버튼을 눌렀을 때
						$('.message-send-button').on('click',function(){
							
							// 메세지 전송 함수 호출
							SendMessage(ch_num);
							
						});
						//엔터키로 메시지 전
						const handler = createKeydownHandler(ch_num);
						$("#message").off('keydown').on('keydown', handler);
						
						MessageContentList(ch_num);
					}
				}
			})
		};
		
		
		// 메세지 리스트를 다시 가져온다.
		const MessageList = function(sb_num){
			$.ajax({
				url:"/peach/chat/chat-list?sb_num="+sb_num,
				method:"get",
				data:{
				},
				success:function(data){
					console.log("메세지 리스트 리로드 성공");
					
					$('.chat-list-box').html(data);
					
					// 메세지 리스트중 하나를 클릭했을 때
					$('.chat-room').on('click', function(){
						//alert('room : '+ $(this).attr('room'));
						let ch_num = $(this).attr('chNum');
						
						// 선택한 메세지빼고 나머지는 active 효과 해제하기
						$('.chat-room').not('.chat-room.chat-room'+ch_num).removeClass('active');
						// 선택한 메세지만 active 효과 주기
						$('.chat-room'+ch_num).addClass('active');
						
						let send_msg = "";
						send_msg += "	<div class='message-sender-box'>";
						send_msg += "		<div class='message-typing' id='message'>";
						send_msg += "			<input type='text' placeholder='메시지를 입력하세요.' class='message-typing-box'></input>";
						send_msg += "		</div>";
						send_msg += "		<button type='button' class='message-send-button'></button>";
						send_msg += "			</div>";
						send_msg += "		</div>";
	
						// 메세지 입력, 전송 칸을 보인다.
						$('.message-sender').html(send_msg);
						
						// 메세지 전송버튼을 눌렀을 때
						$('.message-send-button').on('click',function(){
							
							// 메세지 전송 함수 호출
							SendMessage(ch_num);
							
							// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
							// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
							//$('.chat_list_box:first').addClass('active_chat');
						});
						const handler = createKeydownHandler(ch_num);
						$("#message").off('keydown').on('keydown', handler);
						
						// 메세지 내용을 불러오는 함수 호출
						MessageContentList(ch_num);
	
					
					// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
					// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
					$('.chat-room:first').addClass('active');
				})
			}
		});
		}
	    
		
		// 메세지 내용을 가져온다.
		// 읽지 않은 메세지들을 읽음으로 바꾼다.
		const MessageContentList = function(ch_num) {
			
			$.ajax({
				url:"/peach/chat/message-list?ch_num="+ch_num,
				method:"GET",
				data:{
				},
				success:function(data){
					console.log("메세지 내용 가져오기 성공");
					
					// 메세지 내용을 html에 넣는다
					$('.message-area-list').html(data);
					
					// 이 함수로 메세지 내용을 가져올때마다 스크롤를 맨아래로 가게 한다.
					$(".message-area-list").scrollTop($(".message-area-list")[0].scrollHeight);
					

				},
				error : function() {
					alert('잘못된 접근 입니다.');
				}
			})
			
		
		};
		
		
		// 메세지를 전송하는 함수
		const SendMessage = function(ch_num){
			
			let info = $('.message-typing-box').val();
			//alert("content: " + content);
			
			info = info.trim();
			
			if(info == ""){
				alert("메세지를 입력하세요!");
			}else{
				$.ajax({
					url:"/peach/chat/message-send?ch_num="+ch_num+"&info="+info,
					method:"POST",
					data:{
					},
					success:function(data){
						console.log("메세지 전송 성공");
						
						// 메세지 입력칸 비우기
						$('.message-typing-box').val("");
						
						// 메세지 내용  리로드
						MessageContentList(ch_num);
						
						// 메세지 리스트 리로드
						MessageList();
						
					},
					error : function() {
						alert('서버 에러');
					}
				});
			}
			
		};
		
		$(document).ready(function(){
			// 메세지 리스트 리로드
			FirstMessageList(sb_num);
		});
	
	</script>
</body>
</html>
