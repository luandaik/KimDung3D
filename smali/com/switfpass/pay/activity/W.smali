.class final Lcom/switfpass/pay/activity/W;
.super Landroid/webkit/WebViewClient;


# instance fields
.field private synthetic aQ:Lcom/switfpass/pay/activity/WebViewEx;


# direct methods
.method private constructor <init>(Lcom/switfpass/pay/activity/WebViewEx;)V
    .locals 0

    iput-object p1, p0, Lcom/switfpass/pay/activity/W;->aQ:Lcom/switfpass/pay/activity/WebViewEx;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/switfpass/pay/activity/WebViewEx;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/switfpass/pay/activity/W;-><init>(Lcom/switfpass/pay/activity/WebViewEx;)V

    return-void
.end method


# virtual methods
.method public final doUpdateVisitedHistory(Landroid/webkit/WebView;Ljava/lang/String;Z)V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/W;->aQ:Lcom/switfpass/pay/activity/WebViewEx;

    invoke-static {v0, p1}, Lcom/switfpass/pay/activity/WebViewEx;->a(Lcom/switfpass/pay/activity/WebViewEx;Landroid/webkit/WebView;)V

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->doUpdateVisitedHistory(Landroid/webkit/WebView;Ljava/lang/String;Z)V

    return-void
.end method

.method public final onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/W;->aQ:Lcom/switfpass/pay/activity/WebViewEx;

    invoke-static {v0, p1}, Lcom/switfpass/pay/activity/WebViewEx;->a(Lcom/switfpass/pay/activity/WebViewEx;Landroid/webkit/WebView;)V

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V

    return-void
.end method

.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/W;->aQ:Lcom/switfpass/pay/activity/WebViewEx;

    invoke-static {v0, p1}, Lcom/switfpass/pay/activity/WebViewEx;->a(Lcom/switfpass/pay/activity/WebViewEx;Landroid/webkit/WebView;)V

    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    return-void
.end method

.method public final onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    iget-object v0, p0, Lcom/switfpass/pay/activity/W;->aQ:Lcom/switfpass/pay/activity/WebViewEx;

    invoke-static {v0, p1}, Lcom/switfpass/pay/activity/WebViewEx;->a(Lcom/switfpass/pay/activity/WebViewEx;Landroid/webkit/WebView;)V

    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method
