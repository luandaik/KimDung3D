.class final Lcom/unionpay/mobile/android/hce/i;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/unionpay/mobile/android/hce/f;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/hce/f;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    iput-object p2, p0, Lcom/unionpay/mobile/android/hce/i;->a:Ljava/lang/String;

    iput-object p3, p0, Lcom/unionpay/mobile/android/hce/i;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 8

    const/4 v1, 0x0

    const/16 v3, 0x7d6

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/hce/f;->d(Lcom/unionpay/mobile/android/hce/f;)Landroid/os/Handler;

    move-result-object v0

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/i;->a:Ljava/lang/String;

    invoke-virtual {v0, v3, v2}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    :try_start_0
    invoke-static {p2}, Lcom/unionpay/mobile/android/hce/service/a$a;->a(Landroid/os/IBinder;)Lcom/unionpay/mobile/android/hce/service/a;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    move-object v2, v0

    :goto_0
    if-eqz v2, :cond_1

    :try_start_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/hce/f;->f(Lcom/unionpay/mobile/android/hce/f;)Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v3}, Lcom/unionpay/mobile/android/hce/f;->g(Lcom/unionpay/mobile/android/hce/f;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/unionpay/mobile/android/hce/b;

    const/16 v5, 0x7d3

    iget-object v6, p0, Lcom/unionpay/mobile/android/hce/i;->a:Ljava/lang/String;

    iget-object v7, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v7}, Lcom/unionpay/mobile/android/hce/f;->d(Lcom/unionpay/mobile/android/hce/f;)Landroid/os/Handler;

    move-result-object v7

    invoke-direct {v4, v5, v6, v7}, Lcom/unionpay/mobile/android/hce/b;-><init>(ILjava/lang/String;Landroid/os/Handler;)V

    invoke-interface {v2, v0, v3, v4}, Lcom/unionpay/mobile/android/hce/service/a;->a(Ljava/lang/String;Ljava/lang/String;Lcom/unionpay/mobile/android/hce/service/b;)Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/hce/f;->d(Lcom/unionpay/mobile/android/hce/f;)Landroid/os/Handler;

    move-result-object v0

    const/16 v3, 0x7d6

    iget-object v4, p0, Lcom/unionpay/mobile/android/hce/i;->a:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v3, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v3}, Lcom/unionpay/mobile/android/hce/f;->d(Lcom/unionpay/mobile/android/hce/f;)Landroid/os/Handler;

    move-result-object v3

    iget-object v4, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v4}, Lcom/unionpay/mobile/android/hce/f;->e(Lcom/unionpay/mobile/android/hce/f;)I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v3, v0, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    :goto_1
    if-eqz v1, :cond_1

    const-string v0, "uppay-hce"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "session Key: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "uppay-hce"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "3des key: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/unionpay/mobile/android/hce/i;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/i;->b:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/hce/a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v0, "uppay-hce"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/unionpay/mobile/android/hce/i;->a:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " sessionkey after: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/hce/f;->c(Lcom/unionpay/mobile/android/hce/f;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v0

    iget-object v3, p0, Lcom/unionpay/mobile/android/hce/i;->a:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/hce/l;

    if-nez v0, :cond_0

    new-instance v0, Lcom/unionpay/mobile/android/hce/l;

    iget-object v3, p0, Lcom/unionpay/mobile/android/hce/i;->a:Ljava/lang/String;

    invoke-direct {v0, v3}, Lcom/unionpay/mobile/android/hce/l;-><init>(Ljava/lang/String;)V

    :cond_0
    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/hce/l;->a(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/unionpay/mobile/android/hce/l;->a(Lcom/unionpay/mobile/android/hce/service/a;)V

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/l;->d()V

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v1}, Lcom/unionpay/mobile/android/hce/f;->c(Lcom/unionpay/mobile/android/hce/f;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/i;->a:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/hce/f;->d(Lcom/unionpay/mobile/android/hce/f;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x7d2

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/i;->a:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v1}, Lcom/unionpay/mobile/android/hce/f;->d(Lcom/unionpay/mobile/android/hce/f;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_1
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v2, v1

    goto/16 :goto_0

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_1

    :catch_2
    move-exception v0

    goto/16 :goto_1
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/hce/f;->d(Lcom/unionpay/mobile/android/hce/f;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x7d6

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/i;->a:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/hce/f;->d(Lcom/unionpay/mobile/android/hce/f;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x7d5

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/i;->a:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/i;->c:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v1}, Lcom/unionpay/mobile/android/hce/f;->d(Lcom/unionpay/mobile/android/hce/f;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
