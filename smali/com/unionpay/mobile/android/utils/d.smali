.class public final Lcom/unionpay/mobile/android/utils/d;
.super Ljava/lang/Object;


# direct methods
.method private static a(I[B[B)[B
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    const/16 v6, 0x18

    const/16 v4, 0x10

    const/16 v3, 0x8

    const/4 v5, 0x0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-eq v0, v3, :cond_1

    array-length v0, p1

    if-eq v0, v4, :cond_1

    array-length v0, p1

    if-eq v0, v6, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_1
    if-nez p2, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_2
    const-string v0, "DESede/ECB/NoPadding"

    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    new-array v2, v6, [B

    array-length v0, p1

    if-ne v0, v3, :cond_4

    invoke-static {p1, v5, v2, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {p1, v5, v2, v3, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {p1, v5, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_0
    array-length v0, p2

    rem-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_3

    array-length v0, p2

    div-int/lit8 v0, v0, 0x8

    add-int/lit8 v0, v0, 0x1

    mul-int/lit8 v0, v0, 0x8

    new-array v0, v0, [B

    array-length v3, p2

    invoke-static {p2, v5, v0, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v3, p2

    array-length v4, v0

    invoke-static {v0, v3, v4, v5}, Ljava/util/Arrays;->fill([BIIB)V

    move-object p2, v0

    :cond_3
    if-eqz p0, :cond_6

    const/4 v0, 0x1

    :goto_1
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    const-string v4, "DESede"

    invoke-direct {v3, v2, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v1, v0, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    invoke-virtual {v1, p2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v0

    return-object v0

    :cond_4
    array-length v0, p1

    if-ne v0, v4, :cond_5

    invoke-static {p1, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {p1, v5, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    :cond_5
    invoke-static {p1, v5, v2, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    :cond_6
    const/4 v0, 0x2

    goto :goto_1
.end method

.method public static a([B[B)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    const/4 v0, 0x1

    invoke-static {v0, p0, p1}, Lcom/unionpay/mobile/android/utils/d;->a(I[B[B)[B

    move-result-object v0

    return-object v0
.end method

.method public static b([B[B)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {v0, p0, p1}, Lcom/unionpay/mobile/android/utils/d;->a(I[B[B)[B

    move-result-object v0

    return-object v0
.end method
