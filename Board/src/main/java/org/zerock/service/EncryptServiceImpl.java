package org.zerock.service;

import java.io.UnsupportedEncodingException;
import java.security.KeyFactory;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;

import javax.crypto.Cipher;

import org.springframework.stereotype.Service;

@Service
public class EncryptServiceImpl implements EncryptService {

	private static final String PRIVATE_KEY_PEM = "-----BEGIN PRIVATE KEY-----\n"
			+ "MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBANptsyWo2r3hZTaq\n"
			+ "NkSCaPUpj/1zoE0DjsJ/cPdaYdawkbvHJgLu64jZmF+oFvP8jspkjYv4HZbBWEyi\n"
			+ "l0yeo/QdsooorqApcl+wDzDDunI0Vzw+BKyrYAidr/p+xvhkBftX5WZlEU+qHGhA\n"
			+ "G/gYeO3egO2GIYcqvoSTgonFaB3BAgMBAAECgYBRNn5oXyrNdLN8Krc4q8A4fzaR\n"
			+ "Rt9wIwV+XYH0Bf/gog/dYINKjei3HihgUJAQMXQp3k8enqbpuYOKIt3cWBOe7Okk\n"
			+ "cnqsJM5VXLUyHYJlFldYlUK8kWTeGtFQw5ftycMzYjuDfZqI4vXfQz0iX3GtdsQO\n"
			+ "mwj5kktdd6p/lNbh7QJBAP5F6OaZ3W/KAvsg63KcgzsAtRc+m07pDD1sUdwFdgcA\n"
			+ "vm/32e58rk06x8ObLPGh95VtG/ySq0Hxp5UuEq8LyEMCQQDb6XgWy4mmy1scAoc5\n"
			+ "Y5UDhjcsXruD46egmUQgLg2nwqY2s/05FrCJ7wUMeSuXQOUn75xi7o1KQTLmm5Pp\n"
			+ "jDOrAkEAvh21Ut4OdCwd6Hinsm0VrcMMo5Ga+/hBv5dC6Xhn1DqZKQyvNKKijHn7\n"
			+ "rORUSWKpxF7tQv7C765od6EYNSthEwJATJ7Ruo98DGM6AU5YMwShPLMcshbnmpJN\n"
			+ "K0V7WQLyuwq0wsZ/ac6f/88JoUjuiSqRLRLtGAMpsz94LqTyKiMxNQJBAKXIMCIm\n"
			+ "wOrKWyEo7zkcv4dzQ/BtUzhrWEelJ6cAPEXXEqsw++y4ggjVQwpYPuJPF51EOUpX\n" + "w49a2VZzrOFIwFw=\n"
			+ "-----END PRIVATE KEY-----";

	@Override
	public String decryptRSA(String encrypted) {
		try {
			PrivateKey privateKey = getPrivateKey(PRIVATE_KEY_PEM);
			Cipher cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(encrypted));
			String decryptedMessage = new String(decryptedBytes);
			return decryptedMessage;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	private PrivateKey getPrivateKey(String privateKeyPEM) throws Exception {
		String privateKey = privateKeyPEM.replaceAll("\\n", "").replace("-----BEGIN PRIVATE KEY-----", "")
				.replace("-----END PRIVATE KEY-----", "");
		byte[] keyBytes = Base64.getDecoder().decode(privateKey);
		PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		return keyFactory.generatePrivate(keySpec);
	}

	@Override
	public String encryptSHA256(String plainString) {
		// TODO Auto-generated method stub
		String encrypted = "";
		
		try {
			MessageDigest mdSHA256 = MessageDigest.getInstance("SHA-256");

			mdSHA256.update(plainString.getBytes("UTF-8"));

			byte[] sha256Hash = mdSHA256.digest();

			StringBuffer hexSHA256hash = new StringBuffer();

			for (byte b : sha256Hash) {
				String hexString = String.format("%02x", b);
				hexSHA256hash.append(hexString);
			}
			encrypted = hexSHA256hash.toString();
			
			return encrypted;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}

		return "";
	}

}
