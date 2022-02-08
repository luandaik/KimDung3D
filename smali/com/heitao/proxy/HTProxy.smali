.class public Lcom/heitao/proxy/HTProxy;
.super Ljava/lang/Object;
.source "HTProxy.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native doNativeCustomPay(Ljava/lang/String;)V
.end method

.method public static native doNativeGameExit()V
.end method

.method public static native doNativeLoginCompleted(Ljava/lang/String;)V
.end method

.method public static native doNativeLoginFailed(Ljava/lang/String;)V
.end method

.method public static native doNativeLogoutCompleted(Ljava/lang/String;)V
.end method

.method public static native doNativeLogoutFailed(Ljava/lang/String;)V
.end method

.method public static native doNativePayCompleted(Ljava/lang/String;)V
.end method

.method public static native doNativePayFailed(Ljava/lang/String;)V
.end method

.method public static native doNativeThirdPartyExit()V
.end method

.method public static doProxyExit()V
    .locals 2

    .prologue
    .line 36
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/heitao/channel/HTChannelDispatcher;->doExit(Lcom/heitao/listener/HTExitListener;)V

    .line 37
    return-void
.end method

.method public static doProxyLogin(Ljava/lang/String;)V
    .locals 2
    .param p0, "customParameters"    # Ljava/lang/String;

    .prologue
    .line 12
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/heitao/channel/HTChannelDispatcher;->doLogin(Ljava/lang/String;Lcom/heitao/listener/HTLoginListener;)V

    .line 13
    return-void
.end method

.method public static doProxyLogout(Ljava/lang/String;)V
    .locals 2
    .param p0, "customParameters"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/heitao/channel/HTChannelDispatcher;->doLogout(Ljava/lang/String;Lcom/heitao/listener/HTLogoutListener;)V

    .line 21
    return-void
.end method

.method public static doProxyPay(Ljava/lang/String;)V
    .locals 2
    .param p0, "customParameters"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/heitao/channel/HTChannelDispatcher;->doPay(Ljava/lang/String;Lcom/heitao/listener/HTPayListener;)V

    .line 29
    return-void
.end method

.method public static onProxyEnterGame(Ljava/lang/String;)V
    .locals 1
    .param p0, "infos"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->onEnterGame(Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public static onProxyGameLevelChanged(I)V
    .locals 1
    .param p0, "newLevel"    # I

    .prologue
    .line 60
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->onGameLevelChanged(I)V

    .line 61
    return-void
.end method

.method public static onProxyStartGame()Z
    .locals 1

    .prologue
    .line 44
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/channel/HTChannelDispatcher;->onStartGame()Z

    move-result v0

    return v0
.end method
