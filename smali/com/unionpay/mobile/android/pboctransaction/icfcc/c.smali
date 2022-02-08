.class public final Lcom/unionpay/mobile/android/pboctransaction/icfcc/c;
.super Ljava/lang/Object;


# direct methods
.method public static a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10

    const/4 v9, 0x3

    const/16 v8, -0x80

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v1, 0x0

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a(Ljava/lang/String;)[B

    move-result-object v5

    move v0, v1

    :goto_1
    array-length v2, v5

    if-ge v0, v2, :cond_9

    aget-byte v2, v5, v0

    and-int/lit8 v2, v2, 0x1f

    int-to-byte v2, v2

    const/16 v6, 0x1f

    if-ne v2, v6, :cond_e

    move v2, v3

    :goto_2
    new-array v6, v2, [B

    invoke-static {v5, v0, v6, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {v6, v2}, Lcom/unionpay/mobile/android/pboctransaction/e;->a([BI)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_4

    add-int/2addr v2, v0

    aget-byte v0, v5, v2

    and-int/lit16 v0, v0, 0x80

    int-to-byte v0, v0

    if-eq v0, v8, :cond_1

    aget-byte v0, v5, v2

    and-int/lit16 v0, v0, 0xff

    :goto_3
    new-array v3, v0, [B

    add-int/2addr v2, v4

    invoke-static {v5, v2, v3, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {v3, v0}, Lcom/unionpay/mobile/android/pboctransaction/e;->a([BI)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    aget-byte v0, v5, v2

    and-int/lit8 v0, v0, 0x7f

    add-int/lit8 v4, v0, 0x1

    if-ne v4, v3, :cond_2

    add-int/lit8 v0, v2, 0x1

    aget-byte v0, v5, v0

    and-int/lit16 v0, v0, 0xff

    goto :goto_3

    :cond_2
    if-ne v4, v9, :cond_3

    add-int/lit8 v0, v2, 0x1

    aget-byte v0, v5, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v3, v2, 0x2

    aget-byte v3, v5, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v0, v3

    goto :goto_3

    :cond_3
    const/4 v0, 0x4

    if-ne v4, v0, :cond_d

    add-int/lit8 v0, v2, 0x1

    aget-byte v0, v5, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x10

    add-int/lit8 v3, v2, 0x2

    aget-byte v3, v5, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v0, v3

    add-int/lit8 v3, v2, 0x3

    aget-byte v3, v5, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v0, v3

    goto :goto_3

    :cond_4
    aget-byte v6, v5, v0

    and-int/lit8 v6, v6, 0x20

    const/16 v7, 0x20

    if-ne v6, v7, :cond_5

    add-int/2addr v2, v0

    array-length v0, v5

    if-ge v2, v0, :cond_c

    aget-byte v0, v5, v2

    and-int/lit16 v0, v0, 0x80

    int-to-byte v0, v0

    if-ne v0, v8, :cond_c

    aget-byte v0, v5, v2

    and-int/lit8 v0, v0, 0x7f

    add-int/lit8 v0, v0, 0x1

    :goto_4
    add-int/2addr v0, v2

    goto/16 :goto_1

    :cond_5
    add-int v6, v0, v2

    array-length v0, v5

    if-ge v6, v0, :cond_6

    aget-byte v0, v5, v6

    and-int/lit16 v0, v0, 0x80

    int-to-byte v0, v0

    if-nez v0, :cond_6

    aget-byte v0, v5, v6

    and-int/lit16 v0, v0, 0xff

    move v2, v4

    :goto_5
    add-int/2addr v0, v2

    add-int/2addr v0, v6

    goto/16 :goto_1

    :cond_6
    array-length v0, v5

    if-ge v6, v0, :cond_b

    aget-byte v0, v5, v6

    and-int/lit8 v0, v0, 0x7f

    add-int/lit8 v2, v0, 0x1

    :goto_6
    if-ne v2, v3, :cond_7

    add-int/lit8 v0, v6, 0x1

    array-length v7, v5

    if-ge v0, v7, :cond_7

    add-int/lit8 v0, v6, 0x1

    aget-byte v0, v5, v0

    and-int/lit16 v0, v0, 0xff

    goto :goto_5

    :cond_7
    if-ne v2, v9, :cond_8

    add-int/lit8 v0, v6, 0x2

    array-length v7, v5

    if-ge v0, v7, :cond_8

    add-int/lit8 v0, v6, 0x1

    aget-byte v0, v5, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v7, v6, 0x2

    aget-byte v7, v5, v7

    and-int/lit16 v7, v7, 0xff

    or-int/2addr v0, v7

    goto :goto_5

    :cond_8
    const/4 v0, 0x4

    if-ne v2, v0, :cond_a

    add-int/lit8 v0, v6, 0x2

    array-length v7, v5

    if-ge v0, v7, :cond_a

    add-int/lit8 v0, v6, 0x1

    aget-byte v0, v5, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x10

    add-int/lit8 v7, v6, 0x2

    aget-byte v7, v5, v7

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    or-int/2addr v0, v7

    add-int/lit8 v7, v6, 0x3

    aget-byte v7, v5, v7

    and-int/lit16 v7, v7, 0xff

    or-int/2addr v0, v7

    goto :goto_5

    :cond_9
    const/4 v0, 0x0

    goto/16 :goto_0

    :cond_a
    move v0, v1

    goto :goto_5

    :cond_b
    move v2, v1

    goto :goto_6

    :cond_c
    move v0, v4

    goto :goto_4

    :cond_d
    move v0, v1

    goto/16 :goto_3

    :cond_e
    move v2, v4

    goto/16 :goto_2
.end method
