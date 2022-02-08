.class final Lcom/unionpay/x;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/unionpay/WebViewJavascriptBridge;


# direct methods
.method constructor <init>(Lcom/unionpay/WebViewJavascriptBridge;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/x;->b:Lcom/unionpay/WebViewJavascriptBridge;

    iput-object p2, p0, Lcom/unionpay/x;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/unionpay/x;->b:Lcom/unionpay/WebViewJavascriptBridge;

    iget-object v0, v0, Lcom/unionpay/WebViewJavascriptBridge;->mWebView:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/unionpay/x;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method
