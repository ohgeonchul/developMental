package com.kh.workman.common;

import java.io.IOException;
import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Base64;
import org.springframework.stereotype.Component;

@Component
public class RSATest implements RSAImpl {
	
	private KeyPair keyPair;
	private PublicKey publicKey;
	private PrivateKey privateKey;
	
	
	
	@Override
	public String encrypt(String key) throws NoSuchAlgorithmException
	{
		
		// RSA 키쌍을 생성합니다.
		String encrypted = null;
		
		// Base64 인코딩된 암호화 문자열 입니다.
		try
		{
			keyPair = CipherUtil.genRSAKeyPair();			
			publicKey = keyPair.getPublic();
			privateKey = keyPair.getPrivate();
			encrypted = CipherUtil.encryptRSA(key, publicKey);
			System.out.println("encrypted : " + encrypted);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		/*
		 * // 복호화 합니다. String decrypted = CipherUtil.decryptRSA(encrypted, privateKey);
		 * System.out.println("decrypted : " + decrypted);
		 */
		
//		// 공개키를 Base64 인코딩한 문자일을 만듭니다.
//		byte[] bytePublicKey = publicKey.getEncoded();
//		String base64PublicKey = Base64.getEncoder().encodeToString(bytePublicKey);
//		System.out.println("Base64 Public Key : " + base64PublicKey);
//		
//		// 개인키를 Base64 인코딩한 문자열을 만듭니다.
//		byte[] bytePrivateKey = privateKey.getEncoded();
//		String base64PrivateKey = Base64.getEncoder().encodeToString(bytePrivateKey);
//		System.out.println("Base64 Private Key : " + base64PrivateKey);
		
		return encrypted;	
	}
	
	@Override
	public String decrypt(String key) throws NoSuchAlgorithmException
	{		
		// RSA 키쌍을 생성합니다.
		String encrypted = key;
		String decrypted = null;
		try
		{
			
			keyPair = CipherUtil.genRSAKeyPair();			
			publicKey = keyPair.getPublic();
			privateKey = keyPair.getPrivate();
			//encrypted = CipherUtil.encryptRSA(key, publicKey);
			System.out.println("encrypted : " + encrypted);
			
			// 복호화 합니다.
			decrypted = CipherUtil.decryptRSA(encrypted, privateKey);
			System.out.println("decrypted : " + decrypted);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		// Base64 인코딩된 암호화 문자열 입니다.
		
		return decrypted;
	}
	
	
	
	
       

}
