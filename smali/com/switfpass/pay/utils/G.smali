.class final Lcom/switfpass/pay/utils/G;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private synthetic dH:Lcom/switfpass/pay/utils/PayDialogInfo;


# direct methods
.method constructor <init>(Lcom/switfpass/pay/utils/PayDialogInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/utils/G;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    new-instance v0, Lcom/switfpass/pay/utils/PayToast;

    invoke-direct {v0}, Lcom/switfpass/pay/utils/PayToast;-><init>()V

    iget-object v1, p0, Lcom/switfpass/pay/utils/G;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->e(Lcom/switfpass/pay/utils/PayDialogInfo;)Lcom/switfpass/pay/bean/RequestMsg;

    move-result-object v1

    invoke-virtual {v1}, Lcom/switfpass/pay/bean/RequestMsg;->getTokenId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v1, ""

    iget-object v2, p0, Lcom/switfpass/pay/utils/G;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v2}, Lcom/switfpass/pay/utils/PayDialogInfo;->e(Lcom/switfpass/pay/utils/PayDialogInfo;)Lcom/switfpass/pay/bean/RequestMsg;

    move-result-object v2

    invoke-virtual {v2}, Lcom/switfpass/pay/bean/RequestMsg;->getTokenId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/switfpass/pay/utils/G;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v1

    const-string v2, "tokenid\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-virtual {v0, v1, v2}, Lcom/switfpass/pay/utils/PayToast;->showToast(Landroid/content/Context;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/switfpass/pay/utils/G;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-virtual {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->cancel()V

    iget-object v0, p0, Lcom/switfpass/pay/utils/G;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v0}, Lcom/switfpass/pay/utils/PayDialogInfo;->b(Lcom/switfpass/pay/utils/PayDialogInfo;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/switfpass/pay/utils/G;->dH:Lcom/switfpass/pay/utils/PayDialogInfo;

    invoke-static {v1}, Lcom/switfpass/pay/utils/PayDialogInfo;->e(Lcom/switfpass/pay/utils/PayDialogInfo;)Lcom/switfpass/pay/bean/RequestMsg;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/switfpass/pay/activity/PaySDKCaptureActivity;->startActivity(Landroid/content/Context;Lcom/switfpass/pay/bean/RequestMsg;)V

    goto :goto_0
.end method
