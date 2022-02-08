.class public Lcom/heitao/platform/pay/wft/HTPWftPAy;
.super Ljava/lang/Object;
.source "HTPWftPAy.java"


# static fields
.field private static mInstance:Lcom/heitao/platform/pay/wft/HTPWftPAy;


# instance fields
.field public mPayListener:Lcom/heitao/platform/listener/HTPPayListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/pay/wft/HTPWftPAy;->mInstance:Lcom/heitao/platform/pay/wft/HTPWftPAy;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/heitao/platform/pay/wft/HTPWftPAy;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 17
    return-void
.end method

.method public static getInstance()Lcom/heitao/platform/pay/wft/HTPWftPAy;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/heitao/platform/pay/wft/HTPWftPAy;->mInstance:Lcom/heitao/platform/pay/wft/HTPWftPAy;

    if-nez v0, :cond_0

    .line 25
    new-instance v0, Lcom/heitao/platform/pay/wft/HTPWftPAy;

    invoke-direct {v0}, Lcom/heitao/platform/pay/wft/HTPWftPAy;-><init>()V

    sput-object v0, Lcom/heitao/platform/pay/wft/HTPWftPAy;->mInstance:Lcom/heitao/platform/pay/wft/HTPWftPAy;

    .line 28
    :cond_0
    sget-object v0, Lcom/heitao/platform/pay/wft/HTPWftPAy;->mInstance:Lcom/heitao/platform/pay/wft/HTPWftPAy;

    return-object v0
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 48
    if-nez p3, :cond_0

    .line 68
    :goto_0
    return-void

    .line 52
    :cond_0
    iget-object v1, p0, Lcom/heitao/platform/pay/wft/HTPWftPAy;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    if-eqz v1, :cond_2

    .line 53
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "resultCode"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 54
    .local v0, "respCode":Ljava/lang/String;
    if-eqz v0, :cond_1

    const-string v1, "success"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 56
    const-string v1, "wft\u652f\u4ed8\u6210\u529f"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->d(Ljava/lang/String;)V

    .line 57
    iget-object v1, p0, Lcom/heitao/platform/pay/wft/HTPWftPAy;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-virtual {v1}, Lcom/heitao/platform/listener/HTPPayListener;->onPayCompleted()V

    goto :goto_0

    .line 61
    :cond_1
    const-string v1, "wft\u652f\u4ed8\u5931\u8d25"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 62
    iget-object v1, p0, Lcom/heitao/platform/pay/wft/HTPWftPAy;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    const-string v2, "\u652f\u4ed8\u5931\u8d25"

    invoke-static {v2}, Lcom/heitao/platform/model/HTPError;->getCustomError(Ljava/lang/String;)Lcom/heitao/platform/model/HTPError;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    goto :goto_0

    .line 65
    .end local v0    # "respCode":Ljava/lang/String;
    :cond_2
    const-string v1, "wft\u672a\u5b8c\u6210\u652f\u4ed8,mPayListener null"

    invoke-static {v1}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public pay(Landroid/app/Activity;Lorg/json/JSONObject;Lcom/heitao/platform/listener/HTPPayListener;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Lorg/json/JSONObject;
    .param p3, "listener"    # Lcom/heitao/platform/listener/HTPPayListener;

    .prologue
    .line 31
    iput-object p3, p0, Lcom/heitao/platform/pay/wft/HTPWftPAy;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 33
    :try_start_0
    new-instance v1, Lcom/switfpass/pay/bean/RequestMsg;

    invoke-direct {v1}, Lcom/switfpass/pay/bean/RequestMsg;-><init>()V

    .line 34
    .local v1, "msg":Lcom/switfpass/pay/bean/RequestMsg;
    const-string v2, "token_id"

    invoke-static {p2, v2}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/switfpass/pay/bean/RequestMsg;->setTokenId(Ljava/lang/String;)V

    .line 35
    sget-object v2, Lcom/switfpass/pay/MainApplication;->PAY_WX_WAP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/switfpass/pay/bean/RequestMsg;->setTradeType(Ljava/lang/String;)V

    .line 36
    invoke-static {p1, v1}, Lcom/switfpass/pay/activity/PayPlugin;->unifiedH5Pay(Landroid/app/Activity;Lcom/switfpass/pay/bean/RequestMsg;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .end local v1    # "msg":Lcom/switfpass/pay/bean/RequestMsg;
    :goto_0
    return-void

    .line 38
    :catch_0
    move-exception v0

    .line 39
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "JSONObject params null"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 40
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 41
    const/4 p2, 0x0

    .line 42
    iget-object v2, p0, Lcom/heitao/platform/pay/wft/HTPWftPAy;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    new-instance v3, Lcom/heitao/platform/model/HTPError;

    const/16 v4, -0x2710

    const-string v5, "JSONObject params null"

    invoke-direct {v3, v4, v5}, Lcom/heitao/platform/model/HTPError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    goto :goto_0
.end method
