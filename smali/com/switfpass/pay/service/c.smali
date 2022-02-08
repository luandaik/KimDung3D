.class final Lcom/switfpass/pay/service/c;
.super Lcom/switfpass/pay/thread/Executable;


# instance fields
.field private final synthetic am:Lcom/switfpass/pay/bean/RequestMsg;

.field private final synthetic cM:Lcom/switfpass/pay/thread/UINotifyListener;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/bean/RequestMsg;Lcom/switfpass/pay/thread/UINotifyListener;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/service/c;->am:Lcom/switfpass/pay/bean/RequestMsg;

    iput-object p2, p0, Lcom/switfpass/pay/service/c;->cM:Lcom/switfpass/pay/thread/UINotifyListener;

    invoke-direct {p0}, Lcom/switfpass/pay/thread/Executable;-><init>()V

    return-void
.end method

.method private p()Lcom/switfpass/pay/bean/OrderBena;
    .locals 7

    const/4 v6, 0x0

    sget-object v1, Lcom/switfpass/pay/MainApplication;->PAY_UNIDFIED_MICRO:Ljava/lang/String;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "token_id="

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/switfpass/pay/service/c;->am:Lcom/switfpass/pay/bean/RequestMsg;

    invoke-virtual {v3}, Lcom/switfpass/pay/bean/RequestMsg;->getTokenId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "&trade_type=unified.trade.query&out_trade_no="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v3, p0, Lcom/switfpass/pay/service/c;->am:Lcom/switfpass/pay/bean/RequestMsg;

    invoke-virtual {v3}, Lcom/switfpass/pay/bean/RequestMsg;->getOutTradeNo()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->o()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "unfiedQueryOrder params-->"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    invoke-static {}, Lcom/switfpass/pay/thread/NetHelper;->getInstance()Lcom/switfpass/pay/thread/NetHelper;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/switfpass/pay/thread/NetHelper;->httpsPost(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/switfpass/pay/thread/RequestResult;

    move-result-object v1

    invoke-virtual {v1}, Lcom/switfpass/pay/thread/RequestResult;->hasError()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->o()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "unfiedQueryOrder result data-->"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v2, "status"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/switfpass/pay/bean/OrderBena;

    invoke-direct {v0}, Lcom/switfpass/pay/bean/OrderBena;-><init>()V

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

    const-string v3, "trade_state"

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

    iget-object v2, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v3, "sub_openid"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/switfpass/pay/bean/OrderBena;->setOpenID(Ljava/lang/String;)V

    iget-object v2, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v3, "message"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/switfpass/pay/bean/OrderBena;->setMessage(Ljava/lang/String;)V

    iget-object v1, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v2, "status"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/bean/OrderBena;->setResCode(Ljava/lang/String;)V

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/service/c;->cM:Lcom/switfpass/pay/thread/UINotifyListener;

    iget-object v1, v1, Lcom/switfpass/pay/thread/RequestResult;->data:Lorg/json/JSONObject;

    const-string v2, "message"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V

    :goto_1
    move-object v0, v6

    goto :goto_0

    :cond_1
    iget v0, v1, Lcom/switfpass/pay/thread/RequestResult;->resultCode:I

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_1

    :pswitch_1
    iget-object v0, p0, Lcom/switfpass/pay/service/c;->cM:Lcom/switfpass/pay/thread/UINotifyListener;

    const-string v1, "\u8bf7\u6c42\u8fde\u63a5\u8d85\u65f6\uff0c\u8bf7\u7a0d\u5019\u518d\u8bd5"

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

    iget-object v0, p0, Lcom/switfpass/pay/service/c;->cM:Lcom/switfpass/pay/thread/UINotifyListener;

    const-string v1, "\u67e5\u8be2\u786e\u8ba4\u7ed3\u679c\u5931\u8d25"

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V

    move-object v0, v6

    goto :goto_0

    :pswitch_2
    :try_start_1
    iget-object v0, p0, Lcom/switfpass/pay/service/c;->cM:Lcom/switfpass/pay/thread/UINotifyListener;

    const-string v1, "\u7f51\u7edc\u8fde\u63a5\u4e0d\u53ef\u7528\uff0c\u8bf7\u68c0\u67e5\u4f60\u7f51\u7edc\u8fde\u63a5"

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V

    goto :goto_1

    :pswitch_3
    iget-object v0, p0, Lcom/switfpass/pay/service/c;->cM:Lcom/switfpass/pay/thread/UINotifyListener;

    const-string v1, "\u8bf7\u6c42\u670d\u52a1\u8fde\u63a5\u5931\u8d25\uff0c\u8bf7\u7a0d\u5019\u518d\u8bd5"

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch -0x4
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public final synthetic execute()Ljava/lang/Object;
    .locals 1

    invoke-direct {p0}, Lcom/switfpass/pay/service/c;->p()Lcom/switfpass/pay/bean/OrderBena;

    move-result-object v0

    return-object v0
.end method
