.class public Lcom/heitao/platform/activity/HTPWebViewActivity;
.super Lcom/heitao/platform/activity/HTPBaseActivity;
.source "HTPWebViewActivity.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "SetJavaScriptEnabled"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/platform/activity/HTPWebViewActivity$HTPWebViewClient;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPBaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    .line 22
    invoke-super {p0, p1}, Lcom/heitao/platform/activity/HTPBaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 24
    const-string v2, "htp_pay_webview"

    invoke-static {p0, v2}, Lcom/heitao/platform/common/HTPUtils;->getLayoutByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/heitao/platform/activity/HTPWebViewActivity;->setContentView(I)V

    .line 26
    const-string v2, "htp_webview"

    invoke-static {p0, v2}, Lcom/heitao/platform/common/HTPUtils;->getViewByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/heitao/platform/activity/HTPWebViewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/webkit/WebView;

    .line 27
    .local v1, "webView":Landroid/webkit/WebView;
    new-instance v2, Lcom/heitao/platform/activity/HTPWebViewActivity$HTPWebViewClient;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/HTPWebViewActivity$HTPWebViewClient;-><init>(Lcom/heitao/platform/activity/HTPWebViewActivity;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 28
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 29
    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 30
    invoke-virtual {v1, v4}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 31
    invoke-virtual {v1}, Landroid/webkit/WebView;->clearHistory()V

    .line 33
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPWebViewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "URL"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 34
    .local v0, "url":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 36
    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 43
    :goto_0
    return-void

    .line 40
    :cond_0
    const-string v2, "url_cannot_null"

    invoke-static {p0, v2}, Lcom/heitao/platform/common/HTPUtils;->getStringByR(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPLog;->e(Ljava/lang/String;)V

    .line 41
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPWebViewActivity;->finish()V

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 100
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 102
    invoke-static {}, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->getInstance()Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->payCancel()V

    .line 103
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPWebViewActivity;->finish()V

    .line 104
    const/4 v0, 0x1

    .line 107
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/heitao/platform/activity/HTPBaseActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onPayFinished()V
    .locals 1

    .prologue
    .line 93
    invoke-static {}, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->getInstance()Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;

    move-result-object v0

    invoke-virtual {v0}, Lcom/heitao/platform/pay/webpay/HTPSDKWebPay;->payFinish()V

    .line 94
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPWebViewActivity;->finish()V

    .line 95
    return-void
.end method
