package org.zerock.service;

public interface EncryptService {

	public String decryptRSA(String string);
	
	public String encryptSHA256(String string);
}
