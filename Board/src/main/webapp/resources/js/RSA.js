/**
 * RSA 공개 키 암호화
 */
var rsaService = (function () {

    function encryptMessage(password) {
        var publicKey = `-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDabbMlqNq94WU2qjZEgmj1KY/9
c6BNA47Cf3D3WmHWsJG7xyYC7uuI2ZhfqBbz/I7KZI2L+B2WwVhMopdMnqP0HbKK
KK6gKXJfsA8ww7pyNFc8PgSsq2AIna/6fsb4ZAX7V+VmZRFPqhxoQBv4GHjt3oDt
hiGHKr6Ek4KJxWgdwQIDAQAB
-----END PUBLIC KEY-----`;

        var encrypt = new JSEncrypt();
        encrypt.setPublicKey(publicKey);
        var encrypted = encrypt.encrypt(password);
        
        return encrypted;
    }

    return {
        encryptMessage: encryptMessage
    };
})();

