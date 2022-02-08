.class Lcom/unionpay/sdk/ad;
.super Lcom/unionpay/sdk/bh;


# static fields
.field private static volatile a:Lcom/unionpay/sdk/ad;


# instance fields
.field private b:Lcom/unionpay/sdk/bg;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    sput-object v0, Lcom/unionpay/sdk/ad;->a:Lcom/unionpay/sdk/ad;

    :try_start_0
    invoke-static {}, Lcom/unionpay/sdk/ar;->a()Lcom/unionpay/sdk/ar;

    move-result-object v0

    invoke-static {}, Lcom/unionpay/sdk/ad;->a()Lcom/unionpay/sdk/ad;

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

    iput-object v0, p0, Lcom/unionpay/sdk/ad;->b:Lcom/unionpay/sdk/bg;

    return-void
.end method

.method public static a()Lcom/unionpay/sdk/ad;
    .locals 2

    sget-object v0, Lcom/unionpay/sdk/ad;->a:Lcom/unionpay/sdk/ad;

    if-nez v0, :cond_1

    const-class v1, Lcom/unionpay/sdk/ad;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/unionpay/sdk/ad;->a:Lcom/unionpay/sdk/ad;

    if-nez v0, :cond_0

    new-instance v0, Lcom/unionpay/sdk/ad;

    invoke-direct {v0}, Lcom/unionpay/sdk/ad;-><init>()V

    sput-object v0, Lcom/unionpay/sdk/ad;->a:Lcom/unionpay/sdk/ad;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/unionpay/sdk/ad;->a:Lcom/unionpay/sdk/ad;

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 7

    invoke-static {}, Lcom/unionpay/sdk/o;->b()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/unionpay/sdk/o;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/unionpay/sdk/ad;->b:Lcom/unionpay/sdk/bg;

    invoke-static {}, Lcom/unionpay/sdk/o;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {p3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    move-object v2, p1

    move-object v3, p2

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Lcom/unionpay/sdk/bg;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)J

    goto :goto_0
.end method


# virtual methods
.method public final onTDEBEventAppEvent(Lcom/unionpay/sdk/ag$a;)V
    .locals 5

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

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    sget-boolean v0, Lcom/unionpay/sdk/ag;->b:Z

    if-nez v0, :cond_2

    iget-object v0, p1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v1, "context"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/content/Context;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Lcom/unionpay/sdk/ag;->a(Landroid/content/Context;)V

    :cond_2
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    iget-object v0, p1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "eventId"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/unionpay/sdk/d;->a:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    if-lez v2, :cond_3

    if-eqz v0, :cond_3

    const-string v2, "__"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    sget-object v0, Lcom/unionpay/sdk/d;->a:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_3
    iget-object v0, p1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "map"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_4

    instance-of v2, v0, Ljava/util/HashMap;

    if-eqz v2, :cond_4

    check-cast v0, Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_4
    iget-object v0, p1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "controller"

    invoke-static {}, Lcom/unionpay/sdk/ad;->a()Lcom/unionpay/sdk/ad;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "map"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v1, "map"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "map"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Ljava/util/Map;

    if-eqz v1, :cond_5

    const-string v1, "eventId"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "eventLabel"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "occurTime"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "map"

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-direct {p0, v1, v2, v3, v0}, Lcom/unionpay/sdk/ad;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto/16 :goto_0

    :cond_5
    const-string v1, "eventId"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "eventLabel"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "occurTime"

    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    invoke-direct {p0, v1, v2, v0, v3}, Lcom/unionpay/sdk/ad;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto/16 :goto_0
.end method
