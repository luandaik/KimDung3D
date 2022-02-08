.class final Lcom/unionpay/c;
.super Ljava/lang/Thread;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    const/16 v4, 0x3e9

    invoke-static {}, Lcom/unionpay/UPPayAssistEx;->m()Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    new-instance v0, Lcom/unionpay/a/c;

    invoke-static {}, Lcom/unionpay/UPPayAssistEx;->n()Lcom/unionpay/a/d;

    move-result-object v1

    invoke-static {}, Lcom/unionpay/UPPayAssistEx;->c()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/unionpay/a/c;-><init>(Lcom/unionpay/a/d;Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/unionpay/a/c;->a()I

    invoke-virtual {v0}, Lcom/unionpay/a/c;->b()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/unionpay/UPPayAssistEx;->m()Landroid/os/Handler;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/unionpay/UPPayAssistEx;->m()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    const/16 v2, 0x3ea

    iput v2, v1, Landroid/os/Message;->what:I

    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-static {}, Lcom/unionpay/UPPayAssistEx;->m()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    invoke-static {}, Lcom/unionpay/UPPayAssistEx;->m()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method
