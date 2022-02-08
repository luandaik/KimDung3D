.class Lcom/heitao/request/HTPayOrderNumber$1;
.super Ljava/lang/Object;
.source "HTPayOrderNumber.java"

# interfaces
.implements Lcom/heitao/listener/HTRequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTPayOrderNumber;->doCreatePayOrderNumber(Ljava/util/Map;Lcom/heitao/listener/HTPayOrderListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/request/HTPayOrderNumber;

.field final synthetic val$requestUrlForLog:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTPayOrderNumber;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 67
    iput-object p1, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    iput-object p2, p0, Lcom/heitao/request/HTPayOrderNumber$1;->val$requestUrlForLog:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u751f\u6210\u8ba2\u5355\u53f7\u8bf7\u6c42\u5931\u8d25\uff0cerror="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "create order url="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/request/HTPayOrderNumber$1;->val$requestUrlForLog:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 122
    iget-object v0, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    invoke-virtual {v0}, Lcom/heitao/request/HTPayOrderNumber;->doCancelProgressDialog()V

    .line 124
    iget-object v0, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    iget-object v0, v0, Lcom/heitao/request/HTPayOrderNumber;->mPayOrderNumberLisener:Lcom/heitao/listener/HTPayOrderListener;

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    iget-object v0, v0, Lcom/heitao/request/HTPayOrderNumber;->mPayOrderNumberLisener:Lcom/heitao/listener/HTPayOrderListener;

    invoke-static {}, Lcom/heitao/model/HTError;->getNetworkError()Lcom/heitao/model/HTError;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/heitao/listener/HTPayOrderListener;->onHTPayOrderNumberFailed(Lcom/heitao/model/HTError;)V

    .line 128
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 10
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 71
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u751f\u6210\u8ba2\u5355\u53f7\u8fd4\u56de\u6210\u529f\uff0cresponse="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 72
    iget-object v6, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    invoke-virtual {v6}, Lcom/heitao/request/HTPayOrderNumber;->doCancelProgressDialog()V

    .line 75
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 78
    .local v5, "responseObject":Lorg/json/JSONObject;
    iget-object v6, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    const-string v7, "errno"

    invoke-static {v5, v7}, Lcom/heitao/common/HTJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v7

    invoke-static {v6, v7}, Lcom/heitao/request/HTPayOrderNumber;->access$002(Lcom/heitao/request/HTPayOrderNumber;I)I

    .line 79
    iget-object v6, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    const-string v7, "title"

    invoke-static {v5, v7}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/heitao/request/HTPayOrderNumber;->access$102(Lcom/heitao/request/HTPayOrderNumber;Ljava/lang/String;)Ljava/lang/String;

    .line 80
    iget-object v6, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    const-string v7, "errmsg"

    invoke-static {v5, v7}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/heitao/request/HTPayOrderNumber;->access$202(Lcom/heitao/request/HTPayOrderNumber;Ljava/lang/String;)Ljava/lang/String;

    .line 82
    iget-object v6, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    invoke-static {v6}, Lcom/heitao/request/HTPayOrderNumber;->access$000(Lcom/heitao/request/HTPayOrderNumber;)I

    move-result v6

    if-nez v6, :cond_1

    const-string v6, "errno"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 84
    const-string v6, "data"

    invoke-static {v5, v6}, Lcom/heitao/common/HTJSONHelper;->getJSONObject(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 85
    .local v2, "dataObject":Lorg/json/JSONObject;
    if-eqz v2, :cond_0

    const-string v6, "data"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 87
    const-string v6, "orderno"

    invoke-static {v2, v6}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 88
    .local v4, "orderNumber":Ljava/lang/String;
    const-string v6, "sid"

    invoke-static {v2, v6}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 89
    .local v1, "customServerId":Ljava/lang/String;
    const-string v6, "sdk"

    invoke-static {v2, v6}, Lcom/heitao/common/HTJSONHelper;->getJSONObject(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 91
    .local v0, "customData":Lorg/json/JSONObject;
    iget-object v6, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    iget-object v6, v6, Lcom/heitao/request/HTPayOrderNumber;->mPayOrderNumberLisener:Lcom/heitao/listener/HTPayOrderListener;

    if-eqz v6, :cond_0

    .line 93
    iget-object v6, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    iget-object v6, v6, Lcom/heitao/request/HTPayOrderNumber;->mPayOrderNumberLisener:Lcom/heitao/listener/HTPayOrderListener;

    invoke-interface {v6, v4, v1, v0}, Lcom/heitao/listener/HTPayOrderListener;->onHTPayOrderNumberCompleted(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 115
    .end local v0    # "customData":Lorg/json/JSONObject;
    .end local v1    # "customServerId":Ljava/lang/String;
    .end local v2    # "dataObject":Lorg/json/JSONObject;
    .end local v4    # "orderNumber":Ljava/lang/String;
    .end local v5    # "responseObject":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return-void

    .line 99
    .restart local v5    # "responseObject":Lorg/json/JSONObject;
    :cond_1
    iget-object v6, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    iget-object v7, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    invoke-static {v7}, Lcom/heitao/request/HTPayOrderNumber;->access$000(Lcom/heitao/request/HTPayOrderNumber;)I

    move-result v7

    iget-object v8, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    invoke-static {v8}, Lcom/heitao/request/HTPayOrderNumber;->access$100(Lcom/heitao/request/HTPayOrderNumber;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    invoke-static {v9}, Lcom/heitao/request/HTPayOrderNumber;->access$200(Lcom/heitao/request/HTPayOrderNumber;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v7, v8, v9}, Lcom/heitao/request/HTPayOrderNumber;->access$300(Lcom/heitao/request/HTPayOrderNumber;ILjava/lang/String;Ljava/lang/String;)V

    .line 100
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "create order url="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/heitao/request/HTPayOrderNumber$1;->val$requestUrlForLog:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 103
    .end local v5    # "responseObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v3

    .line 106
    .local v3, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u751f\u6210\u8ba2\u5355\u53f7\u89e3\u6790\u5931\u8d25\uff0cerror="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 107
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "create order url="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/heitao/request/HTPayOrderNumber$1;->val$requestUrlForLog:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 108
    iget-object v6, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    invoke-virtual {v6}, Lcom/heitao/request/HTPayOrderNumber;->doCancelProgressDialog()V

    .line 110
    iget-object v6, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    iget-object v6, v6, Lcom/heitao/request/HTPayOrderNumber;->mPayOrderNumberLisener:Lcom/heitao/listener/HTPayOrderListener;

    if-eqz v6, :cond_0

    .line 112
    iget-object v6, p0, Lcom/heitao/request/HTPayOrderNumber$1;->this$0:Lcom/heitao/request/HTPayOrderNumber;

    iget-object v6, v6, Lcom/heitao/request/HTPayOrderNumber;->mPayOrderNumberLisener:Lcom/heitao/listener/HTPayOrderListener;

    invoke-static {}, Lcom/heitao/model/HTError;->getParsError()Lcom/heitao/model/HTError;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/heitao/listener/HTPayOrderListener;->onHTPayOrderNumberFailed(Lcom/heitao/model/HTError;)V

    goto :goto_0
.end method
