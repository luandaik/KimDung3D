.class final Lcom/unionpay/sdk/aj;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Z

.field final synthetic c:Landroid/app/Activity;


# direct methods
.method constructor <init>(Ljava/lang/String;ZLandroid/app/Activity;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/sdk/aj;->a:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/unionpay/sdk/aj;->b:Z

    iput-object p3, p0, Lcom/unionpay/sdk/aj;->c:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onResume being called! pageName: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unionpay/sdk/aj;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "From: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/unionpay/sdk/aj;->b:Z

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/String;)V

    new-instance v1, Lcom/unionpay/sdk/ag$a;

    invoke-direct {v1}, Lcom/unionpay/sdk/ag$a;-><init>()V

    iget-object v0, v1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "context"

    iget-object v3, p0, Lcom/unionpay/sdk/aj;->c:Landroid/app/Activity;

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v3, "apiType"

    iget-boolean v0, p0, Lcom/unionpay/sdk/aj;->b:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x6

    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "occurTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v1, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "pageName"

    iget-object v3, p0, Lcom/unionpay/sdk/aj;->a:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/unionpay/sdk/bk;->a()Landroid/os/Handler;

    move-result-object v0

    const/16 v2, 0x66

    invoke-static {v0, v2, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_1
    return-void

    :cond_1
    const/4 v0, 0x2

    goto :goto_0

    :catch_0
    move-exception v0

    sget-boolean v1, Lcom/unionpay/sdk/UPAgent;->LOG_ON:Z

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1
.end method
