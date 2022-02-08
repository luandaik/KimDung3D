.class final Lcom/unionpay/mobile/android/hce/j;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/hce/f;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/hce/f;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/hce/j;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/j;->a:Lcom/unionpay/mobile/android/hce/f;

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/j;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v1}, Lcom/unionpay/mobile/android/hce/f;->h(Lcom/unionpay/mobile/android/hce/f;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/j;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v2}, Lcom/unionpay/mobile/android/hce/f;->i(Lcom/unionpay/mobile/android/hce/f;)I

    move-result v2

    iget-object v3, p0, Lcom/unionpay/mobile/android/hce/j;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v3}, Lcom/unionpay/mobile/android/hce/f;->j(Lcom/unionpay/mobile/android/hce/f;)I

    move-result v3

    invoke-static {v0, v1, v2, v3}, Lcom/unionpay/mobile/android/hce/f;->a(Lcom/unionpay/mobile/android/hce/f;Ljava/lang/String;II)Landroid/os/Bundle;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/j;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v1}, Lcom/unionpay/mobile/android/hce/f;->k(Lcom/unionpay/mobile/android/hce/f;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/j;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v1}, Lcom/unionpay/mobile/android/hce/f;->d(Lcom/unionpay/mobile/android/hce/f;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/j;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v2}, Lcom/unionpay/mobile/android/hce/f;->d(Lcom/unionpay/mobile/android/hce/f;)Landroid/os/Handler;

    move-result-object v2

    const/16 v3, 0x7d1

    if-eqz v0, :cond_0

    :goto_0
    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
