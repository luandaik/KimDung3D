.class public Lcom/heitao/api/HTGameProxy;
.super Ljava/lang/Object;
.source "HTGameProxy.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static doAntiAddictionQuery()V
    .locals 1

    .prologue
    .line 400
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/channel/HTChannelDispatcher;->doAntiAddictionQuery()V

    .line 401
    return-void
.end method

.method public static doExit()V
    .locals 2

    .prologue
    .line 356
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/heitao/channel/HTChannelDispatcher;->doExit(Lcom/heitao/listener/HTExitListener;)V

    .line 357
    return-void
.end method

.method public static doExit(Lcom/heitao/listener/HTExitListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/heitao/listener/HTExitListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 184
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->doExit(Lcom/heitao/listener/HTExitListener;)V

    .line 185
    return-void
.end method

.method public static doLogin()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 332
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Lcom/heitao/channel/HTChannelDispatcher;->doLogin(Ljava/lang/String;Lcom/heitao/listener/HTLoginListener;)V

    .line 333
    return-void
.end method

.method public static doLogin(Ljava/util/Map;Lcom/heitao/listener/HTLoginListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/heitao/listener/HTLoginListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/heitao/listener/HTLoginListener;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 152
    .local p0, "customMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v1}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/heitao/channel/HTChannelDispatcher;->doLogin(Ljava/lang/String;Lcom/heitao/listener/HTLoginListener;)V

    .line 153
    return-void
.end method

.method public static doLogout(Ljava/util/Map;Lcom/heitao/listener/HTLogoutListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/heitao/listener/HTLogoutListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/heitao/listener/HTLogoutListener;",
            ")V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 163
    .local p0, "customMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v1}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/heitao/channel/HTChannelDispatcher;->doLogout(Ljava/lang/String;Lcom/heitao/listener/HTLogoutListener;)V

    .line 164
    return-void
.end method

.method public static doOpenWebView(Ljava/lang/String;)V
    .locals 1
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 384
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->doOpenWebView(Ljava/lang/String;)V

    .line 385
    return-void
.end method

.method public static doPay(Lcom/heitao/model/HTPayInfo;)V
    .locals 3
    .param p0, "payInfo"    # Lcom/heitao/model/HTPayInfo;

    .prologue
    const/4 v1, 0x0

    .line 348
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v2

    if-nez p0, :cond_0

    move-object v0, v1

    :goto_0
    invoke-virtual {v2, v0, v1}, Lcom/heitao/channel/HTChannelDispatcher;->doPay(Ljava/lang/String;Lcom/heitao/listener/HTPayListener;)V

    .line 349
    return-void

    .line 348
    :cond_0
    invoke-virtual {p0}, Lcom/heitao/model/HTPayInfo;->toEncodeString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static doPay(Lcom/heitao/model/HTPayInfo;Lcom/heitao/listener/HTPayListener;)V
    .locals 2
    .param p0, "payInfo"    # Lcom/heitao/model/HTPayInfo;
    .param p1, "listener"    # Lcom/heitao/listener/HTPayListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 174
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v1

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0, p1}, Lcom/heitao/channel/HTChannelDispatcher;->doPay(Ljava/lang/String;Lcom/heitao/listener/HTPayListener;)V

    .line 175
    return-void

    .line 174
    :cond_0
    invoke-virtual {p0}, Lcom/heitao/model/HTPayInfo;->toEncodeString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static doRealNameRegister()V
    .locals 1

    .prologue
    .line 392
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/channel/HTChannelDispatcher;->doRealNameRegister()V

    .line 393
    return-void
.end method

.method public static doSendData(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .param p0, "key"    # Ljava/lang/String;
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
    .line 235
    .local p1, "customMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/heitao/channel/HTChannelDispatcher;->doSendData(Ljava/lang/String;Ljava/util/Map;)V

    .line 236
    return-void
.end method

.method public static doSwitchAccount()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 340
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Lcom/heitao/channel/HTChannelDispatcher;->doLogout(Ljava/lang/String;Lcom/heitao/listener/HTLogoutListener;)V

    .line 341
    return-void
.end method

.method public static getChannelSDKVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/channel/HTChannelDispatcher;->getChannelSDKVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSDKVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    const-string v0, "1.1.2"

    return-object v0
.end method

.method public static init(Landroid/content/Context;Lcom/heitao/model/HTGameInfo;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "gameInfo"    # Lcom/heitao/model/HTGameInfo;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/heitao/api/HTGameProxy;->init(Landroid/content/Context;Lcom/heitao/model/HTGameInfo;Lcom/heitao/listener/HTProxyListener;)V

    .line 37
    return-void
.end method

.method public static init(Landroid/content/Context;Lcom/heitao/model/HTGameInfo;Lcom/heitao/listener/HTProxyListener;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "gameInfo"    # Lcom/heitao/model/HTGameInfo;
    .param p2, "listener"    # Lcom/heitao/listener/HTProxyListener;

    .prologue
    .line 317
    if-nez p1, :cond_0

    .line 319
    const-string v0, "\u521d\u59cb\u5316GameInfo\u4e3a\u7a7a"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 322
    :cond_0
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v0

    iput-object p0, v0, Lcom/heitao/common/HTDataCenter;->mContext:Landroid/content/Context;

    .line 323
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v0

    iput-object p1, v0, Lcom/heitao/common/HTDataCenter;->mGameInfo:Lcom/heitao/model/HTGameInfo;

    .line 324
    invoke-static {}, Lcom/heitao/common/HTOutListenerBridge;->getInstance()Lcom/heitao/common/HTOutListenerBridge;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/heitao/common/HTOutListenerBridge;->init(Lcom/heitao/listener/HTProxyListener;)V

    .line 325
    return-void
.end method

.method public static isLogined(Z)Z
    .locals 1
    .param p0, "doLoginWhenNotLogined"    # Z

    .prologue
    .line 202
    if-eqz p0, :cond_0

    .line 204
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/channel/HTChannelDispatcher;->onStartGame()Z

    move-result v0

    .line 207
    :goto_0
    return v0

    :cond_0
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/channel/HTChannelDispatcher;->isLogined()Z

    move-result v0

    goto :goto_0
.end method

.method public static onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p0, "requestCode"    # I
    .param p1, "resultCode"    # I
    .param p2, "data"    # Landroid/content/Intent;

    .prologue
    .line 124
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/heitao/channel/HTChannelDispatcher;->onActivityResult(IILandroid/content/Intent;)V

    .line 125
    return-void
.end method

.method public static onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p0, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 129
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 130
    return-void
.end method

.method public static onConfirmExit()V
    .locals 1

    .prologue
    .line 364
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/channel/HTChannelDispatcher;->onDestroy()V

    .line 365
    return-void
.end method

.method public static onCreate(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 89
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->onCreate(Landroid/content/Context;)V

    .line 90
    return-void
.end method

.method public static onDestroy()V
    .locals 1

    .prologue
    .line 114
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/channel/HTChannelDispatcher;->onDestroy()V

    .line 115
    return-void
.end method

.method public static onEnterGame(Ljava/util/Map;)V
    .locals 2
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
    .line 216
    .local p0, "customMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v1}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/heitao/channel/HTChannelDispatcher;->onEnterGame(Ljava/lang/String;)V

    .line 217
    return-void
.end method

.method public static onGameLevelChanged(I)V
    .locals 1
    .param p0, "newLevel"    # I

    .prologue
    .line 225
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->onGameLevelChanged(I)V

    .line 226
    return-void
.end method

.method public static onNewIntent(Landroid/content/Intent;)V
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 139
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->onNewIntent(Landroid/content/Intent;)V

    .line 140
    return-void
.end method

.method public static onPause()V
    .locals 1

    .prologue
    .line 94
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/channel/HTChannelDispatcher;->onPause()V

    .line 95
    return-void
.end method

.method public static onPlayerRoleNameChanged(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 1
    .param p0, "isCreate"    # Ljava/lang/Boolean;
    .param p1, "roleName"    # Ljava/lang/String;

    .prologue
    .line 375
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/heitao/channel/HTChannelDispatcher;->onPlayerRoleNameChanged(Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 376
    return-void
.end method

.method public static onRestart()V
    .locals 1

    .prologue
    .line 119
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/channel/HTChannelDispatcher;->onRestart()V

    .line 120
    return-void
.end method

.method public static onResume()V
    .locals 1

    .prologue
    .line 99
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/channel/HTChannelDispatcher;->onResume()V

    .line 100
    return-void
.end method

.method public static onStart()V
    .locals 1

    .prologue
    .line 104
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/channel/HTChannelDispatcher;->onStart()V

    .line 105
    return-void
.end method

.method public static onStartGame()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 193
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/channel/HTChannelDispatcher;->onStartGame()Z

    move-result v0

    return v0
.end method

.method public static onStop()V
    .locals 1

    .prologue
    .line 109
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/channel/HTChannelDispatcher;->onStop()V

    .line 110
    return-void
.end method

.method public static onWindowFocusChanged(Z)V
    .locals 1
    .param p0, "hasFocus"    # Z

    .prologue
    .line 134
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->onWindowFocusChanged(Z)V

    .line 135
    return-void
.end method

.method public static setAntiAddictionListener(Lcom/heitao/listener/HTAntiAddictionListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/heitao/listener/HTAntiAddictionListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 305
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->setAntiAddictionListener(Lcom/heitao/listener/HTAntiAddictionListener;)V

    .line 306
    return-void
.end method

.method public static setAppUpdateListener(Lcom/heitao/listener/HTAppUpdateListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/heitao/listener/HTAppUpdateListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 285
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v0

    iput-object p0, v0, Lcom/heitao/common/HTDataCenter;->mAppUpdateListener:Lcom/heitao/listener/HTAppUpdateListener;

    .line 286
    return-void
.end method

.method public static setDebugEnable(Z)V
    .locals 0
    .param p0, "enable"    # Z

    .prologue
    .line 73
    sput-boolean p0, Lcom/heitao/common/HTConsts;->HTSDK_DEBUG:Z

    .line 74
    return-void
.end method

.method public static setExitListener(Lcom/heitao/listener/HTExitListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/heitao/listener/HTExitListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 275
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->setExitListener(Lcom/heitao/listener/HTExitListener;)V

    .line 276
    return-void
.end method

.method public static setLogEnable(Z)V
    .locals 0
    .param p0, "enable"    # Z

    .prologue
    .line 82
    sput-boolean p0, Lcom/heitao/common/HTLog;->mLogEnable:Z

    .line 83
    return-void
.end method

.method public static setLogoinListener(Lcom/heitao/listener/HTLoginListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/heitao/listener/HTLoginListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 245
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->setLogoinListener(Lcom/heitao/listener/HTLoginListener;)V

    .line 246
    return-void
.end method

.method public static setLogoutListener(Lcom/heitao/listener/HTLogoutListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/heitao/listener/HTLogoutListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 255
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->setLogoutListener(Lcom/heitao/listener/HTLogoutListener;)V

    .line 256
    return-void
.end method

.method public static setPayListener(Lcom/heitao/listener/HTPayListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/heitao/listener/HTPayListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 265
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->setPayListener(Lcom/heitao/listener/HTPayListener;)V

    .line 266
    return-void
.end method

.method public static setShowFunctionMenu(Z)V
    .locals 1
    .param p0, "show"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 46
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/heitao/channel/HTChannelDispatcher;->setShowFunctionMenu(Z)V

    .line 47
    return-void
.end method

.method public static setWeiXinListener(Lcom/heitao/listener/HTWeiXinListener;)V
    .locals 1
    .param p0, "listener"    # Lcom/heitao/listener/HTWeiXinListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 295
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v0

    iput-object p0, v0, Lcom/heitao/common/HTDataCenter;->mWeiXinListener:Lcom/heitao/listener/HTWeiXinListener;

    .line 296
    return-void
.end method
