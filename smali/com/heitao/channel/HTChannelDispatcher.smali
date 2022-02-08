.class public Lcom/heitao/channel/HTChannelDispatcher;
.super Ljava/lang/Object;
.source "HTChannelDispatcher.java"


# static fields
.field private static mInstance:Lcom/heitao/channel/HTChannelDispatcher;


# instance fields
.field protected mChannel:Lcom/heitao/channel/HTBaseChannel;

.field protected mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/channel/HTChannelDispatcher;->mInstance:Lcom/heitao/channel/HTChannelDispatcher;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    .line 30
    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    .line 34
    new-instance v0, Lcom/heitao/channel/HTChannel;

    invoke-direct {v0}, Lcom/heitao/channel/HTChannel;-><init>()V

    iput-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    .line 35
    return-void
.end method

.method public static getInstance()Lcom/heitao/channel/HTChannelDispatcher;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/heitao/channel/HTChannelDispatcher;->mInstance:Lcom/heitao/channel/HTChannelDispatcher;

    if-nez v0, :cond_0

    .line 41
    new-instance v0, Lcom/heitao/channel/HTChannelDispatcher;

    invoke-direct {v0}, Lcom/heitao/channel/HTChannelDispatcher;-><init>()V

    sput-object v0, Lcom/heitao/channel/HTChannelDispatcher;->mInstance:Lcom/heitao/channel/HTChannelDispatcher;

    .line 44
    :cond_0
    sget-object v0, Lcom/heitao/channel/HTChannelDispatcher;->mInstance:Lcom/heitao/channel/HTChannelDispatcher;

    return-object v0
.end method


