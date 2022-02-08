.class Lcom/heitao/platform/activity/HTPWAPWXActivity$2;
.super Landroid/webkit/WebChromeClient;
.source "HTPWAPWXActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/activity/HTPWAPWXActivity;->initWebView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPWAPWXActivity;


# direct methods
.method constructor <init>(Lcom/heitao/platform/activity/HTPWAPWXActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity$2;->this$0:Lcom/heitao/platform/activity/HTPWAPWXActivity;

    .line 104
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 0
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "newProgress"    # I

    .prologue
    .line 107
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    .line 108
    return-void
.end method
