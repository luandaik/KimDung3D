.class public Lcom/heitao/platform/pay/smc/HTPSMCWXPay;
.super Ljava/lang/Object;
.source "HTPSMCWXPay.java"


# static fields
.field private static mInstance:Lcom/heitao/platform/pay/smc/HTPSMCWXPay;


# instance fields
.field public mPayListener:Lcom/heitao/platform/listener/HTPPayListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;->mInstance:Lcom/heitao/platform/pay/smc/HTPSMCWXPay;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 16
    return-void
.end method

.method public static getInstance()Lcom/heitao/platform/pay/smc/HTPSMCWXPay;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;->mInstance:Lcom/heitao/platform/pay/smc/HTPSMCWXPay;

    if-nez v0, :cond_0

    .line 24
    new-instance v0, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;

    invoke-direct {v0}, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;-><init>()V

    sput-object v0, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;->mInstance:Lcom/heitao/platform/pay/smc/HTPSMCWXPay;

    .line 27
    :cond_0
    sget-object v0, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;->mInstance:Lcom/heitao/platform/pay/smc/HTPSMCWXPay;

    return-object v0
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 45
    if-nez p3, :cond_0

    .line 54
    :goto_0
    return-void

    .line 48
    :cond_0
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "resultMSG"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "respCode":Ljava/lang/String;
    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "notifyPaySuccess"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 50
    iget-object v1, p0, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-virtual {v1}, Lcom/heitao/platform/listener/HTPPayListener;->onPayCompleted()V

    goto :goto_0

    .line 52
    :cond_1
    iget-object v1, p0, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    new-instance v2, Lcom/heitao/platform/model/HTPError;

    const/16 v3, -0x2710

    const-string v4, "\u652f\u4ed8\u5904\u7406\u4e2d\uff0c\u8bf7\u56de\u6e38\u620f\u5185\u67e5\u770b"

    invoke-direct {v2, v3, v4}, Lcom/heitao/platform/model/HTPError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    goto :goto_0
.end method

.method public pay(Landroid/app/Activity;Lorg/json/JSONObject;Lcom/heitao/platform/listener/HTPPayListener;)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "params"    # Lorg/json/JSONObject;
    .param p3, "listener"    # Lcom/heitao/platform/listener/HTPPayListener;

    .prologue
    .line 30
    iput-object p3, p0, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 32
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/heitao/platform/activity/HTPWAPWXActivity;

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 33
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "url"

    const-string v3, "render_html"

    invoke-static {p2, v3}, Lcom/heitao/platform/common/HTPJSONHelper;->getString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 36
    :catch_0
    move-exception v0

    .line 37
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "JSONObject params null"

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 38
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 39
    const/4 p2, 0x0

    .line 40
    iget-object v2, p0, Lcom/heitao/platform/pay/smc/HTPSMCWXPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    new-instance v3, Lcom/heitao/platform/model/HTPError;

    const/16 v4, -0x2710

    const-string v5, "JSONObject params null"

    invoke-direct {v3, v4, v5}, Lcom/heitao/platform/model/HTPError;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    goto :goto_0
.end method
