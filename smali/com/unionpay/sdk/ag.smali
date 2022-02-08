.class final Lcom/unionpay/sdk/ag;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unionpay/sdk/ag$b;,
        Lcom/unionpay/sdk/ag$a;,
        Lcom/unionpay/sdk/ag$c;
    }
.end annotation


# static fields
.field static a:Z

.field static volatile b:Z

.field static volatile c:Z

.field static d:Z

.field static e:Z

.field static f:Z

.field static g:Lcom/unionpay/sdk/bi;

.field private static final h:Landroid/os/HandlerThread;

.field private static i:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    sput-boolean v0, Lcom/unionpay/sdk/ag;->a:Z

    sput-boolean v0, Lcom/unionpay/sdk/ag;->b:Z

    sput-boolean v0, Lcom/unionpay/sdk/ag;->c:Z

    sput-boolean v0, Lcom/unionpay/sdk/ag;->d:Z

    sput-boolean v0, Lcom/unionpay/sdk/ag;->e:Z

    sput-boolean v0, Lcom/unionpay/sdk/ag;->f:Z

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "PauseEventThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/unionpay/sdk/ag;->h:Landroid/os/HandlerThread;

    const/4 v0, 0x0

    sput-object v0, Lcom/unionpay/sdk/ag;->i:Landroid/os/Handler;

    sget-object v0, Lcom/unionpay/sdk/ag;->h:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Lcom/unionpay/sdk/ah;

    sget-object v1, Lcom/unionpay/sdk/ag;->h:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/unionpay/sdk/ah;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/unionpay/sdk/ag;->i:Landroid/os/Handler;

    return-void
.end method

