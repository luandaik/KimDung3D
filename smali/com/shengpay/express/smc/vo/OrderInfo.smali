.class public Lcom/shengpay/express/smc/vo/OrderInfo;
.super Ljava/lang/Object;
.source "OrderInfo.java"


# instance fields
.field private amount:Ljava/lang/String;

.field private backUrl:Ljava/lang/String;

.field private bankCardType:Ljava/lang/String;

.field private bankCode:Ljava/lang/String;

.field private charset:Ljava/lang/String;

.field private currency:Ljava/lang/String;

.field private exts:Ljava/lang/String;

.field private jsCallback:Ljava/lang/String;

.field private merchantNo:Ljava/lang/String;

.field private merchantOrderNo:Ljava/lang/String;

.field private notifyUrl:Ljava/lang/String;

.field private outMemberId:Ljava/lang/String;

.field private outMemberMobile:Ljava/lang/String;

.field private outMemberName:Ljava/lang/String;

.field private outMemberRegistIP:Ljava/lang/String;

.field private outMemberRegistTime:Ljava/lang/String;

.field private outMemberVerifyStatus:Ljava/lang/String;

.field private pageUrl:Ljava/lang/String;

.field private productDesc:Ljava/lang/String;

.field private productName:Ljava/lang/String;

.field private requestTime:Ljava/lang/String;

.field private result:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private signMsg:Ljava/lang/String;

.field private signType:Ljava/lang/String;

.field private userIP:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    .line 10
    return-void
.end method

.method private isEmpty(Ljava/lang/String;)Z
    .locals 2
    .param p1, "obj"    # Ljava/lang/String;

    .prologue
    .line 329
    if-eqz p1, :cond_0

    const-string v0, ""

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 330
    :cond_0
    const/4 v0, 0x1

    .line 332
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getAmount()Ljava/lang/String;
    .locals 1

    .prologue
    .line 262
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->amount:Ljava/lang/String;

    return-object v0
.end method

.method public getBackUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->backUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getBankCardType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 286
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->bankCardType:Ljava/lang/String;

    return-object v0
.end method

.method public getBankCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 292
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->bankCode:Ljava/lang/String;

    return-object v0
.end method

.method public getCharset()Ljava/lang/String;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->charset:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrency()Ljava/lang/String;
    .locals 1

    .prologue
    .line 256
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->currency:Ljava/lang/String;

    return-object v0
.end method

.method public getExts()Ljava/lang/String;
    .locals 1

    .prologue
    .line 298
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->exts:Ljava/lang/String;

    return-object v0
.end method

.method public getJsCallback()Ljava/lang/String;
    .locals 1

    .prologue
    .line 304
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->jsCallback:Ljava/lang/String;

    return-object v0
.end method

.method public getMerchantNo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->merchantNo:Ljava/lang/String;

    return-object v0
.end method

.method public getMerchantOrderNo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 238
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->merchantOrderNo:Ljava/lang/String;

    return-object v0
.end method

.method public getNotifyUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 274
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->notifyUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getOrderJson()Lorg/json/JSONObject;
    .locals 4

    .prologue
    .line 161
    iget-object v1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v2, "signMsg"

    iget-object v3, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->signMsg:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 163
    .local v0, "jo":Lorg/json/JSONObject;
    return-object v0
.end method

.method public getOrderPara()Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 167
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 168
    .local v4, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lcom/shengpay/express/smc/vo/OrderInfo;->getOrderJson()Lorg/json/JSONObject;

    move-result-object v2

    .line 169
    .local v2, "jo":Lorg/json/JSONObject;
    const/4 v0, 0x0

    .line 170
    .local v0, "i":I
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 179
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 171
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 172
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {v2}, Lorg/json/JSONObject;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ne v0, v5, :cond_1

    .line 173
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 177
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 175
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method public getOutMemberId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberId:Ljava/lang/String;

    return-object v0
.end method

.method public getOutMemberMobile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberMobile:Ljava/lang/String;

    return-object v0
.end method

.method public getOutMemberName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberName:Ljava/lang/String;

    return-object v0
.end method

.method public getOutMemberRegistIP()Ljava/lang/String;
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberRegistIP:Ljava/lang/String;

    return-object v0
.end method

.method public getOutMemberRegistTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberRegistTime:Ljava/lang/String;

    return-object v0
.end method

.method public getOutMemberVerifyStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 220
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberVerifyStatus:Ljava/lang/String;

    return-object v0
.end method

.method public getPageUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 268
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->pageUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getProductDesc()Ljava/lang/String;
    .locals 1

    .prologue
    .line 250
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->productDesc:Ljava/lang/String;

    return-object v0
.end method

.method public getProductName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 244
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->productName:Ljava/lang/String;

    return-object v0
