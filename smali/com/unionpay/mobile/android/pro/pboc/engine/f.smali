.class final Lcom/unionpay/mobile/android/pro/pboc/engine/f;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/mobile/android/pboctransaction/b;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/f;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    const/16 v3, 0x8

    const/4 v2, 0x0

    const-string v0, "uppay-spay"

    const-string v1, "tsmservice  init success"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    sput-boolean v2, Lcom/unionpay/mobile/android/model/b;->bm:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/f;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->b(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/f;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->b(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->e()Z

    move-result v0

    if-nez v0, :cond_0

    sput-boolean v2, Lcom/unionpay/mobile/android/model/b;->aB:Z

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/f;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v0, v3}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/f;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v0, v3}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;I)V

    goto :goto_0
.end method

.method public final b()V
    .locals 3

    const-string v0, "UPCardEngine"

    const-string v1, "mSE init failed"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "uppay-spay"

    const-string v1, "tsmservice  init fail"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/f;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/f;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x8

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/f;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method