.method private static a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static final a(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 5

    const/16 v0, 0x32

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\r\n"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    array-length v1, v3

    if-le v1, v0, :cond_0

    :goto_0
    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_1

    const-string v4, "\t"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v4, v3, v1

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "\r\n"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_0
    array-length v0, v3

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_2

    const/4 v1, 0x1

    invoke-static {v2, v3, v0, v1}, Lcom/unionpay/sdk/ag;->a(Ljava/lang/StringBuilder;[Ljava/lang/StackTraceElement;Ljava/lang/Throwable;I)V

    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static final a()V
    .locals 1

    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/sdk/ag;->f:Z

    return-void
.end method

.method static final a(Landroid/app/Activity;)V
    .locals 2

    if-nez p0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/unionpay/sdk/ag;->a(Landroid/app/Activity;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method static final a(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/unionpay/sdk/o;->f()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/unionpay/sdk/o;->f()Ljava/lang/String;

    move-result-object v0

    const-string v1, "2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/unionpay/sdk/ag;->b()V

    :cond_0
    sget-object v0, Lcom/unionpay/sdk/ag;->i:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    const-string v0, "0"

    invoke-static {v0}, Lcom/unionpay/sdk/o;->b(Ljava/lang/String;)V

    sget-boolean v0, Lcom/unionpay/sdk/ag;->b:Z

    if-nez v0, :cond_1

    invoke-static {p0, p1, p2}, Lcom/unionpay/sdk/ag;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/unionpay/sdk/ak;

    invoke-direct {v1, p0, v0}, Lcom/unionpay/sdk/ak;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/unionpay/sdk/r;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static final a(Landroid/app/Activity;Ljava/lang/String;Z)V
    .locals 2

    sget-boolean v0, Lcom/unionpay/sdk/ag;->b:Z

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/unionpay/sdk/ag;->a(Landroid/content/Context;)V

    :cond_0
    invoke-static {}, Lcom/unionpay/sdk/o;->f()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/unionpay/sdk/o;->f()Ljava/lang/String;

    move-result-object v0

    const-string v1, "2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/unionpay/sdk/ag;->b()V

    :cond_1
    sget-object v0, Lcom/unionpay/sdk/ag;->i:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    const-string v0, "0"

    invoke-static {v0}, Lcom/unionpay/sdk/o;->b(Ljava/lang/String;)V

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/app/Activity;->getChangingConfigurations()I

    move-result v0

    and-int/lit16 v0, v0, 0x80

    const/16 v1, 0x80

    if-ne v0, v1, :cond_2

    const-string v0, "Ignore page changing during screen switch"

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/sdk/ag;->d:Z

    :goto_0
    return-void

    :cond_2
    new-instance v0, Lcom/unionpay/sdk/aj;

    invoke-direct {v0, p1, p2, p0}, Lcom/unionpay/sdk/aj;-><init>(Ljava/lang/String;ZLandroid/app/Activity;)V

    invoke-static {v0}, Lcom/unionpay/sdk/r;->execute(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method static final a(Landroid/content/Context;)V
    .locals 3

    sget-boolean v0, Lcom/unionpay/sdk/ag;->b:Z

    if-nez v0, :cond_5

    if-nez p0, :cond_0

    :goto_0
    return-void

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "UP_APP_ID"

    invoke-static {v0, v1}, Lcom/unionpay/sdk/ag;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "UP_CHANNEL_ID"

    invoke-static {v0, v2}, Lcom/unionpay/sdk/ag;->a(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    const-string v0, "[SDKInit] UP_APP_ID not found in AndroidManifest.xml!"

    invoke-static {v0}, Lcom/unionpay/sdk/k;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "[SDKInit] Failed to initialize!"

    invoke-static {v1, v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_2
    if-eqz v0, :cond_3

    :try_start_1
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    const-string v0, "Default"

    :cond_4
    const/4 v2, 0x1

    invoke-static {p0, v1, v0, v2}, Lcom/unionpay/sdk/ag;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :cond_5
    invoke-static {}, Lcom/unionpay/sdk/ag;->g()V

    invoke-static {}, Lcom/unionpay/sdk/ag;->b()V

    goto :goto_0
.end method

.method static final a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onPageStart being called!, pagename: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    sget-boolean v0, Lcom/unionpay/sdk/ag;->d:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    sput-boolean v0, Lcom/unionpay/sdk/ag;->d:Z

    :goto_0
    return-void

    :cond_0
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_2

    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    invoke-virtual {v0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object p1

    :cond_2
    const/4 v0, 0x6

    invoke-static {p0, p1, v0}, Lcom/unionpay/sdk/ag;->a(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method private static final a(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1

    if-eqz p0, :cond_0

    sget-boolean v0, Lcom/unionpay/sdk/ag;->b:Z

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/unionpay/sdk/ag;->a(Landroid/content/Context;)V

    :cond_0
    new-instance v0, Lcom/unionpay/sdk/am;

    invoke-direct {v0, p2, p1}, Lcom/unionpay/sdk/am;-><init>(ILjava/lang/String;)V

    invoke-static {v0}, Lcom/unionpay/sdk/r;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static final a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    if-nez p0, :cond_0

    const-string v0, "Init failed Context is null"

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/unionpay/sdk/ag;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method static final a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 1

    new-instance v0, Lcom/unionpay/sdk/ai;

    invoke-direct {v0, p1, p2, p3, p0}, Lcom/unionpay/sdk/ai;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Landroid/content/Context;)V

    invoke-static {v0}, Lcom/unionpay/sdk/r;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static final a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 8

    const/4 v1, 0x0

    const/4 v0, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-boolean v4, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "[TimeSpan] Init Begin at: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    :cond_0
    const-string v4, "UPLog"

    sput-object v4, Lcom/unionpay/sdk/r;->c:Ljava/lang/String;

    sget-boolean v4, Lcom/unionpay/sdk/ag;->b:Z

    if-nez v4, :cond_3

    if-nez p0, :cond_2

    :try_start_0
    const-string v0, "Init failed Context is null"

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    sput-object v4, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    if-nez p3, :cond_5

    if-eqz p0, :cond_4

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_4

    :goto_1
    if-nez v0, :cond_5

    const-string v0, "[SDKInit] Failed to initialize due to invalid input."

    invoke-static {v0}, Lcom/unionpay/sdk/k;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "[SDKInit] Failed to initialize!"

    invoke-static {v1, v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    new-instance v0, Lcom/unionpay/sdk/ag$c;

    invoke-direct {v0}, Lcom/unionpay/sdk/ag$c;-><init>()V

    invoke-static {v0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    sget-boolean v0, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v0, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "[TimeSpan] Init End at: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "[TimeSpan] Init duration: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    move v0, v1

    goto :goto_1

    :cond_5
    :try_start_1
    const-string v0, "android.permission.INTERNET"

    invoke-static {p0, v0}, Lcom/unionpay/sdk/r;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "[SDKInit] Permission \"android.permission.INTERNET\" is needed."

    invoke-static {v0}, Lcom/unionpay/sdk/k;->b(Ljava/lang/String;)V

    :goto_3
    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/sdk/ag;->b:Z

    goto :goto_2

    :cond_6
    const-string v0, "ChannelConfig.json"

    invoke-static {p0, v0}, Lcom/unionpay/sdk/r;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_c

    :cond_7
    :goto_4
    invoke-static {p1, p2}, Lcom/unionpay/sdk/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    invoke-static {}, Lcom/unionpay/sdk/ar;->a()Lcom/unionpay/sdk/ar;

    move-result-object v0

    invoke-static {}, Lcom/unionpay/sdk/u;->a()Lcom/unionpay/sdk/u;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/unionpay/sdk/ar;->register(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    :goto_5
    const/16 v0, 0xe

    :try_start_3
    invoke-static {v0}, Lcom/unionpay/sdk/r;->a(I)Z
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0

    move-result v0

    if-eqz v0, :cond_b

    const/4 v0, 0x0

    :try_start_4
    sget-object v1, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    instance-of v1, v1, Landroid/app/Activity;

    if-eqz v1, :cond_a

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    :cond_8
    :goto_6
    if-eqz v0, :cond_9

    sget-boolean v1, Lcom/unionpay/sdk/ag;->e:Z

    if-nez v1, :cond_9

    const-string v1, "android.app.Application$ActivityLifecycleCallbacks"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "registerActivityLifecycleCallbacks"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-instance v4, Lcom/unionpay/sdk/bi;

    invoke-direct {v4}, Lcom/unionpay/sdk/bi;-><init>()V

    sput-object v4, Lcom/unionpay/sdk/ag;->g:Lcom/unionpay/sdk/bi;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    sget-object v6, Lcom/unionpay/sdk/ag;->g:Lcom/unionpay/sdk/bi;

    aput-object v6, v4, v5

    invoke-virtual {v1, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/sdk/ag;->e:Z
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2

    :cond_9
    :goto_7
    :try_start_5
    invoke-static {}, Lcom/unionpay/sdk/ag;->g()V

    new-instance v0, Lcom/unionpay/sdk/ao;

    invoke-direct {v0, p0}, Lcom/unionpay/sdk/ao;-><init>(Landroid/content/Context;)V

    invoke-static {v0}, Lcom/unionpay/sdk/r;->execute(Ljava/lang/Runnable;)V

    goto :goto_3

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/Throwable;)V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_5

    :cond_a
    :try_start_6
    sget-object v1, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    instance-of v1, v1, Landroid/app/Application;

    if-eqz v1, :cond_8

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    check-cast v0, Landroid/app/Application;
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_6

    :catch_2
    move-exception v0

    :try_start_7
    sget-boolean v1, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v1, :cond_9

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_7

    :cond_b
    new-instance v0, Lcom/unionpay/sdk/ap;

    invoke-direct {v0, p0}, Lcom/unionpay/sdk/ap;-><init>(Landroid/content/Context;)V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_0

    :try_start_8
    const-string v1, "android.app.ActivityManagerNative"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v4, "gDefault"

    const-string v5, "android.app.IActivityManager"

    invoke-static {v1, v0, v4, v5}, Lcom/unionpay/sdk/r;->a(Ljava/lang/Class;Lcom/unionpay/sdk/m;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/sdk/ag;->e:Z
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_3

    goto :goto_7

    :catch_3
    move-exception v0

    :try_start_9
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "registerActivityLifecycleListener "

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->b(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_0

    goto :goto_7

    :cond_c
    move-object p2, v0

    goto/16 :goto_4
.end method

.method static final a(Landroid/content/Context;Ljava/lang/Throwable;)V
    .locals 1

    new-instance v0, Lcom/unionpay/sdk/an;

    invoke-direct {v0, p1, p0}, Lcom/unionpay/sdk/an;-><init>(Ljava/lang/Throwable;Landroid/content/Context;)V

    invoke-static {v0}, Lcom/unionpay/sdk/r;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static final a(Ljava/lang/String;J)V
    .locals 3

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    const-string v1, "UPpref_longtime"

    const-string v2, "UPadditionalVersionName"

    invoke-static {v0, v1, v2, p0}, Lcom/unionpay/sdk/l;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    const-string v1, "UPpref_longtime"

    const-string v2, "UPadditionalVersionCode"

    invoke-static {v0, v1, v2, p1, p2}, Lcom/unionpay/sdk/l;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)V

    :cond_1
    return-void
.end method

.method private static final a(Ljava/lang/StringBuilder;[Ljava/lang/StackTraceElement;Ljava/lang/Throwable;I)V
    .locals 7

    const/16 v2, 0x32

    :goto_0
    invoke-virtual {p2}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    array-length v1, v0

    add-int/lit8 v3, v1, -0x1

    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    move v6, v1

    move v1, v3

    move v3, v6

    :goto_1
    if-ltz v1, :cond_0

    if-ltz v3, :cond_0

    aget-object v4, v0, v1

    aget-object v5, p1, v3

    invoke-virtual {v4, v5}, Ljava/lang/StackTraceElement;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    add-int/lit8 v4, v1, -0x1

    add-int/lit8 v1, v3, -0x1

    move v3, v1

    move v1, v4

    goto :goto_1

    :cond_0
    if-le v1, v2, :cond_1

    move v1, v2

    :cond_1
    const-string v3, "Caused by : "

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "\r\n"

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    :goto_2
    if-gt v3, v1, :cond_2

    const-string v4, "\t"

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v4, v0, v3

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "\r\n"

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_2
    const/4 v1, 0x5

    if-lt p3, v1, :cond_4

    :cond_3
    return-void

    :cond_4
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_3

    add-int/lit8 p3, p3, 0x1

    move-object p1, v0

    goto :goto_0
.end method

.method static final a(Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 7

    const/4 v1, 0x0

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    move-object v0, p0

    :goto_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ":"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    move v0, v1

    :goto_2
    const/4 v5, 0x3

    if-ge v0, v5, :cond_7

    array-length v5, v2

    if-ge v1, v5, :cond_7

    aget-object v5, v2, v1

    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "java."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    const-string v6, "java."

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    :cond_2
    const-string v6, "javax."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    const-string v6, "javax."

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    :cond_3
    const-string v6, "android."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    const-string v6, "android."

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    :cond_4
    const-string v6, "com.android."

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    const-string v5, "com.android."

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    :cond_5
    aget-object v5, v2, v1

    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_7
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    :goto_3
    invoke-static {}, Lcom/unionpay/sdk/t;->a()Lcom/unionpay/sdk/t;

    move-result-object v2

    invoke-virtual {v2}, Lcom/unionpay/sdk/bg;->b()V

    invoke-static {}, Lcom/unionpay/sdk/t;->a()Lcom/unionpay/sdk/t;

    move-result-object v2

    invoke-static {p0}, Lcom/unionpay/sdk/ag;->a(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v1, v3}, Lcom/unionpay/sdk/bg;->a(JLjava/lang/String;)J

    invoke-static {}, Lcom/unionpay/sdk/t;->a()Lcom/unionpay/sdk/t;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/sdk/bg;->c()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/unionpay/sdk/o;->a(J)V

    goto/16 :goto_0

    :cond_8
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_3
.end method

.method static final b(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    if-eqz p0, :cond_0

    sget-boolean v0, Lcom/unionpay/sdk/ag;->b:Z

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/unionpay/sdk/d;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Lcom/unionpay/sdk/d;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/unionpay/sdk/ag;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    invoke-static {p0}, Lcom/unionpay/sdk/g;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static b()V
    .locals 4

    new-instance v0, Lcom/unionpay/sdk/ag$a;

    invoke-direct {v0}, Lcom/unionpay/sdk/ag$a;-><init>()V

    iget-object v1, v0, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "apiType"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v0, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "controller"

    invoke-static {}, Lcom/unionpay/sdk/af;->a()Lcom/unionpay/sdk/af;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    const/16 v2, 0x66

    iput v2, v1, Landroid/os/Message;->what:I

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-static {}, Lcom/unionpay/sdk/bk;->a()Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void
.end method

.method static final b(Landroid/app/Activity;)V
    .locals 2

    if-nez p0, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/unionpay/sdk/ag;->b(Landroid/app/Activity;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method static final b(Landroid/app/Activity;Ljava/lang/String;Z)V
    .locals 4

    const/4 v1, 0x0

    const-string v0, "1"

    invoke-static {v0}, Lcom/unionpay/sdk/o;->b(Ljava/lang/String;)V

    new-instance v0, Lcom/unionpay/sdk/al;

    invoke-direct {v0, p1, p0, p2}, Lcom/unionpay/sdk/al;-><init>(Ljava/lang/String;Landroid/app/Activity;Z)V

    invoke-static {v0}, Lcom/unionpay/sdk/r;->execute(Ljava/lang/Runnable;)V

    sget-object v0, Lcom/unionpay/sdk/ag;->i:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    sget-object v0, Lcom/unionpay/sdk/ag;->i:Landroid/os/Handler;

    sget-wide v2, Lcom/unionpay/sdk/d;->k:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method static final b(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onPageEnd being called! pageName: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    const/4 v0, 0x0

    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_1

    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object p1

    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/app/Activity;->getChangingConfigurations()I

    move-result v0

    and-int/lit16 v0, v0, 0x80

    const/16 v1, 0x80

    if-ne v0, v1, :cond_2

    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/sdk/ag;->d:Z

    :goto_0
    return-void

    :cond_2
    const/4 v0, 0x7

    invoke-static {p0, p1, v0}, Lcom/unionpay/sdk/ag;->a(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method static c()Ljava/nio/channels/FileChannel;
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/File;

    sget-object v2, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "td.lock"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    :cond_0
    new-instance v2, Ljava/io/RandomAccessFile;

    const-string v3, "rw"

    invoke-direct {v2, v1, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v0

    :cond_1
    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    move-object v2, v0

    :goto_1
    :try_start_2
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :cond_2
    :goto_2
    sget-boolean v2, Lcom/unionpay/sdk/UPAgent;->LOG_ON:Z

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v2

    sget-boolean v3, Lcom/unionpay/sdk/UPAgent;->LOG_ON:Z

    if-eqz v3, :cond_2

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1
.end method

.method static d()V
    .locals 0

    return-void
.end method

.method static synthetic e()V
    .locals 8

    const/4 v0, 0x1

    :try_start_0
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Determine if app is quiting, after being waited for "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-wide v4, Lcom/unionpay/sdk/d;->k:J

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " sec, now isAppQuiting = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/unionpay/sdk/o;->f()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a([Ljava/lang/String;)V

    invoke-static {}, Lcom/unionpay/sdk/o;->f()Ljava/lang/String;

    move-result-object v0

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/unionpay/sdk/ag$b;->a()Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    new-instance v0, Lcom/unionpay/sdk/ag$a;

    invoke-direct {v0}, Lcom/unionpay/sdk/ag$a;-><init>()V

    iget-object v1, v0, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "apiType"

    const/4 v3, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v0, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "occurTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v0, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "sessionEnd"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/unionpay/sdk/bk;->a()Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0x66

    invoke-static {v1, v2, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    const-string v0, "2"

    invoke-static {v0}, Lcom/unionpay/sdk/o;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic f()V
    .locals 5

    invoke-static {}, Lcom/unionpay/sdk/o;->d()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-object v2, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    if-eqz v2, :cond_0

    sget-object v2, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    const-string v3, "UPpref_longtime"

    const-string v4, "UPpref.init.key"

    invoke-static {v2, v3, v4, v0, v1}, Lcom/unionpay/sdk/l;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Lcom/unionpay/sdk/o;->d()J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x5265c00

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/sdk/r;->e:Z

    goto :goto_0
.end method

.method private static g()V
    .locals 0

    invoke-static {}, Lcom/unionpay/sdk/af;->a()Lcom/unionpay/sdk/af;

    invoke-static {}, Lcom/unionpay/sdk/ad;->a()Lcom/unionpay/sdk/ad;

    invoke-static {}, Lcom/unionpay/sdk/ae;->a()Lcom/unionpay/sdk/ae;

    invoke-static {}, Lcom/unionpay/sdk/c;->a()Lcom/unionpay/sdk/c;

    return-void
.end method
