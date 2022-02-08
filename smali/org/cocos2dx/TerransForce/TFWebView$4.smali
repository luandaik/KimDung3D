.class Lorg/cocos2dx/TerransForce/TFWebView$4;
.super Ljava/lang/Object;
.source "TFWebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/TerransForce/TFWebView;->showWebview(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/cocos2dx/TerransForce/TFWebView;

.field final synthetic val$bShow:Z


# direct methods
.method constructor <init>(Lorg/cocos2dx/TerransForce/TFWebView;Z)V
    .locals 0

    .prologue
    .line 221
    iput-object p1, p0, Lorg/cocos2dx/TerransForce/TFWebView$4;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    iput-boolean p2, p0, Lorg/cocos2dx/TerransForce/TFWebView$4;->val$bShow:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 223
    iget-boolean v0, p0, Lorg/cocos2dx/TerransForce/TFWebView$4;->val$bShow:Z

    if-eqz v0, :cond_0

    .line 225
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView$4;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v0}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    .line 232
    :goto_0
    return-void

    .line 229
    :cond_0
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView$4;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v0}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setVisibility(I)V

    goto :goto_0
.end method
