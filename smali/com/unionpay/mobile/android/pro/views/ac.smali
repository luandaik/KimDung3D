.class final Lcom/unionpay/mobile/android/pro/views/ac;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

.field final synthetic b:Lcom/unionpay/mobile/android/model/c;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Ljava/util/HashMap;

.field final synthetic e:Lcom/unionpay/mobile/android/pro/views/x;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pro/views/x;Lcom/unionpay/mobile/android/pro/pboc/engine/b;Lcom/unionpay/mobile/android/model/c;Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/views/ac;->e:Lcom/unionpay/mobile/android/pro/views/x;

    iput-object p2, p0, Lcom/unionpay/mobile/android/pro/views/ac;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    iput-object p3, p0, Lcom/unionpay/mobile/android/pro/views/ac;->b:Lcom/unionpay/mobile/android/model/c;

    iput-object p4, p0, Lcom/unionpay/mobile/android/pro/views/ac;->c:Ljava/lang/String;

    iput-object p5, p0, Lcom/unionpay/mobile/android/pro/views/ac;->d:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/ac;->a:Lcom/unionpay/mobile/android/pro/pboc/engine/b;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/ac;->b:Lcom/unionpay/mobile/android/model/c;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/ac;->c:Ljava/lang/String;

    iget-object v3, p0, Lcom/unionpay/mobile/android/pro/views/ac;->e:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v3}, Lcom/unionpay/mobile/android/pro/views/x;->u(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/model/b;

    move-result-object v3

    iget-object v3, v3, Lcom/unionpay/mobile/android/model/b;->p:Ljava/util/HashMap;

    iget-object v4, p0, Lcom/unionpay/mobile/android/pro/views/ac;->d:Ljava/util/HashMap;

    iget-object v5, p0, Lcom/unionpay/mobile/android/pro/views/ac;->e:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v5}, Lcom/unionpay/mobile/android/pro/views/x;->v(Lcom/unionpay/mobile/android/pro/views/x;)Lcom/unionpay/mobile/android/model/b;

    move-result-object v5

    iget-object v5, v5, Lcom/unionpay/mobile/android/model/b;->m:Ljava/lang/String;

    invoke-virtual/range {v0 .. v5}, Lcom/unionpay/mobile/android/pro/pboc/engine/b;->a(Lcom/unionpay/mobile/android/model/c;Ljava/lang/String;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/ac;->e:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pro/views/x;->w(Lcom/unionpay/mobile/android/pro/views/x;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/unionpay/mobile/android/pro/views/ac;->e:Lcom/unionpay/mobile/android/pro/views/x;

    invoke-static {v2}, Lcom/unionpay/mobile/android/pro/views/x;->w(Lcom/unionpay/mobile/android/pro/views/x;)Landroid/os/Handler;

    move-result-object v2

    const/4 v3, 0x0

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
