.class public Lcom/shengpay/express/smc/sign/DESCrypt;
.super Ljava/lang/Object;
.source "DESCrypt.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertHexString(Ljava/lang/String;)[B
    .locals 6
    .param p0, "ss"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    new-array v2, v4, [B

    .line 63
    .local v2, "digest":[B
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v2

    if-lt v3, v4, :cond_0

    .line 68
    return-object v2

    .line 64
    :cond_0
    mul-int/lit8 v4, v3, 0x2

    mul-int/lit8 v5, v3, 0x2

    add-int/lit8 v5, v5, 0x2

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "byteString":Ljava/lang/String;
    const/16 v4, 0x10

    invoke-static {v0, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    .line 66
    .local v1, "byteValue":I
    int-to-byte v4, v1

    aput-byte v4, v2, v3

    .line 63
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public static decrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 15
    :try_start_0
    invoke-static {p0}, Lcom/shengpay/express/smc/sign/DESCrypt;->convertHexString(Ljava/lang/String;)[B

    move-result-object v0

    .line 16
    .local v0, "bytesrc":[B
    const-string v8, "DES/CBC/PKCS5Padding"

    invoke-static {v8}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    .line 17
    .local v1, "cipher":Ljavax/crypto/Cipher;
    new-instance v2, Ljavax/crypto/spec/DESKeySpec;

    const-string v8, "UTF-8"

    invoke-virtual {p1, v8}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v8

    invoke-direct {v2, v8}, Ljavax/crypto/spec/DESKeySpec;-><init>([B)V

    .line 18
    .local v2, "desKeySpec":Ljavax/crypto/spec/DESKeySpec;
    const-string v8, "DES"

    invoke-static {v8}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v5

    .line 19
    .local v5, "keyFactory":Ljavax/crypto/SecretKeyFactory;
    invoke-virtual {v5, v2}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v7

    .line 20
    .local v7, "secretKey":Ljavax/crypto/SecretKey;
    new-instance v4, Ljavax/crypto/spec/IvParameterSpec;

    const-string v8, "UTF-8"

    invoke-virtual {p1, v8}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v8

    invoke-direct {v4, v8}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 21
    .local v4, "iv":Ljavax/crypto/spec/IvParameterSpec;
    const/4 v8, 0x2

    invoke-virtual {v1, v8, v7, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 22
    invoke-virtual {v1, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v6

    .line 23
    .local v6, "retByte":[B
    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v6}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v8

    .line 24
    .end local v0    # "bytesrc":[B
    .end local v1    # "cipher":Ljavax/crypto/Cipher;
    .end local v2    # "desKeySpec":Ljavax/crypto/spec/DESKeySpec;
    .end local v4    # "iv":Ljavax/crypto/spec/IvParameterSpec;
    .end local v5    # "keyFactory":Ljavax/crypto/SecretKeyFactory;
    .end local v6    # "retByte":[B
    .end local v7    # "secretKey":Ljavax/crypto/SecretKey;
    :catch_0
    move-exception v3

    .line 25
    .local v3, "e":Ljava/lang/Exception;
    new-instance v8, Ljava/lang/RuntimeException;

    const-string v9, "\u52a0\u5bc6\u5b57\u7b26\u4e32\u51fa\u9519"

    invoke-direct {v8, v9, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8
.end method

.method public static encrypt(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 32
    :try_start_0
    const-string v7, "DES/CBC/PKCS5Padding"

    invoke-static {v7}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    .line 33
    .local v1, "cipher":Ljavax/crypto/Cipher;
    new-instance v2, Ljavax/crypto/spec/DESKeySpec;

    const-string v7, "UTF-8"

    invoke-virtual {p1, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v7

    invoke-direct {v2, v7}, Ljavax/crypto/spec/DESKeySpec;-><init>([B)V

    .line 34
    .local v2, "desKeySpec":Ljavax/crypto/spec/DESKeySpec;
    const-string v7, "DES"

    invoke-static {v7}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v5

    .line 35
    .local v5, "keyFactory":Ljavax/crypto/SecretKeyFactory;
    invoke-virtual {v5, v2}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v6

    .line 36
    .local v6, "secretKey":Ljavax/crypto/SecretKey;
    new-instance v4, Ljavax/crypto/spec/IvParameterSpec;

    const-string v7, "UTF-8"

    invoke-virtual {p1, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v7

    invoke-direct {v4, v7}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 37
    .local v4, "iv":Ljavax/crypto/spec/IvParameterSpec;
    const/4 v7, 0x1

    invoke-virtual {v1, v7, v6, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 39
    const-string v7, "UTF-8"

    invoke-virtual {p0, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v1, v7}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v0

    .line 40
    .local v0, "b":[B
    invoke-static {v0}, Lcom/shengpay/express/smc/sign/DESCrypt;->toHexString([B)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    return-object v7

    .line 41
    .end local v0    # "b":[B
    .end local v1    # "cipher":Ljavax/crypto/Cipher;
    .end local v2    # "desKeySpec":Ljavax/crypto/spec/DESKeySpec;
    .end local v4    # "iv":Ljavax/crypto/spec/IvParameterSpec;
    .end local v5    # "keyFactory":Ljavax/crypto/SecretKeyFactory;
    .end local v6    # "secretKey":Ljavax/crypto/SecretKey;
    :catch_0
    move-exception v3

    .line 42
    .local v3, "e":Ljava/lang/Exception;
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "\u89e3\u5bc6\u5b57\u7b26\u4e32\u51fa\u9519"

    invoke-direct {v7, v8, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7
.end method

.method public static encryptBase(Ljava/lang/String;[B)[B
    .locals 6
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "key"    # [B

    .prologue
    .line 49
    :try_start_0
    const-string v4, "DESede/ECB/PKCS5Padding"

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    .line 50
    .local v1, "cipher":Ljavax/crypto/Cipher;
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string v4, "DESede"

    invoke-direct {v3, p1, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 51
    .local v3, "secretKey":Ljavax/crypto/SecretKey;
    const/4 v4, 0x1

    invoke-virtual {v1, v4, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 52
    const-string v4, "UTF-8"

    invoke-virtual {p0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v1, v4}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 53
    .local v0, "b":[B
    return-object v0

    .line 54
    .end local v0    # "b":[B
    .end local v1    # "cipher":Ljavax/crypto/Cipher;
    .end local v3    # "secretKey":Ljavax/crypto/SecretKey;
    :catch_0
    move-exception v2

    .line 55
    .local v2, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "\u52a0\u5bc6\u5b57\u7b26\u4e32\u51fa\u9519"

    invoke-direct {v4, v5, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public static toHexString([B)Ljava/lang/String;
    .locals 5
    .param p0, "b"    # [B

    .prologue
    .line 73
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 74
    .local v0, "hexString":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p0

    if-lt v1, v3, :cond_0

    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 75
    :cond_0
    aget-byte v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    .line 76
    .local v2, "plainText":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x2

    if-ge v3, v4, :cond_1

    .line 77
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "0"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 78
    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 74
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
