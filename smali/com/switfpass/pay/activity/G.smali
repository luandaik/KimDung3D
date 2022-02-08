.class final Lcom/switfpass/pay/activity/G;
.super Landroid/webkit/WebViewClient;


# instance fields
.field private synthetic au:Lcom/switfpass/pay/activity/QQWapPayWebView;


# direct methods
.method public constructor <init>(Lcom/switfpass/pay/activity/QQWapPayWebView;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/G;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    return-void
.end method

.method public final onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lcom/switfpass/pay/activity/G;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    const/4 v1, 0x1

    const-string v2, "\u52a0\u8f7d\u4e2d..."

    iget-object v3, p0, Lcom/switfpass/pay/activity/G;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-virtual {v0, v1, v2, v3}, Lcom/switfpass/pay/activity/QQWapPayWebView;->showNewLoading(ZLjava/lang/String;Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void

    :catch_0
    move-exception v0

    const-string v1, "QQWapPayWebView"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "onPageStarted "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public final onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 5

    const/4 v0, 0x1

    :try_start_0
    iget-object v1, p0, Lcom/switfpass/pay/activity/G;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    const/4 v2, 0x1

    const-string v3, "\u52a0\u8f7d\u4e2d..."

    iget-object v4, p0, Lcom/switfpass/pay/activity/G;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-virtual {v1, v2, v3, v4}, Lcom/switfpass/pay/activity/QQWapPayWebView;->showNewLoading(ZLjava/lang/String;Landroid/content/Context;)V

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string v3, "mqqapi"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    const-string v3, "forward"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object v1, p0, Lcom/switfpass/pay/activity/G;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-virtual {v1, v2}, Lcom/switfpass/pay/activity/QQWapPayWebView;->startActivity(Landroid/content/Intent;)V

    :goto_0
    return v0

    :cond_0
    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string v3, "weixin"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    const-string v3, "wap"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object v1, p0, Lcom/switfpass/pay/activity/G;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-virtual {v1, v2}, Lcom/switfpass/pay/activity/QQWapPayWebView;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "QQWapPayWebView"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "shouldOverrideUrlLoading "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    :cond_1
    :try_start_1
    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    const-string v3, "mclient.alipay.com"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object v1, p0, Lcom/switfpass/pay/activity/G;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-virtual {v1, v2}, Lcom/switfpass/pay/activity/QQWapPayWebView;->startActivity(Landroid/content/Intent;)V

    iget-object v1, p0, Lcom/switfpass/pay/activity/G;->au:Lcom/switfpass/pay/activity/QQWapPayWebView;

    invoke-static {v1}, Lcom/switfpass/pay/activity/QQWapPayWebView;->a(Lcom/switfpass/pay/activity/QQWapPayWebView;)V

    goto :goto_0

    :cond_2
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v0

    goto :goto_0
.end method
