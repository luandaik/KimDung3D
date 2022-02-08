.class public Lcom/heitao/request/HTRequest;
.super Lcom/heitao/request/HTBaseRequest;
.source "HTRequest.java"


# instance fields
.field private isAddPubPars:Z

.field private isShowProgressDialog:Z

.field private mRequestListener:Lcom/heitao/listener/HTRequestListener;

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

.field private progressDialogText:Ljava/lang/String;

.field private requestURL:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 12
    invoke-direct {p0}, Lcom/heitao/request/HTBaseRequest;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/heitao/request/HTRequest;->mRequestListener:Lcom/heitao/listener/HTRequestListener;

    .line 15
    iput-boolean v1, p0, Lcom/heitao/request/HTRequest;->isAddPubPars:Z

    .line 16
    iput-boolean v1, p0, Lcom/heitao/request/HTRequest;->isShowProgressDialog:Z

    .line 17
    const-string v0, "\u8bf7\u6c42\u4e2d\u00b7\u00b7\u00b7"

    iput-object v0, p0, Lcom/heitao/request/HTRequest;->progressDialogText:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/heitao/request/HTRequest;)Lcom/heitao/listener/HTRequestListener;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/request/HTRequest;

    .prologue
    .line 12
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->mRequestListener:Lcom/heitao/listener/HTRequestListener;

    return-object v0
.end method


# virtual methods
.method public get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/listener/HTRequestListener;)V
    .locals 1
    .param p1, "urlPath"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/heitao/listener/HTRequestListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/heitao/listener/HTRequestListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 63
    .local p2, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/heitao/request/HTRequest;->isAddPubPars()Z

    move-result v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/heitao/request/HTRequest;->get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/listener/HTRequestListener;Z)V

    .line 64
    return-void
.end method

.method public get(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/listener/HTRequestListener;Z)V
    .locals 4
    .param p1, "urlPath"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/heitao/listener/HTRequestListener;
    .param p4, "isAddPubPars"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/heitao/listener/HTRequestListener;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p2, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 70
    const-string v1, "\u8bf7\u6c42Path\u4e3a\u7a7a"

    invoke-static {v1}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 72
    iget-object v1, p0, Lcom/heitao/request/HTRequest;->mRequestListener:Lcom/heitao/listener/HTRequestListener;

    if-eqz v1, :cond_0

    .line 74
    iget-object v1, p0, Lcom/heitao/request/HTRequest;->mRequestListener:Lcom/heitao/listener/HTRequestListener;

    new-instance v2, Ljava/lang/Throwable;

    const-string v3, "\u8bf7\u6c42Path\u4e3a\u7a7a"

    invoke-direct {v2, v3}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/heitao/listener/HTRequestListener;->onFailure(Ljava/lang/Throwable;)V

    .line 84
    :cond_0
    :goto_0
    return-void

    .line 80
    :cond_1
    invoke-virtual {p0, p4}, Lcom/heitao/request/HTRequest;->setAddPubPars(Z)V

    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http://smi.heitao.com/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v2

    iget-object v2, v2, Lcom/heitao/common/HTDataCenter;->mGameInfo:Lcom/heitao/model/HTGameInfo;

    iget-object v2, v2, Lcom/heitao/model/HTGameInfo;->shortName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v2

    invoke-virtual {v2}, Lcom/heitao/channel/HTChannelDispatcher;->getChannelKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 83
    .local v0, "requestUrl":Ljava/lang/String;
    invoke-virtual {p0, v0, p2, p3}, Lcom/heitao/request/HTRequest;->getWithURL(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/listener/HTRequestListener;)V

    goto :goto_0
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
    .line 58
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->params:Ljava/util/Map;

    return-object v0
.end method

.method public getProgressDialogText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->progressDialogText:Ljava/lang/String;

    return-object v0
.end method

.method public getRequestURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->requestURL:Ljava/lang/String;

    return-object v0
.end method

