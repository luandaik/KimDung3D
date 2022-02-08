.class final Lcom/switfpass/pay/activity/D;
.super Lcom/switfpass/pay/thread/UINotifyListener;


# instance fields
.field private synthetic ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-direct {p0}, Lcom/switfpass/pay/thread/UINotifyListener;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/activity/D;)Lcom/switfpass/pay/activity/PaySDKCaptureActivity;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    return-object v0
.end method


# virtual methods
.method public final onError(Ljava/lang/Object;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->e(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->e(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->f(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    new-instance v1, Lcom/switfpass/pay/activity/E;

    invoke-direct {v1, p0, p1}, Lcom/switfpass/pay/activity/E;-><init>(Lcom/switfpass/pay/activity/D;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public final onPostExecute()V
    .locals 0

    invoke-super {p0}, Lcom/switfpass/pay/thread/UINotifyListener;->onPostExecute()V

    return-void
.end method

.method public final onPreExecute()V
    .locals 2

    invoke-super {p0}, Lcom/switfpass/pay/thread/UINotifyListener;->onPreExecute()V

    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v1, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v1, v1, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->U:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-static {v0, v1}, Lcom/switfpass/pay/utils/DialogHelper;->resize(Landroid/app/Activity;Landroid/app/Dialog;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->U:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->show()V

    return-void
.end method

.method public final synthetic onSucceed(Ljava/lang/Object;)V
    .locals 4

    const/4 v2, 0x1

    check-cast p1, Lcom/switfpass/pay/bean/OrderBena;

    invoke-super {p0, p1}, Lcom/switfpass/pay/thread/UINotifyListener;->onSucceed(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->U:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->e(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->e(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->f(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0, v2}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->a(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;Z)V

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getStatus()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getStatus()Ljava/lang/String;

    move-result-object v0

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->U:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    invoke-virtual {p1, v2}, Lcom/switfpass/pay/bean/OrderBena;->setMark(Z)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->g(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Landroid/content/Context;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->startActivity(Lcom/switfpass/pay/bean/OrderBena;Landroid/content/Context;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->finish()V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->d(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Lcom/switfpass/pay/bean/RequestMsg;

    move-result-object v0

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getOutTradeNo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/bean/RequestMsg;->setOutTradeNo(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v1, p0, Lcom/switfpass/pay/activity/D;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->d(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Lcom/switfpass/pay/bean/RequestMsg;

    move-result-object v1

    const-string v2, "\u652f\u4ed8\u786e\u8ba4\u4e2d\uff0c\u8bf7\u7a0d\u5019..."

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->a(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;Lcom/switfpass/pay/bean/RequestMsg;Ljava/lang/String;Z)V

    goto :goto_0
.end method
