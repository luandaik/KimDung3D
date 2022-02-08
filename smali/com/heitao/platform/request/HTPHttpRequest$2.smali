.class Lcom/heitao/platform/request/HTPHttpRequest$2;
.super Lcom/loopj/android/http/AsyncHttpResponseHandler;
.source "HTPHttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/request/HTPHttpRequest;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/request/HTPHttpRequest;


# direct methods
.method constructor <init>(Lcom/heitao/platform/request/HTPHttpRequest;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/request/HTPHttpRequest$2;->this$0:Lcom/heitao/platform/request/HTPHttpRequest;

    .line 140
    invoke-direct {p0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(I[Lorg/apache/http/Header;[BLjava/lang/Throwable;)V
    .locals 2
    .param p1, "code"    # I
    .param p2, "header"    # [Lorg/apache/http/Header;
    .param p3, "response"    # [B
    .param p4, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 181
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "code="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\terror="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 183
    iget-object v0, p0, Lcom/heitao/platform/request/HTPHttpRequest$2;->this$0:Lcom/heitao/platform/request/HTPHttpRequest;

    iget-object v0, v0, Lcom/heitao/platform/request/HTPHttpRequest;->mListener:Lcom/heitao/platform/listener/HTPRequestListener;

    if-eqz v0, :cond_0

    .line 185
    iget-object v0, p0, Lcom/heitao/platform/request/HTPHttpRequest$2;->this$0:Lcom/heitao/platform/request/HTPHttpRequest;

    iget-object v0, v0, Lcom/heitao/platform/request/HTPHttpRequest;->mListener:Lcom/heitao/platform/listener/HTPRequestListener;

    invoke-static {}, Lcom/heitao/platform/model/HTPError;->getRequestFailedError()Lcom/heitao/platform/model/HTPError;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/heitao/platform/listener/HTPRequestListener;->onFailed(Lcom/heitao/platform/model/HTPError;)V

    .line 187
    :cond_0
    return-void
.end method

.method public onSuccess(I[Lorg/apache/http/Header;[B)V
    .locals 5
    .param p1, "code"    # I
    .param p2, "header"    # [Lorg/apache/http/Header;
    .param p3, "response"    # [B

    .prologue
    .line 146
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "post response="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, p3}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 148
    const/4 v1, 0x0

    .line 151
    .local v1, "isParseFinish":Z
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p3}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 152
    .local v2, "jsonObject":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/heitao/platform/request/HTPHttpRequest$2;->this$0:Lcom/heitao/platform/request/HTPHttpRequest;

    invoke-virtual {v3, v2}, Lcom/heitao/platform/request/HTPHttpRequest;->onParse(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    const/4 v1, 0x1

    .line 164
    .end local v2    # "jsonObject":Lorg/json/JSONObject;
    :goto_0
    iget-object v3, p0, Lcom/heitao/platform/request/HTPHttpRequest$2;->this$0:Lcom/heitao/platform/request/HTPHttpRequest;

    iget-object v3, v3, Lcom/heitao/platform/request/HTPHttpRequest;->mListener:Lcom/heitao/platform/listener/HTPRequestListener;

    if-eqz v3, :cond_0

    .line 166
    if-eqz v1, :cond_1

    .line 168
    iget-object v3, p0, Lcom/heitao/platform/request/HTPHttpRequest$2;->this$0:Lcom/heitao/platform/request/HTPHttpRequest;

    iget-object v3, v3, Lcom/heitao/platform/request/HTPHttpRequest;->mListener:Lcom/heitao/platform/listener/HTPRequestListener;

    iget-object v4, p0, Lcom/heitao/platform/request/HTPHttpRequest$2;->this$0:Lcom/heitao/platform/request/HTPHttpRequest;

    iget-object v4, v4, Lcom/heitao/platform/request/HTPHttpRequest;->mHttpEntity:Lcom/heitao/platform/model/HTPHttpEntity;

    invoke-virtual {v3, v4}, Lcom/heitao/platform/listener/HTPRequestListener;->onCompleted(Lcom/heitao/platform/model/HTPHttpEntity;)V

    .line 175
    :cond_0
    :goto_1
    return-void

    .line 155
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 160
    const/4 v1, 0x0

    .line 161
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "post parse error="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 172
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_1
    iget-object v3, p0, Lcom/heitao/platform/request/HTPHttpRequest$2;->this$0:Lcom/heitao/platform/request/HTPHttpRequest;

    iget-object v3, v3, Lcom/heitao/platform/request/HTPHttpRequest;->mListener:Lcom/heitao/platform/listener/HTPRequestListener;

    invoke-static {}, Lcom/heitao/platform/model/HTPError;->getRequestParseError()Lcom/heitao/platform/model/HTPError;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/heitao/platform/listener/HTPRequestListener;->onFailed(Lcom/heitao/platform/model/HTPError;)V

    goto :goto_1
.end method
