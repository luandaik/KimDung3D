.class final Lcom/unionpay/sdk/f;
.super Landroid/os/Handler;


# direct methods
.method constructor <init>(Landroid/os/Looper;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 3

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/unionpay/sdk/ag$a;

    if-eqz v0, :cond_1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/unionpay/sdk/ag$a;

    iget-object v1, v0, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    const-string v2, "controller"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/unionpay/sdk/bh;

    invoke-static {}, Lcom/unionpay/sdk/t;->a()Lcom/unionpay/sdk/t;

    move-result-object v2

    invoke-virtual {v2}, Lcom/unionpay/sdk/bg;->b()V

    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    :cond_0
    :goto_0
    invoke-static {}, Lcom/unionpay/sdk/t;->a()Lcom/unionpay/sdk/t;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/sdk/bg;->c()V

    :cond_1
    return-void

    :pswitch_0
    if-eqz v1, :cond_0

    iget-object v0, v0, Lcom/unionpay/sdk/ag$a;->a:Ljava/util/HashMap;

    goto :goto_0

    :pswitch_1
    :try_start_0
    invoke-static {}, Lcom/unionpay/sdk/ar;->a()Lcom/unionpay/sdk/ar;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/unionpay/sdk/ar;->post(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/unionpay/sdk/k;->a(Ljava/lang/Throwable;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x65
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
