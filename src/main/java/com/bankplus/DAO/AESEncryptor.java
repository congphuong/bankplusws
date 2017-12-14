package com.bankplus.DAO;

import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Value;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class AESEncryptor {
    private static final String ALGO = "AES";
    private static byte[] keyValue = new byte[]{'T', 'h', 'i', 's', 'I', 's', 'A', 'S', 'e', 'c', 'r', 'e', 't', 'K',
            'e', 'y'};
    @Value("${jwt.secret}")
    private String secret;


    public String encrypt(String text) throws Exception {
        Key k = generateKey();
        Cipher c = Cipher.getInstance(ALGO);
        c.init(Cipher.ENCRYPT_MODE, k);
        byte[] encValue = c.doFinal(text.getBytes());
        String enrText = new BASE64Encoder().encode(encValue);

        return enrText;
    }

    public String decrypt(String text) throws Exception {
        Key k = generateKey();
        Cipher c = Cipher.getInstance(ALGO);
        c.init(Cipher.DECRYPT_MODE, k);
        byte[] decValue = new BASE64Decoder().decodeBuffer(text);
        byte[] dec = c.doFinal(decValue);
        String textValue = new String(dec);
        return textValue;

    }

    public boolean matches(String password, String input) throws Exception {
        AESEncryptor AESEncryptor = new AESEncryptor();
        if (input.equalsIgnoreCase(AESEncryptor.decrypt(password))) {
            return true;
        } else {
            return false;
        }
    }

    public Key generateKey() {
//        String key = "mySecret";
        Key k = new SecretKeySpec(keyValue, ALGO);
        return k;
    }

    public static void main(String[] args) throws Exception {
        String src = "trile123";

        AESEncryptor AESEncryptor = new AESEncryptor();

//		System.out.println(AESEncryptor.decrypt("$2aw3yVQyUYr1eLxfSexYK7kg=="));
//		String pass = encrypt(src);
//		System.out.println(pass);
//		System.out.println(matches(pass, src));
        System.out.println(AESEncryptor.decrypt("jgXSEb8rRL9MfZ62Do2StA=="));
    }

}
