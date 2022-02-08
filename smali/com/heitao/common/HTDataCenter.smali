.class public Lcom/heitao/common/HTDataCenter;
.super Ljava/lang/Object;
.source "HTDataCenter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/common/HTDataCenter$1;,
        Lcom/heitao/common/HTDataCenter$HTMethod;
    }
.end annotation


# static fields
.field private static _instance:Lcom/heitao/common/HTDataCenter;


# instance fields
.field private final LOGIN_TIME_INTERVAL:I

.field public mAppUpdateListener:Lcom/heitao/listener/HTAppUpdateListener;

.field public mContext:Landroid/content/Context;

.field public mGameInfo:Lcom/heitao/model/HTGameInfo;

.field public mIsAntiAddiction:I

.field private mLastTimeOfCallDoLoginMethod:J

.field public mSDKInfo:Lcom/heitao/model/HTSDKInfo;

.field public mWeiXinListener:Lcom/heitao/listener/HTWeiXinListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/common/HTDataCenter;->_instance:Lcom/heitao/common/HTDataCenter;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object v0, p0, Lcom/heitao/common/HTDataCenter;->mContext:Landroid/content/Context;

    .line 22
    iput-object v0, p0, Lcom/heitao/common/HTDataCenter;->mGameInfo:Lcom/heitao/model/HTGameInfo;

    .line 24
    iput-object v0, p0, Lcom/heitao/common/HTDataCenter;->mSDKInfo:Lcom/heitao/model/HTSDKInfo;

    .line 26
    iput-object v0, p0, Lcom/heitao/common/HTDataCenter;->mAppUpdateListener:Lcom/heitao/listener/HTAppUpdateListener;

    .line 28
    iput-object v0, p0, Lcom/heitao/common/HTDataCenter;->mWeiXinListener:Lcom/heitao/listener/HTWeiXinListener;

    .line 30
    const/4 v0, 0x0

    iput v0, p0, Lcom/heitao/common/HTDataCenter;->mIsAntiAddiction:I

    .line 33
    const/16 v0, 0x7d0

    iput v0, p0, Lcom/heitao/common/HTDataCenter;->LOGIN_TIME_INTERVAL:I

    .line 34
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/heitao/common/HTDataCenter;->mLastTimeOfCallDoLoginMethod:J

    return-void
.end method

.method public static getInstance()Lcom/heitao/common/HTDataCenter;
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lcom/heitao/common/HTDataCenter;->_instance:Lcom/heitao/common/HTDataCenter;

    if-nez v0, :cond_0

    .line 40
    new-instance v0, Lcom/heitao/common/HTDataCenter;

    invoke-direct {v0}, Lcom/heitao/common/HTDataCenter;-><init>()V

    sput-object v0, Lcom/heitao/common/HTDataCenter;->_instance:Lcom/heitao/common/HTDataCenter;

    .line 43
    :cond_0
    sget-object v0, Lcom/heitao/common/HTDataCenter;->_instance:Lcom/heitao/common/HTDataCenter;

    return-object v0
.end method


# virtual methods
.method public isValidCallMethod(Lcom/heitao/common/HTDataCenter$HTMethod;)Z
    .locals 10
    .param p1, "method"    # Lcom/heitao/common/HTDataCenter$HTMethod;

    .prologue
    .line 48
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 49
    .local v0, "currentTimeMillis":J
    const/4 v4, 0x0

    .line 50
    .local v4, "timeInterval":I
    const-wide/16 v2, 0x0

    .line 52
    .local v2, "lastTimeOfCallMethod":J
    sget-object v5, Lcom/heitao/common/HTDataCenter$1;->$SwitchMap$com$heitao$common$HTDataCenter$HTMethod:[I

    invoke-virtual {p1}, Lcom/heitao/common/HTDataCenter$HTMethod;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 62
    :goto_0
    sub-long v6, v0, v2

    int-to-long v8, v4

    cmp-long v5, v6, v8

    if-gtz v5, :cond_0

    .line 64
    const/4 v5, 0x0

    .line 76
    :goto_1
    return v5

    .line 55
    :pswitch_0
    const/16 v4, 0x7d0

    .line 56
    iget-wide v2, p0, Lcom/heitao/common/HTDataCenter;->mLastTimeOfCallDoLoginMethod:J

    .line 57
    goto :goto_0

    .line 67
    :cond_0
    sget-object v5, Lcom/heitao/common/HTDataCenter$1;->$SwitchMap$com$heitao$common$HTDataCenter$HTMethod:[I

    invoke-virtual {p1}, Lcom/heitao/common/HTDataCenter$HTMethod;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_1

    .line 76
    :goto_2
    const/4 v5, 0x1

    goto :goto_1

    .line 70
    :pswitch_1
    iput-wide v0, p0, Lcom/heitao/common/HTDataCenter;->mLastTimeOfCallDoLoginMethod:J

    goto :goto_2

    .line 52
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch

    .line 67
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
    .end packed-switch
.end method
