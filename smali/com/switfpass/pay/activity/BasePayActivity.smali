.class public Lcom/switfpass/pay/activity/BasePayActivity;
.super Landroid/app/Activity;


# instance fields
.field protected loadingDialog:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/switfpass/pay/activity/BasePayActivity;->loadingDialog:Landroid/app/ProgressDialog;

    return-void
.end method


# virtual methods
.method public dismissMyLoading()V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lcom/switfpass/pay/activity/BasePayActivity;->loadingDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/BasePayActivity;->loadingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/BasePayActivity;->loadingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/activity/BasePayActivity;->loadingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/switfpass/pay/activity/BasePayActivity;->loadingDialog:Landroid/app/ProgressDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v1, "ProgressDialog"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "dismissMyLoading "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/BasePayActivity;->requestWindowFeature(I)Z

    return-void
.end method

.method public showNewLoading(ZLjava/lang/String;Landroid/content/Context;)V
    .locals 4

    if-nez p1, :cond_0

    :goto_0
    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/switfpass/pay/activity/BasePayActivity;->loadingDialog:Landroid/app/ProgressDialog;

    if-nez v0, :cond_1

    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p3}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/switfpass/pay/activity/BasePayActivity;->loadingDialog:Landroid/app/ProgressDialog;

    iget-object v0, p0, Lcom/switfpass/pay/activity/BasePayActivity;->loadingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    :cond_1
    iget-object v0, p0, Lcom/switfpass/pay/activity/BasePayActivity;->loadingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/BasePayActivity;->loadingDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "ProgressDialog"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "showNewLoading "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected showToastInfo(I)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/activity/a;

    invoke-direct {v0, p0, p1}, Lcom/switfpass/pay/activity/a;-><init>(Lcom/switfpass/pay/activity/BasePayActivity;I)V

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/BasePayActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected showToastInfo(Ljava/lang/String;)V
    .locals 1

    new-instance v0, Lcom/switfpass/pay/activity/b;

    invoke-direct {v0, p0, p1}, Lcom/switfpass/pay/activity/b;-><init>(Lcom/switfpass/pay/activity/BasePayActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/switfpass/pay/activity/BasePayActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
