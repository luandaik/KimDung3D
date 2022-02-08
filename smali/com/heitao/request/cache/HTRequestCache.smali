.class public Lcom/heitao/request/cache/HTRequestCache;
.super Lcom/heitao/model/HTBaseEntity;
.source "HTRequestCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/request/cache/HTRequestCache$1;,
        Lcom/heitao/request/cache/HTRequestCache$HttpMode;
    }
.end annotation


# instance fields
.field private httpMode:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

.field private params:Ljava/util/Map;
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

.field private reqId:Ljava/lang/String;

.field private retryCount:I

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/heitao/model/HTBaseEntity;-><init>()V

    .line 10
    return-void
.end method

.method public static httpModeToInt(Lcom/heitao/request/cache/HTRequestCache$HttpMode;)I
    .locals 3
    .param p0, "httpMode"    # Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    .prologue
    .line 82
    const/4 v0, 0x0

    .line 83
    .local v0, "ret":I
    sget-object v1, Lcom/heitao/request/cache/HTRequestCache$1;->$SwitchMap$com$heitao$request$cache$HTRequestCache$HttpMode:[I

    invoke-virtual {p0}, Lcom/heitao/request/cache/HTRequestCache$HttpMode;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 90
    :goto_0
    return v0

    .line 85
    :pswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 86
    :pswitch_1
    const/4 v0, 0x2

    goto :goto_0

    .line 83
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static intToHttpMode(I)Lcom/heitao/request/cache/HTRequestCache$HttpMode;
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 69
    sget-object v0, Lcom/heitao/request/cache/HTRequestCache$HttpMode;->None:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    .line 70
    .local v0, "ret":Lcom/heitao/request/cache/HTRequestCache$HttpMode;
    packed-switch p0, :pswitch_data_0

    .line 77
    :goto_0
    return-object v0

    .line 72
    :pswitch_0
    sget-object v0, Lcom/heitao/request/cache/HTRequestCache$HttpMode;->Get:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    goto :goto_0

    .line 73
    :pswitch_1
    sget-object v0, Lcom/heitao/request/cache/HTRequestCache$HttpMode;->Post:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    goto :goto_0

    .line 70
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public getHttpMode()Lcom/heitao/request/cache/HTRequestCache$HttpMode;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/heitao/request/cache/HTRequestCache;->httpMode:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    return-object v0
.end method

.method public getParams()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Lcom/heitao/request/cache/HTRequestCache;->params:Ljava/util/Map;

    return-object v0
.end method

.method protected getPropertiesMap()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 96
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 97
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "reqId"

    invoke-virtual {p0}, Lcom/heitao/request/cache/HTRequestCache;->getReqId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    const-string v1, "url"

    invoke-virtual {p0}, Lcom/heitao/request/cache/HTRequestCache;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    const-string v2, "params"

    invoke-virtual {p0}, Lcom/heitao/request/cache/HTRequestCache;->getParams()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/heitao/request/cache/HTRequestCache;->getParams()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    const-string v2, "httpMode"

    invoke-virtual {p0}, Lcom/heitao/request/cache/HTRequestCache;->getHttpMode()Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    move-result-object v1

    sget-object v3, Lcom/heitao/request/cache/HTRequestCache$HttpMode;->Get:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    if-ne v1, v3, :cond_1

    const-string v1, "Get"

    :goto_1
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    const-string v1, "retryCount"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/heitao/request/cache/HTRequestCache;->getRetryCount()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    return-object v0

    .line 99
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 100
    :cond_1
    const-string v1, "Post"

    goto :goto_1
.end method

.method public getReqId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/heitao/request/cache/HTRequestCache;->reqId:Ljava/lang/String;

    return-object v0
.end method

.method public getRetryCount()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lcom/heitao/request/cache/HTRequestCache;->retryCount:I

    return v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/heitao/request/cache/HTRequestCache;->url:Ljava/lang/String;

    return-object v0
.end method

.method public setHttpMode(Lcom/heitao/request/cache/HTRequestCache$HttpMode;)V
    .locals 0
    .param p1, "httpMode"    # Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/heitao/request/cache/HTRequestCache;->httpMode:Lcom/heitao/request/cache/HTRequestCache$HttpMode;

    .line 55
    return-void
.end method

.method public setParams(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 44
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/heitao/request/cache/HTRequestCache;->params:Ljava/util/Map;

    .line 45
    return-void
.end method

.method public setReqId(Ljava/lang/String;)V
    .locals 0
    .param p1, "reqId"    # Ljava/lang/String;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/heitao/request/cache/HTRequestCache;->reqId:Ljava/lang/String;

    .line 25
    return-void
.end method

.method public setRetryCount(I)V
    .locals 0
    .param p1, "retryCount"    # I

    .prologue
    .line 64
    iput p1, p0, Lcom/heitao/request/cache/HTRequestCache;->retryCount:I

    .line 65
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/heitao/request/cache/HTRequestCache;->url:Ljava/lang/String;

    .line 35
    return-void
.end method
