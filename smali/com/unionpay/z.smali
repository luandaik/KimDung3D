.class final Lcom/unionpay/z;
.super Landroid/webkit/WebChromeClient;


# instance fields
.field final synthetic a:Lcom/unionpay/WebViewJavascriptBridge;


# direct methods
.method private constructor <init>(Lcom/unionpay/WebViewJavascriptBridge;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/z;->a:Lcom/unionpay/WebViewJavascriptBridge;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/unionpay/WebViewJavascriptBridge;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/unionpay/z;-><init>(Lcom/unionpay/WebViewJavascriptBridge;)V

    return-void
.end method


# virtual methods
.method public final onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public final onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 2

    invoke-virtual {p4}, Landroid/webkit/JsResult;->cancel()V

    iget-object v0, p0, Lcom/unionpay/z;->a:Lcom/unionpay/WebViewJavascriptBridge;

    iget-object v0, v0, Lcom/unionpay/WebViewJavascriptBridge;->mContext:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-static {v0, p3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    const/4 v0, 0x1

    return v0
.end method
