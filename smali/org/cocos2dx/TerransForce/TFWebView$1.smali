.class Lorg/cocos2dx/TerransForce/TFWebView$1;
.super Ljava/lang/Object;
.source "TFWebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/TerransForce/TFWebView;->_displayWebView(IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/cocos2dx/TerransForce/TFWebView;

.field final synthetic val$height:I

.field final synthetic val$width:I

.field final synthetic val$x:I

.field final synthetic val$y:I


# direct methods
.method constructor <init>(Lorg/cocos2dx/TerransForce/TFWebView;IIII)V
    .locals 0

    .prologue
    .line 43
    iput-object p1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    iput p2, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->val$x:I

    iput p3, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->val$y:I

    iput p4, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->val$width:I

    iput p5, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->val$height:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v4, -0x1

    .line 50
    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v1}, Lorg/cocos2dx/TerransForce/TFWebView;->access$000(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/widget/LinearLayout;

    move-result-object v1

    if-nez v1, :cond_0

    .line 52
    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-static {}, Lorg/cocos2dx/TerransForce/TFWebView;->access$100()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Lorg/cocos2dx/TerransForce/TFWebView;->access$002(Lorg/cocos2dx/TerransForce/TFWebView;Landroid/widget/LinearLayout;)Landroid/widget/LinearLayout;

    .line 53
    invoke-static {}, Lorg/cocos2dx/TerransForce/TFWebView;->access$100()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v2}, Lorg/cocos2dx/TerransForce/TFWebView;->access$000(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/widget/LinearLayout;

    move-result-object v2

    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v3, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 63
    :cond_0
    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v1}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v1

    if-nez v1, :cond_1

    .line 65
    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    new-instance v2, Landroid/webkit/WebView;

    invoke-static {}, Lorg/cocos2dx/TerransForce/TFWebView;->access$100()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    invoke-static {v1, v2}, Lorg/cocos2dx/TerransForce/TFWebView;->access$202(Lorg/cocos2dx/TerransForce/TFWebView;Landroid/webkit/WebView;)Landroid/webkit/WebView;

    .line 66
    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v1}, Lorg/cocos2dx/TerransForce/TFWebView;->access$000(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/widget/LinearLayout;

    move-result-object v1

    iget-object v2, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v2}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 68
    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v1}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 73
    :cond_1
    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v1}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 74
    .local v0, "linearParams":Landroid/widget/LinearLayout$LayoutParams;
    iget v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->val$x:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 75
    iget v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->val$y:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 76
    iget v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->val$width:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 77
    iget v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->val$height:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 78
    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v1}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v1}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 81
    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v1}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 82
    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v1}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    .line 85
    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$1;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v1}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v1

    new-instance v2, Lorg/cocos2dx/TerransForce/TFWebView$1$1;

    invoke-direct {v2, p0}, Lorg/cocos2dx/TerransForce/TFWebView$1$1;-><init>(Lorg/cocos2dx/TerransForce/TFWebView$1;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 150
    return-void
.end method
