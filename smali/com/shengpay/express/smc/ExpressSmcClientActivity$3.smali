.class Lcom/shengpay/express/smc/ExpressSmcClientActivity$3;
.super Landroid/webkit/WebViewClient;
.source "ExpressSmcClientActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/shengpay/express/smc/ExpressSmcClientActivity;->loadWebView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;


# direct methods
.method constructor <init>(Lcom/shengpay/express/smc/ExpressSmcClientActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/shengpay/express/smc/ExpressSmcClientActivity$3;->this$0:Lcom/shengpay/express/smc/ExpressSmcClientActivity;

    .line 183
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 187
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 188
    const/4 v0, 0x0

    return v0
.end method
