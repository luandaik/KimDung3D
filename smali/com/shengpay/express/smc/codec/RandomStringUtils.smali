.class public final Lcom/shengpay/express/smc/codec/RandomStringUtils;
.super Ljava/lang/Object;
.source "RandomStringUtils.java"


# static fields
.field private static characters:[C

.field private static hexChars:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 6
    const/16 v0, 0x3e

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/shengpay/express/smc/codec/RandomStringUtils;->characters:[C

    .line 12
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_1

    sput-object v0, Lcom/shengpay/express/smc/codec/RandomStringUtils;->hexChars:[C

    .line 15
    return-void

    .line 6
    nop

    :array_0
    .array-data 2
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
    .end array-data

    .line 12
    :array_1
    .array-data 2
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x30s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getRandomHexString(I)Ljava/lang/String;
    .locals 6
    .param p0, "length"    # I

    .prologue
    .line 29
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .local v3, "sb":Ljava/lang/StringBuilder;
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 31
    .local v2, "r":Ljava/util/Random;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p0, :cond_0

    .line 36
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 32
    :cond_0
    sget-object v4, Lcom/shengpay/express/smc/codec/RandomStringUtils;->hexChars:[C

    array-length v4, v4

    invoke-virtual {v2, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 33
    .local v1, "index":Ljava/lang/Integer;
    sget-object v4, Lcom/shengpay/express/smc/codec/RandomStringUtils;->hexChars:[C

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aget-char v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 31
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static getRandomString(I)Ljava/lang/String;
    .locals 6
    .param p0, "length"    # I

    .prologue
    .line 18
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .local v3, "sb":Ljava/lang/StringBuilder;
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 20
    .local v2, "r":Ljava/util/Random;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, p0, :cond_0

    .line 25
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 21
    :cond_0
    sget-object v4, Lcom/shengpay/express/smc/codec/RandomStringUtils;->characters:[C

    array-length v4, v4

    invoke-virtual {v2, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 22
    .local v1, "index":Ljava/lang/Integer;
    sget-object v4, Lcom/shengpay/express/smc/codec/RandomStringUtils;->characters:[C

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aget-char v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 20
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
