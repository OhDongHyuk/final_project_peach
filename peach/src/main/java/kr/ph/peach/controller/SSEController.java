package kr.ph.peach.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.ph.peach.service.ChatService;
import kr.ph.peach.util.ChatEmitter;
import kr.ph.peach.vo.ChatVO;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;


@RestController
public class SSEController {
	
	@Autowired
	ChatService chatService;

	private final ConcurrentHashMap<Integer, List<ChatEmitter>> chatEmitters = new ConcurrentHashMap<>();
	
    private static final Logger logger = LoggerFactory.getLogger(SSEController.class);
    

    @GetMapping(value = "/connect", produces = "text/event-stream")
    public ResponseEntity<SseEmitter> connect(@RequestParam("userId") Integer userId) {
    	if(userId == null) {
    		return ResponseEntity.badRequest().build();
    	}
    	
    	SseEmitter emitter = new SseEmitter(Long.MAX_VALUE);
    	
        ChatEmitter chatEmitter = null;
        List<ChatVO> chatList = chatService.selectAllChat(userId);
        if (chatList.isEmpty()) {
            return ResponseEntity.ok(emitter); // Return the emitter even if there are no chats
        }
        
        for (ChatVO tmp : chatList) {
            Integer ch_num = tmp.getCh_num();
            chatEmitter = add(userId, ch_num, emitter);
        }

        if (chatEmitter != null) {
            try {
                chatEmitter.sendConnectEvent(userId);
            } catch (IOException e) {
                logger.error("Error sending initial connect event", e);
                return ResponseEntity.status(500).body(null);
            }
        }

        return ResponseEntity.ok(emitter);
    }
    
    @GetMapping(value = "/newmessage", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public void newMessage(@RequestParam("ch_num") Integer roomId) {
    	List<ChatEmitter> chatEmitterList = chatEmitters.get(roomId);
		if(chatEmitterList != null) {
    		for(ChatEmitter chatEmitter : chatEmitterList) {
    			chatEmitter.sendNewMessage(roomId);
    		}
    	}
        
    }
    @GetMapping(value = "/read", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public void read(@RequestParam("ch_num") Integer roomId) {
    	List<ChatEmitter> chatEmitterList = chatEmitters.get(roomId);
		if(chatEmitterList != null) {
    		for(ChatEmitter chatEmitter : chatEmitterList) {
    			chatEmitter.read(roomId);
    		}
    	}
        
    }
    
	private ChatEmitter add(Integer userId, Integer roomId, SseEmitter emitter) {
		if(userId == null || roomId == null || emitter == null) {
			return null;
		}
		List<ChatEmitter> chatEmitterList = chatEmitters.get(roomId);
		ChatEmitter chatEmitter = new ChatEmitter(userId, emitter);
		if(chatEmitterList != null) {
			chatEmitters.get(roomId).add(chatEmitter);
			return chatEmitters.get(roomId).get(chatEmitters.get(roomId).size() - 1);
		}
		List<ChatEmitter> abc = chatEmitters.computeIfAbsent(roomId, k -> new CopyOnWriteArrayList<>());
		abc.add(chatEmitter);
		return chatEmitters.get(roomId).get(chatEmitters.get(roomId).size() - 1);
	}
	
}

