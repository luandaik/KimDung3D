.class public Lcom/shengpay/express/smc/codec/RSAUtil;
.super Ljava/lang/Object;
.source "RSAUtil.java"


# static fields
.field private static final PKCS12:Ljava/lang/String; = "PKCS12"

.field private static final TAG:Ljava/lang/String; = "RSAUtil"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bytesToHexString([B)Ljava/lang/String;
    .locals 5
    .param p0, "src"    # [B

    .prologue
    .line 431
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 432
    .local v2, "sb":Ljava/lang/StringBuffer;
    if-eqz p0, :cond_0

    array-length v3, p0

    if-nez v3, :cond_1

    .line 433
    :cond_0
    const/4 v3, 0x0

    .line 442
    :goto_0
    return-object v3

    .line 435
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v3, p0

    if-lt v1, v3, :cond_2

    .line 442
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 436
    :cond_2
    aget-byte v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 437
    .local v0, "hex":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_3

    .line 438
    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0x30

    invoke-static {v4}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 440
    :cond_3
    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 435
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method private static charToByte(C)B
    .locals 1
    .param p0, "c"    # C

    .prologue
    .line 243
    const-string v0, "0123456789ABCDEF"

    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    int-to-byte v0, v0

    return v0
.end method

.method public static decryptAES(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "encryptedHexTxt"    # Ljava/lang/String;
    .param p1, "keyTxt"    # Ljava/lang/String;

    .prologue
    .line 415
    :try_start_0
    const-string v5, "AES/ECB/PKCS5Padding"

    invoke-static {v5}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 417
    .local v0, "cipher":Ljavax/crypto/Cipher;
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    .line 418
    const-string v5, "utf-8"

    invoke-virtual {p1, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    const-string v6, "AES"

    .line 417
    invoke-direct {v4, v5, v6}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 419
    .local v4, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    const/4 v5, 0x2

    invoke-virtual {v0, v5, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 421
    invoke-static {p0}, Lcom/shengpay/express/smc/codec/RSAUtil;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 422
    .local v1, "encryptedBytes":[B
    invoke-virtual {v0, v1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v3

    .line 423
    .local v3, "original":[B
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v3}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 426
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "encryptedBytes":[B
    .end local v3    # "original":[B
    .end local v4    # "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    :goto_0
    return-object v5

    .line 424
    :catch_0
    move-exception v2

    .line 425
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v2}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 426
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public static decryptDESede(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "encryptedHexTxt"    # Ljava/lang/String;
    .param p1, "keyTxt"    # Ljava/lang/String;

    .prologue
    .line 340
    :try_start_0
    const-string v6, "DESede/CBC/PKCS5Padding"

    invoke-static {v6}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 342
    .local v0, "cipher":Ljavax/crypto/Cipher;
    new-instance v5, Ljavax/crypto/spec/SecretKeySpec;

    .line 343
    const-string v6, "utf-8"

    invoke-virtual {p1, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    const-string v7, "DESede"

    .line 342
    invoke-direct {v5, v6, v7}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 344
    .local v5, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    new-instance v3, Ljavax/crypto/spec/IvParameterSpec;

    const/16 v6, 0x8

    new-array v6, v6, [B

    fill-array-data v6, :array_0

    invoke-direct {v3, v6}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 346
    .local v3, "iv":Ljavax/crypto/spec/IvParameterSpec;
    const/4 v6, 0x2

    invoke-virtual {v0, v6, v5, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 348
    invoke-static {p0}, Lcom/shengpay/express/smc/codec/RSAUtil;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 350
    .local v1, "encryptedBytes":[B
    invoke-virtual {v0, v1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v4

    .line 351
    .local v4, "original":[B
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v4}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 354
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "encryptedBytes":[B
    .end local v3    # "iv":Ljavax/crypto/spec/IvParameterSpec;
    .end local v4    # "original":[B
    .end local v5    # "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    :goto_0
    return-object v6

    .line 352
    :catch_0
    move-exception v2

    .line 353
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v2}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 354
    const/4 v6, 0x0

    goto :goto_0

    .line 344
    nop

    :array_0
    .array-data 1
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
    .end array-data
.end method

.method public static decryptRSA(Ljava/lang/String;Ljava/security/PrivateKey;)[B
    .locals 4
    .param p0, "base64EnvelopedData"    # Ljava/lang/String;
    .param p1, "key"    # Ljava/security/PrivateKey;

    .prologue
    .line 293
    :try_start_0
    const-string v3, "RSA/ECB/PKCS1Padding"

    invoke-static {v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 294
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v3, 0x2

    invoke-virtual {v0, v3, p1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 296
    invoke-static {p0}, Lcom/shengpay/express/smc/codec/Base64Util;->decode(Ljava/lang/String;)[B

    move-result-object v1

    .line 297
    .local v1, "content":[B
    invoke-virtual {v0, v1}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 300
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "content":[B
    :goto_0
    return-object v3

    .line 298
    :catch_0
    move-exception v2

    .line 299
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 300
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static encryptAES(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "originalTxt"    # Ljava/lang/String;
    .param p1, "keyTxt"    # Ljava/lang/String;

    .prologue
    .line 367
    :try_start_0
    const-string v5, "AES/ECB/PKCS5Padding"

    invoke-static {v5}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 369
    .local v0, "cipher":Ljavax/crypto/Cipher;
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    .line 370
    const-string v5, "utf-8"

    invoke-virtual {p1, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v5

    const-string v6, "AES"

    .line 369
    invoke-direct {v4, v5, v6}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 371
    .local v4, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    const/4 v5, 0x1

    invoke-virtual {v0, v5, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 373
    const-string v5, "utf-8"

    invoke-virtual {p0, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    .line 374
    .local v3, "originalBytes":[B
    invoke-virtual {v0, v3}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    .line 375
    .local v1, "encryptedBytes":[B
    invoke-static {v1}, Lcom/shengpay/express/smc/codec/RSAUtil;->bytesToHexString([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 378
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "encryptedBytes":[B
    .end local v3    # "originalBytes":[B
    .end local v4    # "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    :goto_0
    return-object v5

    .line 376
    :catch_0
    move-exception v2

    .line 377
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v2}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 378
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public static encryptAES(Ljava/lang/String;[B)Ljava/lang/String;
    .locals 6
    .param p0, "originalTxt"    # Ljava/lang/String;
    .param p1, "keyBytes"    # [B

    .prologue
    .line 391
    :try_start_0
    const-string v5, "AES/ECB/PKCS5Padding"

    invoke-static {v5}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 393
    .local v0, "cipher":Ljavax/crypto/Cipher;
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    .line 394
    const-string v5, "AES"

    .line 393
    invoke-direct {v4, p1, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 395
    .local v4, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    const/4 v5, 0x1

    invoke-virtual {v0, v5, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 397
    const-string v5, "utf-8"

    invoke-virtual {p0, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    .line 398
    .local v3, "originalBytes":[B
    invoke-virtual {v0, v3}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    .line 399
    .local v1, "encryptedBytes":[B
    invoke-static {v1}, Lcom/shengpay/express/smc/codec/RSAUtil;->bytesToHexString([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 402
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "encryptedBytes":[B
    .end local v3    # "originalBytes":[B
    .end local v4    # "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    :goto_0
    return-object v5

    .line 400
    :catch_0
    move-exception v2

    .line 401
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v2}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 402
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public static encryptDESede(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "originalTxt"    # Ljava/lang/String;
    .param p1, "keyTxt"    # Ljava/lang/String;

    .prologue
    .line 313
    :try_start_0
    const-string v6, "DESede/CBC/PKCS5Padding"

    invoke-static {v6}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 315
    .local v0, "cipher":Ljavax/crypto/Cipher;
    new-instance v5, Ljavax/crypto/spec/SecretKeySpec;

    .line 316
    const-string v6, "utf-8"

    invoke-virtual {p1, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    const-string v7, "DESede"

    .line 315
    invoke-direct {v5, v6, v7}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 317
    .local v5, "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    new-instance v3, Ljavax/crypto/spec/IvParameterSpec;

    const/16 v6, 0x8

    new-array v6, v6, [B

    fill-array-data v6, :array_0

    invoke-direct {v3, v6}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 319
    .local v3, "iv":Ljavax/crypto/spec/IvParameterSpec;
    const/4 v6, 0x1

    invoke-virtual {v0, v6, v5, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 321
    const-string v6, "utf-8"

    invoke-virtual {p0, v6}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    .line 323
    .local v4, "originalBytes":[B
    invoke-virtual {v0, v4}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    .line 324
    .local v1, "encryptedBytes":[B
    invoke-static {v1}, Lcom/shengpay/express/smc/codec/RSAUtil;->bytesToHexString([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 327
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "encryptedBytes":[B
    .end local v3    # "iv":Ljavax/crypto/spec/IvParameterSpec;
    .end local v4    # "originalBytes":[B
    .end local v5    # "skeySpec":Ljavax/crypto/spec/SecretKeySpec;
    :goto_0
    return-object v6

    .line 325
    :catch_0
    move-exception v2

    .line 326
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v2}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 327
    const/4 v6, 0x0

    goto :goto_0

    .line 317
    :array_0
    .array-data 1
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
    .end array-data
.end method

.method public static encryptRSA([BLjava/security/PublicKey;)Ljava/lang/String;
    .locals 4
    .param p0, "data"    # [B
    .param p1, "pubKey"    # Ljava/security/PublicKey;

    .prologue
    .line 274
    :try_start_0
    const-string v3, "RSA/ECB/PKCS1Padding"

    invoke-static {v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 275
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v3, 0x1

    invoke-virtual {v0, v3, p1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 276
    invoke-virtual {v0, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    .line 277
    .local v1, "encrypted":[B
    invoke-static {v1}, Lcom/shengpay/express/smc/codec/Base64Util;->encode([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 280
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "encrypted":[B
    :goto_0
    return-object v3

    .line 278
    :catch_0
    move-exception v2

    .line 279
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 280
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static encryptRSA([BLjava/security/cert/X509Certificate;)Ljava/lang/String;
    .locals 5
    .param p0, "data"    # [B
    .param p1, "cert"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 255
    :try_start_0
    const-string v3, "RSA/ECB/PKCS1Padding"

    invoke-static {v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 256
    .local v0, "cipher":Ljavax/crypto/Cipher;
    const/4 v3, 0x1

    invoke-virtual {p1}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 257
    invoke-virtual {v0, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    .line 258
    .local v1, "encrypted":[B
    invoke-static {v1}, Lcom/shengpay/express/smc/codec/Base64Util;->encode([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 261
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "encrypted":[B
    :goto_0
    return-object v3

    .line 259
    :catch_0
    move-exception v2

    .line 260
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 261
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private static getPrivateKeyByInputStream(Ljava/io/FileInputStream;Ljava/lang/String;)Ljava/security/PrivateKey;
    .locals 5
    .param p0, "in"    # Ljava/io/FileInputStream;
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 203
    const/4 v3, 0x0

    .line 205
    .local v3, "ks":Ljava/security/KeyStore;
    :try_start_0
    const-string v4, "PKCS12"

    invoke-static {v4}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v3

    .line 206
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    invoke-virtual {v3, p0, v4}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 207
    invoke-virtual {p0}, Ljava/io/FileInputStream;->close()V

    .line 208
    const/4 v0, 0x0

    .line 209
    .local v0, "alias":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/security/KeyStore;->aliases()Ljava/util/Enumeration;

    move-result-object v1

    .line 210
    .local v1, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-nez v4, :cond_0

    .line 213
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    invoke-virtual {v3, v0, v4}, Ljava/security/KeyStore;->getKey(Ljava/lang/String;[C)Ljava/security/Key;

    move-result-object v4

    check-cast v4, Ljava/security/PrivateKey;

    .line 217
    .end local v0    # "alias":Ljava/lang/String;
    .end local v1    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    :goto_1
    return-object v4

    .line 211
    .restart local v0    # "alias":Ljava/lang/String;
    .restart local v1    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    :cond_0
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "alias":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v0    # "alias":Ljava/lang/String;
    goto :goto_0

    .line 214
    .end local v0    # "alias":Ljava/lang/String;
    .end local v1    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    :catch_0
    move-exception v2

    .line 215
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v2}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 217
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public static getPrivateKeyByPfxFile(Ljava/lang/String;Ljava/lang/String;)Ljava/security/PrivateKey;
    .locals 5
    .param p0, "certPath"    # Ljava/lang/String;
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 189
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 199
    :cond_0
    :goto_0
    return-object v3

    .line 193
    :cond_1
    const/4 v1, 0x0

    .line 194
    .local v1, "in":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    .end local v1    # "in":Ljava/io/FileInputStream;
    .local v2, "in":Ljava/io/FileInputStream;
    :try_start_1
    invoke-static {v2, p1}, Lcom/shengpay/express/smc/codec/RSAUtil;->getPrivateKeyByInputStream(Ljava/io/FileInputStream;Ljava/lang/String;)Ljava/security/PrivateKey;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    goto :goto_0

    .line 196
    .end local v2    # "in":Ljava/io/FileInputStream;
    .restart local v1    # "in":Ljava/io/FileInputStream;
    :catch_0
    move-exception v0

    .line 197
    .local v0, "ex":Ljava/io/IOException;
    :goto_1
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 196
    .end local v0    # "ex":Ljava/io/IOException;
    .end local v1    # "in":Ljava/io/FileInputStream;
    .restart local v2    # "in":Ljava/io/FileInputStream;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "in":Ljava/io/FileInputStream;
    .restart local v1    # "in":Ljava/io/FileInputStream;
    goto :goto_1
.end method

.method public static getPrivateKeyFromBase64String(Ljava/lang/String;)Ljava/security/PrivateKey;
    .locals 6
    .param p0, "base64PrivateKey"    # Ljava/lang/String;

    .prologue
    .line 228
    :try_start_0
    invoke-static {p0}, Lcom/shengpay/express/smc/codec/Base64Util;->decode(Ljava/lang/String;)[B

    move-result-object v4

    .line 230
    .local v4, "privateKeyBytes":[B
    new-instance v2, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {v2, v4}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    .line 232
    .local v2, "keySpec":Ljava/security/spec/PKCS8EncodedKeySpec;
    const-string v5, "RSA"

    invoke-static {v5}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v1

    .line 233
    .local v1, "keyFact":Ljava/security/KeyFactory;
    invoke-virtual {v1, v2}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 239
    .end local v1    # "keyFact":Ljava/security/KeyFactory;
    .end local v2    # "keySpec":Ljava/security/spec/PKCS8EncodedKeySpec;
    .end local v4    # "privateKeyBytes":[B
    :goto_0
    return-object v3

    .line 236
    :catch_0
    move-exception v0

    .line 237
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v0}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 239
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static getPublicKeyByPfxFile(Ljava/lang/String;Ljava/lang/String;)Ljava/security/PublicKey;
    .locals 2
    .param p0, "certPath"    # Ljava/lang/String;
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 173
    invoke-static {p0, p1}, Lcom/shengpay/express/smc/codec/RSAUtil;->getX509CertFromPfxFile(Ljava/lang/String;Ljava/lang/String;)Ljava/security/cert/X509Certificate;

    move-result-object v0

    .line 174
    .local v0, "cert":Ljava/security/cert/X509Certificate;
    if-eqz v0, :cond_0

    .line 175
    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v1

    .line 177
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getPublicKeyFromBase64String(Ljava/lang/String;)Ljava/security/PublicKey;
    .locals 5
    .param p0, "base64PublicKey"    # Ljava/lang/String;

    .prologue
    .line 153
    :try_start_0
    const-string v4, "RSA"

    invoke-static {v4}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v1

    .line 155
    .local v1, "keyFactory":Ljava/security/KeyFactory;
    new-instance v3, Ljava/security/spec/X509EncodedKeySpec;

    .line 156
    invoke-static {p0}, Lcom/shengpay/express/smc/codec/Base64Util;->decode(Ljava/lang/String;)[B

    move-result-object v4

    .line 155
    invoke-direct {v3, v4}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    .line 157
    .local v3, "publicKeySpec":Ljava/security/spec/EncodedKeySpec;
    invoke-virtual {v1, v3}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 161
    .end local v1    # "keyFactory":Ljava/security/KeyFactory;
    .end local v3    # "publicKeySpec":Ljava/security/spec/EncodedKeySpec;
    :goto_0
    return-object v2

    .line 159
    :catch_0
    move-exception v0

    .line 160
    .local v0, "ex":Ljava/lang/Exception;
    const-string v4, "RSAUtil"

    invoke-static {v4, v0}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 161
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getSerialNoFromBase64Cert(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "base64Cert"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-static {p0}, Lcom/shengpay/express/smc/codec/RSAUtil;->getX509CertFromBase64Cert(Ljava/lang/String;)Ljava/security/cert/X509Certificate;

    move-result-object v0

    .line 43
    .local v0, "cert":Ljava/security/cert/X509Certificate;
    if-eqz v0, :cond_0

    .line 44
    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object v1

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 46
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getSerialNoFromCertification(Ljava/security/cert/X509Certificate;)Ljava/lang/String;
    .locals 2
    .param p0, "cert"    # Ljava/security/cert/X509Certificate;

    .prologue
    .line 38
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getX509CertFromBase64Cert(Ljava/lang/String;)Ljava/security/cert/X509Certificate;
    .locals 1
    .param p0, "base64Cert"    # Ljava/lang/String;

    .prologue
    .line 57
    if-nez p0, :cond_0

    .line 58
    const/4 v0, 0x0

    .line 60
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/shengpay/express/smc/codec/Base64Util;->decode(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lcom/shengpay/express/smc/codec/RSAUtil;->getX509CertFromBytes([B)Ljava/security/cert/X509Certificate;

    move-result-object v0

    goto :goto_0
.end method

.method private static getX509CertFromBytes([B)Ljava/security/cert/X509Certificate;
    .locals 1
    .param p0, "byteArrayCert"    # [B

    .prologue
    .line 70
    if-nez p0, :cond_0

    .line 71
    const/4 v0, 0x0

    .line 73
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-static {v0}, Lcom/shengpay/express/smc/codec/RSAUtil;->getX509CertFromInputStream(Ljava/io/InputStream;)Ljava/security/cert/X509Certificate;

    move-result-object v0

    goto :goto_0
.end method

.method private static getX509CertFromInputStream(Ljava/io/InputStream;)Ljava/security/cert/X509Certificate;
    .locals 5
    .param p0, "streamCert"    # Ljava/io/InputStream;

    .prologue
    .line 84
    const/4 v1, 0x0

    .line 87
    .local v1, "cert":Ljava/security/cert/X509Certificate;
    :try_start_0
    const-string v4, "X.509"

    invoke-static {v4}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v3

    .line 88
    .local v3, "factory":Ljava/security/cert/CertificateFactory;
    invoke-virtual {v3, p0}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/security/cert/X509Certificate;

    move-object v1, v0
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    .end local v3    # "factory":Ljava/security/cert/CertificateFactory;
    :goto_0
    return-object v1

    .line 90
    :catch_0
    move-exception v2

    .line 91
    .local v2, "ex":Ljava/security/cert/CertificateException;
    invoke-virtual {v2}, Ljava/security/cert/CertificateException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v2}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getX509CertFromPfxFile(Ljava/lang/String;Ljava/lang/String;)Ljava/security/cert/X509Certificate;
    .locals 5
    .param p0, "pfxFileName"    # Ljava/lang/String;
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 104
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 114
    :cond_0
    :goto_0
    return-object v3

    .line 107
    :cond_1
    const/4 v1, 0x0

    .line 109
    .local v1, "in":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .end local v1    # "in":Ljava/io/FileInputStream;
    .local v2, "in":Ljava/io/FileInputStream;
    :try_start_1
    invoke-static {v2, p1}, Lcom/shengpay/express/smc/codec/RSAUtil;->getX509CertFromPfxInputStream(Ljava/io/InputStream;Ljava/lang/String;)Ljava/security/cert/X509Certificate;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    goto :goto_0

    .line 111
    .end local v2    # "in":Ljava/io/FileInputStream;
    .restart local v1    # "in":Ljava/io/FileInputStream;
    :catch_0
    move-exception v0

    .line 112
    .local v0, "ex":Ljava/io/FileNotFoundException;
    :goto_1
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 111
    .end local v0    # "ex":Ljava/io/FileNotFoundException;
    .end local v1    # "in":Ljava/io/FileInputStream;
    .restart local v2    # "in":Ljava/io/FileInputStream;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "in":Ljava/io/FileInputStream;
    .restart local v1    # "in":Ljava/io/FileInputStream;
    goto :goto_1
.end method

.method private static getX509CertFromPfxInputStream(Ljava/io/InputStream;Ljava/lang/String;)Ljava/security/cert/X509Certificate;
    .locals 7
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 126
    :try_start_0
    const-string v6, "PKCS12"

    invoke-static {v6}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v4

    .line 127
    .local v4, "ks":Ljava/security/KeyStore;
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    .line 128
    .local v5, "passwd":[C
    invoke-virtual {v4, p0, v5}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 129
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 130
    const/4 v0, 0x0

    .line 131
    .local v0, "alias":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/security/KeyStore;->aliases()Ljava/util/Enumeration;

    move-result-object v2

    .line 132
    .local v2, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 133
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "alias":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .line 135
    .restart local v0    # "alias":Ljava/lang/String;
    :cond_0
    invoke-virtual {v4, v0}, Ljava/security/KeyStore;->getCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509Certificate;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    .end local v0    # "alias":Ljava/lang/String;
    .end local v2    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/lang/String;>;"
    .end local v4    # "ks":Ljava/security/KeyStore;
    .end local v5    # "passwd":[C
    :goto_0
    return-object v1

    .line 137
    :catch_0
    move-exception v3

    .line 138
    .local v3, "ex":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v3}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 140
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static hexStringToBytes(Ljava/lang/String;)[B
    .locals 7
    .param p0, "hexString"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x10

    .line 446
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x1

    if-ge v4, v5, :cond_2

    .line 447
    :cond_0
    const/4 v3, 0x0

    .line 456
    :cond_1
    return-object v3

    .line 448
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    new-array v3, v4, [B

    .line 449
    .local v3, "result":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    if-ge v1, v4, :cond_1

    .line 450
    mul-int/lit8 v4, v1, 0x2

    mul-int/lit8 v5, v1, 0x2

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    .line 453
    .local v0, "high":I
    mul-int/lit8 v4, v1, 0x2

    add-int/lit8 v4, v4, 0x1

    mul-int/lit8 v5, v1, 0x2

    add-int/lit8 v5, v5, 0x2

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 452
    invoke-static {v4, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    .line 454
    .local v2, "low":I
    mul-int/lit8 v4, v0, 0x10

    add-int/2addr v4, v2

    int-to-byte v4, v4

    aput-byte v4, v3, v1

    .line 449
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
