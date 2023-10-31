package kr.ph.peach.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ph.peach.pagination.PageMaker;
import kr.ph.peach.pagination.SaleBoardCriteria;
import kr.ph.peach.service.ChatService;
import kr.ph.peach.service.SaleBoardService;
import kr.ph.peach.util.Message;
import kr.ph.peach.vo.ChatVO;
import kr.ph.peach.vo.MemberVO;
import kr.ph.peach.vo.MessageVO;
import kr.ph.peach.vo.SaleBoardVO;
import kr.ph.peach.vo.SaleCategoryVO;
import kr.ph.peach.vo.SaleImageVO;
import kr.ph.peach.vo.WishVO;


@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	SaleBoardService saleBoardService;
	
	@Autowired
	ChatService chatService;
	
	@GetMapping("/chat")
	public String chat(Model model, HttpSession session, int sb_num) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		SaleBoardVO saleBoard = saleBoardService.selectBoard(sb_num);
		Message msg;
		if(user == null) {
			msg = new Message("saleboard/0", "잘못된 접근입니다.");
			model.addAttribute("msg", msg);
			return "message";
		}
		ChatVO chat = chatService.selectChat(sb_num, user.getMe_num());
		if(sb_num != 0 && saleBoard.getSb_ss_num() != 3) {			
			if(chat == null && saleBoard.getSb_me_num() != user.getMe_num()){
				chatService.insertChat(sb_num, user.getMe_num());
				chat = chatService.selectChat(sb_num, user.getMe_num());
			}
		}
		List<ChatVO> chatList = chatService.selectAllChat(user.getMe_num());
		for(ChatVO tmp : chatList) {
			List<MessageVO> messageVO = chatService.selectAllMessage(tmp.getCh_num());
			chatList.get(chatList.indexOf(tmp)).setCh_seller_nickname(chatService.selectSellerNickName(tmp.getCh_sb_num()));
			chatList.get(chatList.indexOf(tmp)).setCh_buyer_nickname(chatService.selectbuyerNickName(tmp.getCh_me_num()));
			chatList.get(chatList.indexOf(tmp)).setCh_sb_name(chatService.selectSbName(tmp.getCh_sb_num()));
			chatList.get(chatList.indexOf(tmp)).setMessageVO(messageVO);
		}
		model.addAttribute("chatList", chatList);
		model.addAttribute("user", user);
		model.addAttribute("sb_num", sb_num);
		return "/chat/chat";
	}
	
	@GetMapping("/chat-list")
	public String chatList(Model model, HttpSession session, int sb_num) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		List<ChatVO> chatList = chatService.selectAllChat(user.getMe_num());
		for(ChatVO tmp : chatList) {
			List<MessageVO> messageVO = chatService.selectAllMessage(tmp.getCh_num());
			int count = 0;
			for(MessageVO msg : messageVO) {
				if(msg.getMs_unread() == 0 && user.getMe_num() != msg.getMs_me_num()) {
					count++;
				}
			}
			chatList.get(chatList.indexOf(tmp)).setUnreadCount(count);
			chatList.get(chatList.indexOf(tmp)).setCh_seller_nickname(chatService.selectSellerNickName(tmp.getCh_sb_num()));
			chatList.get(chatList.indexOf(tmp)).setCh_buyer_nickname(chatService.selectbuyerNickName(tmp.getCh_me_num()));
			chatList.get(chatList.indexOf(tmp)).setCh_sb_name(chatService.selectSbName(tmp.getCh_sb_num()));
			chatList.get(chatList.indexOf(tmp)).setMessageVO(messageVO);
		}
		model.addAttribute("user", user);
		model.addAttribute("chatList", chatList);
		return "/chatsub/chat-list";
	}
	
	@GetMapping("/message-list")
	public String messageList(Model model, HttpSession session, int ch_num) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		List<MessageVO> messageList = chatService.selectAllMessage(ch_num);
		ChatVO chat = chatService.selectChat(ch_num);
		SaleBoardVO saleBoard = saleBoardService.selectBoard(chat.getCh_sb_num());
		chatService.updateMessageRead(user.getMe_num(), ch_num);
		model.addAttribute("user", user);
		model.addAttribute("messageList", messageList);
		model.addAttribute("board", saleBoard);
		return "/chatsub/message-list";
	}
	
	@ResponseBody
	@PostMapping("/message-send")
	public void messageSend(Model model, HttpSession session, int ch_num, String info) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		chatService.insertMessage(ch_num, info, user.getMe_num());
		return;
	}
}
