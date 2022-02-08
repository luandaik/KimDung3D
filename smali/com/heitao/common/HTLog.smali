.class public Lcom/heitao/common/HTLog;
.super Ljava/lang/Object;
.source "HTLog.java"


# static fields
.field public static mLogEnable:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 7
    const/4 v0, 0x0

    sput-boolean v0, Lcom/heitao/common/HTLog;->mLogEnable:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Ljava/lang/String;)V
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 29
    sget-boolean v0, Lcom/heitao/common/HTConsts;->HTSDK_DEBUG:Z

    if-eqz v0, :cond_0

    .line 31
    const-string v0, "HTGameProxySDK"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;)V
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 11
    const-string v0, "HTGameProxySDK"

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    return-void
.end method

.method public static i(Ljava/lang/String;)V
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 16
    const-string v0, "HTGameProxySDK"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    return-void
.end method

.method public static w(Ljava/lang/String;)V
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 21
    sget-boolean v0, Lcom/heitao/common/HTLog;->mLogEnable:Z

    if-eqz v0, :cond_0

    .line 23
    const-string v0, "HTGameProxySDK"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    :cond_0
    return-void
.end method
