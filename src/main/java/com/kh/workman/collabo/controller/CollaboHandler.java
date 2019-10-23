package com.kh.workman.collabo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.workman.collabo.model.service.CollaboService;

public class CollaboHandler extends TextWebSocketHandler {
	private static Map<String, WebSocketSession> sessionList = new HashMap<String, WebSocketSession>();
	private Logger logger = LoggerFactory.getLogger(CollaboHandler.class);

	@Autowired
	CollaboService service;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// Connection Client for Server
//		Map<String, Object> sessionItem = session.getAttributes();
//		System.out.println(sessionItem.get("collaboNo"));
//		System.out.println(sessionItem.get("userId"));
		sessionList.put(session.getId(), session);
		logger.debug("{} Connection Clinet ", session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		HashMap<String, String> rm = parsingJson(message.getPayload());

		boolean isCompleted = createList(rm, session);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.debug("{} 연결종료", session.getId());
	}

	public int stringToInteger(Object temp) {
		int changed = Integer.parseInt(String.valueOf(temp));
		return changed;
	}

	public boolean createList(HashMap<String, String> rm, WebSocketSession session) {
		boolean isCompleted = service.createList(rm) == 1 ? true : false;
		List<String> collabos = service.participation(Integer.parseInt(rm.get("collaboNo")));
		System.out.println(collabos.toString());
//		if (isCompleted) {
//			for (String key : sessionList.keySet()) {
//				sessionList.get(key);
//			}
//		}

		return isCompleted;
	}

	public HashMap<String, String> parsingJson(String receiveMessage) {
		Gson gson = new GsonBuilder().create();
		HashMap<String, String> temp = gson.fromJson(receiveMessage, HashMap.class);
		return temp;
	}

}
