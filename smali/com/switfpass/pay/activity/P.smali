.class final Lcom/switfpass/pay/activity/P;
.super Lcom/switfpass/pay/thread/UINotifyListener;


# instance fields
.field private synthetic aJ:Lcom/switfpass/pay/activity/QrcodeActivity;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/activity/QrcodeActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/P;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    invoke-direct {p0}, Lcom/switfpass/pay/thread/UINotifyListener;-><init>()V

    return-void
.end method


# virtual methods
.method public final onError(Ljava/lang/Object;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/P;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    new-instance v1, Lcom/switfpass/pay/activity/Q;

    invoke-direct {v1}, Lcom/switfpass/pay/activity/Q;-><init>()V

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/activity/QrcodeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

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
    .locals 3

    check-cast p1, Lcom/switfpass/pay/bean/OrderBena;

    invoke-super {p0, p1}, Lcom/switfpass/pay/thread/UINotifyListener;->onSucceed(Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/P;->aJ:Lcom/switfpass/pay/activity/QrcodeActivity;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/QrcodeActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "\u7ea2\u5305\u53d1\u9001\u6210\u529f"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_0
    return-void
.end method
