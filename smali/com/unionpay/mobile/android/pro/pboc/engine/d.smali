.class final Lcom/unionpay/mobile/android/pro/pboc/engine/d;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/mobile/android/pboctransaction/b;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/d;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/d;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;I)V

    return-void
.end method

.method public final b()V
    .locals 3

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/d;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/pboc/engine/d;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/pro/pboc/engine/b;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
