.class public Lcom/heitao/common/activity/HTWebViewActivity;
.super Landroid/app/Activity;
.source "HTWebViewActivity.java"


# instance fields
.field private isHideToolBar:Z

.field private isPaySuccess:Z

.field private mBackButton:Landroid/widget/ImageButton;

.field private mBarLayout:Landroid/widget/LinearLayout;

.field private mCloseButton:Landroid/widget/ImageButton;

.field private mForwardButton:Landroid/widget/ImageButton;

.field private mRefreshButton:Landroid/widget/ImageButton;

.field private mWebView:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/heitao/common/activity/HTWebViewActivity;)Landroid/widget/ImageButton;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/common/activity/HTWebViewActivity;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mBackButton:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$100(Lcom/heitao/common/activity/HTWebViewActivity;)Landroid/webkit/WebView;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/common/activity/HTWebViewActivity;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mWebView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/heitao/common/activity/HTWebViewActivity;)Landroid/widget/ImageButton;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/common/activity/HTWebViewActivity;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mForwardButton:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$300(Lcom/heitao/common/activity/HTWebViewActivity;)Landroid/widget/ImageButton;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/common/activity/HTWebViewActivity;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mRefreshButton:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$400(Lcom/heitao/common/activity/HTWebViewActivity;)Landroid/widget/ImageButton;
    .locals 1
    .param p0, "x0"    # Lcom/heitao/common/activity/HTWebViewActivity;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mCloseButton:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$500(Lcom/heitao/common/activity/HTWebViewActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/heitao/common/activity/HTWebViewActivity;

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/heitao/common/activity/HTWebViewActivity;->close()V

    return-void
.end method

