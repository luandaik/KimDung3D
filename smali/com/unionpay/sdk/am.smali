.class final Lcom/unionpay/sdk/am;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:I

.field final synthetic b:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;)V
    .locals 0

    iput p1, p0, Lcom/unionpay/sdk/am;->a:I

    iput-object p2, p0, Lcom/unionpay/sdk/am;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    :try_start_0
    sget-boolean v0, Lcom/unionpay/sdk/ag;->b:Z

    if-eqz v0, :cond_0

    new-instance v1, Lcom/unionpay/sdk/ag$a;

    invoke-direct {v1}, Lcom/unionpay/sdk/ag$a;-><init>()V

    iget-object v0, v1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "apiType"

    iget v3, p0, Lcom/unionpay/sdk/am;->a:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "occurTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v3, "pageName"

    iget-object v0, p0, Lcom/unionpay/sdk/am;->b:Ljava/lang/String;

    if-nez v0, :cond_1

    const-string v0, ""

    :goto_0
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/unionpay/sdk/bk;->a()Landroid/os/Handler;

    move-result-object v0

    const/16 v2, 0x66

    invoke-static {v0, v2, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/unionpay/sdk/ag;->c:Z

    :cond_0
    :goto_1
    return-void

    :cond_1
    iget-object v0, p0, Lcom/unionpay/sdk/am;->b:Ljava/lang/String;

    invoke-static {v0}, Lcom/unionpay/sdk/r;->a(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/Throwable;)V

    goto :goto_1
.end method
