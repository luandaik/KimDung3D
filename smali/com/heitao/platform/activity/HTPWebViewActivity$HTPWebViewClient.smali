.class Lcom/heitao/platform/activity/HTPWebViewActivity$HTPWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "HTPWebViewActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/platform/activity/HTPWebViewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "HTPWebViewClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPWebViewActivity;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPWebViewActivity;)V
    .locals 0

    .prologue
    .line 45
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPWebViewActivity$HTPWebViewClient;->this$0:Lcom/heitao/platform/activity/HTPWebViewActivity;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 80
    const-string v0, "http://pay.heitao.com/pay/finishclose"

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 82
    invoke-virtual {p1}, Landroid/webkit/WebView;->stopLoading()V

    .line 83
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWebViewActivity$HTPWebViewClient;->this$0:Lcom/heitao/platform/activity/HTPWebViewActivity;

    invoke-virtual {v0}, Lcom/heitao/platform/activity/HTPWebViewActivity;->onPayFinished()V

    .line 84
    const/4 v0, 0x1

    .line 87
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method
