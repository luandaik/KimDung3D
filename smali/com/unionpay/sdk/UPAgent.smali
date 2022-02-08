.class public Lcom/unionpay/sdk/UPAgent;
.super Ljava/lang/Object;


# static fields
.field public static ENABLE_MULTI_PROCESS_POST:Z

.field public static LOG_ON:Z

.field private static a:Lcom/unionpay/sdk/y;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/sdk/UPAgent;->LOG_ON:Z

    const/4 v0, 0x0

    sput-boolean v0, Lcom/unionpay/sdk/UPAgent;->ENABLE_MULTI_PROCESS_POST:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static declared-synchronized a(Landroid/content/Context;)V
    .locals 8

    const-class v1, Lcom/unionpay/sdk/UPAgent;

    monitor-enter v1

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    sget-object v0, Lcom/unionpay/sdk/UPAgent;->a:Lcom/unionpay/sdk/y;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {}, Lcom/unionpay/sdk/zz;->a()Lcom/unionpay/sdk/zz;

    move-result-object v0

    sput-object v0, Lcom/unionpay/sdk/UPAgent;->a:Lcom/unionpay/sdk/y;

    sget-boolean v0, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v4, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "dynamic load cost "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long v2, v6, v2

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v4

    invoke-static {v0}, Lcom/unionpay/sdk/k;->b([Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static final declared-synchronized getDeviceId(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    const-class v1, Lcom/unionpay/sdk/UPAgent;

    monitor-enter v1

    :try_start_0
    invoke-static {p0}, Lcom/unionpay/sdk/UPAgent;->a(Landroid/content/Context;)V

    sget-object v0, Lcom/unionpay/sdk/UPAgent;->a:Lcom/unionpay/sdk/y;

    invoke-interface {v0, p0}, Lcom/unionpay/sdk/y;->b(Landroid/content/Context;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    :goto_0
    monitor-exit v1

    return-object v0

    :catch_0
    move-exception v0

    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static final getNFCStatus(Landroid/content/Context;)I
    .locals 1

    invoke-static {p0}, Lcom/unionpay/sdk/h;->b(Landroid/content/Context;)I

    move-result v0

    return v0
.end method

.method public static final declared-synchronized init(Landroid/content/Context;)V
    .locals 2

    const-class v1, Lcom/unionpay/sdk/UPAgent;

    monitor-enter v1

    :try_start_0
    invoke-static {p0}, Lcom/unionpay/sdk/UPAgent;->a(Landroid/content/Context;)V

    sget-object v0, Lcom/unionpay/sdk/UPAgent;->a:Lcom/unionpay/sdk/y;

    invoke-interface {v0, p0}, Lcom/unionpay/sdk/y;->a(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v1

    return-void

    :catch_0
    move-exception v0

    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static final declared-synchronized init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-class v1, Lcom/unionpay/sdk/UPAgent;

    monitor-enter v1

    :try_start_0
    invoke-static {p0}, Lcom/unionpay/sdk/UPAgent;->a(Landroid/content/Context;)V

    sget-object v0, Lcom/unionpay/sdk/UPAgent;->a:Lcom/unionpay/sdk/y;

    invoke-interface {v0, p0, p1, p2}, Lcom/unionpay/sdk/y;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v1

    return-void

    :catch_0
    move-exception v0

    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static final onError(Landroid/content/Context;Ljava/lang/Throwable;)V
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/unionpay/sdk/UPAgent;->a(Landroid/content/Context;)V

    sget-object v0, Lcom/unionpay/sdk/UPAgent;->a:Lcom/unionpay/sdk/y;

    invoke-interface {v0, p0, p1}, Lcom/unionpay/sdk/y;->a(Landroid/content/Context;Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public static final onEvent(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    const-string v0, ""

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lcom/unionpay/sdk/UPAgent;->onEvent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static final onEvent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/unionpay/sdk/UPAgent;->onEvent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static final onEvent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/unionpay/sdk/UPAgent;->a(Landroid/content/Context;)V

    sget-object v0, Lcom/unionpay/sdk/UPAgent;->a:Lcom/unionpay/sdk/y;

    invoke-interface {v0, p0, p1, p2, p3}, Lcom/unionpay/sdk/y;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public static final onPageEnd(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/unionpay/sdk/UPAgent;->a(Landroid/content/Context;)V

    sget-object v0, Lcom/unionpay/sdk/UPAgent;->a:Lcom/unionpay/sdk/y;

    invoke-interface {v0, p0, p1}, Lcom/unionpay/sdk/y;->onPageEnd(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public static final onPageStart(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/unionpay/sdk/UPAgent;->a(Landroid/content/Context;)V

    sget-object v0, Lcom/unionpay/sdk/UPAgent;->a:Lcom/unionpay/sdk/y;

    invoke-interface {v0, p0, p1}, Lcom/unionpay/sdk/y;->onPageStart(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public static final onPause(Landroid/app/Activity;)V
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/unionpay/sdk/UPAgent;->a(Landroid/content/Context;)V

    sget-object v0, Lcom/unionpay/sdk/UPAgent;->a:Lcom/unionpay/sdk/y;

    invoke-interface {v0, p0}, Lcom/unionpay/sdk/y;->b(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public static final onResume(Landroid/app/Activity;)V
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/unionpay/sdk/UPAgent;->a(Landroid/content/Context;)V

    sget-object v0, Lcom/unionpay/sdk/UPAgent;->a:Lcom/unionpay/sdk/y;

    invoke-interface {v0, p0}, Lcom/unionpay/sdk/y;->a(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public static final onResume(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    :try_start_0
    invoke-static {p0}, Lcom/unionpay/sdk/UPAgent;->a(Landroid/content/Context;)V

    sget-object v0, Lcom/unionpay/sdk/UPAgent;->a:Lcom/unionpay/sdk/y;

    invoke-interface {v0, p0, p1, p2}, Lcom/unionpay/sdk/y;->onResume(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public static final removeGlobalKV(Ljava/lang/String;)V
    .locals 3

    sget-boolean v0, Lcom/unionpay/sdk/UPAgent;->LOG_ON:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    const-string v0, "UPLog"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "removeGlobalKV# key:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    sget-object v0, Lcom/unionpay/sdk/d;->a:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static final setAdditionalVersionNameAndCode(Ljava/lang/String;J)V
    .locals 1

    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/unionpay/sdk/ag;->a(Ljava/lang/String;J)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method

.method public static final setGlobalKV(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3

    sget-boolean v0, Lcom/unionpay/sdk/UPAgent;->LOG_ON:Z

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    const-string v0, "UPLog"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "setGlobalKV# key:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " value:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    sget-object v0, Lcom/unionpay/sdk/d;->a:Ljava/util/Map;

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static setPushDisabled()V
    .locals 0

    invoke-static {}, Lcom/unionpay/sdk/ag;->a()V

    return-void
.end method

.method public static final setReportUncaughtExceptions(Z)V
    .locals 3

    :try_start_0
    sput-boolean p0, Lcom/unionpay/sdk/d;->b:Z

    sget-boolean v0, Lcom/unionpay/sdk/UPAgent;->LOG_ON:Z

    if-eqz v0, :cond_0

    const-string v0, "UPLog"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "[PreSettings] setReportUncaughtExceptions: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method
