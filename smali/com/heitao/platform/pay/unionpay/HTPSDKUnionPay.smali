.class public Lcom/heitao/platform/pay/unionpay/HTPSDKUnionPay;
.super Ljava/lang/Object;
.source "HTPSDKUnionPay.java"


# static fields
.field public static final MODE_PRODUCT:Ljava/lang/String; = "00"

.field public static final MODE_TEST:Ljava/lang/String; = "01"

.field public static mContext:Landroid/content/Context;

.field private static mPayListener:Lcom/heitao/platform/listener/HTPPayListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/pay/unionpay/HTPSDKUnionPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 21
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p0, "requestCode"    # I
    .param p1, "resultCode"    # I
    .param p2, "data"    # Landroid/content/Intent;

    .prologue
    .line 38
    if-nez p2, :cond_1

    .line 75
    :cond_0
    :goto_0
    return-void

    .line 42
    :cond_1
    const-string v1, ""

    .line 43
    .local v1, "msg":Ljava/lang/String;
    const/4 v0, 0x0

    .line 47
    .local v0, "isSecceed":Z
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    const-string v4, "pay_result"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 48
    .local v2, "str":Ljava/lang/String;
    const-string v3, "success"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 50
    const-string v3, "pay_success"

    invoke-static {v3}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 51
    const/4 v0, 0x1

    .line 64
    :cond_2
    :goto_1
    sget-object v3, Lcom/heitao/platform/pay/unionpay/HTPSDKUnionPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    if-eqz v3, :cond_0

    .line 66
    if-eqz v0, :cond_5

    .line 68
    sget-object v3, Lcom/heitao/platform/pay/unionpay/HTPSDKUnionPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-virtual {v3}, Lcom/heitao/platform/listener/HTPPayListener;->onPayCompleted()V

    goto :goto_0

    .line 53
    :cond_3
    const-string v3, "fail"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 55
    const-string v3, "pay_fail"

    invoke-static {v3}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 56
    const/4 v0, 0x0

    .line 57
    goto :goto_1

    .line 58
    :cond_4
    const-string v3, "cancel"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 60
    const-string v3, "pay_cancel"

    invoke-static {v3}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 61
    const/4 v0, 0x0

    goto :goto_1

    .line 72
    :cond_5
    sget-object v3, Lcom/heitao/platform/pay/unionpay/HTPSDKUnionPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-static {v1}, Lcom/heitao/platform/model/HTPError;->getCustomError(Ljava/lang/String;)Lcom/heitao/platform/model/HTPError;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    goto :goto_0
.end method

.method public static pay(Landroid/app/Activity;Lcom/heitao/platform/model/HTPPayInfo;Ljava/lang/String;Lcom/heitao/platform/listener/HTPPayListener;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "payInfo"    # Lcom/heitao/platform/model/HTPPayInfo;
    .param p2, "tn"    # Ljava/lang/String;
    .param p3, "listener"    # Lcom/heitao/platform/listener/HTPPayListener;

    .prologue
    const/4 v1, 0x0

    .line 25
    sput-object p3, Lcom/heitao/platform/pay/unionpay/HTPSDKUnionPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 28
    const-string v0, "00"

    invoke-static {p0, v1, v1, p2, v0}, Lcom/unionpay/UPPayAssistEx;->startPay(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    return-void
.end method
