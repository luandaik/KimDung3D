.class final Lcom/unionpay/mobile/android/pboctransaction/simapdu/c;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pboctransaction/simapdu/c;->a:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 1

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    const/4 v0, 0x1

    return v0

    :pswitch_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/simapdu/c;->a:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;->a(Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;)Lcom/unionpay/mobile/android/pboctransaction/b;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/simapdu/c;->a:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;->a(Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;)Lcom/unionpay/mobile/android/pboctransaction/b;

    move-result-object v0

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->a()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/simapdu/c;->a:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;->b(Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;)Lcom/unionpay/mobile/android/pboctransaction/b;

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/simapdu/c;->a:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;->a(Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;)Lcom/unionpay/mobile/android/pboctransaction/b;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/simapdu/c;->a:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;->a(Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;)Lcom/unionpay/mobile/android/pboctransaction/b;

    move-result-object v0

    invoke-interface {v0}, Lcom/unionpay/mobile/android/pboctransaction/b;->b()V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/simapdu/c;->a:Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;->b(Lcom/unionpay/mobile/android/pboctransaction/simapdu/b;)Lcom/unionpay/mobile/android/pboctransaction/b;

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
