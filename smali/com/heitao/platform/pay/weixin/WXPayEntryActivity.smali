.class public Lcom/heitao/platform/pay/weixin/WXPayEntryActivity;
.super Landroid/app/Activity;
.source "WXPayEntryActivity.java"

# interfaces
.implements Lcom/tencent/mm/sdk/openapi/IWXAPIEventHandler;


# instance fields
.field private mPayListener:Lcom/heitao/platform/listener/HTPPayListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 22
    invoke-static {}, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->getInstance()Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    iput-object v0, p0, Lcom/heitao/platform/pay/weixin/WXPayEntryActivity;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 20
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 28
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 30
    const-string v0, "WXPayEntryActivity->onCreate"

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 31
    invoke-static {}, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->getInstance()Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->mApi:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    invoke-virtual {p0}, Lcom/heitao/platform/pay/weixin/WXPayEntryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Lcom/tencent/mm/sdk/openapi/IWXAPI;->handleIntent(Landroid/content/Intent;Lcom/tencent/mm/sdk/openapi/IWXAPIEventHandler;)Z

    .line 32
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 37
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 38
    invoke-virtual {p0, p1}, Lcom/heitao/platform/pay/weixin/WXPayEntryActivity;->setIntent(Landroid/content/Intent;)V

    .line 39
    invoke-static {}, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->getInstance()Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/platform/pay/weixin/HTPSDKWeiXinPay;->mApi:Lcom/tencent/mm/sdk/openapi/IWXAPI;

    invoke-virtual {p0}, Lcom/heitao/platform/pay/weixin/WXPayEntryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Lcom/tencent/mm/sdk/openapi/IWXAPI;->handleIntent(Landroid/content/Intent;Lcom/tencent/mm/sdk/openapi/IWXAPIEventHandler;)Z

    .line 40
    return-void
.end method

.method public onReq(Lcom/tencent/mm/sdk/modelbase/BaseReq;)V
    .locals 2
    .param p1, "baseReq"    # Lcom/tencent/mm/sdk/modelbase/BaseReq;

    .prologue
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "WXPayEntryActivity->onReq baseReq="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method public onResp(Lcom/tencent/mm/sdk/modelbase/BaseResp;)V
    .locals 4
    .param p1, "baseResp"    # Lcom/tencent/mm/sdk/modelbase/BaseResp;

    .prologue
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "WXPayEntryActivity->onResp errCode="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p1, Lcom/tencent/mm/sdk/modelbase/BaseResp;->errCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " errStr="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/tencent/mm/sdk/modelbase/BaseResp;->errStr:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 54
    invoke-virtual {p1}, Lcom/tencent/mm/sdk/modelbase/BaseResp;->getType()I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_1

    .line 56
    iget v0, p1, Lcom/tencent/mm/sdk/modelbase/BaseResp;->errCode:I

    if-nez v0, :cond_2

    .line 58
    iget-object v0, p0, Lcom/heitao/platform/pay/weixin/WXPayEntryActivity;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/heitao/platform/pay/weixin/WXPayEntryActivity;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-virtual {v0}, Lcom/heitao/platform/listener/HTPPayListener;->onPayCompleted()V

    .line 71
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/heitao/platform/pay/weixin/WXPayEntryActivity;->finish()V

    .line 73
    :cond_1
    return-void

    .line 65
    :cond_2
    iget-object v0, p0, Lcom/heitao/platform/pay/weixin/WXPayEntryActivity;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    if-eqz v0, :cond_0

    .line 67
    iget-object v0, p0, Lcom/heitao/platform/pay/weixin/WXPayEntryActivity;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    new-instance v1, Lcom/heitao/platform/model/HTPError;

    iget v2, p1, Lcom/tencent/mm/sdk/modelbase/BaseResp;->errCode:I

    iget-object v3, p1, Lcom/tencent/mm/sdk/modelbase/BaseResp;->errStr:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lcom/heitao/platform/model/HTPError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    goto :goto_0
.end method
