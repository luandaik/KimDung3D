.class final Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/b;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/b;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2

    const-string v0, "plugin-tsm"

    const-string v1, "mConnection.onServiceConnected()"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/b;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    invoke-static {p2}, Lcom/unionpay/mobile/tsm/connect/IRemoteApdu$Stub;->asInterface(Landroid/os/IBinder;)Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a(Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;)Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/b;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->b(Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;)Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/b;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a(Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;)Lcom/unionpay/mobile/tsm/connect/IInitCallback$Stub;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;->registerCallback(Lcom/unionpay/mobile/tsm/connect/IInitCallback;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/b;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->b(Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;)Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    move-result-object v0

    invoke-interface {v0}, Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;->init()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/b;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    iget-object v0, v0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a:Lcom/unionpay/mobile/android/pboctransaction/b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/b;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    iget-object v0, v0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a:Lcom/unionpay/mobile/android/pboctransaction/b;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    goto :goto_0
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    const-string v0, "plugin-tsm"

    const-string v1, "mConnection.onServiceDisconnected()"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/b;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a(Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;)Lcom/unionpay/mobile/tsm/connect/IRemoteApdu;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/b;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    iget-object v0, v0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a:Lcom/unionpay/mobile/android/pboctransaction/b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/b;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    iget-object v0, v0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a:Lcom/unionpay/mobile/android/pboctransaction/b;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    :cond_0
    return-void
.end method
