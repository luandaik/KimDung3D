.class public Lcom/heitao/platform/api/HTPlatform;
.super Ljava/lang/Object;
.source "HTPlatform.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;
    }
.end annotation


# static fields
.field private static mInstance:Lcom/heitao/platform/api/HTPlatform;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/api/HTPlatform;->mInstance:Lcom/heitao/platform/api/HTPlatform;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    .line 46
    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/api/HTPlatform;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private active()V
    .locals 2

    .prologue
    .line 383
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/platform/api/HTPlatform$6;

    invoke-direct {v1, p0}, Lcom/heitao/platform/api/HTPlatform$6;-><init>(Lcom/heitao/platform/api/HTPlatform;)V

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 421
    return-void
.end method

.method public static getInstance()Lcom/heitao/platform/api/HTPlatform;
    .locals 1

    .prologue
    .line 63
    sget-object v0, Lcom/heitao/platform/api/HTPlatform;->mInstance:Lcom/heitao/platform/api/HTPlatform;

    if-nez v0, :cond_0

    .line 65
    new-instance v0, Lcom/heitao/platform/api/HTPlatform;

    invoke-direct {v0}, Lcom/heitao/platform/api/HTPlatform;-><init>()V

    sput-object v0, Lcom/heitao/platform/api/HTPlatform;->mInstance:Lcom/heitao/platform/api/HTPlatform;

    .line 68
    :cond_0
    sget-object v0, Lcom/heitao/platform/api/HTPlatform;->mInstance:Lcom/heitao/platform/api/HTPlatform;

    return-object v0
.end method

.method private initOpenUDID()V
    .locals 1

    .prologue
    .line 377
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/heitao/platform/openudid/HTPOpenUDID_manager;->sync(Landroid/content/Context;)V

    .line 378
    invoke-static {}, Lcom/heitao/platform/openudid/HTPOpenUDID_manager;->isInitialized()Z

    .line 379
    return-void
.end method

.method public static setDebugEnable(Z)V
    .locals 0
    .param p0, "isEnable"    # Z

    .prologue
    .line 355
    sput-boolean p0, Lcom/heitao/platform/common/HTPConsts;->HTPlatformSDK_DEBUG:Z

    .line 356
    return-void
.end method

.method public static setLogEnable(Z)V
    .locals 0
    .param p0, "isEnable"    # Z

    .prologue
    .line 346
    sput-boolean p0, Lcom/heitao/platform/common/HTPLog;->mLogEnable:Z

    .line 347
    return-void
.end method

.method public static statistics(Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .param p0, "label"    # Ljava/lang/String;
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
    .line 372
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p0, p1}, Lcom/heitao/platform/statistics/HTPStatistics;->statistics(Ljava/lang/String;Ljava/util/Map;)V

    .line 373
    return-void
.end method


