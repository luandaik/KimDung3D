.class public Lcom/heitao/platform/activity/HTPWAPWXActivity;
.super Landroid/app/Activity;
.source "HTPWAPWXActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/platform/activity/HTPWAPWXActivity$JsToJava;
    }
.end annotation


# static fields
.field public static mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;


# instance fields
.field private URL:Ljava/lang/String;

.field private baseView:Landroid/widget/RelativeLayout;

.field private container:Landroid/widget/RelativeLayout;

.field private mWebView:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/heitao/platform/activity/HTPWAPWXActivity;ILjava/lang/String;)V
    .locals 0

    .prologue
    .line 137
    invoke-direct {p0, p1, p2}, Lcom/heitao/platform/activity/HTPWAPWXActivity;->onLeftBtnClick(ILjava/lang/String;)V

    return-void
.end method

.method private initView()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 44
    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-direct {v1, p0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->baseView:Landroid/widget/RelativeLayout;

    .line 45
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->baseView:Landroid/widget/RelativeLayout;

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 46
    invoke-direct {v2, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 45
    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->baseView:Landroid/widget/RelativeLayout;

    const-string v2, "#FFFFFF"

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 49
    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-direct {v1, p0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->container:Landroid/widget/RelativeLayout;

    .line 51
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 53
    .local v0, "containerParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 55
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->container:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 57
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPWAPWXActivity;->initWebView()V

    .line 59
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->container:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 61
    iget-object v1, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->baseView:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->container:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 62
    return-void
.end method

.method private initWebView()V
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "JavascriptInterface"
        }
    .end annotation

    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    const/4 v3, 0x1

    .line 67
    new-instance v7, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v7, v0, v0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 69
    .local v7, "webViewParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v0, 0xd

    invoke-virtual {v7, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 71
    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    .line 72
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 73
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0, v7}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 75
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v6

    .line 76
    .local v6, "settings":Landroid/webkit/WebSettings;
    invoke-virtual {v6, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 77
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 78
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 79
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 80
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 81
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Lcom/heitao/platform/activity/HTPWAPWXActivity$JsToJava;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/HTPWAPWXActivity$JsToJava;-><init>(Lcom/heitao/platform/activity/HTPWAPWXActivity;)V

    const-string v3, "wxResult"

    invoke-virtual {v0, v2, v3}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Lcom/heitao/platform/activity/HTPWAPWXActivity$1;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/HTPWAPWXActivity$1;-><init>(Lcom/heitao/platform/activity/HTPWAPWXActivity;)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 104
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Lcom/heitao/platform/activity/HTPWAPWXActivity$2;

    invoke-direct {v2, p0}, Lcom/heitao/platform/activity/HTPWAPWXActivity$2;-><init>(Lcom/heitao/platform/activity/HTPWAPWXActivity;)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 111
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    iget-object v2, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->URL:Ljava/lang/String;

    const-string v3, "text/html"

    const-string v4, "UTF-8"

    move-object v5, v1

    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    return-void
.end method

.method private onLeftBtnClick(ILjava/lang/String;)V
    .locals 2
    .param p1, "status"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 138
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 139
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "resultStatus"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 140
    const-string v1, "resultMSG"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 141
    const/4 v1, 0x1

    invoke-virtual {p0, v1, v0}, Lcom/heitao/platform/activity/HTPWAPWXActivity;->setResult(ILandroid/content/Intent;)V

    .line 142
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPWAPWXActivity;->finish()V

    .line 143
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 33
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 34
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPWAPWXActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x12

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 36
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/platform/common/HTPDataCenter;->mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;

    sput-object v0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;

    .line 37
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTPWAPWXActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "url"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->URL:Ljava/lang/String;

    .line 39
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTPWAPWXActivity;->initView()V

    .line 40
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->baseView:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v0}, Lcom/heitao/platform/activity/HTPWAPWXActivity;->setContentView(Landroid/view/View;)V

    .line 41
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 116
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 117
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 118
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity;->mWebView:Landroid/webkit/WebView;

    .line 120
    :cond_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x0

    .line 130
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 132
    const-string v0, "nopay"

    invoke-direct {p0, v1, v0}, Lcom/heitao/platform/activity/HTPWAPWXActivity;->onLeftBtnClick(ILjava/lang/String;)V

    .line 135
    :cond_0
    return v1
.end method
