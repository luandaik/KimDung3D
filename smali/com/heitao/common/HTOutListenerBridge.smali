.class public Lcom/heitao/common/HTOutListenerBridge;
.super Ljava/lang/Object;
.source "HTOutListenerBridge.java"

# interfaces
.implements Lcom/heitao/listener/HTLoginListener;
.implements Lcom/heitao/listener/HTLogoutListener;
.implements Lcom/heitao/listener/HTPayListener;
.implements Lcom/heitao/listener/HTExitListener;
.implements Lcom/heitao/listener/HTWeiXinListener;
.implements Lcom/heitao/listener/HTAppUpdateListener;
.implements Lcom/heitao/listener/HTAntiAddictionListener;
.implements Lcom/heitao/listener/HTRealNameRegisterListener;


# static fields
.field private static mInstance:Lcom/heitao/common/HTOutListenerBridge;


# instance fields
.field public mProxyListener:Lcom/heitao/listener/HTProxyListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/common/HTOutListenerBridge;->mInstance:Lcom/heitao/common/HTOutListenerBridge;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    return-void
.end method

.method public static getInstance()Lcom/heitao/common/HTOutListenerBridge;
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lcom/heitao/common/HTOutListenerBridge;->mInstance:Lcom/heitao/common/HTOutListenerBridge;

    if-nez v0, :cond_0

    .line 40
    new-instance v0, Lcom/heitao/common/HTOutListenerBridge;

    invoke-direct {v0}, Lcom/heitao/common/HTOutListenerBridge;-><init>()V

    sput-object v0, Lcom/heitao/common/HTOutListenerBridge;->mInstance:Lcom/heitao/common/HTOutListenerBridge;

    .line 42
    :cond_0
    sget-object v0, Lcom/heitao/common/HTOutListenerBridge;->mInstance:Lcom/heitao/common/HTOutListenerBridge;

    return-object v0
.end method


