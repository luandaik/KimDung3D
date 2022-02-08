.class public Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;
.super Ljava/lang/Object;
.source "HTPSDKWebPay.java"


# static fields
.field private static mInstance:Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;


# instance fields
.field private mPayListener:Lcom/heitao/platform/listener/HTPPayListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->mInstance:Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 11
    return-void
.end method

.method public static getInstance()Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->mInstance:Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;

    if-nez v0, :cond_0

    .line 50
    new-instance v0, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;

    invoke-direct {v0}, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;-><init>()V

    sput-object v0, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->mInstance:Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;

    .line 53
    :cond_0
    sget-object v0, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->mInstance:Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;

    return-object v0
.end method


# virtual methods
.method public pay(Landroid/app/Activity;Lcom/heitao/platform/model/HTPPayInfo;Ljava/lang/String;Lcom/heitao/platform/listener/HTPPayListener;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "payInfo"    # Lcom/heitao/platform/model/HTPPayInfo;
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "listener"    # Lcom/heitao/platform/listener/HTPPayListener;

    .prologue
    .line 18
    iput-object p4, p0, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    .line 20
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/heitao/platform/activity/HTPWebViewActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 21
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 22
    const-string v1, "URL"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 24
    return-void
.end method

.method public payCancel()V
    .locals 2

    .prologue
    .line 38
    iget-object v0, p0, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    if-eqz v0, :cond_0

    .line 40
    iget-object v0, p0, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-static {}, Lcom/heitao/platform/model/HTPError;->getPayCancelError()Lcom/heitao/platform/model/HTPError;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/heitao/platform/listener/HTPPayListener;->onPayFailed(Lcom/heitao/platform/model/HTPError;)V

    .line 43
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->mInstance:Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;

    .line 44
    return-void
.end method

.method public payFinish()V
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    if-eqz v0, :cond_0

    .line 30
    iget-object v0, p0, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->mPayListener:Lcom/heitao/platform/listener/HTPPayListener;

    invoke-virtual {v0}, Lcom/heitao/platform/listener/HTPPayListener;->onPayCompleted()V

    .line 33
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->mInstance:Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;

    .line 34
    return-void
.end method
