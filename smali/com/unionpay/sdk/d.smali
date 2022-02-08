.class final Lcom/unionpay/sdk/d;
.super Ljava/lang/Object;


# static fields
.field static final a:Ljava/util/Map;

.field static b:Z

.field static c:Landroid/content/Context;

.field static d:Landroid/os/Handler;

.field static e:Ljava/nio/channels/FileChannel;

.field static f:J

.field static g:Ljava/lang/String;

.field static h:Ljava/lang/String;

.field static i:Ljava/lang/String;

.field static j:J

.field static k:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v1, 0x0

    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    sput-object v0, Lcom/unionpay/sdk/d;->a:Ljava/util/Map;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/unionpay/sdk/d;->b:Z

    sput-object v1, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    sput-object v1, Lcom/unionpay/sdk/d;->d:Landroid/os/Handler;

    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/unionpay/sdk/d;->f:J

    const-string v0, ""

    sput-object v0, Lcom/unionpay/sdk/d;->g:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/unionpay/sdk/d;->h:Ljava/lang/String;

    const-string v0, "Default"

    sput-object v0, Lcom/unionpay/sdk/d;->i:Ljava/lang/String;

    const-wide/16 v0, 0x7530

    sput-wide v0, Lcom/unionpay/sdk/d;->k:J

    return-void
.end method

.method static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/unionpay/sdk/d;->g:Ljava/lang/String;

    invoke-static {v0}, Lcom/unionpay/sdk/r;->b(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "UP_app_pefercen_profile"

    const-string v1, "UP_appId"

    const-string v2, ""

    invoke-static {p0, v0, v1, v2}, Lcom/unionpay/sdk/l;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/unionpay/sdk/d;->g:Ljava/lang/String;

    :cond_0
    sget-object v0, Lcom/unionpay/sdk/d;->g:Ljava/lang/String;

    return-object v0
.end method

.method static a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    if-eqz v0, :cond_0

    new-instance v0, Landroid/os/Handler;

    sget-object v1, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/unionpay/sdk/d;->d:Landroid/os/Handler;

    :cond_0
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "-"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "-"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aget-object v0, v1, v2
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    sput-object v0, Lcom/unionpay/sdk/d;->g:Ljava/lang/String;

    :goto_1
    invoke-static {}, Lcom/unionpay/sdk/ag;->d()V

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    sput-object p1, Lcom/unionpay/sdk/d;->i:Ljava/lang/String;

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Analytics SDK Initializing..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n\tSDK_VERSION is: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "Android+UP+V2.2.8"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n\tApp ID is: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/unionpay/sdk/d;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n\tApp Channel is: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/unionpay/sdk/d;->i:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    const-string v1, "UP_app_pefercen_profile"

    const-string v2, "UP_appId"

    sget-object v3, Lcom/unionpay/sdk/d;->g:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lcom/unionpay/sdk/l;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    const-string v1, "UP_app_pefercen_profile"

    const-string v2, "UP_channelId"

    sget-object v3, Lcom/unionpay/sdk/d;->i:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lcom/unionpay/sdk/l;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    sput-object p0, Lcom/unionpay/sdk/d;->g:Ljava/lang/String;

    goto :goto_1

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static b(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/unionpay/sdk/d;->i:Ljava/lang/String;

    invoke-static {v0}, Lcom/unionpay/sdk/r;->b(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/unionpay/sdk/d;->i:Ljava/lang/String;

    const-string v1, "Default"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const-string v0, "UP_app_pefercen_profile"

    const-string v1, "UP_channelId"

    const-string v2, ""

    invoke-static {p0, v0, v1, v2}, Lcom/unionpay/sdk/l;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/unionpay/sdk/d;->i:Ljava/lang/String;

    :cond_1
    sget-object v0, Lcom/unionpay/sdk/d;->i:Ljava/lang/String;

    return-object v0
.end method
