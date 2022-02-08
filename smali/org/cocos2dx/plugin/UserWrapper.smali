.class public Lorg/cocos2dx/plugin/UserWrapper;
.super Ljava/lang/Object;
.source "UserWrapper.java"


# static fields
.field public static final ACTION_RET_ENTERPLATFORM_FAILED:I = 0x7

.field public static final ACTION_RET_ENTERPLATFORM_SUCCEED:I = 0x6

.field public static final ACTION_RET_INIT_FAILED:I = 0x1

.field public static final ACTION_RET_INIT_SUCCEED:I = 0x0

.field public static final ACTION_RET_LOGIN_FAILED:I = 0x3

.field public static final ACTION_RET_LOGIN_SUCCEED:I = 0x2

.field public static final ACTION_RET_LOGOUT_FAILED:I = 0x5

.field public static final ACTION_RET_LOGOUT_SUCCEED:I = 0x4

.field public static final ACTION_RET_SWITCHACCOUNT_FAILED:I = 0x9

.field public static final ACTION_RET_SWITCHACCOUNT_SUCCEED:I = 0x8

.field public static final APP_ID:Ljava/lang/String; = "appId"

.field public static final DEVICE_ID:Ljava/lang/String; = "deviceID"

.field public static final PARTY_NAME:Ljava/lang/String; = "partyName"

.field public static final PLATFORM:Ljava/lang/String; = "platform"

.field public static final PLATFORM_TOKEN:Ljava/lang/String; = "platformToken"

.field public static final RESULT_MSG:Ljava/lang/String; = "resultMsg"

.field public static final ROLE_ID:Ljava/lang/String; = "roleId"

.field public static final ROLE_LEVEL:Ljava/lang/String; = "roleLevel"

.field public static final ROLE_NAME:Ljava/lang/String; = "roleName"

.field public static final SERVER_ID:Ljava/lang/String; = "serverId"

.field public static final SERVER_NAME:Ljava/lang/String; = "serverName"

.field public static final TOKEN:Ljava/lang/String; = "token"

.field public static final USER_ID:Ljava/lang/String; = "userId"

.field public static final USER_NAME:Ljava/lang/String; = "userName"

.field public static final VIP_LEVEL:Ljava/lang/String; = "vipLevel"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-static {p0, p1, p2}, Lorg/cocos2dx/plugin/UserWrapper;->nativeOnActionResult(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method private static native nativeOnActionResult(Ljava/lang/String;ILjava/lang/String;)V
.end method

.method public static onActionResult(Lorg/cocos2dx/plugin/InterfaceUser;ILjava/lang/String;)V
    .locals 4
    .param p0, "obj"    # Lorg/cocos2dx/plugin/InterfaceUser;
    .param p1, "ret"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 88
    move v2, p1

    .line 89
    .local v2, "curRet":I
    move-object v1, p2

    .line 90
    .local v1, "curMsg":Ljava/lang/String;
    move-object v0, p0

    .line 91
    .local v0, "curAdapter":Lorg/cocos2dx/plugin/InterfaceUser;
    new-instance v3, Lorg/cocos2dx/plugin/UserWrapper$1;

    invoke-direct {v3, v0, v2, v1}, Lorg/cocos2dx/plugin/UserWrapper$1;-><init>(Lorg/cocos2dx/plugin/InterfaceUser;ILjava/lang/String;)V

    invoke-static {v3}, Lorg/cocos2dx/plugin/PluginWrapper;->runOnGLThread(Ljava/lang/Runnable;)V

    .line 99
    return-void
.end method
