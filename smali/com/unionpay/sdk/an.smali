.class final Lcom/unionpay/sdk/an;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Ljava/lang/Throwable;

.field final synthetic b:Landroid/content/Context;


# direct methods
.method constructor <init>(Ljava/lang/Throwable;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/sdk/an;->a:Ljava/lang/Throwable;

    iput-object p2, p0, Lcom/unionpay/sdk/an;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    :try_start_0
    iget-object v0, p0, Lcom/unionpay/sdk/an;->a:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/unionpay/sdk/an;->b:Landroid/content/Context;

    if-eqz v0, :cond_1

    sget-boolean v0, Lcom/unionpay/sdk/ag;->b:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/sdk/an;->b:Landroid/content/Context;

    invoke-static {v0}, Lcom/unionpay/sdk/ag;->a(Landroid/content/Context;)V

    :cond_1
    new-instance v0, Lcom/unionpay/sdk/ag$a;

    invoke-direct {v0}, Lcom/unionpay/sdk/ag$a;-><init>()V

    iget-object v1, v0, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "apiType"

    const/4 v3, 0x5

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

    const-string v2, "throwable"

    iget-object v3, p0, Lcom/unionpay/sdk/an;->a:Ljava/lang/Throwable;

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/unionpay/sdk/bk;->a()Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0x66

    invoke-static {v1, v2, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
