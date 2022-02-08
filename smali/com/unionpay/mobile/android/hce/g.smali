.class final Lcom/unionpay/mobile/android/hce/g;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/hce/f;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/hce/f;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/hce/g;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 7

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    const/4 v0, 0x0

    return v0

    :pswitch_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/g;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/hce/f;->a(Lcom/unionpay/mobile/android/hce/f;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/g;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/f;->b()V

    goto :goto_0

    :pswitch_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/g;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/hce/f;->a(Lcom/unionpay/mobile/android/hce/f;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/Bundle;

    if-eqz v0, :cond_0

    const-string v1, "pkgName"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "success"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "result"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "reserved"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "yitong"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "result: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/unionpay/mobile/android/utils/j;->c(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/g;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v0}, Lcom/unionpay/mobile/android/hce/f;->b(Lcom/unionpay/mobile/android/hce/f;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/hce/d;

    if-nez v0, :cond_1

    new-instance v0, Lcom/unionpay/mobile/android/hce/d;

    invoke-direct {v0, v1}, Lcom/unionpay/mobile/android/hce/d;-><init>(Ljava/lang/String;)V

    :cond_1
    if-eqz v2, :cond_2

    invoke-virtual {v0, v3}, Lcom/unionpay/mobile/android/hce/d;->a(Ljava/lang/String;)V

    invoke-virtual {v0, v4}, Lcom/unionpay/mobile/android/hce/d;->b(Ljava/lang/String;)V

    :cond_2
    invoke-virtual {v0}, Lcom/unionpay/mobile/android/hce/d;->e()V

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/g;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v2}, Lcom/unionpay/mobile/android/hce/f;->b(Lcom/unionpay/mobile/android/hce/f;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/g;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/hce/f;->a(Lcom/unionpay/mobile/android/hce/f;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_4
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/g;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v1}, Lcom/unionpay/mobile/android/hce/f;->b(Lcom/unionpay/mobile/android/hce/f;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/unionpay/mobile/android/hce/d;

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/g;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v2}, Lcom/unionpay/mobile/android/hce/f;->c(Lcom/unionpay/mobile/android/hce/f;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/unionpay/mobile/android/hce/l;

    invoke-virtual {v1}, Lcom/unionpay/mobile/android/hce/d;->f()V

    iget-object v3, p0, Lcom/unionpay/mobile/android/hce/g;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v3}, Lcom/unionpay/mobile/android/hce/f;->b(Lcom/unionpay/mobile/android/hce/f;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/unionpay/mobile/android/hce/l;->e()V

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/g;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v1}, Lcom/unionpay/mobile/android/hce/f;->c(Lcom/unionpay/mobile/android/hce/f;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v1

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/g;->a:Lcom/unionpay/mobile/android/hce/f;

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/hce/f;->a(Lcom/unionpay/mobile/android/hce/f;Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x7d1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method
