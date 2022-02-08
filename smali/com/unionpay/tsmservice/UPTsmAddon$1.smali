.class final Lcom/unionpay/tsmservice/UPTsmAddon$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field final synthetic a:Lcom/unionpay/tsmservice/UPTsmAddon;


# direct methods
.method constructor <init>(Lcom/unionpay/tsmservice/UPTsmAddon;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$1;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final declared-synchronized handleMessage(Landroid/os/Message;)Z
    .locals 2

    const/4 v0, 0x1

    monitor-enter p0

    :try_start_0
    iget v1, p1, Landroid/os/Message;->what:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    packed-switch v1, :pswitch_data_0

    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :pswitch_0
    :try_start_1
    iget-object v1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$1;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    invoke-static {}, Lcom/unionpay/tsmservice/UPTsmAddon;->a()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :pswitch_1
    :try_start_2
    iget-object v1, p0, Lcom/unionpay/tsmservice/UPTsmAddon$1;->a:Lcom/unionpay/tsmservice/UPTsmAddon;

    invoke-static {}, Lcom/unionpay/tsmservice/UPTsmAddon;->b()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
