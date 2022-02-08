.class Lcom/heitao/platform/update/HTAPKUpdateHelper$1;
.super Landroid/os/Handler;
.source "HTAPKUpdateHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/platform/update/HTAPKUpdateHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x1

    .line 44
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 45
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 64
    :goto_0
    return-void

    .line 48
    :pswitch_0
    invoke-static {}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->access$0()Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-static {}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->access$1()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgress(I)V

    goto :goto_0

    .line 51
    :pswitch_1
    invoke-static {}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->access$0()Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->cancel()V

    .line 52
    invoke-static {}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->access$2()Landroid/content/Context;

    move-result-object v0

    invoke-static {}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->access$3()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->installAPK(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 55
    :pswitch_2
    invoke-static {}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->access$0()Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->cancel()V

    .line 57
    invoke-static {}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->access$0()Landroid/app/ProgressDialog;

    move-result-object v0

    const-string v1, "\u4e0b\u8f7d\u5931\u8d25"

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 58
    invoke-static {}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->access$0()Landroid/app/ProgressDialog;

    move-result-object v0

    const-string v1, "\u7f51\u7edc\u94fe\u63a5\u5f02\u5e38\uff0c\u4e0b\u8f7d\u5931\u8d25\uff01"

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 59
    invoke-static {}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->access$0()Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 60
    invoke-static {}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->access$0()Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 61
    invoke-static {}, Lcom/heitao/platform/update/HTAPKUpdateHelper;->access$0()Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    goto :goto_0

    .line 45
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
