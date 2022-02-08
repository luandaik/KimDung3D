.class final Lcom/unionpay/mobile/android/pro/pboc/engine/j;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/j;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/j;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    monitor-enter v1

    :try_start_0
    const-string v0, "UPCardEngine"

    const-string v2, " se_return : 8"

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    sget-boolean v0, Lcom/unionpay/mobile/android/model/b;->bl:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/j;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/j;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Landroid/os/Handler;

    move-result-object v0

    const/16 v2, 0x8

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/j;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v2}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    :goto_0
    monitor-exit v1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/j;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->f(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Lcom/unionpay/mobile/android/pboctransaction/d;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/j;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->f(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Lcom/unionpay/mobile/android/pboctransaction/d;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/pboctransaction/d;->b()Ljava/util/ArrayList;

    move-result-object v0

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/j;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    const-string v3, "com.unionpay.tsmservice"

    invoke-static {v2, v3}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/j;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v2}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Landroid/os/Handler;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/j;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v2}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Landroid/os/Handler;

    move-result-object v2

    const/16 v3, 0x8

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/j;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v2}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method