.end method

.method public getRequestTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->requestTime:Ljava/lang/String;

    return-object v0
.end method

.method public getSignMsg()Ljava/lang/String;
    .locals 1

    .prologue
    .line 322
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->signMsg:Ljava/lang/String;

    return-object v0
.end method

.method public getSignOriginal()Ljava/lang/String;
    .locals 5

    .prologue
    .line 40
    const-string v0, "|"

    .line 41
    .local v0, "separator":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 42
    .local v1, "signSource":Ljava/lang/StringBuffer;
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->merchantNo:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 43
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->merchantNo:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 44
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 45
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "merchantNo"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->merchantNo:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    :cond_0
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->charset:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 48
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->charset:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 49
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 50
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "charset"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->charset:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    :cond_1
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->requestTime:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 53
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->requestTime:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 54
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 55
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "requestTime"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->requestTime:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    :cond_2
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberId:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 58
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 59
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 60
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "outMemberId"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberId:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    :cond_3
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberRegistTime:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 63
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberRegistTime:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 64
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 65
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "outMemberRegistTime"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberRegistTime:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    :cond_4
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberRegistIP:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 68
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberRegistIP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 69
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 70
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "outMemberRegistIP"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberRegistIP:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    :cond_5
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberVerifyStatus:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 73
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberVerifyStatus:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 74
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 75
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "outMemberVerifyStatus"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberVerifyStatus:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    :cond_6
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberName:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 78
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 79
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 80
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "outMemberName"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberName:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    :cond_7
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberMobile:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 83
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberMobile:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 84
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 85
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "outMemberMobile"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberMobile:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    :cond_8
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->merchantOrderNo:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 88
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->merchantOrderNo:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 89
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 90
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "merchantOrderNo"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->merchantOrderNo:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    :cond_9
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->productName:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_a

    .line 93
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->productName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 94
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 95
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "productName"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->productName:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    :cond_a
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->productDesc:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_b

    .line 98
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->productDesc:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 99
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 100
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "productDesc"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->productDesc:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    :cond_b
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->currency:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 103
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->currency:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 104
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 105
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "currency"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->currency:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    :cond_c
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->amount:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_d

    .line 108
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->amount:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 109
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 110
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "amount"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->amount:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    :cond_d
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->pageUrl:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_e

    .line 113
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->pageUrl:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 114
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 115
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "pageUrl"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->pageUrl:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    :cond_e
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->notifyUrl:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_f

    .line 118
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->notifyUrl:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 119
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 120
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "notifyUrl"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->notifyUrl:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    :cond_f
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->userIP:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_10

    .line 123
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->userIP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 124
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 125
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "userIP"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->userIP:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    :cond_10
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->bankCardType:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_11

    .line 128
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->bankCardType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 129
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 130
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "bankCardType"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->bankCardType:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    :cond_11
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->bankCode:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_12

    .line 133
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->bankCode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 134
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 135
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "bankCode"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->bankCode:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    :cond_12
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->exts:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_13

    .line 138
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->exts:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 139
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 140
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "exts"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->exts:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    :cond_13
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->signType:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_14

    .line 143
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->signType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 144
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 145
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "signType"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->signType:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    :cond_14
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->jsCallback:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_15

    .line 149
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "jsCallback"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->jsCallback:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    :cond_15
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->backUrl:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_16

    .line 152
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "backUrl"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->backUrl:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    :cond_16
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->signType:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/shengpay/express/smc/vo/OrderInfo;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_17

    .line 155
    iget-object v2, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->result:Ljava/util/Map;

    const-string v3, "charset"

    iget-object v4, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->charset:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    :cond_17
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getSignType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 316
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->signType:Ljava/lang/String;

    return-object v0
.end method

.method public getUserIP()Ljava/lang/String;
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->userIP:Ljava/lang/String;

    return-object v0
.end method

.method public setAmount(Ljava/lang/String;)V
    .locals 0
    .param p1, "amount"    # Ljava/lang/String;

    .prologue
    .line 265
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->amount:Ljava/lang/String;

    .line 266
    return-void
.end method

.method public setBackUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "backUrl"    # Ljava/lang/String;

    .prologue
    .line 313
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->backUrl:Ljava/lang/String;

    .line 314
    return-void
.end method

.method public setBankCardType(Ljava/lang/String;)V
    .locals 0
    .param p1, "bankCardType"    # Ljava/lang/String;

    .prologue
    .line 289
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->bankCardType:Ljava/lang/String;

    .line 290
    return-void
.end method

.method public setBankCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "bankCode"    # Ljava/lang/String;

    .prologue
    .line 295
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->bankCode:Ljava/lang/String;

    .line 296
    return-void
.end method

