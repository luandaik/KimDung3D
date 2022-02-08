.class final Lcom/unionpay/tsmservice/UPTsmAddon$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field final synthetic a:Lcom/unionpay/tsmservice/UPTsmAddon;


# direct methods
.method constructor <init>(Lcom/unionpay/tsmservice/UPTsmAddon;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$2;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final declared-synchronized onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$2;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Lcom/unionpay/tsmservice/UPTsmAddon;Z)Z

    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$2;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    invoke-static {p2}, Lcom/unionpay/tsmservice/ITsmService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/tsmservice/ITsmService;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Lcom/unionpay/tsmservice/UPTsmAddon;Lcom/unionpay/tsmservice/ITsmService;)Lcom/unionpay/tsmservice/ITsmService;

    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$2;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    invoke-static {v0}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Lcom/unionpay/tsmservice/UPTsmAddon;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$2;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Lcom/unionpay/tsmservice/UPTsmAddon;Z)Z

    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$2;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Lcom/unionpay/tsmservice/UPTsmAddon;Lcom/unionpay/tsmservice/ITsmService;)Lcom/unionpay/tsmservice/ITsmService;

    iget-object v0, p0, Lcom/unionpay/tsmservice/UPTsmAddon$2;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    invoke-static {v0}, Lcom/unionpay/tsmservice/UPTsmAddon;->a(Lcom/unionpay/tsmservice/UPTsmAddon;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
