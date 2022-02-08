.class final Lcom/switfpass/pay/activity/q;
.super Lcom/switfpass/pay/thread/UINotifyListener;


# instance fields
.field private synthetic ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

.field private final synthetic am:Lcom/switfpass/pay/bean/RequestMsg;

.field private final synthetic an:Z


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;Lcom/switfpass/pay/bean/RequestMsg;Z)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iput-object p2, p0, Lcom/switfpass/pay/activity/q;->am:Lcom/switfpass/pay/bean/RequestMsg;

    iput-boolean p3, p0, Lcom/switfpass/pay/activity/q;->an:Z

    invoke-direct {p0}, Lcom/switfpass/pay/thread/UINotifyListener;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/activity/q;)Lcom/switfpass/pay/activity/PaySDKCaptureActivity;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    return-object v0
.end method


# virtual methods
.method public final onError(Ljava/lang/Object;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->V:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->V:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->f(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->a(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;Z)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    new-instance v1, Lcom/switfpass/pay/activity/r;

    invoke-direct {v1, p0, p1}, Lcom/switfpass/pay/activity/r;-><init>(Lcom/switfpass/pay/activity/q;Ljava/lang/Object;)V

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

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v1, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v1, v1, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->U:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-static {v0, v1}, Lcom/switfpass/pay/utils/DialogHelper;->resize(Landroid/app/Activity;Landroid/app/Dialog;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->V:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->show()V

    return-void
.end method

.method public final synthetic onSucceed(Ljava/lang/Object;)V
    .locals 8

    const/4 v4, 0x1

    check-cast p1, Lcom/switfpass/pay/bean/OrderBena;

    invoke-super {p0, p1}, Lcom/switfpass/pay/thread/UINotifyListener;->onSucceed(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->V:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->V:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    :cond_0
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getMoeny()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getMoeny()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/switfpass/pay/utils/Util;->formatMoneyUtils(D)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->a(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->am:Lcom/switfpass/pay/bean/RequestMsg;

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getOutTradeNo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/bean/RequestMsg;->setOutTradeNo(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->f(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0, v4}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->a(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;Z)V

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getStatus()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SUCCESS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-boolean v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->ae:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->ae:Z

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->V:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    invoke-virtual {p1, v4}, Lcom/switfpass/pay/bean/OrderBena;->setMark(Z)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->g(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Landroid/content/Context;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->startActivity(Lcom/switfpass/pay/bean/OrderBena;Landroid/content/Context;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->finish()V

    :cond_2
    :goto_0
    return-void

    :cond_3
    iget-boolean v0, p0, Lcom/switfpass/pay/activity/q;->an:Z

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->V:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->V:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    :cond_4
    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getStatus()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SUCCESS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->V:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    invoke-virtual {p1, v4}, Lcom/switfpass/pay/bean/OrderBena;->setMark(Z)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->g(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Landroid/content/Context;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/switfpass/pay/activity/PayResultActivity;->startActivity(Lcom/switfpass/pay/bean/OrderBena;Landroid/content/Context;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->finish()V

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->V:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    const-string v1, "\u8be5\u7b14\u8ba2\u5355\u72b6\u6001\uff1a\u672a\u652f\u4ed8\uff0c\u8bf7\u51b2\u6b63\u8be5\u7b14\u8ba2\u5355\u6216\u8005\u7ee7\u7eed\u67e5\u8be2\u786e\u8ba4\u8be5\u7b14\u8ba2\u5355\u662f\u5426\u5df2\u7ecf\u652f\u4ed8\u6210\u529f!"

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->showToastInfo(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->h(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)V

    goto :goto_0

    :cond_6
    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->count:I

    const/4 v1, 0x4

    if-ge v0, v1, :cond_7

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->V:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    const-wide/16 v2, 0x5

    invoke-static {v0, v2, v3}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->a(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;J)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget v1, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->count:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->count:I

    iget-object v7, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    new-instance v0, Lcom/switfpass/pay/utils/DialogInfoSdk;

    iget-object v1, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v2, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    sget v3, Lcom/switfpass/pay/R$string;->dialog_title_prompt:I

    invoke-virtual {v2, v3}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    iget-object v4, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    sget v5, Lcom/switfpass/pay/R$string;->pay_dialog_ok:I

    invoke-virtual {v4, v5}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0xb

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/switfpass/pay/utils/DialogInfoSdk;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/switfpass/pay/utils/DialogInfoSdk$HandleBtn;)V

    invoke-static {v7, v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->a(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;Lcom/switfpass/pay/utils/DialogInfoSdk;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v1, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->b(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Lcom/switfpass/pay/utils/DialogInfoSdk;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/switfpass/pay/utils/DialogHelper;->resize(Landroid/app/Activity;Landroid/app/Dialog;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->b(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Lcom/switfpass/pay/utils/DialogInfoSdk;

    move-result-object v0

    new-instance v1, Lcom/switfpass/pay/activity/s;

    invoke-direct {v1}, Lcom/switfpass/pay/activity/s;-><init>()V

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/utils/DialogInfoSdk;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->b(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Lcom/switfpass/pay/utils/DialogInfoSdk;

    move-result-object v0

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/DialogInfoSdk;->show()V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v1, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->c()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->b(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->c(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->i(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0

    :cond_7
    invoke-static {}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->d()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "result.state-->"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getStatus()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getStatus()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SUCCESS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getOutTradeNo()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->b(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->V:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    invoke-static {v0}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->h(Lcom/switfpass/pay/activity/PaySDKCaptureActivity;)V

    goto/16 :goto_0

    :cond_8
    iget-object v0, p0, Lcom/switfpass/pay/activity/q;->ai:Lcom/switfpass/pay/activity/PaySDKCaptureActivity;

    iget-object v0, v0, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->V:Lcom/switfpass/pay/utils/ProgressInfoDialog;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    goto/16 :goto_0
.end method
