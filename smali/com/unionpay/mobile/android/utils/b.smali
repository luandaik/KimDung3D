.class public final Lcom/unionpay/mobile/android/utils/b;
.super Ljava/lang/Object;


# direct methods
.method public static a([B)Ljava/lang/String;
    .locals 6

    const-string v1, "0123456789abcdef"

    new-instance v2, Ljava/lang/StringBuilder;

    array-length v0, p0

    mul-int/lit8 v0, v0, 0x2

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    array-length v3, p0

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v3, :cond_0

    aget-byte v4, p0, v0

    and-int/lit16 v4, v4, 0xff

    shr-int/lit8 v5, v4, 0x4

    invoke-virtual {v1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    and-int/lit8 v4, v4, 0xf

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static a(Ljava/lang/String;)[B
    .locals 7

    const/16 v6, 0x10

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    array-length v0, v2

    div-int/lit8 v3, v0, 0x2

    new-array v4, v3, [B

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, v3, :cond_1

    mul-int/lit8 v0, v1, 0x2

    aget-char v0, v2, v0

    invoke-static {v0, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v0

    mul-int/lit8 v5, v1, 0x2

    add-int/lit8 v5, v5, 0x1

    aget-char v5, v2, v5

    invoke-static {v5, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    shl-int/lit8 v0, v0, 0x4

    or-int/2addr v0, v5

    const/16 v5, 0x7f

    if-le v0, v5, :cond_0

    add-int/lit16 v0, v0, -0x100

    :cond_0
    int-to-byte v0, v0

    aput-byte v0, v4, v1

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_1
    return-object v4
.end method