.method static synthetic access$602(Lcom/heitao/common/activity/HTWebViewActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/heitao/common/activity/HTWebViewActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 23
    iput-boolean p1, p0, Lcom/heitao/common/activity/HTWebViewActivity;->isPaySuccess:Z

    return p1
.end method

.method private close()V
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 167
    invoke-virtual {p0}, Lcom/heitao/common/activity/HTWebViewActivity;->finish()V

    .line 168
    return-void
.end method


# virtual methods
.method public getBitmapFromAssets(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 3
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 172
    const/4 v1, 0x0

    .line 175
    .local v1, "is":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0}, Lcom/heitao/common/activity/HTWebViewActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 184
    :goto_0
    if-eqz v1, :cond_0

    .line 186
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 189
    :goto_1
    return-object v2

    .line 177
    :catch_0
    move-exception v0

    .line 180
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 181
    const/4 v1, 0x0

    goto :goto_0

    .line 189
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 144
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 146
    iget-boolean v0, p0, Lcom/heitao/common/activity/HTWebViewActivity;->isPaySuccess:Z

    if-nez v0, :cond_0

    .line 148
    invoke-static {}, Lcom/heitao/notification/HTNotificationCenter;->getInstance()Lcom/heitao/notification/HTNotificationCenter;

    move-result-object v0

    const-string v1, "ON_PAY_FAILED"

    invoke-virtual {v0, v1}, Lcom/heitao/notification/HTNotificationCenter;->postNotification(Ljava/lang/String;)V

    .line 150
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/16 v4, 0x8

    .line 35
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 37
    const-string v2, "ht_guide_webview_activity"

    sget-object v3, Lcom/heitao/common/HTResourcesHelper$HTResType;->Layout:Lcom/heitao/common/HTResourcesHelper$HTResType;

    invoke-static {p0, v2, v3}, Lcom/heitao/common/HTResourcesHelper;->getResourcesId(Landroid/content/Context;Ljava/lang/String;Lcom/heitao/common/HTResourcesHelper$HTResType;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/heitao/common/activity/HTWebViewActivity;->setContentView(I)V

    .line 39
    invoke-virtual {p0}, Lcom/heitao/common/activity/HTWebViewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "isHideToolBar"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->isHideToolBar:Z

    .line 41
    const-string v2, "barLayout"

    sget-object v3, Lcom/heitao/common/HTResourcesHelper$HTResType;->Id:Lcom/heitao/common/HTResourcesHelper$HTResType;

    invoke-static {p0, v2, v3}, Lcom/heitao/common/HTResourcesHelper;->getResourcesId(Landroid/content/Context;Ljava/lang/String;Lcom/heitao/common/HTResourcesHelper$HTResType;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/heitao/common/activity/HTWebViewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mBarLayout:Landroid/widget/LinearLayout;

    .line 42
    const-string v2, "webView"

    sget-object v3, Lcom/heitao/common/HTResourcesHelper$HTResType;->Id:Lcom/heitao/common/HTResourcesHelper$HTResType;

    invoke-static {p0, v2, v3}, Lcom/heitao/common/HTResourcesHelper;->getResourcesId(Landroid/content/Context;Ljava/lang/String;Lcom/heitao/common/HTResourcesHelper$HTResType;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/heitao/common/activity/HTWebViewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/webkit/WebView;

    iput-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mWebView:Landroid/webkit/WebView;

    .line 43
    const-string v2, "btn_webview_back"

    sget-object v3, Lcom/heitao/common/HTResourcesHelper$HTResType;->Id:Lcom/heitao/common/HTResourcesHelper$HTResType;

    invoke-static {p0, v2, v3}, Lcom/heitao/common/HTResourcesHelper;->getResourcesId(Landroid/content/Context;Ljava/lang/String;Lcom/heitao/common/HTResourcesHelper$HTResType;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/heitao/common/activity/HTWebViewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    iput-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mBackButton:Landroid/widget/ImageButton;

    .line 44
    const-string v2, "btn_webview_forward"

    sget-object v3, Lcom/heitao/common/HTResourcesHelper$HTResType;->Id:Lcom/heitao/common/HTResourcesHelper$HTResType;

    invoke-static {p0, v2, v3}, Lcom/heitao/common/HTResourcesHelper;->getResourcesId(Landroid/content/Context;Ljava/lang/String;Lcom/heitao/common/HTResourcesHelper$HTResType;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/heitao/common/activity/HTWebViewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    iput-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mForwardButton:Landroid/widget/ImageButton;

    .line 45
    const-string v2, "btn_webview_refresh"

    sget-object v3, Lcom/heitao/common/HTResourcesHelper$HTResType;->Id:Lcom/heitao/common/HTResourcesHelper$HTResType;

    invoke-static {p0, v2, v3}, Lcom/heitao/common/HTResourcesHelper;->getResourcesId(Landroid/content/Context;Ljava/lang/String;Lcom/heitao/common/HTResourcesHelper$HTResType;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/heitao/common/activity/HTWebViewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    iput-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mRefreshButton:Landroid/widget/ImageButton;

    .line 46
    const-string v2, "btn_webview_close"

    sget-object v3, Lcom/heitao/common/HTResourcesHelper$HTResType;->Id:Lcom/heitao/common/HTResourcesHelper$HTResType;

    invoke-static {p0, v2, v3}, Lcom/heitao/common/HTResourcesHelper;->getResourcesId(Landroid/content/Context;Ljava/lang/String;Lcom/heitao/common/HTResourcesHelper$HTResType;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/heitao/common/activity/HTWebViewActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    iput-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mCloseButton:Landroid/widget/ImageButton;

    .line 48
    iget-boolean v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->isHideToolBar:Z

    if-eqz v2, :cond_0

    .line 50
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mBarLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 52
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mBackButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v5}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 53
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mBackButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v4}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 55
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mForwardButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v5}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 56
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mForwardButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v4}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 58
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mRefreshButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v5}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 59
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mRefreshButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v4}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 61
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mCloseButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v5}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 62
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mCloseButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v4}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 103
    :goto_0
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    .line 104
    .local v1, "settings":Landroid/webkit/WebSettings;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 105
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v3, Lcom/heitao/common/activity/HTWebViewActivity$2;

    invoke-direct {v3, p0}, Lcom/heitao/common/activity/HTWebViewActivity$2;-><init>(Lcom/heitao/common/activity/HTWebViewActivity;)V

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 137
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/heitao/common/activity/HTWebViewActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    const-string v4, "url"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 138
    return-void

    .line 67
    .end local v1    # "settings":Landroid/webkit/WebSettings;
    :cond_0
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mBackButton:Landroid/widget/ImageButton;

    const-string v3, "HTGameProxy/Images/btn_webview_back.png"

    invoke-virtual {p0, v3}, Lcom/heitao/common/activity/HTWebViewActivity;->getBitmapFromAssets(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 68
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mForwardButton:Landroid/widget/ImageButton;

    const-string v3, "HTGameProxy/Images/btn_webview_forward.png"

    invoke-virtual {p0, v3}, Lcom/heitao/common/activity/HTWebViewActivity;->getBitmapFromAssets(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 69
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mRefreshButton:Landroid/widget/ImageButton;

    const-string v3, "HTGameProxy/Images/btn_webview_refresh.png"

    invoke-virtual {p0, v3}, Lcom/heitao/common/activity/HTWebViewActivity;->getBitmapFromAssets(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 70
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mCloseButton:Landroid/widget/ImageButton;

    const-string v3, "HTGameProxy/Images/btn_webview_close.png"

    invoke-virtual {p0, v3}, Lcom/heitao/common/activity/HTWebViewActivity;->getBitmapFromAssets(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ImageButton;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 72
    new-instance v0, Lcom/heitao/common/activity/HTWebViewActivity$1;

    invoke-direct {v0, p0}, Lcom/heitao/common/activity/HTWebViewActivity$1;-><init>(Lcom/heitao/common/activity/HTWebViewActivity;)V

    .line 97
    .local v0, "listener":Landroid/view/View$OnClickListener;
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mBackButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 98
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mForwardButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mRefreshButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    iget-object v2, p0, Lcom/heitao/common/activity/HTWebViewActivity;->mCloseButton:Landroid/widget/ImageButton;

    invoke-virtual {v2, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method
