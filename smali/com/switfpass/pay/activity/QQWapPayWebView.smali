.class public Lcom/switfpass/pay/activity/QQWapPayWebView;
.super Lcom/switfpass/pay/activity/BasePayActivity;


# instance fields
.field private X:Ljava/lang/String;

.field private as:Z

.field private at:Lcom/switfpass/pay/activity/WebViewEx;

.field private tokenId:Ljava/lang/String;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/switfpass/pay/activity/BasePayActivity;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->as:Z

    return-void
.end method

.method static synthetic a(Lcom/switfpass/pay/activity/QQWapPayWebView;)V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->as:Z

    return-void
.end method

.method public static startActivity(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "url"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-class v1, Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public static startActivity(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "url"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "tokenId"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "outTradeNo"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-class v1, Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    const/4 v3, 0x1

    invoke-super {p0, p1}, Lcom/switfpass/pay/activity/BasePayActivity;->onCreate(Landroid/os/Bundle;)V

    iput-boolean v3, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->as:Z

    new-instance v0, Lcom/switfpass/pay/activity/WebViewEx;

    invoke-direct {v0, p0}, Lcom/switfpass/pay/activity/WebViewEx;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->at:Lcom/switfpass/pay/activity/WebViewEx;

    iget-object v0, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->at:Lcom/switfpass/pay/activity/WebViewEx;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/WebViewEx;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    :cond_0
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-virtual {p0}, Lcom/switfpass/pay/activity/QQWapPayWebView;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v1, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    const/16 v2, 0x78

    if-ne v1, v2, :cond_2

    sget-object v1, Landroid/webkit/WebSettings$ZoomDensity;->CLOSE:Landroid/webkit/WebSettings$ZoomDensity;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDefaultZoom(Landroid/webkit/WebSettings$ZoomDensity;)V

    :cond_1
    :goto_0
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->at:Lcom/switfpass/pay/activity/WebViewEx;

    new-instance v1, Lcom/switfpass/pay/activity/H;

    invoke-direct {v1}, Lcom/switfpass/pay/activity/H;-><init>()V

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/activity/WebViewEx;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->at:Lcom/switfpass/pay/activity/WebViewEx;

    new-instance v1, Lcom/switfpass/pay/activity/G;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/activity/G;-><init>(Lcom/switfpass/pay/activity/QQWapPayWebView;)V

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/activity/WebViewEx;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    invoke-virtual {p0}, Lcom/switfpass/pay/activity/QQWapPayWebView;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "url"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->url:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/switfpass/pay/activity/QQWapPayWebView;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "tokenId"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->tokenId:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/switfpass/pay/activity/QQWapPayWebView;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "outTradeNo"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->X:Ljava/lang/String;

    iget-object v0, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->at:Lcom/switfpass/pay/activity/WebViewEx;

    iget-object v1, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/switfpass/pay/activity/WebViewEx;->loadUrl(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->at:Lcom/switfpass/pay/activity/WebViewEx;

    invoke-virtual {v0}, Lcom/switfpass/pay/activity/WebViewEx;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    return-void

    :cond_2
    const/16 v2, 0xa0

    if-ne v1, v2, :cond_3

    sget-object v1, Landroid/webkit/WebSettings$ZoomDensity;->MEDIUM:Landroid/webkit/WebSettings$ZoomDensity;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDefaultZoom(Landroid/webkit/WebSettings$ZoomDensity;)V

    goto :goto_0

    :cond_3
    const/16 v2, 0xf0

    if-ne v1, v2, :cond_1

    sget-object v1, Landroid/webkit/WebSettings$ZoomDensity;->FAR:Landroid/webkit/WebSettings$ZoomDensity;

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDefaultZoom(Landroid/webkit/WebSettings$ZoomDensity;)V

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 0

    invoke-virtual {p0}, Lcom/switfpass/pay/activity/QQWapPayWebView;->dismissMyLoading()V

    invoke-super {p0}, Lcom/switfpass/pay/activity/BasePayActivity;->onDestroy()V

    return-void
.end method

.method protected onPause()V
    .locals 0

    invoke-super {p0}, Lcom/switfpass/pay/activity/BasePayActivity;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 3

    invoke-virtual {p0}, Lcom/switfpass/pay/activity/QQWapPayWebView;->dismissMyLoading()V

    iget-boolean v0, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->as:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->as:Z

    :goto_0
    invoke-super {p0}, Lcom/switfpass/pay/activity/BasePayActivity;->onResume()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->tokenId:Ljava/lang/String;

    iget-object v1, p0, Lcom/switfpass/pay/activity/QQWapPayWebView;->X:Ljava/lang/String;

    new-instance v2, Lcom/switfpass/pay/bean/RequestMsg;

    invoke-direct {v2}, Lcom/switfpass/pay/bean/RequestMsg;-><init>()V

    invoke-virtual {v2, v0}, Lcom/switfpass/pay/bean/RequestMsg;->setTokenId(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Lcom/switfpass/pay/bean/RequestMsg;->setOutTradeNo(Ljava/lang/String;)V

    invoke-static {}, Lcom/switfpass/pay/service/OrderService;->getInstance()Lcom/switfpass/pay/service/OrderService;

    move-result-object v0

    new-instance v1, Lcom/switfpass/pay/activity/F;

    invoke-direct {v1, p0}, Lcom/switfpass/pay/activity/F;-><init>(Lcom/switfpass/pay/activity/QQWapPayWebView;)V

    invoke-virtual {v0, v2, v1}, Lcom/switfpass/pay/service/OrderService;->unfiedQueryOrder(Lcom/switfpass/pay/bean/RequestMsg;Lcom/switfpass/pay/thread/UINotifyListener;)V

    goto :goto_0
.end method

.method protected onStop()V
    .locals 0

    invoke-super {p0}, Lcom/switfpass/pay/activity/BasePayActivity;->onStop()V

    return-void
.end method
