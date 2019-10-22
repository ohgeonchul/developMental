package com.kh.workman.collabo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.workman.collabo.model.service.CollaboService;

public class CollaboHandler extends TextWebSocketHandler {
	private static final List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Logger logger = LoggerFactory.getLogger(CollaboHandler.class);
	@Autowired
	private CollaboService service;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// Connection Client for Server
//		Map<String, Object> sessionItem = session.getAttributes();
//		System.out.println(sessionItem.get("collaboNo"));
//		System.out.println(sessionItem.get("userId"));
		sessionList.add(session);
		logger.debug("{} Connection Clinet ", session.getId());
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// Data Communication
		String sMessage = message.getPayload().toString();
		Gson gson = new GsonBuilder().create();
//		receiveMessage rm = gson.fromJson(sMessage, receiveMessage.class);
		Map receiveMessage = (Map<String, String>) gson.fromJson(sMessage, Map.class);
		logger.debug(receiveMessage.toString());

		int result = service.createList(receiveMessage);
		if(result == 1) {
			
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.debug("{} 연결종료", session.getId());
	}

}
