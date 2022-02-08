.class public final Lcom/unionpay/mobile/android/hce/b;
.super Lcom/unionpay/mobile/android/hce/service/b$a;


# instance fields
.field private a:I

.field private b:Ljava/lang/String;

.field private c:Landroid/os/Handler;


# direct methods
.method public constructor <init>(ILjava/lang/String;Landroid/os/Handler;)V
    .locals 0

    invoke-direct {p0}, Lcom/unionpay/mobile/android/hce/service/b$a;-><init>()V

    iput p1, p0, Lcom/unionpay/mobile/android/hce/b;->a:I

    iput-object p2, p0, Lcom/unionpay/mobile/android/hce/b;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/unionpay/mobile/android/hce/b;->c:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v3, 0x0

    iget v0, p0, Lcom/unionpay/mobile/android/hce/b;->a:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "pkgName"

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/b;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "success"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "errCode"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "success"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "errCode"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/b;->c:Landroid/os/Handler;

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/b;->c:Landroid/os/Handler;

    const/16 v3, 0x7d4

    invoke-static {v2, v3, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x7d3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const/4 v3, 0x1

    iget v0, p0, Lcom/unionpay/mobile/android/hce/b;->a:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "pkgName"

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/b;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "success"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "result"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "reserved"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/b;->c:Landroid/os/Handler;

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/b;->c:Landroid/os/Handler;

    const/16 v3, 0x7d3

    invoke-static {v2, v3, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    :pswitch_1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "success"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "result"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "reserved"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/unionpay/mobile/android/hce/b;->c:Landroid/os/Handler;

    iget-object v2, p0, Lcom/unionpay/mobile/android/hce/b;->c:Landroid/os/Handler;

    const/16 v3, 0x7d4

    invoke-static {v2, v3, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x7d3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
