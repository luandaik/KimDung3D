.class Lcom/heitao/common/activity/HTWebViewActivity$2;
.super Landroid/webkit/WebViewClient;
.source "HTWebViewActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/common/activity/HTWebViewActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/common/activity/HTWebViewActivity;


# direct methods
.method constructor <init>(Lcom/heitao/common/activity/HTWebViewActivity;)V
    .locals 0

    .prologue
    .line 105
    iput-object p1, p0, Lcom/heitao/common/activity/HTWebViewActivity$2;->this$0:Lcom/heitao/common/activity/HTWebViewActivity;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 131
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 134
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 111
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 113
    const-string v0, "/spay/finishclose"

    .line 114
    .local v0, "closeUrl":Ljava/lang/String;
    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 116
    iget-object v1, p0, Lcom/heitao/common/activity/HTWebViewActivity$2;->this$0:Lcom/heitao/common/activity/HTWebViewActivity;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/heitao/common/activity/HTWebViewActivity;->access$602(Lcom/heitao/common/activity/HTWebViewActivity;Z)Z

    .line 117
    invoke-static {}, Lcom/heitao/notification/HTNotificationCenter;->getInstance()Lcom/heitao/notification/HTNotificationCenter;

    move-result-object v1

    const-string v2, "ON_PAY_SUCCESS"

    invoke-virtual {v1, v2}, Lcom/heitao/notification/HTNotificationCenter;->postNotification(Ljava/lang/String;)V

    .line 118
    iget-object v1, p0, Lcom/heitao/common/activity/HTWebViewActivity$2;->this$0:Lcom/heitao/common/activity/HTWebViewActivity;

    invoke-virtual {v1}, Lcom/heitao/common/activity/HTWebViewActivity;->finish()V

    .line 120
    :cond_0
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 124
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 125
    const/4 v0, 0x1

    return v0
.end method
