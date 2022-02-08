.class public Lcom/shengpay/express/smc/SdpWebAppInterface;
.super Ljava/lang/Object;
.source "SdpWebAppInterface.java"


# static fields
.field private static webAppInterface:Lcom/shengpay/express/smc/SdpWebAppInterface;


# instance fields
.field private TAG:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private merchantName:Ljava/lang/String;

.field private walletPcgName:Ljava/lang/String;

.field private webView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>(Landroid/webkit/WebView;Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "webView"    # Landroid/webkit/WebView;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "merchantName"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const-string v0, "SdpWebAppInterface"

    iput-object v0, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->TAG:Ljava/lang/String;

    .line 21
    const-string v0, "com.shengpay.mobile.wallet"

    iput-object v0, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->walletPcgName:Ljava/lang/String;

    .line 41
    iput-object p1, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->webView:Landroid/webkit/WebView;

    .line 42
    iput-object p2, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->context:Landroid/content/Context;

    .line 43
    iput-object p3, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->merchantName:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public static init(Landroid/webkit/WebView;Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p0, "webView"    # Landroid/webkit/WebView;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "merchantName"    # Ljava/lang/String;

    .prologue
    .line 34
    new-instance v1, Lcom/shengpay/express/smc/SdpWebAppInterface;

    invoke-direct {v1, p0, p1, p2}, Lcom/shengpay/express/smc/SdpWebAppInterface;-><init>(Landroid/webkit/WebView;Landroid/content/Context;Ljava/lang/String;)V

    sput-object v1, Lcom/shengpay/express/smc/SdpWebAppInterface;->webAppInterface:Lcom/shengpay/express/smc/SdpWebAppInterface;

    .line 35
    sget-object v1, Lcom/shengpay/express/smc/SdpWebAppInterface;->webAppInterface:Lcom/shengpay/express/smc/SdpWebAppInterface;

    const-string v2, "walletHelper"

    invoke-virtual {p0, v1, v2}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 37
    .local v0, "webSettings":Landroid/webkit/WebSettings;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 38
    return-void
.end method


# virtual methods
.method public callWallet(Ljava/lang/String;)V
    .locals 6
    .param p1, "data"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 69
    iget-object v3, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "callWallet.data="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 72
    .local v2, "jo":Lorg/json/JSONObject;
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 73
    .local v1, "intent":Landroid/content/Intent;
    const-string v3, "sdp.intent.action.PAY"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 74
    const-string v3, "sdp:"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 75
    const-string v3, "sdp_pkgName"

    iget-object v4, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 76
    const-string v3, "sdp_orderNo"

    const-string v4, "orderNo"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 77
    const-string v3, "sdp_merchantNo"

    const-string v4, "merchantNo"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 78
    const-string v3, "sdp_merchantName"

    const-string v4, "merchantName"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 79
    const-string v3, "sdp_sessionToken"

    const-string v4, "sessionToken"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 80
    const-string v3, "sdp_goodsInfo"

    const-string v4, "goodsInfo"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 81
    const-string v3, "sdp_riskExt"

    const-string v4, "riskExt"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 82
    const-string v3, "sdp_appId"

    const-string v4, "appId"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 83
    const-string v3, "sdp_acquireInstOrderNo"

    const-string v4, "acquireInstOrderNo"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 84
    const-string v3, "sdp_amount"

    const-string v4, "amount"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 85
    const-string v3, "sdp_acquireInstType"

    const-string v4, "acquireInstType"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 86
    const-string v3, "sdp_sign"

    const-string v4, "sign"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 87
    iget-object v3, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "intent.bundle="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    invoke-virtual {v5}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    iget-object v3, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->context:Landroid/content/Context;

    invoke-virtual {v3, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "jo":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 89
    :catch_0
    move-exception v0

    .line 90
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public getMerchantName()Ljava/lang/String;
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->merchantName:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v0, ""

    iget-object v1, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->merchantName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->merchantName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 49
    :cond_0
    const-string v0, "\u65b0\u5feb\u6377\u6536\u94f6\u53f0"

    .line 51
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->merchantName:Ljava/lang/String;

    goto :goto_0
.end method

.method public isInstalled()Ljava/lang/String;
    .locals 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 57
    :try_start_0
    iget-object v2, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    iget-object v3, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->walletPcgName:Ljava/lang/String;

    .line 58
    const/16 v4, 0x2000

    .line 57
    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 59
    .local v1, "info":Landroid/content/pm/ApplicationInfo;
    iget-object v2, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->TAG:Ljava/lang/String;

    const-string v3, "isInstalled,true."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    const-string v2, "true"

    .line 63
    .end local v1    # "info":Landroid/content/pm/ApplicationInfo;
    :goto_0
    return-object v2

    .line 61
    :catch_0
    move-exception v0

    .line 62
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    iget-object v2, p0, Lcom/shengpay/express/smc/SdpWebAppInterface;->TAG:Ljava/lang/String;

    const-string v3, "isInstalled,false."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    const-string v2, "false"

    goto :goto_0
.end method
