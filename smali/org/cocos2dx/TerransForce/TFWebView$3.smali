.class Lorg/cocos2dx/TerransForce/TFWebView$3;
.super Ljava/lang/Object;
.source "TFWebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/TerransForce/TFWebView;->_removeWebView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/cocos2dx/TerransForce/TFWebView;


# direct methods
.method constructor <init>(Lorg/cocos2dx/TerransForce/TFWebView;)V
    .locals 0

    .prologue
    .line 184
    iput-object p1, p0, Lorg/cocos2dx/TerransForce/TFWebView$3;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 192
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView$3;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v0}, Lorg/cocos2dx/TerransForce/TFWebView;->access$000(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$3;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v1}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    .line 193
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView$3;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v0}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 199
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView$3;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/cocos2dx/TerransForce/TFWebView;->access$202(Lorg/cocos2dx/TerransForce/TFWebView;Landroid/webkit/WebView;)Landroid/webkit/WebView;

    .line 202
    return-void
.end method
