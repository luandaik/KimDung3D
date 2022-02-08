.class Lorg/cocos2dx/TerransForce/TFWebView$2;
.super Ljava/lang/Object;
.source "TFWebView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/TerransForce/TFWebView;->update_URL(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/cocos2dx/TerransForce/TFWebView;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/cocos2dx/TerransForce/TFWebView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 165
    iput-object p1, p0, Lorg/cocos2dx/TerransForce/TFWebView$2;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    iput-object p2, p0, Lorg/cocos2dx/TerransForce/TFWebView$2;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 167
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView$2;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v0}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "m_webView is nul"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 168
    :cond_0
    iget-object v0, p0, Lorg/cocos2dx/TerransForce/TFWebView$2;->this$0:Lorg/cocos2dx/TerransForce/TFWebView;

    invoke-static {v0}, Lorg/cocos2dx/TerransForce/TFWebView;->access$200(Lorg/cocos2dx/TerransForce/TFWebView;)Landroid/webkit/WebView;

    move-result-object v0

    iget-object v1, p0, Lorg/cocos2dx/TerransForce/TFWebView$2;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 169
    return-void
.end method