.method public setCharset(Ljava/lang/String;)V
    .locals 0
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 193
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->charset:Ljava/lang/String;

    .line 194
    return-void
.end method

.method public setCurrency(Ljava/lang/String;)V
    .locals 0
    .param p1, "currency"    # Ljava/lang/String;

    .prologue
    .line 259
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->currency:Ljava/lang/String;

    .line 260
    return-void
.end method

.method public setExts(Ljava/lang/String;)V
    .locals 0
    .param p1, "exts"    # Ljava/lang/String;

    .prologue
    .line 301
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->exts:Ljava/lang/String;

    .line 302
    return-void
.end method

.method public setJsCallback(Ljava/lang/String;)V
    .locals 0
    .param p1, "jsCallback"    # Ljava/lang/String;

    .prologue
    .line 307
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->jsCallback:Ljava/lang/String;

    .line 308
    return-void
.end method

.method public setMerchantNo(Ljava/lang/String;)V
    .locals 0
    .param p1, "merchantNo"    # Ljava/lang/String;

    .prologue
    .line 187
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->merchantNo:Ljava/lang/String;

    .line 188
    return-void
.end method

.method public setMerchantOrderNo(Ljava/lang/String;)V
    .locals 0
    .param p1, "merchantOrderNo"    # Ljava/lang/String;

    .prologue
    .line 241
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->merchantOrderNo:Ljava/lang/String;

    .line 242
    return-void
.end method

.method public setNotifyUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "notifyUrl"    # Ljava/lang/String;

    .prologue
    .line 277
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->notifyUrl:Ljava/lang/String;

    .line 278
    return-void
.end method

.method public setOutMemberId(Ljava/lang/String;)V
    .locals 0
    .param p1, "outMemberId"    # Ljava/lang/String;

    .prologue
    .line 205
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberId:Ljava/lang/String;

    .line 206
    return-void
.end method

.method public setOutMemberMobile(Ljava/lang/String;)V
    .locals 0
    .param p1, "outMemberMobile"    # Ljava/lang/String;

    .prologue
    .line 235
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberMobile:Ljava/lang/String;

    .line 236
    return-void
.end method

.method public setOutMemberName(Ljava/lang/String;)V
    .locals 0
    .param p1, "outMemberName"    # Ljava/lang/String;

    .prologue
    .line 229
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberName:Ljava/lang/String;

    .line 230
    return-void
.end method

.method public setOutMemberRegistIP(Ljava/lang/String;)V
    .locals 0
    .param p1, "outMemberRegistIP"    # Ljava/lang/String;

    .prologue
    .line 217
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberRegistIP:Ljava/lang/String;

    .line 218
    return-void
.end method

.method public setOutMemberRegistTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "outMemberRegistTime"    # Ljava/lang/String;

    .prologue
    .line 211
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberRegistTime:Ljava/lang/String;

    .line 212
    return-void
.end method

.method public setOutMemberVerifyStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "outMemberVerifyStatus"    # Ljava/lang/String;

    .prologue
    .line 223
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->outMemberVerifyStatus:Ljava/lang/String;

    .line 224
    return-void
.end method

.method public setPageUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "pageUrl"    # Ljava/lang/String;

    .prologue
    .line 271
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->pageUrl:Ljava/lang/String;

    .line 272
    return-void
.end method

.method public setProductDesc(Ljava/lang/String;)V
    .locals 0
    .param p1, "productDesc"    # Ljava/lang/String;

    .prologue
    .line 253
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->productDesc:Ljava/lang/String;

    .line 254
    return-void
.end method

.method public setProductName(Ljava/lang/String;)V
    .locals 0
    .param p1, "productName"    # Ljava/lang/String;

    .prologue
    .line 247
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->productName:Ljava/lang/String;

    .line 248
    return-void
.end method

.method public setRequestTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "requestTime"    # Ljava/lang/String;

    .prologue
    .line 199
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->requestTime:Ljava/lang/String;

    .line 200
    return-void
.end method

.method public setSignMsg(Ljava/lang/String;)V
    .locals 0
    .param p1, "signMsg"    # Ljava/lang/String;

    .prologue
    .line 325
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->signMsg:Ljava/lang/String;

    .line 326
    return-void
.end method

.method public setSignType(Ljava/lang/String;)V
    .locals 0
    .param p1, "signType"    # Ljava/lang/String;

    .prologue
    .line 319
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->signType:Ljava/lang/String;

    .line 320
    return-void
.end method

.method public setUserIP(Ljava/lang/String;)V
    .locals 0
    .param p1, "userIP"    # Ljava/lang/String;

    .prologue
    .line 283
    iput-object p1, p0, Lcom/shengpay/express/smc/vo/OrderInfo;->userIP:Ljava/lang/String;

    .line 284
    return-void
.end method
