.class public Lcom/shengpay/express/smc/sign/RSA;
.super Ljava/lang/Object;
.source "RSA.java"


# static fields
.field public static final SIGN_ALGORITHMS:Ljava/lang/String; = "MD5withRSA"

.field public static final SIGN_ALGORITHMS_SHA1:Ljava/lang/String; = "SHA1WithRSA"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static sign(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "privateKey"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;

    .prologue
    .line 66
    :try_start_0
    new-instance v1, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-static {p1}, Lcom/shengpay/express/smc/sign/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    .line 68
    .local v1, "keySpec":Ljava/security/spec/PKCS8EncodedKeySpec;
    const-string v4, "RSA"

    invoke-static {v4}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v2

    .line 69
    .local v2, "keyf":Ljava/security/KeyFactory;
    invoke-virtual {v2, v1}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object v3

    .line 71
    .local v3, "priKey":Ljava/security/PrivateKey;
    invoke-static {p0, v3, p2}, Lcom/shengpay/express/smc/sign/RSA;->sign(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    return-object v4

    .line 73
    .end local v1    # "keySpec":Ljava/security/spec/PKCS8EncodedKeySpec;
    .end local v2    # "keyf":Ljava/security/KeyFactory;
    .end local v3    # "priKey":Ljava/security/PrivateKey;
    :catch_0
    move-exception v0

    .line 74
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public static sign(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "privateKey"    # Ljava/security/PrivateKey;
    .param p2, "charset"    # Ljava/lang/String;

    .prologue
    .line 88
    :try_start_0
    const-string v2, "MD5withRSA"

    invoke-static {v2}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v1

    .line 90
    .local v1, "signature":Ljava/security/Signature;
    invoke-virtual {v1, p1}, Ljava/security/Signature;->initSign(Ljava/security/PrivateKey;)V

    .line 91
    invoke-static {p0, p2}, Lcom/shengpay/express/smc/utils/StringUtils;->getContentBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/security/Signature;->update([B)V

    .line 93
    invoke-virtual {v1}, Ljava/security/Signature;->sign()[B

    move-result-object v2

    invoke-static {v2}, Lcom/shengpay/express/smc/sign/Base64;->encode([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 95
    .end local v1    # "signature":Ljava/security/Signature;
    :catch_0
    move-exception v0

    .line 96
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static signSHA1(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "privateKey"    # Ljava/lang/String;
    .param p2, "encode"    # Ljava/lang/String;

    .prologue
    .line 36
    :try_start_0
    new-instance v3, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-static {p1}, Lcom/shengpay/express/smc/sign/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    .line 38
    .local v3, "priPKCS8":Ljava/security/spec/PKCS8EncodedKeySpec;
    const-string v6, "RSA"

    invoke-static {v6}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v1

    .line 39
    .local v1, "keyf":Ljava/security/KeyFactory;
    invoke-virtual {v1, v3}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object v2

    .line 41
    .local v2, "priKey":Ljava/security/PrivateKey;
    const-string v6, "SHA1WithRSA"

    invoke-static {v6}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v4

    .line 43
    .local v4, "signature":Ljava/security/Signature;
    invoke-virtual {v4, v2}, Ljava/security/Signature;->initSign(Ljava/security/PrivateKey;)V

    .line 44
    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/security/Signature;->update([B)V

    .line 46
    invoke-virtual {v4}, Ljava/security/Signature;->sign()[B

    move-result-object v5

    .line 48
    .local v5, "signed":[B
    invoke-static {v5}, Lcom/shengpay/express/smc/sign/Base64;->encode([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 53
    .end local v1    # "keyf":Ljava/security/KeyFactory;
    .end local v2    # "priKey":Ljava/security/PrivateKey;
    .end local v3    # "priPKCS8":Ljava/security/spec/PKCS8EncodedKeySpec;
    .end local v4    # "signature":Ljava/security/Signature;
    .end local v5    # "signed":[B
    :goto_0
    return-object v6

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 53
    const/4 v6, 0x0

    goto :goto_0
.end method

.method public static verify(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "sign"    # Ljava/lang/String;
    .param p2, "publicKey"    # Ljava/lang/String;
    .param p3, "charset"    # Ljava/lang/String;

    .prologue
    .line 111
    :try_start_0
    new-instance v2, Ljava/security/spec/X509EncodedKeySpec;

    invoke-static {p2}, Lcom/shengpay/express/smc/sign/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    .line 113
    .local v2, "keySpec":Ljava/security/spec/X509EncodedKeySpec;
    const-string v4, "RSA"

    invoke-static {v4}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v1

    .line 114
    .local v1, "keyFactory":Ljava/security/KeyFactory;
    invoke-virtual {v1, v2}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v3

    .line 116
    .local v3, "pubKey":Ljava/security/PublicKey;
    invoke-static {p0, p1, v3, p3}, Lcom/shengpay/express/smc/sign/RSA;->verify(Ljava/lang/String;Ljava/lang/String;Ljava/security/PublicKey;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    return v4

    .line 118
    .end local v1    # "keyFactory":Ljava/security/KeyFactory;
    .end local v2    # "keySpec":Ljava/security/spec/X509EncodedKeySpec;
    .end local v3    # "pubKey":Ljava/security/PublicKey;
    :catch_0
    move-exception v0

    .line 119
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public static verify(Ljava/lang/String;Ljava/lang/String;Ljava/security/PublicKey;Ljava/lang/String;)Z
    .locals 3
    .param p0, "content"    # Ljava/lang/String;
    .param p1, "sign"    # Ljava/lang/String;
    .param p2, "publicKey"    # Ljava/security/PublicKey;
    .param p3, "charset"    # Ljava/lang/String;

    .prologue
    .line 134
    :try_start_0
    const-string v2, "MD5withRSA"

    invoke-static {v2}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v1

    .line 136
    .local v1, "signature":Ljava/security/Signature;
    invoke-virtual {v1, p2}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 137
    invoke-static {p0, p3}, Lcom/shengpay/express/smc/utils/StringUtils;->getContentBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/security/Signature;->update([B)V

    .line 139
    invoke-static {p1}, Lcom/shengpay/express/smc/sign/Base64;->decode(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/security/Signature;->verify([B)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    return v2

    .line 141
    .end local v1    # "signature":Ljava/security/Signature;
    :catch_0
    move-exception v0

    .line 142
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
