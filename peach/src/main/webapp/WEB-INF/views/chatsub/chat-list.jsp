<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
	<div class="chat-option">
		전체대화
	</div>
	
	<c:forEach items="${chatList}" var="chat">
		<c:choose>
			<c:when test="${chat.ch_me_num == user.me_num}">
				<div class="chat-room${chat.ch_num } chat-room" id="sbNum${chat.ch_sb_num }" chNum="${chat.ch_num }">
						<div class="prifle-pic">
							<img src="<c:url value='/resources/image/NoMainImage.png'/>">
						</div>
						<div class="chat-name">
							<div class="chat-title">
								${chat.ch_seller_nickname}
							</div>
							<div class="chat-content">
								<div class="chat-content-content">
									${chat.ch_sb_name }
								</div>
								<div class="chat-content-date">
									${chat.ch_last_date }
								</div>
							</div>	
						</div>
						<c:if test="${chat.unreadCount > 0 }">
							<div class="col-2 unread${chat.ch_num }">
								<span class="badge bg-danger">${chat.unreadCount}</span>
							</div>
						</c:if>
				</div>
			</c:when>
			<c:otherwise>
				<div class="chat-room${chat.ch_num } chat-room" id="sbNum${chat.ch_sb_num }" chNum="${chat.ch_num }">
						<div class="prifle-pic">
							<img src="<c:url value='/resources/image/NoMainImage.png'/>">
						</div>
						<div class="chat-name">
							<div class="chat-title">
								${chat.ch_buyer_nickname }
							</div>
							<div class="chat-content">
								<div class="chat-content-content">
									${chat.ch_sb_name }
								</div>
								<div class="chat-content-date">
									${chat.ch_last_date }
								</div>
							</div>
						</div>
					</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>