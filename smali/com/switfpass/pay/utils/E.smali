.class final Lcom/switfpass/pay/utils/E;
.super Lcom/switfpass/pay/thread/UINotifyListener;


# instance fields
.field private synthetic dH:Lcom/switfpass/pay/utils/PayDialogInfo;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/E;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-direct {p0}, Lcom/switfpass/pay/thread/UINotifyListener;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/utils/E;)Lcom/switfpass/pay/utils/PayDialogInfo;
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/utils/E;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    return-object v0
.end method


# virtual methods
.method public final onError(Ljava/lang/Object;)V
    .locals 2

    const/4 v1, 0x1

    iget-object v0, p0, Lcom/switfpass/pay/utils/E;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->dismissMyLoading()V

    invoke-super {p0, p1}, Lcom/switfpass/pay/thread/UINotifyListener;->onError(Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    const-string v0, "\u652f\u4ed8\u5931\u8d25\uff0c\u539f\u56e0\u5305\u62ec\u7528\u6237\u7f51\u7edc\u51fa\u9519"

    invoke-static {v1, v1, v0}, Lcom/switfpass/pay/handle/PayHandlerManager;->notifyMessage(IILjava/lang/Object;)V

    iget-object v0, p0, Lcom/switfpass/pay/utils/E;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/switfpass/pay/utils/F;

    invoke-direct {v1, p0, p1}, Lcom/switfpass/pay/utils/F;-><init>(Lcom/switfpass/pay/utils/E;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public final onPostExecute()V
    .locals 0

    invoke-super {p0}, Lcom/switfpass/pay/thread/UINotifyListener;->onPostExecute()V

    return-void
.end method

.method public final onPreExecute()V
    .locals 4

    invoke-super {p0}, Lcom/switfpass/pay/thread/UINotifyListener;->onPreExecute()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/E;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    iget-object v1, p0, Lcom/switfpass/pay/utils/E;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x1

    const-string v3, "\u8bf7\u7a0d\u5019\uff0c\u6b63\u5728\u8bf7\u6c42\u652f\u4ed8\u5b9d.."

    invoke-virtual {v0, v1, v2, v3}, Lcom/switfpass/pay/utils/PayDialogInfo;->showLoading(Landroid/content/Context;ZLjava/lang/String;)V

    return-void
.end method

.method public final synthetic onSucceed(Ljava/lang/Object;)V
    .locals 1

    check-cast p1, Lcom/switfpass/pay/bean/OrderBena;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/utils/E;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0, p1}, Lcom/switfpass/pay/utils/PayDialogInfo;->a(Lcom/switfpass/pay/utils/PayDialogInfo;Lcom/switfpass/pay/bean/OrderBena;)V

    :cond_0
    return-void
.end method
