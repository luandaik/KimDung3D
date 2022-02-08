.class final Lcom/unionpay/mobile/android/utils/m;
.super Ljava/lang/Thread;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/utils/k;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/utils/k;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/utils/m;->a:Lcom/unionpay/mobile/android/utils/k;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    invoke-super {p0}, Ljava/lang/Thread;->run()V

    :try_start_0
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    const-wide/16 v0, 0x3e8

    :try_start_1
    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    iget-object v1, p0, Lcom/unionpay/mobile/android/utils/m;->a:Lcom/unionpay/mobile/android/utils/k;

    monitor-enter v1

    :try_start_2
    invoke-static {}, Lcom/unionpay/mobile/android/utils/k;->b()Lorg/simalliance/openmobileapi/SEService;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/unionpay/mobile/android/utils/k;->b()Lorg/simalliance/openmobileapi/SEService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/simalliance/openmobileapi/SEService;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const-string v0, "uppay"

    const-string v2, "se service connection time out"

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/utils/m;->a:Lcom/unionpay/mobile/android/utils/k;

    invoke-static {v0}, Lcom/unionpay/mobile/android/utils/k;->b(Lcom/unionpay/mobile/android/utils/k;)Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/utils/m;->a:Lcom/unionpay/mobile/android/utils/k;

    invoke-static {v0}, Lcom/unionpay/mobile/android/utils/k;->b(Lcom/unionpay/mobile/android/utils/k;)Landroid/os/Handler;

    move-result-object v0

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_1
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    return-void

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit p0

    throw v0
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    const-string v1, "uppay"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catchall_1
    move-exception v0

    monitor-exit v1

    throw v0
.end method
