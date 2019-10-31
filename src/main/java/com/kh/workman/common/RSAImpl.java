package com.kh.workman.common;

public interface RSAImpl {
	
	String encrypt(String key) throws Exception;
	String decrypt(String key) throws Exception;

}
