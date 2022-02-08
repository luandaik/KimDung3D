.class public Lorg/cocos2dx/TerransForce/HeitaoSdkManager;
.super Ljava/lang/Object;
.source "HeitaoSdkManager.java"


# static fields
.field private static ACCELEROMETER_NOTICE:I

.field private static EXIT_GAME:I

.field private static LOGIN_IN_FAIL:I

.field private static LOGIN_IN_SUCESS:I

.field private static LOGIN_OUT_FAIL:I

.field private static LOGIN_OUT_SUCESS:I

.field private static PAY_FAIL:I

.field private static PAY_SUCESS:I

.field private static UpdateInfo:Lcom/heitao/model/HTAppUpdateInfo;

.field public static custom:Ljava/lang/String;

.field private static fuctionID:I

.field private static isDelayLogout:Z

.field private static isOpenAccelerometer:Z

.field private static mActivity:Landroid/app/Activity;

.field public static mAppUpdateListener:Lcom/heitao/listener/HTAppUpdateListener;

.field private static mExitListener:Lcom/heitao/listener/HTExitListener;

.field public static mLoginListener:Lcom/heitao/listener/HTLoginListener;

.field public static mLogoutListener:Lcom/heitao/listener/HTLogoutListener;

.field public static mPayListener:Lcom/heitao/listener/HTPayListener;

.field public static platformId:Ljava/lang/String;

.field public static platformUserId:Ljava/lang/String;

.field public static token:Ljava/lang/String;

.field public static userid:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 35
    const-string v0, ""

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->userid:Ljava/lang/String;

    .line 36
    const-string v0, ""

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->platformUserId:Ljava/lang/String;

    .line 37
    const-string v0, ""

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->platformId:Ljava/lang/String;

    .line 38
    const-string v0, ""

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->token:Ljava/lang/String;

    .line 39
    const-string v0, ""

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->custom:Ljava/lang/String;

    .line 41
    sput v2, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->LOGIN_IN_SUCESS:I

    .line 42
    const/4 v0, 0x2

    sput v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->LOGIN_IN_FAIL:I

    .line 43
    const/4 v0, 0x3

    sput v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->LOGIN_OUT_SUCESS:I

    .line 44
    const/4 v0, 0x4

    sput v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->LOGIN_OUT_FAIL:I

    .line 45
    const/4 v0, 0x5

    sput v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->PAY_SUCESS:I

    .line 46
    const/4 v0, 0x6

    sput v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->PAY_FAIL:I

    .line 47
    const/16 v0, 0x9

    sput v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->ACCELEROMETER_NOTICE:I

    .line 49
    const/16 v0, 0x64

    sput v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->EXIT_GAME:I

    .line 51
    sput v1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->fuctionID:I

    .line 60
    const/4 v0, 0x0

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mActivity:Landroid/app/Activity;

    .line 62
    sput-boolean v1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->isOpenAccelerometer:Z

    .line 63
    sput-boolean v2, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->isDelayLogout:Z

    .line 147
    new-instance v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$2;

    invoke-direct {v0}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$2;-><init>()V

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mLoginListener:Lcom/heitao/listener/HTLoginListener;

    .line 171
    new-instance v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$3;

    invoke-direct {v0}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$3;-><init>()V

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mLogoutListener:Lcom/heitao/listener/HTLogoutListener;

    .line 202
    new-instance v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$4;

    invoke-direct {v0}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$4;-><init>()V

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mPayListener:Lcom/heitao/listener/HTPayListener;

    .line 218
    new-instance v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$5;

    invoke-direct {v0}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$5;-><init>()V

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mExitListener:Lcom/heitao/listener/HTExitListener;

    .line 260
    new-instance v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$7;

    invoke-direct {v0}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$7;-><init>()V

    sput-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mAppUpdateListener:Lcom/heitao/listener/HTAppUpdateListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static GameLevelChanged(I)V
    .locals 0
    .param p0, "level"    # I

    .prologue
    .line 319
    invoke-static {p0}, Lcom/heitao/api/HTGameProxy;->onGameLevelChanged(I)V

    .line 320
    return-void