# virtual methods
.method public doLogin(Lcom/heitao/platform/listener/HTPLoginListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/heitao/platform/listener/HTPLoginListener;

    .prologue
    .line 145
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iput-object p1, v0, Lcom/heitao/platform/common/HTPDataCenter;->mLoginListener:Lcom/heitao/platform/listener/HTPLoginListener;

    .line 147
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/platform/api/HTPlatform$1;

    invoke-direct {v1, p0}, Lcom/heitao/platform/api/HTPlatform$1;-><init>(Lcom/heitao/platform/api/HTPlatform;)V

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 170
    return-void
.end method

.method public doLogout()V
    .locals 3

    .prologue
    .line 177
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/heitao/platform/common/HTPDataCenter;->reset()V

    .line 178
    invoke-virtual {p0}, Lcom/heitao/platform/api/HTPlatform;->removeFloatWindow()V

    .line 179
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    const-class v2, Lcom/heitao/platform/activity/HTPPlatformLoginActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 180
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 181
    return-void
.end method

.method public doLogoutWithOutLogin()V
    .locals 1

    .prologue
    .line 187
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/common/HTPDataCenter;->reset()V

    .line 188
    invoke-virtual {p0}, Lcom/heitao/platform/api/HTPlatform;->removeFloatWindow()V

    .line 189
    return-void
.end method

.method public doPay(Lcom/heitao/platform/model/HTPPayInfo;Lcom/heitao/platform/listener/HTPPayListener;)V
    .locals 2
    .param p1, "info"    # Lcom/heitao/platform/model/HTPPayInfo;
    .param p2, "listener"    # Lcom/heitao/platform/listener/HTPPayListener;

    .prologue
    .line 217
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    if-nez v0, :cond_1

    .line 219
    const-string v0, "cannot_pay_before_login"

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 221
    if-eqz p2, :cond_1

    .line 223
    invoke-static {}, Lcom/heitao/platform/model/HTPError;->getNotLoginError()Lcom/heitao/platform/model/HTPError;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    .line 300
    :cond_0
    :goto_0
    return-void

    .line 228
    :cond_1
    if-nez p1, :cond_2

    .line 230
    const-string v0, "pay_info_null"

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 231
    if-eqz p2, :cond_0

    .line 233
    invoke-static {}, Lcom/heitao/platform/model/HTPError;->getPayInfoError()Lcom/heitao/platform/model/HTPError;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    goto :goto_0

    .line 238
    :cond_2
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    const-string v1, "pay_initing"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->doShowProgressDialog(Landroid/content/Context;Ljava/lang/String;)V

    .line 240
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iput-object p1, v0, Lcom/heitao/platform/common/HTPDataCenter;->mPayInfo:Lcom/heitao/platform/model/HTPPayInfo;

    .line 241
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iput-object p2, v0, Lcom/heitao/platform/common/HTPDataCenter;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 243
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/platform/api/HTPlatform$3;

    invoke-direct {v1, p0}, Lcom/heitao/platform/api/HTPlatform$3;-><init>(Lcom/heitao/platform/api/HTPlatform;)V

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public init(Landroid/content/Context;Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "direction"    # Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;
    .param p3, "appKey"    # Ljava/lang/String;
    .param p4, "secretKey"    # Ljava/lang/String;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    .line 81
    invoke-direct {p0}, Lcom/heitao/platform/api/HTPlatform;->initOpenUDID()V

    .line 83
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iput-object p1, v1, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    .line 84
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iput-object p2, v1, Lcom/heitao/platform/common/HTPDataCenter;->mDirection:Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;

    .line 85
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iput-object p3, v1, Lcom/heitao/platform/common/HTPDataCenter;->mAppKey:Ljava/lang/String;

    .line 86
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iput-object p4, v1, Lcom/heitao/platform/common/HTPDataCenter;->mSecretKey:Ljava/lang/String;

    .line 87
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/heitao/platform/common/HTPDataCenter;->attainChannelFromMETAINF(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "cID":Ljava/lang/String;
    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 90
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    const-string v2, "10000000"

    iput-object v2, v1, Lcom/heitao/platform/common/HTPDataCenter;->mChannelId:Ljava/lang/String;

    .line 96
    :goto_0
    invoke-static {}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->getInstance()Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->init(Landroid/content/Context;)V

    .line 98
    invoke-direct {p0}, Lcom/heitao/platform/api/HTPlatform;->active()V

    .line 99
    invoke-virtual {p0}, Lcom/heitao/platform/api/HTPlatform;->versionCheck()V

    .line 100
    return-void

    .line 94
    :cond_0
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iput-object v0, v1, Lcom/heitao/platform/common/HTPDataCenter;->mChannelId:Ljava/lang/String;

    goto :goto_0
.end method

.method public init(Landroid/content/Context;Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/heitao/platform/listener/HTPLogoutListener;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "direction"    # Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;
    .param p3, "appKey"    # Ljava/lang/String;
    .param p4, "secretKey"    # Ljava/lang/String;
    .param p5, "channelId"    # Ljava/lang/String;
    .param p6, "listener"    # Lcom/heitao/platform/listener/HTPLogoutListener;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    .line 113
    invoke-direct {p0}, Lcom/heitao/platform/api/HTPlatform;->initOpenUDID()V

    .line 115
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iput-object p1, v1, Lcom/heitao/platform/common/HTPDataCenter;->mContext:Landroid/content/Context;

    .line 116
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iput-object p2, v1, Lcom/heitao/platform/common/HTPDataCenter;->mDirection:Lcom/heitao/platform/api/HTPlatform$HTPlatformDirection;

    .line 117
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iput-object p3, v1, Lcom/heitao/platform/common/HTPDataCenter;->mAppKey:Ljava/lang/String;

    .line 118
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iput-object p4, v1, Lcom/heitao/platform/common/HTPDataCenter;->mSecretKey:Ljava/lang/String;

    .line 119
    invoke-static {p5}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 120
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/heitao/platform/common/HTPDataCenter;->attainChannelFromMETAINF(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 121
    .local v0, "cID":Ljava/lang/String;
    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 123
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    const-string v2, "10000000"

    iput-object v2, v1, Lcom/heitao/platform/common/HTPDataCenter;->mChannelId:Ljava/lang/String;

    .line 133
    .end local v0    # "cID":Ljava/lang/String;
    :goto_0
    invoke-static {}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->getInstance()Lcom/heitao/platform/pay/center/HTPSDKPayCenter;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/heitao/platform/pay/center/HTPSDKPayCenter;->init(Landroid/content/Context;)V

    .line 134
    invoke-virtual {p0, p6}, Lcom/heitao/platform/api/HTPlatform;->setLogoutLister(Lcom/heitao/platform/listener/HTPLogoutListener;)V

    .line 135
    invoke-direct {p0}, Lcom/heitao/platform/api/HTPlatform;->active()V

    .line 136
    invoke-virtual {p0}, Lcom/heitao/platform/api/HTPlatform;->versionCheck()V

    .line 137
    return-void

    .line 127
    .restart local v0    # "cID":Ljava/lang/String;
    :cond_0
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iput-object v0, v1, Lcom/heitao/platform/common/HTPDataCenter;->mChannelId:Ljava/lang/String;

    goto :goto_0

    .line 130
    .end local v0    # "cID":Ljava/lang/String;
    :cond_1
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iput-object p5, v1, Lcom/heitao/platform/common/HTPDataCenter;->mChannelId:Ljava/lang/String;

    goto :goto_0
.end method

.method public onDestory()V
    .locals 1

    .prologue
    .line 321
    invoke-static {}, Lcom/heitao/platform/activity/view/HTPFloatWindow;->hideFloatWindow()V

    .line 322
    invoke-static {}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->getInstance()Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/activity/view/menu/HTPFloatMenuWindow;->onDestory()V

    .line 323
    return-void
.end method

.method public openUserCenter()V
    .locals 2

    .prologue
    .line 199
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/platform/api/HTPlatform$2;

    invoke-direct {v1, p0}, Lcom/heitao/platform/api/HTPlatform$2;-><init>(Lcom/heitao/platform/api/HTPlatform;)V

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 210
    return-void
.end method

.method public removeFloatWindow()V
    .locals 2

    .prologue
    .line 330
    invoke-static {}, Lcom/heitao/platform/activity/view/HTPFloatWindow;->hideFloatWindow()V

    .line 331
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/platform/api/HTPlatform$5;

    invoke-direct {v1, p0}, Lcom/heitao/platform/api/HTPlatform$5;-><init>(Lcom/heitao/platform/api/HTPlatform;)V

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 339
    return-void
.end method

.method public setLogoutLister(Lcom/heitao/platform/listener/HTPLogoutListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/heitao/platform/listener/HTPLogoutListener;

    .prologue
    .line 192
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iput-object p1, v0, Lcom/heitao/platform/common/HTPDataCenter;->mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;

    .line 193
    return-void
.end method

.method public setPolicyUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 363
    sput-object p1, Lcom/heitao/platform/common/HTPConsts;->POLICY_URL:Ljava/lang/String;

    .line 364
    return-void
.end method

.method public showFloatWindow()V
    .locals 0

    .prologue
    .line 308
    invoke-static {}, Lcom/heitao/platform/activity/view/HTPFloatWindow;->showFloatWindow()V

    .line 309
    return-void
.end method

.method public showNewWindow()V
    .locals 2

    .prologue
    .line 311
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/platform/api/HTPlatform$4;

    invoke-direct {v1, p0}, Lcom/heitao/platform/api/HTPlatform$4;-><init>(Lcom/heitao/platform/api/HTPlatform;)V

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 318
    return-void
.end method

.method public versionCheck()V
    .locals 2

    .prologue
    .line 428
    iget-object v0, p0, Lcom/heitao/platform/api/HTPlatform;->mContext:Landroid/content/Context;

    new-instance v1, Lcom/heitao/platform/api/HTPlatform$7;

    invoke-direct {v1, p0}, Lcom/heitao/platform/api/HTPlatform$7;-><init>(Lcom/heitao/platform/api/HTPlatform;)V

    invoke-static {v0, v1}, Lcom/heitao/platform/common/HTPUtils;->doRunnableOnMainLooper(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 552
    return-void
.end method
