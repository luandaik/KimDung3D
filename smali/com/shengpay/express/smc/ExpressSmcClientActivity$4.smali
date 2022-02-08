.class Lcom/shengpay/express/smc/ExpressSmcClientActivity$4;
.super Ljava/lang/Object;
.source "ExpressSmcClientActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/shengpay/express/smc/ExpressSmcClientActivity;->doSyncLog(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

.field private final synthetic val$logStr:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/shengpay/express/smc/ExpressSmcClientActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$4;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    iput-object p2, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$4;->val$logStr:Ljava/lang/String;

    .line 318
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 321
    invoke-static {}, Lcom/shengpay/express/smc/utils/Logger;->getLogger()Lcom/shengpay/express/smc/utils/Logger;

    move-result-object v4

    iget-object v5, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$4;->val$logStr:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/shengpay/express/smc/utils/Logger;->writeWebConsoleLog(Ljava/lang/String;)V

    .line 322
    invoke-static {}, Lcom/shengpay/express/smc/utils/Logger;->getLogger()Lcom/shengpay/express/smc/utils/Logger;

    move-result-object v4

    invoke-virtual {v4}, Lcom/shengpay/express/smc/utils/Logger;->getLogStr()Ljava/lang/String;

    move-result-object v2

    .line 324
    .local v2, "log":Ljava/lang/String;
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 325
    .local v3, "params":Lorg/json/JSONObject;
    const-string v4, "log"

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 326
    const-string v4, "ticket"

    iget-object v5, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$4;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v5}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$18(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 327
    invoke-static {}, Lcom/shengpay/express/smc/http/JsonHttpClient;->INSTANCE()Lcom/shengpay/express/smc/http/JsonHttpClient;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$4;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v6}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$13(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Lcom/shengpay/express/smc/utils/ConfigUtil;

    move-result-object v6

    invoke-virtual {v6}, Lcom/shengpay/express/smc/utils/ConfigUtil;->getSmcServerUrl()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "log.htm"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/shengpay/express/smc/http/JsonHttpClient;->sendJsonString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    .line 328
    .local v1, "jsonResp":Lorg/json/JSONObject;
    iget-object v4, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$4;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v4}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v4, "\u5411\u670d\u52a1\u5668\u53d1\u9001\u65e5\u5fd7\u7ed3\u679c\uff1a"

    invoke-direct {v6, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "success"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "\u6210\u529f"

    :goto_0
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/shengpay/express/smc/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    .end local v1    # "jsonResp":Lorg/json/JSONObject;
    .end local v3    # "params":Lorg/json/JSONObject;
    :goto_1
    return-void

    .line 328
    .restart local v1    # "jsonResp":Lorg/json/JSONObject;
    .restart local v3    # "params":Lorg/json/JSONObject;
    :cond_0
    const-string v4, "\u5931\u8d25"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 329
    .end local v1    # "jsonResp":Lorg/json/JSONObject;
    .end local v3    # "params":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 330
    .local v0, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$4;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    invoke-static {v4}, Lcom/shengpay/express/smc/ExpressSmcClientActivity;->access$0(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/shengpay/express/smc/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
