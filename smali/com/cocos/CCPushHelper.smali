.class public Lcom/cocos/CCPushHelper;
.super Ljava/lang/Object;
.source "CCPushHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cocos/CCPushHelper$AnalyticsBean;
    }
.end annotation


# static fields
.field protected static gContext:Landroid/content/Context;

.field protected static mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 16
    sput-object v0, Lcom/cocos/CCPushHelper;->gContext:Landroid/content/Context;

    .line 17
    sput-object v0, Lcom/cocos/CCPushHelper;->mCocos2dxActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 189
    return-void
.end method

.method public static cancelAllLocalTimer()I
    .locals 1

    .prologue
    .line 121
    const/4 v0, -0x1

    .line 122
    .local v0, "ret":I
    return v0
.end method

.method public static cancelLocalTimer(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p0, "time"    # Ljava/lang/String;
    .param p1, "notifyText"    # Ljava/lang/String;

    .prologue
    .line 112
    const/4 v0, -0x1

    .line 113
    .local v0, "ret":I
    return v0
.end method

.method public static delAccount()V
    .locals 0

    .prologue
    .line 88
    return-void
.end method

.method public static delSilentTime()I
    .locals 1

    .prologue
    .line 143
    const/4 v0, -0x1

    .line 144
    .local v0, "ret":I
    return v0
.end method

.method public static delTags(Ljava/lang/String;)V
    .locals 0
    .param p0, "srtTags"    # Ljava/lang/String;

    .prologue
    .line 74
    return-void
.end method

.method public static executeAnalytics(Ljava/lang/String;)V
    .locals 0
    .param p0, "eventId"    # Ljava/lang/String;

    .prologue
    .line 220
    return-void
.end method

.method public static executeAnalytics(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 0
    .param p0, "eventId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 224
    .local p1, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    return-void
.end method

.method public static getParams(Landroid/content/Intent;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 169
    const/4 v0, 0x0

    .line 170
    .local v0, "ret":Lorg/json/JSONObject;
    return-object v0
.end method

.method public static getSDKVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    const-string v0, ""

    .line 160
    .local v0, "ret":Ljava/lang/String;
    return-object v0
.end method

.method public static init(Lorg/cocos2dx/lib/Cocos2dxActivity;)V
    .locals 0
    .param p0, "mCocos2dxActivity"    # Lorg/cocos2dx/lib/Cocos2dxActivity;

    .prologue
    .line 24
    return-void
.end method

.method public static init(Lorg/cocos2dx/lib/Cocos2dxActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "mCocos2dxActivity"    # Lorg/cocos2dx/lib/Cocos2dxActivity;
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "channel"    # Ljava/lang/String;

    .prologue
    .line 41
    return-void
.end method

.method public static init(Lorg/cocos2dx/lib/Cocos2dxActivity;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p0, "mCocos2dxActivity"    # Lorg/cocos2dx/lib/Cocos2dxActivity;
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "channel"    # Ljava/lang/String;
    .param p3, "isNotifyForeground"    # Z

    .prologue
    .line 52
    return-void
.end method

.method public static init(Lorg/cocos2dx/lib/Cocos2dxActivity;Z)V
    .locals 0
    .param p0, "mCocos2dxActivity"    # Lorg/cocos2dx/lib/Cocos2dxActivity;
    .param p1, "isNotifyForeground"    # Z

    .prologue
    .line 32
    return-void
.end method

.method public static sendImMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p0, "senderAccount"    # Ljava/lang/String;
    .param p1, "receiverAccount"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;
    .param p3, "msgId"    # Ljava/lang/String;

    .prologue
    .line 182
    const/4 v0, -0x1

    .line 184
    .local v0, "ret":I
    return v0
.end method

.method public static setAccount(Ljava/lang/String;)V
    .locals 0
    .param p0, "account"    # Ljava/lang/String;

    .prologue
    .line 82
    return-void
.end method

.method public static setDebugMode(Z)V
    .locals 0
    .param p0, "debug"    # Z

    .prologue
    .line 152
    return-void
.end method

.method public static setDebugModeForAnalytics(Z)V
    .locals 0
    .param p0, "isDebugMode"    # Z

    .prologue
    .line 216
    return-void
.end method

.method public static setLocalTimer(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p0, "time"    # Ljava/lang/String;
    .param p1, "notifyText"    # Ljava/lang/String;

    .prologue
    .line 99
    const/4 v0, -0x1

    .line 100
    .local v0, "ret":I
    return v0
.end method

.method public static setPushSwitchState(Z)V
    .locals 0
    .param p0, "state"    # Z

    .prologue
    .line 59
    return-void
.end method

.method public static setSilentTime(IIII)I
    .locals 1
    .param p0, "startHour"    # I
    .param p1, "startMinute"    # I
    .param p2, "endHour"    # I
    .param p3, "endMinute"    # I

    .prologue
    .line 134
    const/4 v0, -0x1

    .line 135
    .local v0, "ret":I
    return v0
.end method

.method public static setTags(Ljava/lang/String;)V
    .locals 0
    .param p0, "srtTags"    # Ljava/lang/String;

    .prologue
    .line 66
    return-void
.end method
