.class Lcom/heitao/request/HTStatistics$1;
.super Ljava/lang/Object;
.source "HTStatistics.java"

# interfaces
.implements Lcom/heitao/listener/HTRequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTStatistics;->doStatisticsRoleInfo(Ljava/util/Map;)V
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
    .line 44
    iput-object p1, p0, Lcom/heitao/request/HTStatistics$1;->this$0:Lcom/heitao/request/HTStatistics;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u7edf\u8ba1\u89d2\u8272\u4fe1\u606f\u8bf7\u6c42\u5931\u8d25\uff0cerror="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 91
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 8
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 48
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u7edf\u8ba1\u89d2\u8272\u4fe1\u606f\u8fd4\u56de\u6210\u529f\uff0cresponse="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 51
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 54
    .local v4, "responseObject":Lorg/json/JSONObject;
    const-string v6, "errno"

    invoke-static {v4, v6}, Lcom/heitao/common/HTJSONHelper;->getInt(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v2

    .line 55
    .local v2, "errorCode":I
    const-string v6, "errmsg"

    invoke-static {v4, v6}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 57
    .local v3, "errorMessage":Ljava/lang/String;
    if-nez v2, :cond_3

    const-string v6, "errno"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 59
    const-string v6, "\u7edf\u8ba1\u89d2\u8272\u4fe1\u606f\u63d0\u4ea4\u6210\u529f"

    invoke-static {v6}, Lcom/heitao/common/HTLog;->i(Ljava/lang/String;)V

    .line 61
    const-string v6, "data"

    invoke-static {v4, v6}, Lcom/heitao/common/HTJSONHelper;->getJSONObject(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 62
    .local v0, "dataObject":Lorg/json/JSONObject;
    if-eqz v0, :cond_0

    const-string v6, "data"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 64
    const-string v6, "wx_uid"

    invoke-static {v0, v6}, Lcom/heitao/common/HTJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 65
    .local v5, "weixinID":Ljava/lang/String;
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v6

    iget-object v6, v6, Lcom/heitao/common/HTDataCenter;->mWeiXinListener:Lcom/heitao/listener/HTWeiXinListener;

    if-eqz v6, :cond_2

    .line 67
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v6

    iget-object v7, v6, Lcom/heitao/common/HTDataCenter;->mWeiXinListener:Lcom/heitao/listener/HTWeiXinListener;

    invoke-static {v5}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    const/4 v6, 0x1

    :goto_0
    invoke-interface {v7, v6, v5, v0}, Lcom/heitao/listener/HTWeiXinListener;->onHTWeiXinBindQueryCompleted(ZLjava/lang/String;Lorg/json/JSONObject;)V

    .line 85
    .end local v0    # "dataObject":Lorg/json/JSONObject;
    .end local v2    # "errorCode":I
    .end local v3    # "errorMessage":Ljava/lang/String;
    .end local v4    # "responseObject":Lorg/json/JSONObject;
    .end local v5    # "weixinID":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 67
    .restart local v0    # "dataObject":Lorg/json/JSONObject;
    .restart local v2    # "errorCode":I
    .restart local v3    # "errorMessage":Ljava/lang/String;
    .restart local v4    # "responseObject":Lorg/json/JSONObject;
    .restart local v5    # "weixinID":Ljava/lang/String;
    :cond_1
    const/4 v6, 0x0

    goto :goto_0

    .line 71
    :cond_2
    const-string v6, "\u672a\u8bbe\u7f6e\u5fae\u4fe1\u76d1\u542c"

    invoke-static {v6}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 80
    .end local v0    # "dataObject":Lorg/json/JSONObject;
    .end local v2    # "errorCode":I
    .end local v3    # "errorMessage":Ljava/lang/String;
    .end local v4    # "responseObject":Lorg/json/JSONObject;
    .end local v5    # "weixinID":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 83
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u7edf\u8ba1\u89d2\u8272\u4fe1\u606f\u89e3\u6790\u5931\u8d25\uff0cerror="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto :goto_1

    .line 77
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "errorCode":I
    .restart local v3    # "errorMessage":Ljava/lang/String;
    .restart local v4    # "responseObject":Lorg/json/JSONObject;
    :cond_3
    :try_start_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u7edf\u8ba1\u89d2\u8272\u4fe1\u606f\u89e3\u6790\u5931\u8d25\uff0cerror="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
