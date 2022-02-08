.class final Lcom/unionpay/aa;
.super Landroid/webkit/WebViewClient;


# instance fields
.field final synthetic a:Lcom/unionpay/WebViewJavascriptBridge;


# direct methods
.method private constructor <init>(Lcom/unionpay/WebViewJavascriptBridge;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/aa;->a:Lcom/unionpay/WebViewJavascriptBridge;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/unionpay/WebViewJavascriptBridge;B)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/unionpay/aa;-><init>(Lcom/unionpay/WebViewJavascriptBridge;)V

    return-void
.end method


# virtual methods
.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2

    const-string v0, "test"

    const-string v1, "onPageFinished"

    invoke-static {v0, v1}, Lcom/unionpay/utils/g;->a(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