.method public getWithURL(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/listener/HTRequestListener;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/heitao/listener/HTRequestListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/heitao/listener/HTRequestListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 88
    .local p2, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p3, p0, Lcom/heitao/request/HTRequest;->mRequestListener:Lcom/heitao/listener/HTRequestListener;

    .line 89
    iput-object p1, p0, Lcom/heitao/request/HTRequest;->requestURL:Ljava/lang/String;

    .line 90
    iput-object p2, p0, Lcom/heitao/request/HTRequest;->params:Ljava/util/Map;

    .line 92
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->mRequestListener:Lcom/heitao/listener/HTRequestListener;

    if-nez v0, :cond_0

    .line 94
    const-string v0, "\u8bf7\u6c42\u76d1\u542c\u4e3a\u7a7a"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->requestURL:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 99
    const-string v0, "\u8bf7\u6c42url\u4e3a\u7a7a"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 101
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->mRequestListener:Lcom/heitao/listener/HTRequestListener;

    if-eqz v0, :cond_1

    .line 103
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->mRequestListener:Lcom/heitao/listener/HTRequestListener;

    new-instance v1, Ljava/lang/Throwable;

    const-string v2, "\u8bf7\u6c42url\u4e3a\u7a7a"

    invoke-direct {v1, v2}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/heitao/listener/HTRequestListener;->onFailure(Ljava/lang/Throwable;)V

    .line 159
    :cond_1
    :goto_0
    return-void

    .line 109
    :cond_2
    invoke-virtual {p0}, Lcom/heitao/request/HTRequest;->isShowProgressDialog()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 111
    invoke-virtual {p0}, Lcom/heitao/request/HTRequest;->getProgressDialogText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/heitao/request/HTRequest;->doShowProgressDialog(Ljava/lang/String;)V

    .line 114
    :cond_3
    invoke-virtual {p0}, Lcom/heitao/request/HTRequest;->isAddPubPars()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 117
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->params:Ljava/util/Map;

    invoke-virtual {p0, v0}, Lcom/heitao/request/HTRequest;->addPublicParsMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/request/HTRequest;->params:Ljava/util/Map;

    .line 120
    :cond_4
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->params:Ljava/util/Map;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/heitao/request/HTRequest;->params:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 122
    :cond_5
    const-string v0, "\u8bf7\u6c42\u53c2\u6570\u4e3a\u7a7a"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    .line 129
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5f00\u59cb\u8bf7\u6c42\uff0crequestUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/request/HTRequest;->requestURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 131
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->requestURL:Ljava/lang/String;

    new-instance v1, Lcom/heitao/request/HTRequest$1;

    invoke-direct {v1, p0}, Lcom/heitao/request/HTRequest$1;-><init>(Lcom/heitao/request/HTRequest;)V

    invoke-virtual {p0, v0, v1}, Lcom/heitao/request/HTRequest;->get(Ljava/lang/String;Lcom/heitao/listener/HTRequestListener;)V

    goto :goto_0

    .line 126
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/heitao/request/HTRequest;->requestURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/request/HTRequest;->params:Ljava/util/Map;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/request/HTRequest;->requestURL:Ljava/lang/String;

    goto :goto_1
.end method

.method public isAddPubPars()Z
    .locals 1

    .prologue
    .line 23
    iget-boolean v0, p0, Lcom/heitao/request/HTRequest;->isAddPubPars:Z

    return v0
.end method

.method public isShowProgressDialog()Z
    .locals 1

    .prologue
    .line 33
    iget-boolean v0, p0, Lcom/heitao/request/HTRequest;->isShowProgressDialog:Z

    return v0
.end method

.method public postWithPath(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/listener/HTRequestListener;)V
    .locals 4
    .param p1, "urlPath"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/heitao/listener/HTRequestListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/heitao/listener/HTRequestListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 163
    .local p2, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 165
    const-string v1, "\u8bf7\u6c42Path\u4e3a\u7a7a"

    invoke-static {v1}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 167
    iget-object v1, p0, Lcom/heitao/request/HTRequest;->mRequestListener:Lcom/heitao/listener/HTRequestListener;

    if-eqz v1, :cond_0

    .line 169
    iget-object v1, p0, Lcom/heitao/request/HTRequest;->mRequestListener:Lcom/heitao/listener/HTRequestListener;

    new-instance v2, Ljava/lang/Throwable;

    const-string v3, "\u8bf7\u6c42Path\u4e3a\u7a7a"

    invoke-direct {v2, v3}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/heitao/listener/HTRequestListener;->onFailure(Ljava/lang/Throwable;)V

    .line 177
    :cond_0
    :goto_0
    return-void

    .line 175
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http://smi.heitao.com/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v2

    iget-object v2, v2, Lcom/heitao/common/HTDataCenter;->mGameInfo:Lcom/heitao/model/HTGameInfo;

    iget-object v2, v2, Lcom/heitao/model/HTGameInfo;->shortName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v2

    invoke-virtual {v2}, Lcom/heitao/channel/HTChannelDispatcher;->getChannelKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 176
    .local v0, "requestUrl":Ljava/lang/String;
    invoke-virtual {p0, v0, p2, p3}, Lcom/heitao/request/HTRequest;->postWithURL(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/listener/HTRequestListener;)V

    goto :goto_0
.end method

.method public postWithURL(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/listener/HTRequestListener;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/heitao/listener/HTRequestListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/heitao/listener/HTRequestListener;",
            ")V"
        }
    .end annotation

    .prologue
    .line 181
    .local p2, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p3, p0, Lcom/heitao/request/HTRequest;->mRequestListener:Lcom/heitao/listener/HTRequestListener;

    .line 182
    iput-object p1, p0, Lcom/heitao/request/HTRequest;->requestURL:Ljava/lang/String;

    .line 183
    iput-object p2, p0, Lcom/heitao/request/HTRequest;->params:Ljava/util/Map;

    .line 185
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->mRequestListener:Lcom/heitao/listener/HTRequestListener;

    if-nez v0, :cond_0

    .line 187
    const-string v0, "\u8bf7\u6c42\u76d1\u542c\u4e3a\u7a7a"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    .line 190
    :cond_0
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->requestURL:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 192
    const-string v0, "\u8bf7\u6c42url\u4e3a\u7a7a"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 194
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->mRequestListener:Lcom/heitao/listener/HTRequestListener;

    if-eqz v0, :cond_1

    .line 196
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->mRequestListener:Lcom/heitao/listener/HTRequestListener;

    new-instance v1, Ljava/lang/Throwable;

    const-string v2, "\u8bf7\u6c42url\u4e3a\u7a7a"

    invoke-direct {v1, v2}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/heitao/listener/HTRequestListener;->onFailure(Ljava/lang/Throwable;)V

    .line 248
    :cond_1
    :goto_0
    return-void

    .line 202
    :cond_2
    invoke-virtual {p0}, Lcom/heitao/request/HTRequest;->isShowProgressDialog()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 204
    invoke-virtual {p0}, Lcom/heitao/request/HTRequest;->getProgressDialogText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/heitao/request/HTRequest;->doShowProgressDialog(Ljava/lang/String;)V

    .line 207
    :cond_3
    invoke-virtual {p0}, Lcom/heitao/request/HTRequest;->isAddPubPars()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 210
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->params:Ljava/util/Map;

    invoke-virtual {p0, v0}, Lcom/heitao/request/HTRequest;->addPublicParsMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/request/HTRequest;->params:Ljava/util/Map;

    .line 213
    :cond_4
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->params:Ljava/util/Map;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/heitao/request/HTRequest;->params:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 215
    :cond_5
    const-string v0, "\u8bf7\u6c42\u53c2\u6570\u4e3a\u7a7a"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    .line 218
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u5f00\u59cb\u8bf7\u6c42\uff0crequestUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nparams="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/heitao/request/HTRequest;->params:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/common/HTLog;->d(Ljava/lang/String;)V

    .line 220
    iget-object v0, p0, Lcom/heitao/request/HTRequest;->requestURL:Ljava/lang/String;

    iget-object v1, p0, Lcom/heitao/request/HTRequest;->params:Ljava/util/Map;

    new-instance v2, Lcom/heitao/request/HTRequest$2;

    invoke-direct {v2, p0}, Lcom/heitao/request/HTRequest$2;-><init>(Lcom/heitao/request/HTRequest;)V

    invoke-virtual {p0, v0, v1, v2}, Lcom/heitao/request/HTRequest;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/listener/HTRequestListener;)V

    goto :goto_0
.end method

.method public setAddPubPars(Z)V
    .locals 0
    .param p1, "isAddPubPars"    # Z

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/heitao/request/HTRequest;->isAddPubPars:Z

    .line 29
    return-void
.end method

.method public setProgressDialogText(Ljava/lang/String;)V
    .locals 0
    .param p1, "progressDialogText"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/heitao/request/HTRequest;->progressDialogText:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public setShowProgressDialog(Z)V
    .locals 0
    .param p1, "isShowProgressDialog"    # Z

    .prologue
    .line 38
    iput-boolean p1, p0, Lcom/heitao/request/HTRequest;->isShowProgressDialog:Z

    .line 39
    return-void
.end method