.end method

.method public static ShowFunctionMenu(Z)V
    .locals 0
    .param p0, "bShow"    # Z

    .prologue
    .line 324
    invoke-static {p0}, Lcom/heitao/api/HTGameProxy;->setShowFunctionMenu(Z)V

    .line 325
    return-void
.end method

.method static synthetic access$000()I
    .locals 1

    .prologue
    .line 33
    sget v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->fuctionID:I

    return v0
.end method

.method static synthetic access$100(IILjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # I
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-static {p0, p1, p2}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->callBack(IILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000()V
    .locals 0

    .prologue
    .line 33
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->showExitGameDialog()V

    return-void
.end method

.method static synthetic access$1100()V
    .locals 0

    .prologue
    .line 33
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->updatecallBack()V

    return-void
.end method

.method static synthetic access$200()I
    .locals 1

    .prologue
    .line 33
    sget v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->LOGIN_IN_FAIL:I

    return v0
.end method

.method static synthetic access$300()I
    .locals 1

    .prologue
    .line 33
    sget v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->LOGIN_IN_SUCESS:I

    return v0
.end method

.method static synthetic access$400()I
    .locals 1

    .prologue
    .line 33
    sget v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->LOGIN_OUT_FAIL:I

    return v0
.end method

.method static synthetic access$500()Z
    .locals 1

    .prologue
    .line 33
    sget-boolean v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->isDelayLogout:Z

    return v0
.end method

.method static synthetic access$600()I
    .locals 1

    .prologue
    .line 33
    sget v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->LOGIN_OUT_SUCESS:I

    return v0
.end method

.method static synthetic access$700()I
    .locals 1

    .prologue
    .line 33
    sget v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->PAY_FAIL:I

    return v0
.end method

.method static synthetic access$800()I
    .locals 1

    .prologue
    .line 33
    sget v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->PAY_SUCESS:I

    return v0
.end method

.method static synthetic access$900()I
    .locals 1

    .prologue
    .line 33
    sget v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->EXIT_GAME:I

    return v0
.end method

.method private static native callBack(IILjava/lang/String;)V
.end method

.method private static doRunnableOnMainLooper(Ljava/lang/Runnable;)V
    .locals 2
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 410
    new-instance v0, Landroid/os/Handler;

    sget-object v1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 411
    .local v0, "mainHandler":Landroid/os/Handler;
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 412
    return-void
.end method

.method public static enterGame(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "serverid"    # Ljava/lang/String;
    .param p1, "servername"    # Ljava/lang/String;
    .param p2, "roleid"    # Ljava/lang/String;
    .param p3, "rolename"    # Ljava/lang/String;
    .param p4, "level"    # Ljava/lang/String;
    .param p5, "isNewRole"    # Ljava/lang/String;

    .prologue
    .line 390
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 400
    .local v0, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "cp_server_id"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    const-string v1, "cp_server_name"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    const-string v1, "role_id"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    const-string v1, "role_name"

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    const-string v1, "role_level"

    invoke-interface {v0, v1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    const-string v1, "is_new_role"

    invoke-interface {v0, v1, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    invoke-static {v0}, Lcom/heitao/api/HTGameProxy;->onEnterGame(Ljava/util/Map;)V

    .line 407
    return-void
.end method

.method public static getChannelSDKVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 307
    invoke-static {}, Lcom/heitao/api/HTGameProxy;->getChannelSDKVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSDKVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 303
    invoke-static {}, Lcom/heitao/api/HTGameProxy;->getSDKVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getcustom()Ljava/lang/String;
    .locals 1

    .prologue
    .line 299
    sget-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->custom:Ljava/lang/String;

    return-object v0
.end method

.method public static getplatformId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 291
    sget-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->platformId:Ljava/lang/String;

    return-object v0
.end method

.method public static getplatformUserId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 287
    sget-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->platformUserId:Ljava/lang/String;

    return-object v0
.end method

.method public static gettoken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 295
    sget-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->token:Ljava/lang/String;

    return-object v0
.end method

.method public static getuserid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 283
    sget-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->userid:Ljava/lang/String;

    return-object v0
.end method

.method public static init(Ljava/lang/String;I)Ljava/lang/String;
    .locals 3
    .param p0, "desc"    # Ljava/lang/String;
    .param p1, "callBackFunctionId"    # I

    .prologue
    .line 95
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "callBackFunctionId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 96
    sput p1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->fuctionID:I

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "desc = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "   fuctionid = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static init(Landroid/app/Activity;)V
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v4, 0x0

    .line 66
    sput-object p0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mActivity:Landroid/app/Activity;

    .line 69
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "-----\u521d\u59cb\u5316\u9ed1\u6843SDK----"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 71
    new-instance v0, Lcom/heitao/model/HTGameInfo;

    const-string v1, "\u6c5f\u6e56HD"

    const-string v2, "jhhd"

    sget-object v3, Lcom/heitao/model/HTGameInfo$HTDirection;->Landscape:Lcom/heitao/model/HTGameInfo$HTDirection;

    invoke-direct {v0, v1, v2, v3}, Lcom/heitao/model/HTGameInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/heitao/model/HTGameInfo$HTDirection;)V

    .line 72
    .local v0, "gameInfo":Lcom/heitao/model/HTGameInfo;
    sget-object v1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mActivity:Landroid/app/Activity;

    invoke-static {v1, v0}, Lcom/heitao/api/HTGameProxy;->init(Landroid/content/Context;Lcom/heitao/model/HTGameInfo;)V

    .line 74
    invoke-static {v4}, Lcom/heitao/api/HTGameProxy;->setLogEnable(Z)V

    .line 75
    invoke-static {v4}, Lcom/heitao/api/HTGameProxy;->setDebugEnable(Z)V

    .line 76
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/heitao/api/HTGameProxy;->setShowFunctionMenu(Z)V

    .line 78
    sget-object v1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mLoginListener:Lcom/heitao/listener/HTLoginListener;

    invoke-static {v1}, Lcom/heitao/api/HTGameProxy;->setLogoinListener(Lcom/heitao/listener/HTLoginListener;)V

    .line 79
    sget-object v1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mLogoutListener:Lcom/heitao/listener/HTLogoutListener;

    invoke-static {v1}, Lcom/heitao/api/HTGameProxy;->setLogoutListener(Lcom/heitao/listener/HTLogoutListener;)V

    .line 80
    sget-object v1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mExitListener:Lcom/heitao/listener/HTExitListener;

    invoke-static {v1}, Lcom/heitao/api/HTGameProxy;->setExitListener(Lcom/heitao/listener/HTExitListener;)V

    .line 81
    sget-object v1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mAppUpdateListener:Lcom/heitao/listener/HTAppUpdateListener;

    invoke-static {v1}, Lcom/heitao/api/HTGameProxy;->setAppUpdateListener(Lcom/heitao/listener/HTAppUpdateListener;)V

    .line 83
    sget-object v1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mActivity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/heitao/api/HTGameProxy;->onCreate(Landroid/content/Context;)V

    .line 85
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "----\u521d\u59cb\u5316\u9ed1\u6843SDK end----"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 86
    return-void
.end method

.method public static isOpenAccelerometer()Z
    .locals 1

    .prologue
    .line 442
    sget-boolean v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->isOpenAccelerometer:Z

    return v0
.end method

.method public static login()V
    .locals 2

    .prologue
    .line 124
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "login..."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 125
    const/4 v0, 0x0

    sget-object v1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mLoginListener:Lcom/heitao/listener/HTLoginListener;

    invoke-static {v0, v1}, Lcom/heitao/api/HTGameProxy;->doLogin(Ljava/util/Map;Lcom/heitao/listener/HTLoginListener;)V

    .line 126
    return-void
.end method

.method public static loginExit()V
    .locals 2

    .prologue
    .line 143
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "\u51c6\u5907\u9000\u51fa\u6e38\u620f"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 144
    sget-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mExitListener:Lcom/heitao/listener/HTExitListener;

    invoke-static {v0}, Lcom/heitao/api/HTGameProxy;->doExit(Lcom/heitao/listener/HTExitListener;)V

    .line 145
    return-void
.end method

.method public static loginOut()V
    .locals 2

    .prologue
    .line 139
    const/4 v0, 0x0

    sget-object v1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mLogoutListener:Lcom/heitao/listener/HTLogoutListener;

    invoke-static {v0, v1}, Lcom/heitao/api/HTGameProxy;->doLogout(Ljava/util/Map;Lcom/heitao/listener/HTLogoutListener;)V

    .line 140
    return-void
.end method

.method public static onUseGiftCode(Ljava/lang/String;)V
    .locals 2
    .param p0, "giftCode"    # Ljava/lang/String;

    .prologue
    .line 426
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 428
    .local v0, "parsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "cardno"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    const-string v1, "gamegiftuse"

    invoke-static {v1, v0}, Lcom/heitao/api/HTGameProxy;->doSendData(Ljava/lang/String;Ljava/util/Map;)V

    .line 431
    return-void
.end method

.method public static openQQ(Ljava/lang/String;)V
    .locals 5
    .param p0, "qq"    # Ljava/lang/String;

    .prologue
    .line 416
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->getInstance()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    move-result-object v2

    invoke-virtual {v2}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 418
    .local v0, "activty":Landroid/app/Activity;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mqqwpa://im/chat?chat_type=wpa&uin="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 420
    .local v1, "url":Ljava/lang/String;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "-----openQQ---- url="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 421
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 422
    return-void
.end method

.method public static openUrl(Ljava/lang/String;)V
    .locals 4
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 435
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->getInstance()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    move-result-object v1

    invoke-virtual {v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 437
    .local v0, "activty":Landroid/app/Activity;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "-----openUrl---- url="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 438
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 439
    return-void
.end method

.method public static pay(IIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 18
    .param p0, "price"    # I
    .param p1, "rate"    # I
    .param p2, "count"    # I
    .param p3, "fixedMoney"    # I
    .param p4, "unitName"    # Ljava/lang/String;
    .param p5, "productId"    # Ljava/lang/String;
    .param p6, "serverId"    # Ljava/lang/String;
    .param p7, "cpExtendInfo"    # Ljava/lang/String;

    .prologue
    .line 352
    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    .line 354
    .local v14, "customJsonObject":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "coin_image_name"

    const-string v3, "gold.png"

    invoke-virtual {v14, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 359
    :goto_0
    const/16 v17, 0x0

    .line 360
    .local v17, "payType":Ljava/lang/String;
    const-string v2, "\u5361"

    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    .line 361
    const-string v17, "1"

    .line 367
    :goto_1
    :try_start_1
    const-string v2, "is_pay_month"

    move-object/from16 v0, v17

    invoke-virtual {v14, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 373
    :goto_2
    new-instance v1, Lcom/heitao/model/HTPayInfo;

    move/from16 v0, p0

    int-to-float v2, v0

    const/4 v7, 0x0

    const-string v9, ""

    const-string v10, ""

    const-string v11, ""

    invoke-virtual {v14}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v8, p6

    move-object/from16 v12, p7

    invoke-direct/range {v1 .. v13}, Lcom/heitao/model/HTPayInfo;-><init>(FIIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 376
    .local v1, "payInfo":Lcom/heitao/model/HTPayInfo;
    sget-object v2, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mPayListener:Lcom/heitao/listener/HTPayListener;

    invoke-static {v1, v2}, Lcom/heitao/api/HTGameProxy;->doPay(Lcom/heitao/model/HTPayInfo;Lcom/heitao/listener/HTPayListener;)V

    .line 377
    return-void

    .line 355
    .end local v1    # "payInfo":Lcom/heitao/model/HTPayInfo;
    .end local v17    # "payType":Ljava/lang/String;
    :catch_0
    move-exception v16

    .line 357
    .local v16, "e1":Lorg/json/JSONException;
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 364
    .end local v16    # "e1":Lorg/json/JSONException;
    .restart local v17    # "payType":Ljava/lang/String;
    :cond_0
    const-string v17, "0"

    goto :goto_1

    .line 368
    :catch_1
    move-exception v15

    .line 370
    .local v15, "e":Lorg/json/JSONException;
    invoke-virtual {v15}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2
.end method

.method public static resultCallback(ILjava/lang/String;)V
    .locals 2
    .param p0, "nResult"    # I
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 114
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->getInstance()Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;

    move-result-object v0

    new-instance v1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$1;

    invoke-direct {v1, p0, p1}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$1;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/cocos2dx/lib/Cocos2dxGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 121
    return-void
.end method

.method public static setDebugEnable(Z)V
    .locals 0
    .param p0, "enable"    # Z

    .prologue
    .line 311
    invoke-static {p0}, Lcom/heitao/api/HTGameProxy;->setDebugEnable(Z)V

    .line 312
    return-void
.end method

.method public static setLogEnable(Z)V
    .locals 0
    .param p0, "enable"    # Z

    .prologue
    .line 315
    invoke-static {p0}, Lcom/heitao/api/HTGameProxy;->setLogEnable(Z)V

    .line 316
    return-void
.end method

.method public static setOpenAccelerometer(Z)V
    .locals 1
    .param p0, "isOpenAccelerometer"    # Z

    .prologue
    .line 446
    sget-boolean v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->isOpenAccelerometer:Z

    if-eq v0, p0, :cond_0

    .line 448
    sput-boolean p0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->isOpenAccelerometer:Z

    .line 449
    const/4 v0, 0x1

    if-ne p0, v0, :cond_1

    .line 450
    sget-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mActivity:Landroid/app/Activity;

    check-cast v0, Lorg/cocos2dx/TerransForce/TerransForce;

    invoke-virtual {v0}, Lorg/cocos2dx/TerransForce/TerransForce;->enable()V

    .line 457
    :cond_0
    :goto_0
    return-void

    .line 453
    :cond_1
    sget-object v0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mActivity:Landroid/app/Activity;

    check-cast v0, Lorg/cocos2dx/TerransForce/TerransForce;

    invoke-virtual {v0}, Lorg/cocos2dx/TerransForce/TerransForce;->disable()V

    goto :goto_0
.end method

.method public static setTestFuctionID(I)Ljava/lang/String;
    .locals 3
    .param p0, "callBackFunctionId"    # I

    .prologue
    .line 89
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "callBackFunctionId2 = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "fuctionid2 = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static showExitGameDialog()V
    .locals 3

    .prologue
    .line 238
    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget-object v1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 239
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v1, "\u786e\u5b9a\u8981\u9000\u51fa\u6e38\u620f\u5417\uff1f"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 240
    const-string v1, "\u63d0\u793a"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 241
    const-string v1, "\u786e\u5b9a"

    new-instance v2, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$6;

    invoke-direct {v2}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$6;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 248
    const-string v1, "\u53d6\u6d88"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 249
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 250
    return-void
.end method

.method public static startGame()Z
    .locals 1

    .prologue
    .line 383
    invoke-static {}, Lcom/heitao/api/HTGameProxy;->onStartGame()Z

    move-result v0

    return v0
.end method

.method private static native updatecallBack()V
.end method
