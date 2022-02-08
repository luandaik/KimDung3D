.class final Lcom/switfpass/pay/utils/j;
.super Landroid/os/Handler;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)V
    .locals 5

    const/4 v4, 0x1

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    new-instance v1, Lcom/switfpass/pay/activity/PayResult;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-direct {v1, v0}, Lcom/switfpass/pay/activity/PayResult;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/switfpass/pay/activity/PayResult;->getResultStatus()Ljava/lang/String;

    move-result-object v0

    const-string v1, "hehui"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "resultStatus-->"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "9000"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    const-string v1, "\u652f\u4ed8\u6210\u529f"

    invoke-static {v4, v0, v1}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V

    goto :goto_0

    :cond_0
    const-string v1, "8000"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    const-string v1, "\u652f\u4ed8\u7ed3\u679c\u5f85\u786e\u8ba4\u4e2d\uff0c\u6700\u7ec8\u4ea4\u6613\u662f\u5426\u6210\u529f\u4ee5\u670d\u52a1\u7aef\u5f02\u6b65\u901a\u77e5\u4e3a\u51c6"

    invoke-static {v4, v0, v1}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V

    goto :goto_0

    :cond_1
    const-string v0, "\u652f\u4ed8\u5931\u8d25\uff0c\u539f\u56e0\u5305\u62ec\u7528\u6237\u4e3b\u52a8\u53d6\u6d88\u652f\u4ed8\uff0c\u6216\u8005\u7cfb\u7edf\u8fd4\u56de\u7684\u9519\u8bef"

    invoke-static {v4, v4, v0}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
