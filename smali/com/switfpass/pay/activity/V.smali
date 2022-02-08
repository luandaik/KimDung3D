.class final Lcom/switfpass/pay/activity/V;
.super Landroid/webkit/WebChromeClient;


# instance fields
.field private synthetic aQ:Lcom/switfpass/pay/activity/WebViewEx;


# direct methods
.method private constructor <init>(Lcom/switfpass/pay/activity/WebViewEx;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/V;->aQ:Lcom/switfpass/pay/activity/WebViewEx;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/switfpass/pay/activity/WebViewEx;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/switfpass/pay/activity/V;-><init>(Lcom/switfpass/pay/activity/WebViewEx;)V

    return-void
.end method


# virtual methods
.method public final onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .locals 1

    instance-of v0, p1, Lcom/switfpass/pay/activity/WebViewEx;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/switfpass/pay/activity/V;->aQ:Lcom/switfpass/pay/activity/WebViewEx;

    invoke-static {v0, p3, p5}, Lcom/switfpass/pay/activity/WebViewEx;->a(Lcom/switfpass/pay/activity/WebViewEx;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    invoke-super/range {p0 .. p5}, Landroid/webkit/WebChromeClient;->onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z

    move-result v0

    goto :goto_0
.end method

.method public final onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/V;->aQ:Lcom/switfpass/pay/activity/WebViewEx;

    invoke-static {v0, p1}, Lcom/switfpass/pay/activity/WebViewEx;->a(Lcom/switfpass/pay/activity/WebViewEx;Landroid/webkit/WebView;)V

    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    return-void
.end method

.method public final onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/V;->aQ:Lcom/switfpass/pay/activity/WebViewEx;

    invoke-static {v0, p1}, Lcom/switfpass/pay/activity/WebViewEx;->a(Lcom/switfpass/pay/activity/WebViewEx;Landroid/webkit/WebView;)V

    return-void
.end method
