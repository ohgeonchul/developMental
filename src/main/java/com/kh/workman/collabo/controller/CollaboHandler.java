package com.kh.workman.collabo.controller;

import java.io.IOException;
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
		Map<String, Object> sessionItem = session.getAttributes();
		// System.out.println(sessionItem.get("collaboNo"));
		// System.out.println(sessionItem.get("userId"));
		sessionList.put((String) sessionItem.get("userId"), session);
		logger.debug("{} Connection Clinet ", session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		HashMap<String, Object> rm = parsingJson(message.getPayload());
		
		System.out.println(rm.toString());
		

//		boolean isCompleted = createList(rm, session);
//
//		System.out.println(isCompleted ? "성공" : "실패");
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

	public boolean createList(HashMap<String, Object> rm, WebSocketSession session) throws IOException {
		boolean isCompleted = service.createList(rm) == 1 ? true : false;
		List<HashMap> collabos = service.participation(Integer.parseInt((String) rm.get("collaboNo")));
		HashMap<String, Object> tempCollaboList = service.selectCollaboListOne((Integer) rm.get("listNo") - 1);
		System.out.println(rm.keySet().toString());
		if (isCompleted) {
			for (String key : sessionList.keySet()) {
				for (int i = 0; i < collabos.size(); i++) {
					if (key.equals(collabos.get(i).get("id"))) {
						tempCollaboList.put("type", "list");
						tempCollaboList.put("action", "create");
						sessionList.get(key).sendMessage(new TextMessage(toJson(rm)));
						break;
					}
				}
			}
		}

		return isCompleted;
	}

	public HashMap<String, Object> parsingJson(String receiveMessage) {
		Gson gson = new GsonBuilder().create();
		HashMap<String, Object> temp = gson.fromJson(receiveMessage, HashMap.class);
		return temp;
	}

	public String toJson(Object obj) {
		Gson gson = new GsonBuilder().create();
		return gson.toJson(obj);
	}

}
