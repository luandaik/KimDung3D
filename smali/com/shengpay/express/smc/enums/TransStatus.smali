.class public final enum Lcom/shengpay/express/smc/enums/TransStatus;
.super Ljava/lang/Enum;
.source "TransStatus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/shengpay/express/smc/enums/TransStatus;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum CANELSUCC:Lcom/shengpay/express/smc/enums/TransStatus;

.field private static final synthetic ENUM$VALUES:[Lcom/shengpay/express/smc/enums/TransStatus;

.field public static final enum FAIL:Lcom/shengpay/express/smc/enums/TransStatus;

.field public static final enum PARTREFUNDSUCCESS:Lcom/shengpay/express/smc/enums/TransStatus;

.field public static final enum PROCESSING:Lcom/shengpay/express/smc/enums/TransStatus;

.field public static final enum REFUNDFAIL:Lcom/shengpay/express/smc/enums/TransStatus;

.field public static final enum REFUNDPROCESSING:Lcom/shengpay/express/smc/enums/TransStatus;

.field public static final enum REFUNDSUCC:Lcom/shengpay/express/smc/enums/TransStatus;

.field private static final RETURN_KEY_TRANS_STATUS:Ljava/lang/String; = "transStatus"

.field public static final enum SUCC:Lcom/shengpay/express/smc/enums/TransStatus;

.field public static final enum TIMEOUT:Lcom/shengpay/express/smc/enums/TransStatus;

.field private static map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/shengpay/express/smc/enums/TransStatus;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private code:Ljava/lang/String;

.field private desc:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .prologue
    const/4 v10, 0x4

    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v1, 0x0

    .line 13
    new-instance v2, Lcom/shengpay/express/smc/enums/TransStatus;

    const-string v3, "PROCESSING"

    const-string v4, "00"

    const-string v5, "\u7b49\u5f85\u4ed8\u6b3e\u4e2d"

    invoke-direct {v2, v3, v1, v4, v5}, Lcom/shengpay/express/smc/enums/TransStatus;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v2, Lcom/shengpay/express/smc/enums/TransStatus;->PROCESSING:Lcom/shengpay/express/smc/enums/TransStatus;

    .line 14
    new-instance v2, Lcom/shengpay/express/smc/enums/TransStatus;

    const-string v3, "SUCC"

    const-string v4, "01"

    const-string v5, "\u4ed8\u6b3e\u6210\u529f"

    invoke-direct {v2, v3, v7, v4, v5}, Lcom/shengpay/express/smc/enums/TransStatus;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v2, Lcom/shengpay/express/smc/enums/TransStatus;->SUCC:Lcom/shengpay/express/smc/enums/TransStatus;

    .line 15
    new-instance v2, Lcom/shengpay/express/smc/enums/TransStatus;

    const-string v3, "FAIL"

    const-string v4, "02"

    const-string v5, "\u4ed8\u6b3e\u5931\u8d25"

    invoke-direct {v2, v3, v8, v4, v5}, Lcom/shengpay/express/smc/enums/TransStatus;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v2, Lcom/shengpay/express/smc/enums/TransStatus;->FAIL:Lcom/shengpay/express/smc/enums/TransStatus;

    .line 16
    new-instance v2, Lcom/shengpay/express/smc/enums/TransStatus;

    const-string v3, "TIMEOUT"

    const-string v4, "03"

    const-string v5, "\u8fc7\u671f"

    invoke-direct {v2, v3, v9, v4, v5}, Lcom/shengpay/express/smc/enums/TransStatus;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v2, Lcom/shengpay/express/smc/enums/TransStatus;->TIMEOUT:Lcom/shengpay/express/smc/enums/TransStatus;

    .line 17
    new-instance v2, Lcom/shengpay/express/smc/enums/TransStatus;

    const-string v3, "CANELSUCC"

    const-string v4, "04"

    const-string v5, "\u64a4\u9500\u6210\u529f"

    invoke-direct {v2, v3, v10, v4, v5}, Lcom/shengpay/express/smc/enums/TransStatus;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v2, Lcom/shengpay/express/smc/enums/TransStatus;->CANELSUCC:Lcom/shengpay/express/smc/enums/TransStatus;

    .line 18
    new-instance v2, Lcom/shengpay/express/smc/enums/TransStatus;

    const-string v3, "REFUNDPROCESSING"

    const/4 v4, 0x5

    const-string v5, "05"

    const-string v6, "\u9000\u6b3e\u4e2d"

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/shengpay/express/smc/enums/TransStatus;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v2, Lcom/shengpay/express/smc/enums/TransStatus;->REFUNDPROCESSING:Lcom/shengpay/express/smc/enums/TransStatus;

    .line 19
    new-instance v2, Lcom/shengpay/express/smc/enums/TransStatus;

    const-string v3, "REFUNDSUCC"

    const/4 v4, 0x6

    const-string v5, "06"

    const-string v6, "\u9000\u6b3e\u6210\u529f"

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/shengpay/express/smc/enums/TransStatus;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v2, Lcom/shengpay/express/smc/enums/TransStatus;->REFUNDSUCC:Lcom/shengpay/express/smc/enums/TransStatus;

    .line 20
    new-instance v2, Lcom/shengpay/express/smc/enums/TransStatus;

    const-string v3, "REFUNDFAIL"

    const/4 v4, 0x7

    const-string v5, "07"

    const-string v6, "\u9000\u6b3e\u5931\u8d25"

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/shengpay/express/smc/enums/TransStatus;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v2, Lcom/shengpay/express/smc/enums/TransStatus;->REFUNDFAIL:Lcom/shengpay/express/smc/enums/TransStatus;

    .line 21
    new-instance v2, Lcom/shengpay/express/smc/enums/TransStatus;

    const-string v3, "PARTREFUNDSUCCESS"

    const/16 v4, 0x8

    const-string v5, "08"

    const-string v6, "\u90e8\u5206\u9000\u6b3e\u6210\u529f"

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/shengpay/express/smc/enums/TransStatus;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    sput-object v2, Lcom/shengpay/express/smc/enums/TransStatus;->PARTREFUNDSUCCESS:Lcom/shengpay/express/smc/enums/TransStatus;

    const/16 v2, 0x9

    new-array v2, v2, [Lcom/shengpay/express/smc/enums/TransStatus;

    sget-object v3, Lcom/shengpay/express/smc/enums/TransStatus;->PROCESSING:Lcom/shengpay/express/smc/enums/TransStatus;

    aput-object v3, v2, v1

    sget-object v3, Lcom/shengpay/express/smc/enums/TransStatus;->SUCC:Lcom/shengpay/express/smc/enums/TransStatus;

    aput-object v3, v2, v7

    sget-object v3, Lcom/shengpay/express/smc/enums/TransStatus;->FAIL:Lcom/shengpay/express/smc/enums/TransStatus;

    aput-object v3, v2, v8

    sget-object v3, Lcom/shengpay/express/smc/enums/TransStatus;->TIMEOUT:Lcom/shengpay/express/smc/enums/TransStatus;

    aput-object v3, v2, v9

    sget-object v3, Lcom/shengpay/express/smc/enums/TransStatus;->CANELSUCC:Lcom/shengpay/express/smc/enums/TransStatus;

    aput-object v3, v2, v10

    const/4 v3, 0x5

    sget-object v4, Lcom/shengpay/express/smc/enums/TransStatus;->REFUNDPROCESSING:Lcom/shengpay/express/smc/enums/TransStatus;

    aput-object v4, v2, v3

    const/4 v3, 0x6

    sget-object v4, Lcom/shengpay/express/smc/enums/TransStatus;->REFUNDSUCC:Lcom/shengpay/express/smc/enums/TransStatus;

    aput-object v4, v2, v3

    const/4 v3, 0x7

    sget-object v4, Lcom/shengpay/express/smc/enums/TransStatus;->REFUNDFAIL:Lcom/shengpay/express/smc/enums/TransStatus;

    aput-object v4, v2, v3

    const/16 v3, 0x8

    sget-object v4, Lcom/shengpay/express/smc/enums/TransStatus;->PARTREFUNDSUCCESS:Lcom/shengpay/express/smc/enums/TransStatus;

    aput-object v4, v2, v3

    sput-object v2, Lcom/shengpay/express/smc/enums/TransStatus;->ENUM$VALUES:[Lcom/shengpay/express/smc/enums/TransStatus;

    .line 29
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    sput-object v2, Lcom/shengpay/express/smc/enums/TransStatus;->map:Ljava/util/Map;

    .line 31
    invoke-static {}, Lcom/shengpay/express/smc/enums/TransStatus;->values()[Lcom/shengpay/express/smc/enums/TransStatus;

    move-result-object v2

    array-length v3, v2

    .local v0, "transStatus":Lcom/shengpay/express/smc/enums/TransStatus;
    :goto_0
    if-lt v1, v3, :cond_0

    .line 34
    return-void

    .line 31
    :cond_0
    aget-object v0, v2, v1

    .line 32
    sget-object v4, Lcom/shengpay/express/smc/enums/TransStatus;->map:Ljava/util/Map;

    iget-object v5, v0, Lcom/shengpay/express/smc/enums/TransStatus;->code:Ljava/lang/String;

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p3, "code"    # Ljava/lang/String;
    .param p4, "desc"    # Ljava/lang/String;

    .prologue
    .line 107
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 108
    iput-object p3, p0, Lcom/shengpay/express/smc/enums/TransStatus;->code:Ljava/lang/String;

    .line 109
    iput-object p4, p0, Lcom/shengpay/express/smc/enums/TransStatus;->desc:Ljava/lang/String;

    .line 110
    return-void
.end method

.method public static getByCode(Ljava/lang/String;)Lcom/shengpay/express/smc/enums/TransStatus;
    .locals 1
    .param p0, "status"    # Ljava/lang/String;

    .prologue
    .line 72
    sget-object v0, Lcom/shengpay/express/smc/enums/TransStatus;->map:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/shengpay/express/smc/enums/TransStatus;

    return-object v0
.end method

.method private static getTransStatus(Ljava/lang/String;)Lcom/shengpay/express/smc/enums/TransStatus;
    .locals 5
    .param p0, "resultString"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 56
    const/4 v1, 0x0

    .line 58
    .local v1, "status":Lcom/shengpay/express/smc/enums/TransStatus;
    if-nez p0, :cond_0

    :try_start_0
    const-string v4, ""

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 68
    :goto_0
    return-object v3

    .line 61
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 62
    .local v0, "callbackJson":Lorg/json/JSONObject;
    const-string v3, "transStatus"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 63
    .local v2, "trasStatusCode":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 64
    invoke-static {v2}, Lcom/shengpay/express/smc/enums/TransStatus;->getByCode(Ljava/lang/String;)Lcom/shengpay/express/smc/enums/TransStatus;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .end local v0    # "callbackJson":Lorg/json/JSONObject;
    .end local v2    # "trasStatusCode":Ljava/lang/String;
    :cond_1
    :goto_1
    move-object v3, v1

    .line 68
    goto :goto_0

    .line 66
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method private isFailed()Z
    .locals 1

    .prologue
    .line 76
    sget-object v0, Lcom/shengpay/express/smc/enums/TransStatus;->FAIL:Lcom/shengpay/express/smc/enums/TransStatus;

    if-ne v0, p0, :cond_0

    .line 77
    const/4 v0, 0x1

    .line 79
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isFailed(Ljava/lang/String;)Z
    .locals 2
    .param p0, "resultString"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-static {p0}, Lcom/shengpay/express/smc/enums/TransStatus;->getTransStatus(Ljava/lang/String;)Lcom/shengpay/express/smc/enums/TransStatus;

    move-result-object v0

    .local v0, "status":Lcom/shengpay/express/smc/enums/TransStatus;
    if-eqz v0, :cond_0

    .line 49
    invoke-direct {v0}, Lcom/shengpay/express/smc/enums/TransStatus;->isFailed()Z

    move-result v1

    .line 51
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private isSuccess()Z
    .locals 1

    .prologue
    .line 84
    sget-object v0, Lcom/shengpay/express/smc/enums/TransStatus;->SUCC:Lcom/shengpay/express/smc/enums/TransStatus;

    if-ne v0, p0, :cond_0

    .line 85
    const/4 v0, 0x1

    .line 87
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isSuccess(Ljava/lang/String;)Z
    .locals 2
    .param p0, "resultString"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-static {p0}, Lcom/shengpay/express/smc/enums/TransStatus;->getTransStatus(Ljava/lang/String;)Lcom/shengpay/express/smc/enums/TransStatus;

    move-result-object v0

    .local v0, "status":Lcom/shengpay/express/smc/enums/TransStatus;
    if-eqz v0, :cond_0

    .line 40
    invoke-direct {v0}, Lcom/shengpay/express/smc/enums/TransStatus;->isSuccess()Z

    move-result v1

    .line 42
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/shengpay/express/smc/enums/TransStatus;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/shengpay/express/smc/enums/TransStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/shengpay/express/smc/enums/TransStatus;

    return-object v0
.end method

.method public static values()[Lcom/shengpay/express/smc/enums/TransStatus;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/shengpay/express/smc/enums/TransStatus;->ENUM$VALUES:[Lcom/shengpay/express/smc/enums/TransStatus;

    array-length v1, v0

    new-array v2, v1, [Lcom/shengpay/express/smc/enums/TransStatus;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method


# virtual methods
.method public getCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/shengpay/express/smc/enums/TransStatus;->code:Ljava/lang/String;

    return-object v0
.end method

.method public getDesc()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/shengpay/express/smc/enums/TransStatus;->desc:Ljava/lang/String;

    return-object v0
.end method

.method public setCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/shengpay/express/smc/enums/TransStatus;->code:Ljava/lang/String;

    .line 97
    return-void
.end method

.method public setDesc(Ljava/lang/String;)V
    .locals 0
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/shengpay/express/smc/enums/TransStatus;->desc:Ljava/lang/String;

    .line 105
    return-void
.end method
