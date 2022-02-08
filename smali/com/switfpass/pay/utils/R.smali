.class final Lcom/switfpass/pay/utils/R;
.super Lcom/switfpass/pay/thread/UINotifyListener;


# instance fields
.field private synthetic dH:Lcom/switfpass/pay/utils/PayDialogInfo;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-direct {p0}, Lcom/switfpass/pay/thread/UINotifyListener;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/utils/R;)Lcom/switfpass/pay/utils/PayDialogInfo;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    return-object v0
.end method


# virtual methods
.method public final onError(Ljava/lang/Object;)V
    .locals 3

    const/4 v2, 0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Lcom/switfpass/pay/utils/PayDialogInfo;)Lcom/switfpass/pay/utils/ProgressInfoDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->c(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->c(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    invoke-super {p0, p1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->d(Lcom/switfpass/pay/utils/PayDialogInfo;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0, v2}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Lcom/switfpass/pay/utils/PayDialogInfo;Z)V

    if-eqz p1, :cond_1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v1, v1, v0}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/switfpass/pay/utils/S;

    invoke-direct {v1, p0, p1}, Lcom/switfpass/pay/utils/S;-><init>(Lcom/switfpass/pay/utils/R;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

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

    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Lcom/switfpass/pay/utils/PayDialogInfo;)Lcom/switfpass/pay/utils/ProgressInfoDialog;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/switfpass/pay/utils/DialogHelper;->resize(Landroid/app/Activity;Landroid/app/Dialog;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Lcom/switfpass/pay/utils/PayDialogInfo;)Lcom/switfpass/pay/utils/ProgressInfoDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->show()V

    return-void
.end method

.method public final synthetic onSucceed(Ljava/lang/Object;)V
    .locals 2

    check-cast p1, Lcom/switfpass/pay/bean/OrderBena;

    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Lcom/switfpass/pay/utils/PayDialogInfo;)Lcom/switfpass/pay/utils/ProgressInfoDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->c(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->c(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->d(Lcom/switfpass/pay/utils/PayDialogInfo;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/switfpass/pay/activity/QrcodeActivity;->startActivity(Lcom/switfpass/pay/bean/OrderBena;Landroid/content/Context;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/switfpass/pay/utils/R;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Lcom/switfpass/pay/utils/PayDialogInfo;Z)V

    goto :goto_0
.end method
