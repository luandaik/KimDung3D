.class final Lcom/switfpass/pay/activity/l;
.super Lcom/switfpass/pay/thread/UINotifyListener;


# instance fields
.field private synthetic ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-direct {p0}, Lcom/switfpass/pay/thread/UINotifyListener;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/activity/l;)Lcom/switfpass/pay/activity/PaySDKCaptureActivity;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    return-object v0
.end method


# virtual methods
.method public final onError(Ljava/lang/Object;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->e(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->e(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->U:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->f(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->a(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;Z)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    new-instance v1, Lcom/switfpass/pay/activity/m;

    invoke-direct {v1, p0, p1}, Lcom/switfpass/pay/activity/m;-><init>(Lcom/switfpass/pay/activity/l;Ljava/lang/Object;)V

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

    iget-object v0, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v1, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v1, v1, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->U:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-static {v0, v1}, Lcom/switfpass/pay/utils/DialogHelper;->resize(Landroid/app/Activity;Landroid/app/Dialog;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->U:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->show()V

    return-void
.end method

.method public final synthetic onSucceed(Ljava/lang/Object;)V
    .locals 3

    check-cast p1, Lcom/switfpass/pay/bean/OrderBena;

    invoke-super {p0, p1}, Lcom/switfpass/pay/thread/UINotifyListener;->onSucceed(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->U:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->e(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->e(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    if-eqz p1, :cond_1

    const/4 v0, 0x6

    const/16 v1, 0x8

    const-string v2, "\u652f\u4ed8\u72b6\u6001\uff1a\u8be5\u7b14\u8ba2\u5355\u5df2\u51b2\u6b63"

    invoke-static {v0, v1, v2}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    const-string v1, "\u8be5\u7b14\u8ba2\u5355\u5df2\u7ecf\u51b2\u6b63\u6210\u529f\uff0c\u8bf7\u91cd\u65b0\u53d1\u8d77\u652f\u4ed8\u8bf7\u6c42"

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->showToastInfo(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/l;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->finish()V

    :cond_1
    return-void
.end method
