.class final Lcom/unionpay/mobile/android/pro/views/v;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pro/views/u;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pro/views/u;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/views/v;->a:Lcom/unionpay/mobile/android/pro/views/u;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    const/4 v0, 0x1

    return v0

    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_1

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/unionpay/mobile/android/model/a;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/v;->a:Lcom/unionpay/mobile/android/pro/views/u;

    invoke-static {v1, v0}, Lcom/unionpay/mobile/android/pro/views/u;->a(Lcom/unionpay/mobile/android/pro/views/u;Lcom/unionpay/mobile/android/model/a;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/v;->a:Lcom/unionpay/mobile/android/pro/views/u;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/v;->a:Lcom/unionpay/mobile/android/pro/views/u;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pro/views/u;->a(Lcom/unionpay/mobile/android/pro/views/u;)Lcom/unionpay/mobile/android/model/b;

    move-result-object v1

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->ap:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pro/views/u;->a(Lcom/unionpay/mobile/android/pro/views/u;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-string v1, "1003100020"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/unionpay/mobile/android/model/b;->bl:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/v;->a:Lcom/unionpay/mobile/android/pro/views/u;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/u;->b(Lcom/unionpay/mobile/android/pro/views/u;)V

    goto :goto_0

    :cond_2
    sget-boolean v0, Lcom/unionpay/mobile/android/model/b;->bl:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/v;->a:Lcom/unionpay/mobile/android/pro/views/u;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/v;->a:Lcom/unionpay/mobile/android/pro/views/u;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pro/views/u;->c(Lcom/unionpay/mobile/android/pro/views/u;)Lcom/unionpay/mobile/android/model/b;

    move-result-object v1

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->ap:Ljava/lang/String;

    const-string v2, "fail"

    invoke-static {v0, v1, v2}, Lcom/unionpay/mobile/android/pro/views/u;->a(Lcom/unionpay/mobile/android/pro/views/u;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/v;->a:Lcom/unionpay/mobile/android/pro/views/u;

    iget-object v1, p0, Lcom/unionpay/mobile/android/pro/views/v;->a:Lcom/unionpay/mobile/android/pro/views/u;

    invoke-static {v1}, Lcom/unionpay/mobile/android/pro/views/u;->d(Lcom/unionpay/mobile/android/pro/views/u;)Lcom/unionpay/mobile/android/model/b;

    move-result-object v1

    iget-object v1, v1, Lcom/unionpay/mobile/android/model/b;->ap:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/pro/views/u;->b(Lcom/unionpay/mobile/android/pro/views/u;Ljava/lang/String;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x7d0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