# virtual methods
.method public init(Lcom/heitao/listener/HTProxyListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/heitao/listener/HTProxyListener;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    .line 49
    iget-object v0, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    if-eqz v0, :cond_0

    .line 51
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->setLogoinListener(Lcom/heitao/listener/HTLoginListener;)V

    .line 52
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->setLogoutListener(Lcom/heitao/listener/HTLogoutListener;)V

    .line 53
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->setPayListener(Lcom/heitao/listener/HTPayListener;)V

    .line 54
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->setExitListener(Lcom/heitao/listener/HTExitListener;)V

    .line 55
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->setAntiAddictionListener(Lcom/heitao/listener/HTAntiAddictionListener;)V

    .line 56
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->setRealNameRegisterListener(Lcom/heitao/listener/HTRealNameRegisterListener;)V

    .line 58
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v0

    iput-object p0, v0, Lcom/heitao/common/HTDataCenter;->mAppUpdateListener:Lcom/heitao/listener/HTAppUpdateListener;

    .line 59
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v0

    iput-object p0, v0, Lcom/heitao/common/HTDataCenter;->mWeiXinListener:Lcom/heitao/listener/HTWeiXinListener;

    .line 65
    :goto_0
    return-void

    .line 63
    :cond_0
    const-string v0, "\u672a\u8bbe\u7f6eProxy\u76d1\u542c\uff0c1.1.0\u7248\u672c\u4ee5\u4e0a\u5efa\u8bae\u8bbe\u7f6e"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onHTAntiAddictionQueryCompleted(I)V
    .locals 3
    .param p1, "result"    # I

    .prologue
    .line 146
    iget-object v0, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    const/16 v1, 0x46

    new-instance v2, Lcom/heitao/model/HTAntiAddiction;

    invoke-direct {v2, p1}, Lcom/heitao/model/HTAntiAddiction;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/heitao/listener/HTProxyListener;->onCallBack(ILcom/heitao/model/HTBaseEntity;)V

    .line 147
    return-void
.end method

.method public onHTAppUpdate(Lcom/heitao/model/HTAppUpdateInfo;)V
    .locals 2
    .param p1, "appUpdateInfo"    # Lcom/heitao/model/HTAppUpdateInfo;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    const/16 v1, 0x32

    invoke-virtual {v0, v1, p1}, Lcom/heitao/listener/HTProxyListener;->onCallBack(ILcom/heitao/model/HTBaseEntity;)V

    .line 72
    return-void
.end method

.method public onHTGameExit()V
    .locals 3

    .prologue
    .line 97
    iget-object v0, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    const/16 v1, 0x29

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/heitao/listener/HTProxyListener;->onCallBack(ILcom/heitao/model/HTBaseEntity;)V

    .line 98
    return-void
.end method

.method public onHTLoginCompleted(Lcom/heitao/model/HTUser;Ljava/util/Map;)V
    .locals 2
    .param p1, "user"    # Lcom/heitao/model/HTUser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/heitao/model/HTUser;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 139
    .local p2, "customParsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    const/16 v1, 0xa

    invoke-virtual {v0, v1, p1}, Lcom/heitao/listener/HTProxyListener;->onCallBack(ILcom/heitao/model/HTBaseEntity;)V

    .line 140
    return-void
.end method

.method public onHTLoginFailed(Lcom/heitao/model/HTError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 132
    iget-object v0, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    const/16 v1, 0xb

    invoke-virtual {v0, v1, p1}, Lcom/heitao/listener/HTProxyListener;->onCallBack(ILcom/heitao/model/HTBaseEntity;)V

    .line 133
    return-void
.end method

.method public onHTLogoutCompleted(Lcom/heitao/model/HTUser;Ljava/util/Map;)V
    .locals 3
    .param p1, "user"    # Lcom/heitao/model/HTUser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/heitao/model/HTUser;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 125
    .local p2, "customParsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    const/16 v1, 0x14

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/heitao/listener/HTProxyListener;->onCallBack(ILcom/heitao/model/HTBaseEntity;)V

    .line 126
    return-void
.end method

.method public onHTLogoutFailed(Lcom/heitao/model/HTError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    const/16 v1, 0x15

    invoke-virtual {v0, v1, p1}, Lcom/heitao/listener/HTProxyListener;->onCallBack(ILcom/heitao/model/HTBaseEntity;)V

    .line 119
    return-void
.end method

.method public onHTPayCompleted(Lcom/heitao/model/HTPayResult;)V
    .locals 2
    .param p1, "result"    # Lcom/heitao/model/HTPayResult;

    .prologue
    .line 111
    iget-object v0, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    const/16 v1, 0x1e

    invoke-virtual {v0, v1, p1}, Lcom/heitao/listener/HTProxyListener;->onCallBack(ILcom/heitao/model/HTBaseEntity;)V

    .line 112
    return-void
.end method

.method public onHTPayFailed(Lcom/heitao/model/HTError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 104
    iget-object v0, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    const/16 v1, 0x1f

    invoke-virtual {v0, v1, p1}, Lcom/heitao/listener/HTProxyListener;->onCallBack(ILcom/heitao/model/HTBaseEntity;)V

    .line 105
    return-void
.end method

.method public onHTRealNameRegisterComplete(I)V
    .locals 3
    .param p1, "result"    # I

    .prologue
    .line 153
    iget-object v0, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    const/16 v1, 0x50

    new-instance v2, Lcom/heitao/model/HTRealNameRegister;

    invoke-direct {v2, p1}, Lcom/heitao/model/HTRealNameRegister;-><init>(I)V

    invoke-virtual {v0, v1, v2}, Lcom/heitao/listener/HTProxyListener;->onCallBack(ILcom/heitao/model/HTBaseEntity;)V

    .line 154
    return-void
.end method

.method public onHTThirdPartyExit()V
    .locals 3

    .prologue
    .line 90
    iget-object v0, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    const/16 v1, 0x28

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/heitao/listener/HTProxyListener;->onCallBack(ILcom/heitao/model/HTBaseEntity;)V

    .line 91
    return-void
.end method

.method public onHTWeiXinBindQueryCompleted(ZLjava/lang/String;Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "isBind"    # Z
    .param p2, "weixinID"    # Ljava/lang/String;
    .param p3, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    .line 78
    new-instance v0, Lcom/heitao/model/HTWXBindInfo;

    invoke-direct {v0}, Lcom/heitao/model/HTWXBindInfo;-><init>()V

    .line 79
    .local v0, "info":Lcom/heitao/model/HTWXBindInfo;
    iput-boolean p1, v0, Lcom/heitao/model/HTWXBindInfo;->isBind:Z

    .line 80
    iput-object p2, v0, Lcom/heitao/model/HTWXBindInfo;->weixinID:Ljava/lang/String;

    .line 81
    iput-object p3, v0, Lcom/heitao/model/HTWXBindInfo;->extend:Lorg/json/JSONObject;

    .line 83
    iget-object v1, p0, Lcom/heitao/common/HTOutListenerBridge;->mProxyListener:Lcom/heitao/listener/HTProxyListener;

    const/16 v2, 0x3c

    invoke-virtual {v1, v2, v0}, Lcom/heitao/listener/HTProxyListener;->onCallBack(ILcom/heitao/model/HTBaseEntity;)V

    .line 84
    return-void
.end method