# virtual methods
.method public doAntiAddictionQuery()V
    .locals 2

    .prologue
    .line 478
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$22;

    invoke-direct {v1, p0}, Lcom/heitao/channel/HTChannelDispatcher$22;-><init>(Lcom/heitao/channel/HTChannelDispatcher;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 485
    return-void
.end method

.method public doExit(Lcom/heitao/listener/HTExitListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/heitao/listener/HTExitListener;

    .prologue
    .line 328
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$15;

    invoke-direct {v1, p0, p1}, Lcom/heitao/channel/HTChannelDispatcher$15;-><init>(Lcom/heitao/channel/HTChannelDispatcher;Lcom/heitao/listener/HTExitListener;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 341
    return-void
.end method

.method public doLogin(Ljava/lang/String;Lcom/heitao/listener/HTLoginListener;)V
    .locals 2
    .param p1, "customParameters"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/heitao/listener/HTLoginListener;

    .prologue
    .line 262
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v0

    sget-object v1, Lcom/heitao/common/HTDataCenter$HTMethod;->Login:Lcom/heitao/common/HTDataCenter$HTMethod;

    invoke-virtual {v0, v1}, Lcom/heitao/common/HTDataCenter;->isValidCallMethod(Lcom/heitao/common/HTDataCenter$HTMethod;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 264
    const-string v0, "\u767b\u5f55\u64cd\u4f5c\u8fc7\u5feb"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    .line 281
    :goto_0
    return-void

    .line 268
    :cond_0
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$12;

    invoke-direct {v1, p0, p2, p1}, Lcom/heitao/channel/HTChannelDispatcher$12;-><init>(Lcom/heitao/channel/HTChannelDispatcher;Lcom/heitao/listener/HTLoginListener;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public doLogout(Ljava/lang/String;Lcom/heitao/listener/HTLogoutListener;)V
    .locals 2
    .param p1, "customParameters"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/heitao/listener/HTLogoutListener;

    .prologue
    .line 288
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$13;

    invoke-direct {v1, p0, p2, p1}, Lcom/heitao/channel/HTChannelDispatcher$13;-><init>(Lcom/heitao/channel/HTChannelDispatcher;Lcom/heitao/listener/HTLogoutListener;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 301
    return-void
.end method

.method public doOpenWebView(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 448
    invoke-static {p1}, Lcom/heitao/common/HTUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p1}, Landroid/webkit/URLUtil;->isValidUrl(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 450
    :cond_0
    const-string v1, "URL\u4e3a\u7a7a\u6216\u65e0\u6548"

    invoke-static {v1}, Lcom/heitao/common/HTUtils;->doShowToast(Ljava/lang/String;)V

    .line 457
    :goto_0
    return-void

    .line 454
    :cond_1
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    const-class v2, Lcom/heitao/common/activity/HTWebViewActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 455
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "url"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 456
    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public doPay(Ljava/lang/String;Lcom/heitao/listener/HTPayListener;)V
    .locals 2
    .param p1, "customParameters"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/heitao/listener/HTPayListener;

    .prologue
    .line 308
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$14;

    invoke-direct {v1, p0, p2, p1}, Lcom/heitao/channel/HTChannelDispatcher$14;-><init>(Lcom/heitao/channel/HTChannelDispatcher;Lcom/heitao/listener/HTPayListener;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 321
    return-void
.end method

.method public doRealNameRegister()V
    .locals 2

    .prologue
    .line 464
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$21;

    invoke-direct {v1, p0}, Lcom/heitao/channel/HTChannelDispatcher$21;-><init>(Lcom/heitao/channel/HTChannelDispatcher;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 471
    return-void
.end method

.method public doSendData(Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
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
    .line 415
    .local p2, "customMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$19;

    invoke-direct {v1, p0, p1, p2}, Lcom/heitao/channel/HTChannelDispatcher$19;-><init>(Lcom/heitao/channel/HTChannelDispatcher;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 424
    return-void
.end method

.method public getChannel()Lcom/heitao/channel/HTBaseChannel;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    return-object v0
.end method

.method public getChannelKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    invoke-virtual {v0}, Lcom/heitao/channel/HTBaseChannel;->getChannelKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getChannelSDKVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    invoke-virtual {v0}, Lcom/heitao/channel/HTBaseChannel;->getChannelSDKVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isLogined()Z
    .locals 1

    .prologue
    .line 373
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    invoke-virtual {v0}, Lcom/heitao/channel/HTBaseChannel;->isLogined()Z

    move-result v0

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 178
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$8;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/heitao/channel/HTChannelDispatcher$8;-><init>(Lcom/heitao/channel/HTChannelDispatcher;IILandroid/content/Intent;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 187
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 191
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$9;

    invoke-direct {v1, p0, p1}, Lcom/heitao/channel/HTChannelDispatcher$9;-><init>(Lcom/heitao/channel/HTChannelDispatcher;Landroid/content/res/Configuration;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 209
    return-void
.end method

.method public onCreate(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    .line 78
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$1;

    invoke-direct {v1, p0}, Lcom/heitao/channel/HTChannelDispatcher$1;-><init>(Lcom/heitao/channel/HTChannelDispatcher;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 89
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 145
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$6;

    invoke-direct {v1, p0}, Lcom/heitao/channel/HTChannelDispatcher$6;-><init>(Lcom/heitao/channel/HTChannelDispatcher;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 161
    return-void
.end method

.method public onEnterGame(Ljava/lang/String;)V
    .locals 2
    .param p1, "infos"    # Ljava/lang/String;

    .prologue
    .line 381
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$17;

    invoke-direct {v1, p0, p1}, Lcom/heitao/channel/HTChannelDispatcher$17;-><init>(Lcom/heitao/channel/HTChannelDispatcher;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 390
    return-void
.end method

.method public onGameLevelChanged(I)V
    .locals 2
    .param p1, "newLevel"    # I

    .prologue
    .line 397
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$18;

    invoke-direct {v1, p0, p1}, Lcom/heitao/channel/HTChannelDispatcher$18;-><init>(Lcom/heitao/channel/HTChannelDispatcher;I)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 406
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 235
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$11;

    invoke-direct {v1, p0, p1}, Lcom/heitao/channel/HTChannelDispatcher$11;-><init>(Lcom/heitao/channel/HTChannelDispatcher;Landroid/content/Intent;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 253
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$2;

    invoke-direct {v1, p0}, Lcom/heitao/channel/HTChannelDispatcher$2;-><init>(Lcom/heitao/channel/HTChannelDispatcher;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 102
    return-void
.end method

.method public onPlayerRoleNameChanged(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 2
    .param p1, "isCreate"    # Ljava/lang/Boolean;
    .param p2, "roleName"    # Ljava/lang/String;

    .prologue
    .line 433
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$20;

    invoke-direct {v1, p0, p1, p2}, Lcom/heitao/channel/HTChannelDispatcher$20;-><init>(Lcom/heitao/channel/HTChannelDispatcher;Ljava/lang/Boolean;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 440
    return-void
.end method

.method public onRestart()V
    .locals 2

    .prologue
    .line 165
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$7;

    invoke-direct {v1, p0}, Lcom/heitao/channel/HTChannelDispatcher$7;-><init>(Lcom/heitao/channel/HTChannelDispatcher;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 174
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 106
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$3;

    invoke-direct {v1, p0}, Lcom/heitao/channel/HTChannelDispatcher$3;-><init>(Lcom/heitao/channel/HTChannelDispatcher;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 115
    return-void
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$4;

    invoke-direct {v1, p0}, Lcom/heitao/channel/HTChannelDispatcher$4;-><init>(Lcom/heitao/channel/HTChannelDispatcher;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 128
    return-void
.end method

.method public onStartGame()Z
    .locals 1

    .prologue
    .line 365
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    invoke-virtual {v0}, Lcom/heitao/channel/HTBaseChannel;->onStartGame()Z

    move-result v0

    return v0
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 132
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$5;

    invoke-direct {v1, p0}, Lcom/heitao/channel/HTChannelDispatcher$5;-><init>(Lcom/heitao/channel/HTChannelDispatcher;)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 141
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2
    .param p1, "hasFocus"    # Z

    .prologue
    .line 213
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$10;

    invoke-direct {v1, p0, p1}, Lcom/heitao/channel/HTChannelDispatcher$10;-><init>(Lcom/heitao/channel/HTChannelDispatcher;Z)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 231
    return-void
.end method

.method public setAntiAddictionListener(Lcom/heitao/listener/HTAntiAddictionListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/heitao/listener/HTAntiAddictionListener;

    .prologue
    .line 524
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iput-object p1, v0, Lcom/heitao/channel/HTBaseChannel;->mAntiAddictionListener:Lcom/heitao/listener/HTAntiAddictionListener;

    .line 525
    return-void
.end method

.method public setExitListener(Lcom/heitao/listener/HTExitListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/heitao/listener/HTExitListener;

    .prologue
    .line 516
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iput-object p1, v0, Lcom/heitao/channel/HTBaseChannel;->mExitListener:Lcom/heitao/listener/HTExitListener;

    .line 517
    return-void
.end method

.method public setLogoinListener(Lcom/heitao/listener/HTLoginListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/heitao/listener/HTLoginListener;

    .prologue
    .line 492
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iput-object p1, v0, Lcom/heitao/channel/HTBaseChannel;->mLoginListener:Lcom/heitao/listener/HTLoginListener;

    .line 493
    return-void
.end method

.method public setLogoutListener(Lcom/heitao/listener/HTLogoutListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/heitao/listener/HTLogoutListener;

    .prologue
    .line 500
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iput-object p1, v0, Lcom/heitao/channel/HTBaseChannel;->mLogoutListener:Lcom/heitao/listener/HTLogoutListener;

    .line 501
    return-void
.end method

.method public setPayListener(Lcom/heitao/listener/HTPayListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/heitao/listener/HTPayListener;

    .prologue
    .line 508
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iput-object p1, v0, Lcom/heitao/channel/HTBaseChannel;->mPayListener:Lcom/heitao/listener/HTPayListener;

    .line 509
    return-void
.end method

.method public setRealNameRegisterListener(Lcom/heitao/listener/HTRealNameRegisterListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/heitao/listener/HTRealNameRegisterListener;

    .prologue
    .line 532
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iput-object p1, v0, Lcom/heitao/channel/HTBaseChannel;->mRealNameRegisterListener:Lcom/heitao/listener/HTRealNameRegisterListener;

    .line 533
    return-void
.end method

.method public setShowFunctionMenu(Z)V
    .locals 2
    .param p1, "show"    # Z

    .prologue
    .line 349
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/channel/HTChannelDispatcher$16;

    invoke-direct {v1, p0, p1}, Lcom/heitao/channel/HTChannelDispatcher$16;-><init>(Lcom/heitao/channel/HTChannelDispatcher;Z)V

    invoke-static {v0, v1}, Lcom/heitao/common/HTUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 358
    return-void
.end method
