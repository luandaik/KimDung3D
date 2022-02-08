.class Lorg/cocos2dx/TerransForce/TFWebView$1$1;
.super Landroid/webkit/WebViewClient;
.source "TFWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/TerransForce/TFWebView$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/cocos2dx/TerransForce/TFWebView$1;


# direct methods
.method constructor <init>(Lorg/cocos2dx/TerransForce/TFWebView$1;)V
    .locals 0

    .prologue
    .line 85
    iput-object p1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1$1;->this$1:Lorg/cocos2dx/TerransForce/TFWebView$1;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 89
    const/4 v0, 0x0

    return v0
.end method
