package com.kh.workman.collabo.model.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class receiveMessage {
	private String type;
	private String userId;
	private int roomNo;
	private String content;
	
}
