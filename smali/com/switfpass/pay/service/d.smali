.class final Lcom/switfpass/pay/service/d;
.super Lcom/switfpass/pay/thread/Executable;


# instance fields
.field private final synthetic cM:Lcom/switfpass/pay/thread/UINotifyListener;

.field private final synthetic cO:Ljava/lang/String;

.field private final synthetic cP:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/switfpass/pay/thread/UINotifyListener;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/service/d;->cO:Ljava/lang/String;

    iput-object p2, p0, Lcom/switfpass/pay/service/d;->cP:Ljava/lang/String;

    iput-object p3, p0, Lcom/switfpass/pay/service/d;->cM:Lcom/switfpass/pay/thread/UINotifyListener;

    invoke-direct {p0}, Lcom/switfpass/pay/thread/Executable;-><init>()V

    return-void
.end method

.method private p()Lcom/switfpass/pay/bean/OrderBena;
    .locals 8

    const/4 v6, 0x0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->PAY_QUERY_STAUTS:Ljava/lang/String;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "mchId"

    iget-object v3, p0, Lcom/switfpass/pay/service/d;->cO:Ljava/lang/String;

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :try_start_0
    invoke-static {}, Lcom/switfpass/pay/thread/NetHelper;->getInstance()Lcom/switfpass/pay/thread/NetHelper;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v7, "uuid="

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/switfpass/pay/service/d;->cP:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/switfpass/pay/thread/NetHelper;->httpsPost(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/switfpass/pay/thread/RequestResult;

    move-result-object v1

    invoke-virtual {v1}, Lcom/switfpass/pay/thread/RequestResult;->hasError()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/switfpass/pay/bean/OrderBena;

    invoke-direct {v0}, Lcom/switfpass/pay/bean/OrderBena;-><init>()V

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->o()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "result data-->"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v3, "money"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/switfpass/pay/bean/OrderBena;->setMoeny(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v3, "out_trade_no"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/switfpass/pay/bean/OrderBena;->setOutTradeNo(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v3, "status"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/switfpass/pay/bean/OrderBena;->setStatus(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v3, "trade_type"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/switfpass/pay/bean/OrderBena;->setService(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v3, "trade_name"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/switfpass/pay/bean/OrderBena;->setTradeName(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v3, "trade_time"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/switfpass/pay/bean/OrderBena;->setTradeTime(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v3, "transaction_id"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/switfpass/pay/bean/OrderBena;->setTransactionId(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v3, "body"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/switfpass/pay/bean/OrderBena;->setBody(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v3, "order_no"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/switfpass/pay/bean/OrderBena;->setMchOrderNo(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v3, "mch_name"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/switfpass/pay/bean/OrderBena;->setMchName(Ljava/lang/String;)V

    iget-object v1, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v2, "sub_openid"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/bean/OrderBena;->setOpenID(Ljava/lang/String;)V

    :goto_0
    return-object v0

    :cond_0
    iget v0, v1, Lcom/switfpass/pay/thread/RequestResult;->resultCode:I

    packed-switch v0, :pswitch_data_0

    :goto_1
    :pswitch_0
    move-object v0, v6

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/switfpass/pay/service/d;->cM:Lcom/switfpass/pay/thread/UINotifyListener;

    const-string v1, "\u7f51\u7edc\u8fde\u63a5\u4e0d\u53ef\u7528\uff0c\u8bf7\u68c0\u67e5\u4f60\u7f51\u7edc\u8fde\u63a5"

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->o()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "createNativeOrder method error "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v6

    goto :goto_0

    :pswitch_2
    :try_start_1
    iget-object v0, p0, Lcom/switfpass/pay/service/d;->cM:Lcom/switfpass/pay/thread/UINotifyListener;

    const-string v1, "\u8bf7\u6c42\u8fde\u63a5\u8d85\u65f6\uff0c\u8bf7\u7a0d\u5019\u518d\u8bd5"

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V

    goto :goto_1

    :pswitch_3
    iget-object v0, p0, Lcom/switfpass/pay/service/d;->cM:Lcom/switfpass/pay/thread/UINotifyListener;

    const-string v1, "\u8bf7\u6c42\u670d\u52a1\u8fde\u63a5\u5931\u8d25\uff0c\u8bf7\u7a0d\u5019\u518d\u8bd5"

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch -0x4
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public final synthetic execute()Ljava/lang/Object;
    .locals 1

    invoke-direct {p0}, Lcom/switfpass/pay/service/d;->p()Lcom/switfpass/pay/bean/OrderBena;

    move-result-object v0

    return-object v0
.end method
