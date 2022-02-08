.class Lcom/unionpay/sdk/af;
.super Lcom/unionpay/sdk/bh;


# static fields
.field private static volatile a:Lcom/unionpay/sdk/af;


# instance fields
.field private b:Ljava/util/HashMap;

.field private c:Lcom/unionpay/sdk/bg;

.field private d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    sput-object v0, Lcom/unionpay/sdk/af;->a:Lcom/unionpay/sdk/af;

    :try_start_0
    invoke-static {}, Lcom/unionpay/sdk/ar;->a()Lcom/unionpay/sdk/ar;

    move-result-object v0

    invoke-static {}, Lcom/unionpay/sdk/af;->a()Lcom/unionpay/sdk/af;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/unionpay/sdk/ar;->register(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/unionpay/sdk/bh;-><init>()V

    invoke-static {}, Lcom/unionpay/sdk/t;->a()Lcom/unionpay/sdk/t;

    move-result-object v0

    iput-object v0, p0, Lcom/unionpay/sdk/af;->c:Lcom/unionpay/sdk/bg;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/sdk/af;->d:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/unionpay/sdk/af;->b:Ljava/util/HashMap;

    return-void
.end method

.method public static a()Lcom/unionpay/sdk/af;
    .locals 2

    sget-object v0, Lcom/unionpay/sdk/af;->a:Lcom/unionpay/sdk/af;

    if-nez v0, :cond_1

    const-class v1, Lcom/unionpay/sdk/af;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/unionpay/sdk/af;->a:Lcom/unionpay/sdk/af;

    if-nez v0, :cond_0

    new-instance v0, Lcom/unionpay/sdk/af;

    invoke-direct {v0}, Lcom/unionpay/sdk/af;-><init>()V

    sput-object v0, Lcom/unionpay/sdk/af;->a:Lcom/unionpay/sdk/af;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/unionpay/sdk/af;->a:Lcom/unionpay/sdk/af;

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private final a(Ljava/lang/String;)V
    .locals 11

    const/4 v10, 0x1

    const/4 v9, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/unionpay/sdk/o;->c()J

    move-result-wide v2

    invoke-static {}, Lcom/unionpay/sdk/o;->e()J

    move-result-wide v4

    sub-long v0, v4, v2

    const-wide/16 v6, 0x1f4

    cmp-long v6, v0, v6

    if-gez v6, :cond_0

    const-wide/16 v0, -0x3e8

    :cond_0
    sget-boolean v6, Lcom/unionpay/sdk/ag;->a:Z

    if-eqz v6, :cond_1

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "sessionStartTime   = %d\n"

    new-array v8, v10, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "sessionTempEndTime = %d\n"

    new-array v3, v10, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v9

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "duration           = %d"

    new-array v3, v10, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v9

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-array v2, v10, [Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v9

    invoke-static {v2}, Lcom/unionpay/sdk/k;->a([Ljava/lang/String;)V

    :cond_1
    iget-object v2, p0, Lcom/unionpay/sdk/af;->c:Lcom/unionpay/sdk/bg;

    long-to-int v0, v0

    div-int/lit16 v0, v0, 0x3e8

    invoke-virtual {v2, p1, v0}, Lcom/unionpay/sdk/bg;->a(Ljava/lang/String;I)J

    :cond_2
    return-void
.end method


# virtual methods
.method public final onTDEBEventSession(Lcom/unionpay/sdk/ag$a;)V
    .locals 12

    const-wide/16 v4, 0x0

    const/4 v2, 0x2

    const/4 v6, 0x1

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v1, "apiType"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    if-eq v0, v6, :cond_2

    if-eq v0, v2, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x6

    if-eq v0, v1, :cond_2

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    :cond_2
    iget-object v0, p1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v1, "controller"

    invoke-static {}, Lcom/unionpay/sdk/af;->a()Lcom/unionpay/sdk/af;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v1, "occurTime"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v7, p1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    :try_start_0
    const-string v0, "apiType"

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    :pswitch_1
    invoke-static {}, Lcom/unionpay/sdk/c;->a()Lcom/unionpay/sdk/c;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/unionpay/sdk/c;->a(Z)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/Throwable;)V

    goto :goto_0

    :pswitch_2
    :try_start_1
    invoke-static {}, Lcom/unionpay/sdk/o;->c()J

    move-result-wide v2

    invoke-static {}, Lcom/unionpay/sdk/o;->e()J

    move-result-wide v0

    cmp-long v8, v0, v2

    if-lez v8, :cond_5

    :goto_1
    const-string v2, "occurTime"

    invoke-virtual {v7, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    sub-long v0, v2, v0

    sget-wide v8, Lcom/unionpay/sdk/d;->k:J

    cmp-long v0, v0, v8

    if-lez v0, :cond_8

    const-string v0, "[Session] - New session!"

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    invoke-static {}, Lcom/unionpay/sdk/o;->b()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/unionpay/sdk/af;->a(Ljava/lang/String;)V

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/unionpay/sdk/o;->e()J

    move-result-wide v10

    sub-long v8, v2, v10

    cmp-long v0, v4, v10

    if-nez v0, :cond_6

    :goto_2
    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    if-eqz v0, :cond_7

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/unionpay/sdk/j;->c(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_7

    :goto_3
    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    if-eqz v0, :cond_3

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    const-string v7, "UPpref_longtime"

    const-string v8, "UPpref.session.key"

    invoke-static {v0, v7, v8, v1}, Lcom/unionpay/sdk/l;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    if-eqz v0, :cond_4

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    const-string v7, "UPpref_longtime"

    const-string v8, "UPpref.start.key"

    invoke-static {v0, v7, v8, v2, v3}, Lcom/unionpay/sdk/l;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)V

    :cond_4
    iget-object v0, p0, Lcom/unionpay/sdk/af;->c:Lcom/unionpay/sdk/bg;

    invoke-virtual/range {v0 .. v6}, Lcom/unionpay/sdk/bg;->a(Ljava/lang/String;JJI)J

    move-result-wide v2

    const-string v0, "sessionId: %s, status: %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    const/4 v1, 0x1

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v1

    invoke-static {v0, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    const-string v0, ""

    invoke-static {v0}, Lcom/unionpay/sdk/o;->a(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unionpay/sdk/af;->d:Z

    :goto_4
    invoke-static {}, Lcom/unionpay/sdk/c;->a()Lcom/unionpay/sdk/c;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/unionpay/sdk/c;->a(Z)V

    goto/16 :goto_0

    :cond_5
    move-wide v0, v2

    goto/16 :goto_1

    :cond_6
    move-wide v4, v8

    goto :goto_2

    :cond_7
    const/4 v6, -0x1

    goto :goto_3

    :cond_8
    const-string v0, "[Session] - Same session as before!"

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    goto :goto_4

    :pswitch_3
    const-string v0, "pageName"

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "sessionEnd"

    invoke-virtual {v7, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-static {}, Lcom/unionpay/sdk/o;->b()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/unionpay/sdk/af;->a(Ljava/lang/String;)V

    invoke-static {}, Lcom/unionpay/sdk/c;->a()Lcom/unionpay/sdk/c;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/unionpay/sdk/c;->a(Z)V

    goto/16 :goto_0

    :cond_9
    const-string v1, "occurTime"

    invoke-virtual {v7, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/unionpay/sdk/o;->a(J)V

    invoke-static {v0}, Lcom/unionpay/sdk/o;->a(Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/unionpay/sdk/af;->d:Z

    goto/16 :goto_0

    :pswitch_4
    const-string v0, "occurTime"

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    const-string v0, "pageName"

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    if-nez v0, :cond_b

    const-string v5, ""

    :goto_5
    iget-object v0, p0, Lcom/unionpay/sdk/af;->b:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz v2, :cond_0

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    if-eqz v0, :cond_a

    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    const-string v1, "UPpref_shorttime"

    const-string v6, "UPpref.actstart.key"

    invoke-static {v0, v1, v6, v3, v4}, Lcom/unionpay/sdk/l;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)V

    :cond_a
    iget-object v0, p0, Lcom/unionpay/sdk/af;->c:Lcom/unionpay/sdk/bg;

    invoke-static {}, Lcom/unionpay/sdk/o;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    invoke-virtual/range {v0 .. v7}, Lcom/unionpay/sdk/bg;->a(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;J)J

    move-result-wide v0

    sput-wide v0, Lcom/unionpay/sdk/d;->j:J

    iget-object v0, p0, Lcom/unionpay/sdk/af;->b:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/sdk/af;->b:Ljava/util/HashMap;

    sget-wide v4, Lcom/unionpay/sdk/d;->j:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    :cond_b
    sget-object v0, Lcom/unionpay/sdk/d;->c:Landroid/content/Context;

    const-string v1, "UPpref_shorttime"

    const-string v5, "UPpref.lastactivity.key"

    const-string v6, ""

    invoke-static {v0, v1, v5, v6}, Lcom/unionpay/sdk/l;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_5

    :pswitch_5
    const-string v0, "pageName"

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lcom/unionpay/sdk/af;->b:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/sdk/af;->b:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    sget-wide v2, Lcom/unionpay/sdk/d;->j:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    :goto_6
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v0, v2, v4

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/unionpay/sdk/af;->c:Lcom/unionpay/sdk/bg;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/unionpay/sdk/bg;->a(JJ)J

    :cond_c
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "pages.size(): "

    aput-object v3, v0, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/unionpay/sdk/af;->b:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    invoke-static {v0}, Lcom/unionpay/sdk/k;->b([Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/unionpay/sdk/af;->d:Z

    if-eqz v0, :cond_0

    invoke-static {v1}, Lcom/unionpay/sdk/o;->a(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_d
    iget-object v0, p0, Lcom/unionpay/sdk/af;->b:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    iget-object v2, p0, Lcom/unionpay/sdk/af;->b:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_6

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
