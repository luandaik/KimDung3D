.class final Lcom/unionpay/mobile/android/pboctransaction/samsung/g;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 11

    const/16 v10, 0x10

    const/4 v8, 0x0

    const/4 v2, 0x4

    const/4 v1, 0x1

    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    :cond_0
    :goto_0
    return v8

    :sswitch_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    const-string v0, "uppay"

    const-string v2, "init success"

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;Z)V

    goto :goto_0

    :sswitch_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    const-string v0, "uppay"

    const-string v2, "list success"

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->b(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, [Lcom/unionpay/tsmservice/data/SeAppListItem;

    if-eqz v6, :cond_4

    array-length v0, v6

    if-lez v0, :cond_4

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    move v7, v8

    :goto_1
    array-length v0, v6

    if-ge v7, v0, :cond_2

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    aget-object v0, v6, v7

    invoke-virtual {v0}, Lcom/unionpay/tsmservice/data/SeAppListItem;->getAppDetail()Lcom/unionpay/tsmservice/data/AppDetail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/tsmservice/data/AppDetail;->getAppID()Lcom/unionpay/tsmservice/AppID;

    move-result-object v0

    invoke-virtual {v0}, Lcom/unionpay/tsmservice/AppID;->getAppAid()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v10, :cond_3

    const/16 v2, 0xe

    invoke-virtual {v0, v2, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v2, "06"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    move v0, v8

    :goto_2
    if-nez v0, :cond_1

    new-instance v0, Lcom/unionpay/mobile/android/model/a;

    aget-object v2, v6, v7

    invoke-virtual {v2}, Lcom/unionpay/tsmservice/data/SeAppListItem;->getAppDetail()Lcom/unionpay/tsmservice/data/AppDetail;

    move-result-object v2

    invoke-virtual {v2}, Lcom/unionpay/tsmservice/data/AppDetail;->getAppID()Lcom/unionpay/tsmservice/AppID;

    move-result-object v2

    invoke-virtual {v2}, Lcom/unionpay/tsmservice/AppID;->getAppAid()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    aget-object v4, v6, v7

    invoke-virtual {v4}, Lcom/unionpay/tsmservice/data/SeAppListItem;->getVirtualCardInfo()Lcom/unionpay/tsmservice/data/VirtualCardInfo;

    move-result-object v4

    invoke-virtual {v4}, Lcom/unionpay/tsmservice/data/VirtualCardInfo;->getCardNo()Ljava/lang/String;

    move-result-object v4

    move v5, v1

    invoke-direct/range {v0 .. v5}, Lcom/unionpay/mobile/android/model/a;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v0, v7, 0x1

    move v7, v0

    goto :goto_1

    :cond_2
    move-object v0, v9

    :goto_3
    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->b(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    :sswitch_2
    const-string v0, "uppay"

    const-string v1, "channel success"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/Bundle;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    const-string v2, "channel"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    const-string v2, "apdu"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->b(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->c(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Z

    goto/16 :goto_0

    :sswitch_3
    const-string v0, "uppay"

    const-string v1, "apdu success version 3.3.1"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->c(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_4
    const-string v0, "uppay"

    const-string v1, "close channel success"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->d(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Z

    goto/16 :goto_0

    :sswitch_5
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    const-string v0, "uppay"

    const-string v1, "msg error"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v2, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v2, v1, v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;ILjava/lang/String;)V

    goto/16 :goto_0

    :sswitch_6
    const-string v0, "uppay"

    const-string v1, "timeout"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p1, Landroid/os/Message;->arg1:I

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    const-string v2, ""

    invoke-static {v1, v0, v2}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;ILjava/lang/String;)V

    goto/16 :goto_0

    :sswitch_7
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    const-string v0, "uppay-spay"

    const-string v2, "get spay list call back"

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/unionpay/tsmservice/data/VirtualCardInfo;

    new-instance v2, Lcom/unionpay/mobile/android/model/a;

    const/16 v3, 0x20

    invoke-virtual {v0}, Lcom/unionpay/tsmservice/data/VirtualCardInfo;->getAppID()Lcom/unionpay/tsmservice/AppID;

    move-result-object v4

    invoke-virtual {v4}, Lcom/unionpay/tsmservice/AppID;->getAppAid()Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v0}, Lcom/unionpay/tsmservice/data/VirtualCardInfo;->getCardNo()Ljava/lang/String;

    move-result-object v6

    move v7, v1

    invoke-direct/range {v2 .. v7}, Lcom/unionpay/mobile/android/model/a;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->b(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x7d0

    invoke-virtual {v0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->b(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_0

    :sswitch_8
    const-string v0, "uppay-spay"

    const-string v1, "send apdu time out"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->e(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Z

    goto/16 :goto_0

    :sswitch_9
    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->a(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    const-string v0, "uppay-spay"

    const-string v2, "check spay support"

    invoke-static {v0, v2}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/pboctransaction/samsung/g;->a:Lcom/unionpay/mobile/android/pboctransaction/samsung/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f;->f(Lcom/unionpay/mobile/android/pboctransaction/samsung/f;)Lcom/unionpay/mobile/android/pboctransaction/samsung/f$a;

    move-result-object v0

    invoke-interface {v0, v1}, Lcom/unionpay/mobile/android/pboctransaction/samsung/f$a;->a(Z)V

    goto/16 :goto_0

    :cond_3
    move v0, v1

    goto/16 :goto_2

    :cond_4
    move-object v0, v2

    goto/16 :goto_3

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_5
        0x3 -> :sswitch_8
        0x4 -> :sswitch_6
        0x3e8 -> :sswitch_0
        0x3f3 -> :sswitch_2
        0x3f4 -> :sswitch_3
        0x3f5 -> :sswitch_4
        0x3f6 -> :sswitch_1
        0x3f7 -> :sswitch_7
        0x3f8 -> :sswitch_9
    .end sparse-switch
.end method
