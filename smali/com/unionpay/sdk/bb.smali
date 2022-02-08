.class final Lcom/unionpay/sdk/bb;
.super Landroid/os/Handler;


# instance fields
.field final synthetic a:Lcom/unionpay/sdk/n;


# direct methods
.method constructor <init>(Lcom/unionpay/sdk/n;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/sdk/bb;->a:Lcom/unionpay/sdk/n;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/unionpay/sdk/bb;->a:Lcom/unionpay/sdk/n;

    invoke-static {v0}, Lcom/unionpay/sdk/n;->a(Lcom/unionpay/sdk/n;)Landroid/hardware/SensorManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/sdk/bb;->a:Lcom/unionpay/sdk/n;

    invoke-static {v0}, Lcom/unionpay/sdk/n;->a(Lcom/unionpay/sdk/n;)Landroid/hardware/SensorManager;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/sdk/bb;->a:Lcom/unionpay/sdk/n;

    invoke-static {v1}, Lcom/unionpay/sdk/n;->b(Lcom/unionpay/sdk/n;)Landroid/hardware/SensorEventListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
    .end packed-switch
.end method
