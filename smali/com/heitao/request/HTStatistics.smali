.class public Lcom/heitao/request/HTStatistics;
.super Lcom/heitao/request/HTBaseRequest;
.source "HTStatistics.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/heitao/request/HTBaseRequest;-><init>()V

    return-void
.end method


# virtual methods
.method public doSendData(Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p2, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "http://smi.heitao.com/"

    .line 103
    .local v0, "baseUrl":Ljava/lang/String;
    invoke-static {v0}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 105
    const-string v2, "\u8bf7\u5148\u8bbe\u7f6eSDK\u8bf7\u6c42URL"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 164
    :goto_0
    return-void

    .line 109
    :cond_0
    invoke-static {p1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 111
    const-string v2, "\u53d1\u9001\u6570\u636eKey\u4e3a\u7a7a"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 115
    :cond_1
    if-eqz p2, :cond_2

    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 117
    :cond_2
    const-string v2, "\u53d1\u9001\u6570\u636e\u4e3a\u7a7a"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    .line 121
    :cond_3
    invoke-virtual {p0, p2}, Lcom/heitao/request/HTStatistics;->addPublicParsMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p2

    .line 123
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v3

    iget-object v3, v3, Lcom/heitao/common/HTDataCenter;->mGameInfo:Lcom/heitao/model/HTGameInfo;

    iget-object v3, v3, Lcom/heitao/model/HTGameInfo;->shortName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v3

    invoke-virtual {v3}, Lcom/heitao/channel/HTChannelDispatcher;->getChannelKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 124
    .local v1, "requestUrl":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {p2, v3}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 125
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u53d1\u9001\u6570\u636e\u5f00\u59cb\u8bf7\u6c42\uff0crequestUrl="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 128
    new-instance v2, Lcom/heitao/request/HTStatistics$2;

    invoke-direct {v2, p0}, Lcom/heitao/request/HTStatistics$2;-><init>(Lcom/heitao/request/HTStatistics;)V

    invoke-virtual {p0, v1, v2}, Lcom/heitao/request/HTStatistics;->get(Ljava/lang/String;Lcom/heitao/listener/HTRequestListener;)V

    goto/16 :goto_0
.end method

.method public doStatisticsRoleInfo(Ljava/util/Map;)V
    .locals 4
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
    .line 22
    .local p1, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "http://smi.heitao.com/"

    .line 23
    .local v0, "baseUrl":Ljava/lang/String;
    invoke-static {v0}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 25
    const-string v2, "\u8bf7\u5148\u8bbe\u7f6eSDK\u8bf7\u6c42URL"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 93
    :goto_0
    return-void

    .line 29
    :cond_0
    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 31
    :cond_1
    const-string v2, "\u7edf\u8ba1\u89d2\u8272\u4fe1\u606f\u53c2\u6570\u4e3a\u7a7a"

    invoke-static {v2}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    goto :goto_0

    .line 36
    :cond_2
    invoke-virtual {p0, p1}, Lcom/heitao/request/HTStatistics;->addPublicParsMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 38
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v3

    iget-object v3, v3, Lcom/heitao/common/HTDataCenter;->mGameInfo:Lcom/heitao/model/HTGameInfo;

    iget-object v3, v3, Lcom/heitao/model/HTGameInfo;->shortName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/role/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v3

    invoke-virtual {v3}, Lcom/heitao/channel/HTChannelDispatcher;->getChannelKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 39
    .local v1, "requestUrl":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {p1, v3}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 40
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u7edf\u8ba1\u89d2\u8272\u4fe1\u606f\u5f00\u59cb\u8bf7\u6c42\uff0crequestUrl="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 43
    new-instance v2, Lcom/heitao/request/HTStatistics$1;

    invoke-direct {v2, p0}, Lcom/heitao/request/HTStatistics$1;-><init>(Lcom/heitao/request/HTStatistics;)V

    invoke-virtual {p0, v1, v2}, Lcom/heitao/request/HTStatistics;->get(Ljava/lang/String;Lcom/heitao/listener/HTRequestListener;)V

    goto :goto_0
.end method
