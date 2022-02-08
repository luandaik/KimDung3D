.class Lcom/unionpay/sdk/ae;
.super Lcom/unionpay/sdk/bh;


# static fields
.field private static volatile a:Lcom/unionpay/sdk/ae;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    sput-object v0, Lcom/unionpay/sdk/ae;->a:Lcom/unionpay/sdk/ae;

    :try_start_0
    invoke-static {}, Lcom/unionpay/sdk/ar;->a()Lcom/unionpay/sdk/ar;

    move-result-object v0

    invoke-static {}, Lcom/unionpay/sdk/ae;->a()Lcom/unionpay/sdk/ae;

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
    .locals 0

    invoke-direct {p0}, Lcom/unionpay/sdk/bh;-><init>()V

    return-void
.end method

.method public static a()Lcom/unionpay/sdk/ae;
    .locals 2

    sget-object v0, Lcom/unionpay/sdk/ae;->a:Lcom/unionpay/sdk/ae;

    if-nez v0, :cond_1

    const-class v1, Lcom/unionpay/sdk/ae;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/unionpay/sdk/ae;->a:Lcom/unionpay/sdk/ae;

    if-nez v0, :cond_0

    new-instance v0, Lcom/unionpay/sdk/ae;

    invoke-direct {v0}, Lcom/unionpay/sdk/ae;-><init>()V

    sput-object v0, Lcom/unionpay/sdk/ae;->a:Lcom/unionpay/sdk/ae;

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    sget-object v0, Lcom/unionpay/sdk/ae;->a:Lcom/unionpay/sdk/ae;

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public final onTDEBEventError(Lcom/unionpay/sdk/ag$a;)V
    .locals 3

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

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    iget-object v0, p1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v1, "controller"

    invoke-static {}, Lcom/unionpay/sdk/ae;->a()Lcom/unionpay/sdk/ae;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    :try_start_0
    const-string v0, "throwable"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "occurTime"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "throwable"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    const-string v2, "occurTime"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/sdk/ag;->a(Ljava/lang/Throwable;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_2
    :try_start_1
    const-string v0, "throwable"

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/unionpay/sdk/ag;->a(Ljava/lang/Throwable;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
