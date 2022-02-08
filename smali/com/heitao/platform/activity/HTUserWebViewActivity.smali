.class public Lcom/heitao/platform/activity/HTUserWebViewActivity;
.super Landroid/app/Activity;
.source "HTUserWebViewActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/heitao/platform/activity/HTUserWebViewActivity$JsToJava;
    }
.end annotation


# static fields
.field public static mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;


# instance fields
.field private URL:Ljava/lang/String;

.field private baseView:Landroid/widget/RelativeLayout;

.field private close_bt:Landroid/widget/RelativeLayout;

.field private container:Landroid/widget/RelativeLayout;

.field private isLandScape:Z

.field private mWebView:Landroid/webkit/WebView;

.field private scale_h:F

.field private scale_w:F

.field private screenHeight:I

.field private screenWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const/4 v0, 0x0

    sput-object v0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private initView()V
    .locals 7

    .prologue
    const/4 v6, -0x1

    .line 56
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTUserWebViewActivity;->scale()V

    .line 57
    new-instance v4, Landroid/widget/RelativeLayout;

    invoke-direct {v4, p0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->baseView:Landroid/widget/RelativeLayout;

    .line 58
    iget-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->baseView:Landroid/widget/RelativeLayout;

    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    .line 59
    invoke-direct {v5, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 58
    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    iget-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->baseView:Landroid/widget/RelativeLayout;

    const-string v5, "#80000000"

    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 62
    new-instance v4, Landroid/widget/RelativeLayout;

    invoke-direct {v4, p0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->container:Landroid/widget/RelativeLayout;

    .line 63
    iget-boolean v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->isLandScape:Z

    if-eqz v4, :cond_0

    const/high16 v4, 0x44660000    # 920.0f

    iget v5, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->scale_h:F

    mul-float/2addr v4, v5

    float-to-int v3, v4

    .line 64
    .local v3, "container_with":I
    :goto_0
    iget-boolean v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->isLandScape:Z

    if-eqz v4, :cond_1

    const/high16 v4, 0x44200000    # 640.0f

    iget v5, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->scale_h:F

    mul-float/2addr v4, v5

    float-to-int v2, v4

    .line 66
    .local v2, "container_hight":I
    :goto_1
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v3, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 67
    .local v1, "containerParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v4, 0xd

    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 68
    const-string v4, "ht_user_webview_bg"

    invoke-static {p0, v4}, Lcom/heitao/platform/common/HTPUtils;->getDrawByR(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    .line 69
    .local v0, "bg_id":I
    iget-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->container:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v0}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 70
    iget-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->container:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTUserWebViewActivity;->initWebView()V

    .line 74
    iget-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->container:Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 76
    iget-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->baseView:Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->container:Landroid/widget/RelativeLayout;

    invoke-virtual {v4, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 77
    return-void

    .line 63
    .end local v0    # "bg_id":I
    .end local v1    # "containerParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v2    # "container_hight":I
    .end local v3    # "container_with":I
    :cond_0
    const/high16 v4, 0x442a0000    # 680.0f

    iget v5, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->scale_w:F

    mul-float/2addr v4, v5

    float-to-int v3, v4

    goto :goto_0

    .line 64
    .restart local v3    # "container_with":I
    :cond_1
    const/high16 v4, 0x43f00000    # 480.0f

    iget v5, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->scale_w:F

    mul-float/2addr v4, v5

    float-to-int v2, v4

    goto :goto_1
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
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 82
    iget-boolean v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->isLandScape:Z

    if-eqz v4, :cond_0

    const/high16 v4, 0x44660000    # 920.0f

    iget v5, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->scale_h:F

    mul-float/2addr v4, v5

    float-to-int v3, v4

    .line 83
    .local v3, "webview_with":I
    :goto_0
    iget-boolean v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->isLandScape:Z

    if-eqz v4, :cond_1

    const/high16 v4, 0x44200000    # 640.0f

    iget v5, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->scale_h:F

    mul-float/2addr v4, v5

    float-to-int v2, v4

    .line 84
    .local v2, "webview_hight":I
    :goto_1
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v3, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 85
    .local v1, "webViewParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v4, 0xd

    invoke-virtual {v1, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 87
    new-instance v4, Landroid/webkit/WebView;

    invoke-direct {v4, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->mWebView:Landroid/webkit/WebView;

    .line 88
    iget-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v4, v7}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 89
    iget-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v4, v1}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    iget-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v4}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 92
    .local v0, "webSettings":Landroid/webkit/WebSettings;
    invoke-virtual {v0, v6}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 93
    invoke-virtual {v0, v6}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 94
    invoke-virtual {v0, v6}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 95
    invoke-virtual {v0, v6}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    .line 96
    iget-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v5, Lcom/heitao/platform/activity/HTUserWebViewActivity$JsToJava;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/HTUserWebViewActivity$JsToJava;-><init>(Lcom/heitao/platform/activity/HTUserWebViewActivity;)V

    const-string v6, "JsToJava"

    invoke-virtual {v4, v5, v6}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 98
    iget-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v4, v7}, Landroid/webkit/WebView;->setHorizontalScrollBarEnabled(Z)V

    .line 99
    iget-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v4, v7}, Landroid/webkit/WebView;->setVerticalScrollBarEnabled(Z)V

    .line 114
    iget-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->mWebView:Landroid/webkit/WebView;

    iget-object v5, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->URL:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 116
    iget-object v4, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v5, Lcom/heitao/platform/activity/HTUserWebViewActivity$1;

    invoke-direct {v5, p0}, Lcom/heitao/platform/activity/HTUserWebViewActivity$1;-><init>(Lcom/heitao/platform/activity/HTUserWebViewActivity;)V

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 129
    return-void

    .line 82
    .end local v0    # "webSettings":Landroid/webkit/WebSettings;
    .end local v1    # "webViewParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v2    # "webview_hight":I
    .end local v3    # "webview_with":I
    :cond_0
    const/high16 v4, 0x442a0000    # 680.0f

    iget v5, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->scale_w:F

    mul-float/2addr v4, v5

    float-to-int v3, v4

    goto :goto_0

    .line 83
    .restart local v3    # "webview_with":I
    :cond_1
    const/high16 v4, 0x43f00000    # 480.0f

    iget v5, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->scale_w:F

    mul-float/2addr v4, v5

    float-to-int v2, v4

    goto :goto_1
.end method

.method private scale()V
    .locals 5

    .prologue
    const v4, 0x44aa8000    # 1364.0f

    const/high16 v3, 0x44400000    # 768.0f

    .line 157
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 158
    .local v0, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTUserWebViewActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 160
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->screenWidth:I

    .line 161
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->screenHeight:I

    .line 163
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    if-ge v1, v2, :cond_0

    .line 165
    iget v1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->screenWidth:I

    int-to-float v1, v1

    div-float/2addr v1, v4

    iput v1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->scale_w:F

    .line 166
    iget v1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->screenHeight:I

    int-to-float v1, v1

    div-float/2addr v1, v3

    iput v1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->scale_h:F

    .line 167
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->isLandScape:Z

    .line 174
    :goto_0
    return-void

    .line 170
    :cond_0
    iget v1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->screenWidth:I

    int-to-float v1, v1

    div-float/2addr v1, v3

    iput v1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->scale_w:F

    .line 171
    iget v1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->screenHeight:I

    int-to-float v1, v1

    div-float/2addr v1, v4

    iput v1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->scale_h:F

    .line 172
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->isLandScape:Z

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 36
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 37
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTUserWebViewActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x12

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 38
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/platform/common/HTPDataCenter;->mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;

    sput-object v0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->mLogoutListener:Lcom/heitao/platform/listener/HTPLogoutListener;

    .line 39
    invoke-virtual {p0}, Lcom/heitao/platform/activity/HTUserWebViewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "url"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->URL:Ljava/lang/String;

    .line 40
    iget-object v0, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->URL:Ljava/lang/String;

    invoke-static {v0}, Lcom/heitao/platform/common/HTPUtils;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    const-string v0, "http://about:blank"

    iput-object v0, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->URL:Ljava/lang/String;

    .line 51
    :goto_0
    invoke-direct {p0}, Lcom/heitao/platform/activity/HTUserWebViewActivity;->initView()V

    .line 52
    iget-object v0, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->baseView:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v0}, Lcom/heitao/platform/activity/HTUserWebViewActivity;->setContentView(Landroid/view/View;)V

    .line 53
    return-void

    .line 43
    :cond_0
    iget-object v0, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->URL:Ljava/lang/String;

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->URL:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "&uid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v1, v1, Lcom/heitao/platform/model/HTPUser;->userId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&token="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 45
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v1, v1, Lcom/heitao/platform/model/HTPUser;->token:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&time="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v1, v1, Lcom/heitao/platform/model/HTPUser;->time:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->URL:Ljava/lang/String;

    goto :goto_0

    .line 47
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->URL:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "?uid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v1, v1, Lcom/heitao/platform/model/HTPUser;->userId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&token="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 48
    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v1, v1, Lcom/heitao/platform/model/HTPUser;->token:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "&time="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/heitao/platform/common/HTPDataCenter;->getInstance()Lcom/heitao/platform/common/HTPDataCenter;

    move-result-object v1

    iget-object v1, v1, Lcom/heitao/platform/common/HTPDataCenter;->mUser:Lcom/heitao/platform/model/HTPUser;

    iget-object v1, v1, Lcom/heitao/platform/model/HTPUser;->time:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->URL:Ljava/lang/String;

    goto/16 :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 150
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 151
    iget-object v0, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->mWebView:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    .line 152
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/heitao/platform/activity/HTUserWebViewActivity;->mWebView:Landroid/webkit/WebView;

    .line 154
    :cond_0
    return-void
.end method
