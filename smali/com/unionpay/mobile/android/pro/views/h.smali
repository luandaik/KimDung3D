.class public Lcom/unionpay/mobile/android/pro/views/h;
.super Lcom/unionpay/mobile/android/nocard/views/l;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/unionpay/mobile/android/nocard/views/l;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic a(Lcom/unionpay/mobile/android/pro/views/h;)V
    .locals 0

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pro/views/h;->z()V

    return-void
.end method


# virtual methods
.method public final B()V
    .locals 9

    const/4 v1, 0x0

    const/16 v8, 0x31

    new-instance v2, Ljava/lang/StringBuffer;

    const-string v0, "000"

    invoke-direct {v2, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x0

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/h;->a:Lcom/unionpay/mobile/android/model/b;

    sget-boolean v3, Lcom/unionpay/mobile/android/model/b;->ba:Z

    if-eqz v3, :cond_0

    new-instance v0, Lcom/unionpay/mobile/android/utils/k;

    invoke-direct {v0}, Lcom/unionpay/mobile/android/utils/k;-><init>()V

    :cond_0
    if-eqz v0, :cond_4

    invoke-static {}, Lcom/unionpay/mobile/android/utils/k;->a()Lorg/simalliance/openmobileapi/SEService;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/unionpay/mobile/android/utils/k;->a()Lorg/simalliance/openmobileapi/SEService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/simalliance/openmobileapi/SEService;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/unionpay/mobile/android/utils/k;->a()Lorg/simalliance/openmobileapi/SEService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/simalliance/openmobileapi/SEService;->getReaders()[Lorg/simalliance/openmobileapi/Reader;

    move-result-object v3

    array-length v4, v3

    move v0, v1

    :goto_0
    if-ge v0, v4, :cond_4

    aget-object v5, v3, v0

    if-eqz v5, :cond_3

    invoke-virtual {v5}, Lorg/simalliance/openmobileapi/Reader;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "sim"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v2, v1, v8}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    :cond_1
    invoke-virtual {v5}, Lorg/simalliance/openmobileapi/Reader;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "ese"

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    const/4 v6, 0x1

    invoke-virtual {v2, v6, v8}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    :cond_2
    invoke-virtual {v5}, Lorg/simalliance/openmobileapi/Reader;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    const-string v6, "sd"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v5, 0x2

    invoke-virtual {v2, v5, v8}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/unionpay/mobile/android/pro/views/h;->d(Ljava/lang/String;)V

    return-void
.end method

.method public C()Lcom/unionpay/mobile/android/pro/pboc/engine/b;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected final t()V
    .locals 2

    :try_start_0
    const-string v0, "org.simalliance.openmobileapi.SEService"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/h;->a:Lcom/unionpay/mobile/android/model/b;

    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/mobile/android/model/b;->ba:Z

    new-instance v0, Lcom/unionpay/mobile/android/utils/k;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/h;->d:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Lcom/unionpay/mobile/android/utils/k;-><init>(Landroid/content/Context;Lcom/unionpay/mobile/android/nocard/views/b;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/h;->a:Lcom/unionpay/mobile/android/model/b;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/unionpay/mobile/android/model/b;->ba:Z

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pro/views/h;->u()V

    goto :goto_0
.end method

.method public final y()V
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "uppay-pro"

    const-string v1, "checkAndGetSDCardsList +++"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "00"

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/h;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/plugin/c;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "95"

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/h;->a:Lcom/unionpay/mobile/android/model/b;

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->I:Lcom/unionpay/mobile/android/plugin/c;

    iget-object v1, v1, Lcom/unionpay/mobile/android/plugin/c;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pro/views/h;->C()Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    move-result-object v1

    new-instance v2, Lcom/unionpay/mobile/android/pro/views/i;

    invoke-direct {v2, p0}, Lcom/unionpay/mobile/android/pro/views/i;-><init>(Lcom/unionpay/mobile/android/pro/views/h;)V

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/pro/views/h;->C()Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    move-result-object v1

    invoke-virtual {v1, v2, v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/a;Z)V

    :goto_1
    const-string v0, "uppay-pro"

    const-string v1, "checkAndGetSDCardsList ---"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit p0

    return-void

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    invoke-interface {v2, v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/a;->a(Ljava/util/ArrayList;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
