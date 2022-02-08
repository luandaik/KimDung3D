.class final Lcom/unionpay/mobile/android/pboctransaction/samsung/h;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/tsmservice/UPTsmAddon$UPTsmConnectionListener;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/h;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onTsmConnected()V
    .locals 2

    const-string v0, "uppay"

    const-string v1, "TsmService connected."

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/h;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->g(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)V

    return-void
.end method

.method public final onTsmDisconnected()V
    .locals 2

    const-string v0, "uppay"

    const-string v1, "TsmService disconnected."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/h;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;Z)V

    return-void
.end method
