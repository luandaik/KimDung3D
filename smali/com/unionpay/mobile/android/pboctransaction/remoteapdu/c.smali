.class final Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/c;
.super Lcom/unionpay/mobile/tsm/connect/IInitCallback$Stub;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/c;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    invoke-direct {p0}, Lcom/unionpay/mobile/tsm/connect/IInitCallback$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public final initFailed()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const-string v0, "plugin-tsm"

    const-string v1, "mInitCallback.initFailed()"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/c;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    iget-object v0, v0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a:Lcom/unionpay/mobile/android/pboctransaction/b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/c;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    iget-object v0, v0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a:Lcom/unionpay/mobile/android/pboctransaction/b;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    :cond_0
    return-void
.end method

.method public final initSucceed()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const-string v0, "plugin-tsm"

    const-string v1, "mInitCallback.initSucceed()"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/c;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    iget-object v0, v0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a:Lcom/unionpay/mobile/android/pboctransaction/b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/c;->a:Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;

    iget-object v0, v0, Lcom/unionpay/mobile/android/pboctransaction/remoteapdu/a;->a:Lcom/unionpay/mobile/android/pboctransaction/b;

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->a()V

    :cond_0
    return-void
.end method
