package com.kh.spring.collabo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;

public class CollaboHandler extends TextWebSocketHandler {
	private static final List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Logger logger = LoggerFactory.getLogger(CollaboHandler.class);

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// Connection Client for Server
		Map<String,Object> sessionItem = session.getAttributes();
		
		System.out.println(sessionItem.toString());
		System.out.println(sessionItem.get("userId"));
		sessionList.add(session);
		logger.debug("{} Connection Clinet ", session.getId());
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		// Data Communication
		TextMessage tm = new TextMessage("" + message.getPayload());
		System.out.println(message.getPayload());
//		JSONParser parser = new JSONParser();
//		JsonArray jsonArray = (JsonArray) parser.parse(tm);
		System.out.println(tm);
		for (WebSocketSession s : sessionList) {
			s.sendMessage(tm);
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.debug("{} 연결종료", session.getId());
	}

}
