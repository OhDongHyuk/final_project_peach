package kr.ph.peach.util;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.ph.peach.controller.SSEController;

public class ChatEmitter {
    private final ConcurrentHashMap<Integer, SseEmitter> emitters = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<Integer, Boolean> isEmitterComplete = new ConcurrentHashMap<>();
    private static final Logger logger = LoggerFactory.getLogger(SSEController.class);

    // Updated constructor to remove the main sseEmitter
    public ChatEmitter(Integer userId, SseEmitter emitter) {
        // Initialize each user's emitter
        add(userId, emitter);
    }

    // Updated add method to configure each emitter added
    public boolean add(Integer userId, SseEmitter emitter) {
        SseEmitter existingEmitter = emitters.putIfAbsent(userId, emitter);
        if (existingEmitter == null) {
            configureSseEmitter(userId); // Configure the new emitter
            isEmitterComplete.put(userId, false); // Mark as not completed
            return true;
        }
        return false;
    }

    // Send the connection confirmation event to the specific user's emitter
    public void sendConnectEvent(Integer userId) throws IOException {
        SseEmitter userEmitter = emitters.get(userId);
        if (userEmitter != null) {
            userEmitter.send(SseEmitter.event().name("connect").data("Connected to user " + userId));
        }
    }

    // Configure the emitter for lifecycle events
    private void configureSseEmitter(Integer userId) {
        SseEmitter userEmitter = emitters.get(userId);
        if (userEmitter != null) {
            userEmitter.onCompletion(() -> complete(userId));
            userEmitter.onTimeout(() -> complete(userId));
            userEmitter.onError(e -> completeWithError(userId, e));
        }
    }

    // Complete the emitter for a specific user
    private void complete(Integer userId) {
        SseEmitter userEmitter = emitters.remove(userId);
        if (userEmitter != null) {
            userEmitter.complete();
            isEmitterComplete.put(userId, true); // Mark the emitter as completed
            logger.info("Emitter for user {} is completed.", userId);
        }
    }

    // Complete the emitter with an error for a specific user
    private void completeWithError(Integer userId, Throwable throwable) {
        SseEmitter userEmitter = emitters.get(userId);
        if (userEmitter != null) {
            try {
                logger.error("Emitter for user {} encountered error: {}", userId, throwable.getMessage());
                userEmitter.completeWithError(throwable);
            } finally {
                emitters.remove(userId);
            }
        }
    }
    public SseEmitter get(Integer userId) {
    	SseEmitter emitter = emitters.get(userId);
    	return emitter;
    }
    
    public ConcurrentHashMap<Integer, SseEmitter> getEmitters() {
        return emitters;
    }

	public void remove(Integer userId) {
		
		emitters.get(userId).complete();
	}
	

	public void sendNewMessage(Integer roomId) {
	    emitters.forEach((userId, userEmitter) -> {
	        // Check if the emitter has been marked as completed
	        Boolean completed = isEmitterComplete.getOrDefault(userId, false);
	        if (!completed) {
	            try {
	                userEmitter.send(SseEmitter.event().name("newMessage").data(roomId));
	            } catch (IOException e) {
	                logger.error("Error sending new message to user " + userId, e);
	                complete(userId); // Make sure to complete if an error occurs
	            } catch (IllegalStateException e) {
	                logger.error("Emitter is already completed for user " + userId, e);
	                // This catch block may not be necessary if you always ensure the map is up-to-date.
	            }
	        }
	    });
	}
	
	public void read(Integer roomId) {
	    emitters.forEach((userId, userEmitter) -> {
	        // Check if the emitter has been marked as completed
	        Boolean completed = isEmitterComplete.getOrDefault(userId, false);
	        if (!completed) {
	            try {
	                userEmitter.send(SseEmitter.event().name("read").data(roomId));
	            } catch (IOException e) {
	                logger.error("Error sending new message to user " + userId, e);
	                complete(userId); // Make sure to complete if an error occurs
	            } catch (IllegalStateException e) {
	                logger.error("Emitter is already completed for user " + userId, e);
	                // This catch block may not be necessary if you always ensure the map is up-to-date.
	            }
	        }
	    });
	}

	
    
}
