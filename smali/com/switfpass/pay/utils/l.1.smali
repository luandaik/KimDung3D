.class final Lcom/switfpass/pay/utils/l;
.super Lcom/switfpass/pay/thread/UINotifyListener;


# instance fields
.field private final synthetic am:Lcom/switfpass/pay/bean/RequestMsg;

.field private synthetic dH:Lcom/switfpass/pay/utils/PayDialogInfo;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    iput-object p2, p0, Lcom/switfpass/pay/utils/l;->am:Lcom/switfpass/pay/bean/RequestMsg;

    invoke-direct {p0}, Lcom/switfpass/pay/thread/UINotifyListener;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/utils/l;)Lcom/switfpass/pay/utils/PayDialogInfo;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    return-object v0
.end method


# virtual methods
.method public final onError(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Lcom/switfpass/pay/utils/PayDialogInfo;)Lcom/switfpass/pay/utils/ProgressInfoDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->c(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->c(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->d(Lcom/switfpass/pay/utils/PayDialogInfo;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Lcom/switfpass/pay/utils/PayDialogInfo;Z)V

    invoke-super {p0, p1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/switfpass/pay/utils/m;

    invoke-direct {v1, p0, p1}, Lcom/switfpass/pay/utils/m;-><init>(Lcom/switfpass/pay/utils/l;Ljava/lang/Object;)V

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

    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Lcom/switfpass/pay/utils/PayDialogInfo;)Lcom/switfpass/pay/utils/ProgressInfoDialog;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/switfpass/pay/utils/DialogHelper;->resize(Landroid/app/Activity;Landroid/app/Dialog;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Lcom/switfpass/pay/utils/PayDialogInfo;)Lcom/switfpass/pay/utils/ProgressInfoDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->show()V

    return-void
.end method

.method public final synthetic onSucceed(Ljava/lang/Object;)V
    .locals 4

    check-cast p1, Lcom/switfpass/pay/bean/OrderBena;

    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Lcom/switfpass/pay/utils/PayDialogInfo;)Lcom/switfpass/pay/utils/ProgressInfoDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/ProgressInfoDialog;->dismiss()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->c(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->c(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    if-eqz p1, :cond_3

    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->d(Lcom/switfpass/pay/utils/PayDialogInfo;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getOutTradeNo()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->am:Lcom/switfpass/pay/bean/RequestMsg;

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getOutTradeNo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/bean/RequestMsg;->setOutTradeNo(Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getUuId()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/switfpass/pay/utils/l;->am:Lcom/switfpass/pay/bean/RequestMsg;

    invoke-virtual {v2}, Lcom/switfpass/pay/bean/RequestMsg;->getTokenId()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/switfpass/pay/utils/l;->am:Lcom/switfpass/pay/bean/RequestMsg;

    invoke-virtual {v3}, Lcom/switfpass/pay/bean/RequestMsg;->getOutTradeNo()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/switfpass/pay/activity/QQWapPayWebView;->startActivity(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    const-string v1, "\u624b\u673a\u6ca1\u6709\u5b89\u88c5\u5fae\u4fe1\uff0c\u8bf7\u5148\u5b89\u88c5\u5fae\u4fe1"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/switfpass/pay/utils/l;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Lcom/switfpass/pay/utils/PayDialogInfo;Z)V

    goto :goto_0
.end method
