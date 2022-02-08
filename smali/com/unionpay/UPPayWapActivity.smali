.class public Lcom/unionpay/UPPayWapActivity;
.super Landroid/app/Activity;


# instance fields
.field a:Landroid/widget/LinearLayout;

.field private b:Landroid/webkit/WebView;

.field private c:Lcom/unionpay/WebViewJavascriptBridge;

.field private d:Landroid/app/AlertDialog;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic a(Lcom/unionpay/UPPayWapActivity;)Landroid/app/AlertDialog;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/UPPayWapActivity;->d:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic a(Lcom/unionpay/UPPayWapActivity;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0

    iput-object p1, p0, Lcom/unionpay/UPPayWapActivity;->d:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    invoke-static {p0, p1, p2}, Lcom/unionpay/UPPayWapActivity;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic a(Lcom/unionpay/UPPayWapActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "pay_result"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "result_data"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/unionpay/UPPayWapActivity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/unionpay/UPPayWapActivity;->finish()V

    return-void
.end method

.method static synthetic a(Lcom/unionpay/UPPayWapActivity;Z)V
    .locals 2

    iget-object v1, p0, Lcom/unionpay/UPPayWapActivity;->a:Landroid/widget/LinearLayout;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void

    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method private static b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{\"code\":\"0\",\"msg\":\"success\"}"

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    if-eqz p0, :cond_0

    const-string v1, "code"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    if-eqz p1, :cond_1

    const-string v1, "msg"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    if-eqz p2, :cond_2

    const-string v1, "value"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_2
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    const-string v0, ""

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 11

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/unionpay/UPPayWapActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "waptype"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, ""

    const-string v1, ""

    if-eqz v0, :cond_1

    const-string v3, "new_page"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/unionpay/UPPayWapActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v3, "wapurl"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/unionpay/UPPayWapActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v4, "waptitle"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v3, :cond_0

    move-object v2, v3

    :cond_0
    if-eqz v0, :cond_3

    :goto_0
    new-instance v1, Lcom/unionpay/i;

    invoke-direct {v1, p0}, Lcom/unionpay/i;-><init>(Lcom/unionpay/UPPayWapActivity;)V

    move-object v10, v2

    move-object v2, v1

    move-object v1, v10

    :goto_1
    invoke-virtual {p0}, Lcom/unionpay/UPPayWapActivity;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/view/Window;->requestFeature(I)Z

    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v5, -0x1

    const/4 v6, -0x2

    invoke-direct {v4, v5, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    new-instance v5, Landroid/widget/RelativeLayout;

    invoke-direct {v5, p0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v4}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/high16 v4, 0x41200000    # 10.0f

    invoke-static {p0, v4}, Lcom/unionpay/utils/e;->a(Landroid/content/Context;F)I

    move-result v4

    const/high16 v6, 0x42500000    # 52.0f

    invoke-static {p0, v6}, Lcom/unionpay/utils/e;->a(Landroid/content/Context;F)I

    move-result v6

    new-instance v7, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v8, -0x1

    invoke-direct {v7, v8, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v7}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const v7, -0xa35c26

    invoke-virtual {v5, v7}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/unionpay/UPPayWapActivity;->a:Landroid/widget/LinearLayout;

    iget-object v7, p0, Lcom/unionpay/UPPayWapActivity;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v4, v4, v4, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v7, p0, Lcom/unionpay/UPPayWapActivity;->a:Landroid/widget/LinearLayout;

    const/16 v8, 0x10

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v7, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v8, -0x2

    const/4 v9, -0x2

    invoke-direct {v7, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v8, 0x9

    const/4 v9, -0x1

    invoke-virtual {v7, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    const/16 v8, 0xf

    const/4 v9, -0x1

    invoke-virtual {v7, v8, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iput v4, v7, Landroid/widget/RelativeLayout$LayoutParams;->leftMargin:I

    iget-object v4, p0, Lcom/unionpay/UPPayWapActivity;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, p0, Lcom/unionpay/UPPayWapActivity;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v2, v7}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-static {p0, v2}, Lcom/unionpay/utils/e;->a(Landroid/content/Context;F)I

    move-result v2

    const/high16 v4, 0x41300000    # 11.0f

    invoke-static {p0, v4}, Lcom/unionpay/utils/e;->a(Landroid/content/Context;F)I

    move-result v4

    new-instance v7, Landroid/widget/ImageView;

    invoke-direct {v7, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const-string v8, "res/nav_back.png"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v8

    invoke-static {v8}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v8

    new-instance v9, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v9, v8}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v8, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v8, v4, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0xf

    const/4 v4, -0x1

    invoke-virtual {v8, v2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    iget-object v2, p0, Lcom/unionpay/UPPayWapActivity;->a:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v4, 0x43a00000    # 320.0f

    invoke-static {p0, v4}, Lcom/unionpay/utils/e;->a(Landroid/content/Context;F)I

    move-result v4

    invoke-direct {v2, v4, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v4, 0xd

    const/4 v6, -0x1

    invoke-virtual {v2, v4, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/high16 v6, 0x41a00000    # 20.0f

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v6, -0x1

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v0, 0x11

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v0, 0x1

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v5, v4, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/webkit/WebView;

    invoke-direct {v0, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/unionpay/UPPayWapActivity;->b:Landroid/webkit/WebView;

    iget-object v0, p0, Lcom/unionpay/UPPayWapActivity;->b:Landroid/webkit/WebView;

    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x1

    invoke-direct {v2, v4, v5}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/unionpay/UPPayWapActivity;->b:Landroid/webkit/WebView;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {p0, v3}, Lcom/unionpay/UPPayWapActivity;->setContentView(Landroid/view/View;)V

    new-instance v0, Lcom/unionpay/WebViewJavascriptBridge;

    iget-object v2, p0, Lcom/unionpay/UPPayWapActivity;->b:Landroid/webkit/WebView;

    const/4 v3, 0x0

    invoke-direct {v0, p0, v2, v3}, Lcom/unionpay/WebViewJavascriptBridge;-><init>(Landroid/app/Activity;Landroid/webkit/WebView;Lcom/unionpay/ab;)V

    iput-object v0, p0, Lcom/unionpay/UPPayWapActivity;->c:Lcom/unionpay/WebViewJavascriptBridge;

    iget-object v0, p0, Lcom/unionpay/UPPayWapActivity;->b:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/unionpay/UPPayWapActivity;->c:Lcom/unionpay/WebViewJavascriptBridge;

    const-string v1, "getDeviceInfo"

    new-instance v2, Lcom/unionpay/p;

    invoke-direct {v2, p0}, Lcom/unionpay/p;-><init>(Lcom/unionpay/UPPayWapActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/WebViewJavascriptBridge;->registerHandler(Ljava/lang/String;Lcom/unionpay/ab;)V

    iget-object v0, p0, Lcom/unionpay/UPPayWapActivity;->c:Lcom/unionpay/WebViewJavascriptBridge;

    const-string v1, "saveData"

    new-instance v2, Lcom/unionpay/q;

    invoke-direct {v2, p0}, Lcom/unionpay/q;-><init>(Lcom/unionpay/UPPayWapActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/WebViewJavascriptBridge;->registerHandler(Ljava/lang/String;Lcom/unionpay/ab;)V

    iget-object v0, p0, Lcom/unionpay/UPPayWapActivity;->c:Lcom/unionpay/WebViewJavascriptBridge;

    const-string v1, "getData"

    new-instance v2, Lcom/unionpay/r;

    invoke-direct {v2, p0}, Lcom/unionpay/r;-><init>(Lcom/unionpay/UPPayWapActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/WebViewJavascriptBridge;->registerHandler(Ljava/lang/String;Lcom/unionpay/ab;)V

    iget-object v0, p0, Lcom/unionpay/UPPayWapActivity;->c:Lcom/unionpay/WebViewJavascriptBridge;

    const-string v1, "removeData"

    new-instance v2, Lcom/unionpay/s;

    invoke-direct {v2, p0}, Lcom/unionpay/s;-><init>(Lcom/unionpay/UPPayWapActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/WebViewJavascriptBridge;->registerHandler(Ljava/lang/String;Lcom/unionpay/ab;)V

    iget-object v0, p0, Lcom/unionpay/UPPayWapActivity;->c:Lcom/unionpay/WebViewJavascriptBridge;

    const-string v1, "setPageBackEnable"

    new-instance v2, Lcom/unionpay/t;

    invoke-direct {v2, p0}, Lcom/unionpay/t;-><init>(Lcom/unionpay/UPPayWapActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/WebViewJavascriptBridge;->registerHandler(Ljava/lang/String;Lcom/unionpay/ab;)V

    iget-object v0, p0, Lcom/unionpay/UPPayWapActivity;->c:Lcom/unionpay/WebViewJavascriptBridge;

    const-string v1, "payBySDK"

    new-instance v2, Lcom/unionpay/u;

    invoke-direct {v2, p0}, Lcom/unionpay/u;-><init>(Lcom/unionpay/UPPayWapActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/WebViewJavascriptBridge;->registerHandler(Ljava/lang/String;Lcom/unionpay/ab;)V

    iget-object v0, p0, Lcom/unionpay/UPPayWapActivity;->c:Lcom/unionpay/WebViewJavascriptBridge;

    const-string v1, "downloadApp"

    new-instance v2, Lcom/unionpay/v;

    invoke-direct {v2, p0}, Lcom/unionpay/v;-><init>(Lcom/unionpay/UPPayWapActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/WebViewJavascriptBridge;->registerHandler(Ljava/lang/String;Lcom/unionpay/ab;)V

    iget-object v0, p0, Lcom/unionpay/UPPayWapActivity;->c:Lcom/unionpay/WebViewJavascriptBridge;

    const-string v1, "payResult"

    new-instance v2, Lcom/unionpay/j;

    invoke-direct {v2, p0}, Lcom/unionpay/j;-><init>(Lcom/unionpay/UPPayWapActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/WebViewJavascriptBridge;->registerHandler(Ljava/lang/String;Lcom/unionpay/ab;)V

    iget-object v0, p0, Lcom/unionpay/UPPayWapActivity;->c:Lcom/unionpay/WebViewJavascriptBridge;

    const-string v1, "closePage"

    new-instance v2, Lcom/unionpay/k;

    invoke-direct {v2, p0}, Lcom/unionpay/k;-><init>(Lcom/unionpay/UPPayWapActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/WebViewJavascriptBridge;->registerHandler(Ljava/lang/String;Lcom/unionpay/ab;)V

    iget-object v0, p0, Lcom/unionpay/UPPayWapActivity;->c:Lcom/unionpay/WebViewJavascriptBridge;

    const-string v1, "openNewPage"

    new-instance v2, Lcom/unionpay/l;

    invoke-direct {v2, p0}, Lcom/unionpay/l;-><init>(Lcom/unionpay/UPPayWapActivity;)V

    invoke-virtual {v0, v1, v2}, Lcom/unionpay/WebViewJavascriptBridge;->registerHandler(Ljava/lang/String;Lcom/unionpay/ab;)V

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/unionpay/UPPayWapActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "wapurl"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/unionpay/UPPayWapActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v3, "paydata"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "?s="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2
    invoke-static {}, Lcom/unionpay/utils/h;->a()Lcom/unionpay/utils/h;

    move-result-object v1

    iget-object v1, v1, Lcom/unionpay/utils/h;->e:Ljava/lang/String;

    new-instance v2, Lcom/unionpay/m;

    invoke-direct {v2, p0}, Lcom/unionpay/m;-><init>(Lcom/unionpay/UPPayWapActivity;)V

    move-object v10, v1

    move-object v1, v0

    move-object v0, v10

    goto/16 :goto_1

    :cond_2
    move-object v0, v2

    goto :goto_2

    :cond_3
    move-object v0, v1

    goto/16 :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/unionpay/UPPayWapActivity;->onPause()V

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method
