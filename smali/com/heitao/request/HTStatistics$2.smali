.class Lcom/heitao/request/HTStatistics$2;
.super Ljava/lang/Object;
.source "HTStatistics.java"

# interfaces
.implements Lcom/heitao/listener/HTRequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTStatistics;->doSendData(Ljava/lang/String;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/request/HTStatistics;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTStatistics;)V
    .locals 0

    .prologue
    .line 129
    iput-object p1, p0, Lcom/heitao/request/HTStatistics$2;->this$0:Lcom/heitao/request/HTStatistics;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 161
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u53d1\u9001\u6570\u636e\u8bf7\u6c42\u5931\u8d25\uff0cerror="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 162
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 6
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 133
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u53d1\u9001\u6570\u636e\u8fd4\u56de\u6210\u529f\uff0cresponse="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 136
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 139
    .local v3, "responseObject":Lorg/json/JSONObject;
    const-string v4, "errno"

    invoke-static {v3, v4}, Lcom/heitao/common/HTJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v1

    .line 140
    .local v1, "errorCode":I
    const-string v4, "errmsg"

    invoke-static {v3, v4}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 142
    .local v2, "errorMessage":Ljava/lang/String;
    if-nez v1, :cond_0

    const-string v4, "errno"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 144
    const-string v4, "\u53d1\u9001\u6570\u636e\u6210\u529f"

    invoke-static {v4}, Lcom/heitao/common/HTLog;->i(Ljava/lang/String;)V

    .line 156
    .end local v1    # "errorCode":I
    .end local v2    # "errorMessage":Ljava/lang/String;
    .end local v3    # "responseObject":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 148
    .restart local v1    # "errorCode":I
    .restart local v2    # "errorMessage":Ljava/lang/String;
    .restart local v3    # "responseObject":Lorg/json/JSONObject;
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u53d1\u9001\u6570\u636e\u89e3\u6790\u5931\u8d25\uff0cerror="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 151
    .end local v1    # "errorCode":I
    .end local v2    # "errorMessage":Ljava/lang/String;
    .end local v3    # "responseObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 154
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u53d1\u9001\u6570\u636e\u89e3\u6790\u5931\u8d25\uff0cerror="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method
