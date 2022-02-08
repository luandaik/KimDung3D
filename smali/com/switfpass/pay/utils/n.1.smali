.class final Lcom/switfpass/pay/utils/n;
.super Lcom/switfpass/pay/thread/UINotifyListener;


# instance fields
.field private final synthetic am:Lcom/switfpass/pay/bean/RequestMsg;

.field private synthetic dH:Lcom/switfpass/pay/utils/PayDialogInfo;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/RequestMsg;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/n;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    iput-object p2, p0, Lcom/switfpass/pay/utils/n;->am:Lcom/switfpass/pay/bean/RequestMsg;

    invoke-direct {p0}, Lcom/switfpass/pay/thread/UINotifyListener;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/utils/n;)Lcom/switfpass/pay/utils/PayDialogInfo;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/n;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    return-object v0
.end method


# virtual methods
.method public final onError(Ljava/lang/Object;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/n;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->dismissMyLoading()V

    if-eqz p1, :cond_0

    if-eqz p1, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/n;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/switfpass/pay/utils/o;

    invoke-direct {v1, p0, p1}, Lcom/switfpass/pay/utils/o;-><init>(Lcom/switfpass/pay/utils/n;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    const/16 v0, 0x9

    const/4 v1, -0x1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string v1, "PayDialogInfo"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public final onPostExecute()V
    .locals 0

    invoke-super {p0}, Lcom/switfpass/pay/thread/UINotifyListener;->onPostExecute()V

    return-void
.end method

.method public final onPreExecute()V
    .locals 4

    iget-object v0, p0, Lcom/switfpass/pay/utils/n;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    iget-object v1, p0, Lcom/switfpass/pay/utils/n;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x1

    const-string v3, "\u8bf7\u7a0d\u5019\uff0c\u6b63\u5728\u8bf7\u6c42QQ\u94b1\u5305H5\u652f\u4ed8.."

    invoke-virtual {v0, v1, v2, v3}, Lcom/switfpass/pay/utils/PayDialogInfo;->showLoading(Landroid/content/Context;ZLjava/lang/String;)V

    invoke-super {p0}, Lcom/switfpass/pay/thread/UINotifyListener;->onPreExecute()V

    return-void
.end method

.method public final synthetic onSucceed(Ljava/lang/Object;)V
    .locals 4

    check-cast p1, Lcom/switfpass/pay/bean/OrderBena;

    iget-object v0, p0, Lcom/switfpass/pay/utils/n;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->dismissMyLoading()V

    if-eqz p1, :cond_1

    const/16 v0, 0x9

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "success"

    invoke-static {v0, v1, v2}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/n;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->isQQClientAvailable(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getOutTradeNo()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/n;->am:Lcom/switfpass/pay/bean/RequestMsg;

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getOutTradeNo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/bean/RequestMsg;->setOutTradeNo(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/utils/n;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {p1}, Lcom/switfpass/pay/bean/OrderBena;->getUuId()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/switfpass/pay/utils/n;->am:Lcom/switfpass/pay/bean/RequestMsg;

    invoke-virtual {v2}, Lcom/switfpass/pay/bean/RequestMsg;->getTokenId()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/switfpass/pay/utils/n;->am:Lcom/switfpass/pay/bean/RequestMsg;

    invoke-virtual {v3}, Lcom/switfpass/pay/bean/RequestMsg;->getOutTradeNo()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/switfpass/pay/activity/QQWapPayWebView;->startActivity(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void

    :cond_2
    iget-object v0, p0, Lcom/switfpass/pay/utils/n;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    const-string v1, "\u624b\u673aQQ\u6ca1\u6709\u5b89\u88c5\uff0c\u8bf7\u5148\u5b89\u88c5\u624b\u673aQQ"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "PayDialogInfo"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "qqWapPays "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
