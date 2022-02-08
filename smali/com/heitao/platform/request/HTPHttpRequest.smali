.class public Lcom/heitao/platform/request/HTPHttpRequest;
.super Ljava/lang/Object;
.source "HTPHttpRequest.java"


# instance fields
.field protected mHttpEntity:Lcom/heitao/platform/model/HTPHttpEntity;

.field private mIsAddPubPars:Z

.field protected mListener:Lcom/heitao/platform/listener/HTPRequestListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/heitao/platform/request/HTPHttpRequest;->mListener:Lcom/heitao/platform/listener/HTPRequestListener;

    .line 24
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/heitao/platform/request/HTPHttpRequest;->mIsAddPubPars:Z

    .line 25
    new-instance v0, Lcom/heitao/platform/model/HTPHttpEntity;

    invoke-direct {v0}, Lcom/heitao/platform/model/HTPHttpEntity;-><init>()V

    iput-object v0, p0, Lcom/heitao/platform/request/HTPHttpRequest;->mHttpEntity:Lcom/heitao/platform/model/HTPHttpEntity;

    .line 21
    return-void
.end method

.method private addPublicParameter(Ljava/util/Map;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 193
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 195
    new-instance p1, Ljava/util/HashMap;

    .end local p1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 199
    .restart local p1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 201
    .local v0, "time":Ljava/lang/String;
    const-string v1, "appkey"

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v2

    iget-object v2, v2, Lcom/heitao/platform/common/HTPDataCenter;->mAppKey:Ljava/lang/String;

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    const-string v1, "time"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    const-string v1, "token"

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->genTokenFromTimestamp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    const-string v1, "platform"

    const-string v2, "22"

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    const-string v1, "udid"

    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->getUDID()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    const-string v1, "chid"

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v2

    iget-object v2, v2, Lcom/heitao/platform/common/HTPDataCenter;->mChannelId:Ljava/lang/String;

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    const-string v1, "sdkversion"

    const-string v2, "2.0.1"

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    const-string v1, "imei"

    invoke-static {}, Lcom/heitao/platform/common/HTPUtils;->getDeviceId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    return-object p1
.end method


# virtual methods
.method public get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V
    .locals 4
    .param p1, "url"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/heitao/platform/listener/HTPRequestListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/heitao/platform/listener/HTPRequestListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 35
    .local p2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p3, p0, Lcom/heitao/platform/request/HTPHttpRequest;->mListener:Lcom/heitao/platform/listener/HTPRequestListener;

    .line 37
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 39
    const-string v2, "get_url_null"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 107
    :goto_0
    return-void

    .line 43
    :cond_0
    iget-object v2, p0, Lcom/heitao/platform/request/HTPHttpRequest;->mListener:Lcom/heitao/platform/listener/HTPRequestListener;

    if-nez v2, :cond_1

    .line 45
    const-string v2, "get_request_listener_null"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 48
    :cond_1
    iget-boolean v2, p0, Lcom/heitao/platform/request/HTPHttpRequest;->mIsAddPubPars:Z

    if-eqz v2, :cond_2

    .line 50
    invoke-direct {p0, p2}, Lcom/heitao/platform/request/HTPHttpRequest;->addPublicParameter(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p2

    .line 53
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {p2, v3}, Lcom/heitao/platform/common/HTPUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 55
    .local v1, "requestURL":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "requestURL="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 56
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "map="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 58
    new-instance v0, Lcom/loopj/android/http/AsyncHttpClient;

    invoke-direct {v0}, Lcom/loopj/android/http/AsyncHttpClient;-><init>()V

    .line 59
    .local v0, "client":Lcom/loopj/android/http/AsyncHttpClient;
    const/16 v2, 0x2710

    invoke-virtual {v0, v2}, Lcom/loopj/android/http/AsyncHttpClient;->setTimeout(I)V

    .line 60
    new-instance v2, Lcom/heitao/platform/request/HTPHttpRequest$1;

    invoke-direct {v2, p0}, Lcom/heitao/platform/request/HTPHttpRequest$1;-><init>(Lcom/heitao/platform/request/HTPHttpRequest;)V

    invoke-virtual {v0, v1, v2}, Lcom/loopj/android/http/AsyncHttpClient;->get(Ljava/lang/String;Lcom/loopj/android/http/ResponseHandlerInterface;)Lcom/loopj/android/http/RequestHandle;

    goto :goto_0
.end method

.method public get(Ljava/lang/String;Ljava/util/Map;ZLcom/heitao/platform/listener/HTPRequestListener;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;
    .param p3, "isAddPubPars"    # Z
    .param p4, "listener"    # Lcom/heitao/platform/listener/HTPRequestListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z",
            "Lcom/heitao/platform/listener/HTPRequestListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 29
    .local p2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-boolean p3, p0, Lcom/heitao/platform/request/HTPHttpRequest;->mIsAddPubPars:Z

    .line 30
    invoke-virtual {p0, p1, p2, p4}, Lcom/heitao/platform/request/HTPHttpRequest;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    .line 31
    return-void
.end method

.method protected onParse(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    .line 215
    const-string v0, "subclass_must_overwrite_parent"

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 216
    return-void
.end method

.method public post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/heitao/platform/listener/HTPRequestListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/heitao/platform/listener/HTPRequestListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 117
    .local p2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p3, p0, Lcom/heitao/platform/request/HTPHttpRequest;->mListener:Lcom/heitao/platform/listener/HTPRequestListener;

    .line 119
    invoke-static {p1}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 121
    const-string v1, "post_url_null"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 189
    :goto_0
    return-void

    .line 125
    :cond_0
    iget-object v1, p0, Lcom/heitao/platform/request/HTPHttpRequest;->mListener:Lcom/heitao/platform/listener/HTPRequestListener;

    if-nez v1, :cond_1

    .line 127
    const-string v1, "post_request_listener_null"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 130
    :cond_1
    iget-boolean v1, p0, Lcom/heitao/platform/request/HTPHttpRequest;->mIsAddPubPars:Z

    if-eqz v1, :cond_2

    .line 132
    invoke-direct {p0, p2}, Lcom/heitao/platform/request/HTPHttpRequest;->addPublicParameter(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p2

    .line 135
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "requestURL="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 136
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "map="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 138
    new-instance v0, Lcom/loopj/android/http/AsyncHttpClient;

    invoke-direct {v0}, Lcom/loopj/android/http/AsyncHttpClient;-><init>()V

    .line 139
    .local v0, "client":Lcom/loopj/android/http/AsyncHttpClient;
    const/16 v1, 0x2710

    invoke-virtual {v0, v1}, Lcom/loopj/android/http/AsyncHttpClient;->setTimeout(I)V

    .line 140
    new-instance v1, Lcom/loopj/android/http/RequestParams;

    invoke-direct {v1, p2}, Lcom/loopj/android/http/RequestParams;-><init>(Ljava/util/Map;)V

    new-instance v2, Lcom/heitao/platform/request/HTPHttpRequest$2;

    invoke-direct {v2, p0}, Lcom/heitao/platform/request/HTPHttpRequest$2;-><init>(Lcom/heitao/platform/request/HTPHttpRequest;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/loopj/android/http/AsyncHttpClient;->post(Ljava/lang/String;Lcom/loopj/android/http/RequestParams;Lcom/loopj/android/http/ResponseHandlerInterface;)Lcom/loopj/android/http/RequestHandle;

    goto :goto_0
.end method

.method public post(Ljava/lang/String;Ljava/util/Map;ZLcom/heitao/platform/listener/HTPRequestListener;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;
    .param p3, "isAddPubPars"    # Z
    .param p4, "listener"    # Lcom/heitao/platform/listener/HTPRequestListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z",
            "Lcom/heitao/platform/listener/HTPRequestListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 111
    .local p2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-boolean p3, p0, Lcom/heitao/platform/request/HTPHttpRequest;->mIsAddPubPars:Z

    .line 112
    invoke-virtual {p0, p1, p2, p4}, Lcom/heitao/platform/request/HTPHttpRequest;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    .line 113
    return-void
.end method
