.class final Lcom/switfpass/pay/activity/F;
.super Lcom/switfpass/pay/thread/UINotifyListener;


# instance fields
.field private synthetic au:Lcom/switfpass/pay/activity/QQWapPayWebView;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/QQWapPayWebView;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/F;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-direct {p0}, Lcom/switfpass/pay/thread/UINotifyListener;-><init>()V

    return-void
.end method


# virtual methods
.method public final onError(Ljava/lang/Object;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "resultCode"

    const-string v2, "NOTPAY"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/switfpass/pay/activity/F;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Lcom/switfpass/pay/activity/QQWapPayWebView;->setResult(ILandroid/content/Intent;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/F;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/QQWapPayWebView;->finish()V

    return-void
.end method

.method public final onPostExecute()V
    .locals 0

    invoke-super {p0}, Lcom/switfpass/pay/thread/UINotifyListener;->onPostExecute()V

    return-void
.end method

.method public final onPreExecute()V
    .locals 0

    invoke-super {p0}, Lcom/switfpass/pay/thread/UINotifyListener;->onPreExecute()V

    return-void
.end method

.method public final synthetic onSucceed(Ljava/lang/Object;)V
    .locals 4

    const/4 v3, -0x1

    check-cast p1, Lcom/switfpass/pay/bean/OrderBena;

    if-eqz p1, :cond_0

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "resultCode"

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getStatus()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/switfpass/pay/activity/F;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-virtual {v1, v3, v0}, Lcom/switfpass/pay/activity/QQWapPayWebView;->setResult(ILandroid/content/Intent;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/F;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/QQWapPayWebView;->finish()V

    :goto_0
    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "resultCode"

    const-string v2, "NOTPAY"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/switfpass/pay/activity/F;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-virtual {v1, v3, v0}, Lcom/switfpass/pay/activity/QQWapPayWebView;->setResult(ILandroid/content/Intent;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/F;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/QQWapPayWebView;->finish()V

    goto :goto_0
.end method
