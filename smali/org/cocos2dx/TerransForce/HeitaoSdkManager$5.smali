.class final Lorg/cocos2dx/TerransForce/HeitaoSdkManager$5;
.super Ljava/lang/Object;
.source "HeitaoSdkManager.java"

# interfaces
.implements Lcom/heitao/listener/HTExitListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cocos2dx/TerransForce/HeitaoSdkManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 218
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHTGameExit()V
    .locals 2

    .prologue
    .line 230
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "\u6e38\u620f"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 232
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->access$1000()V

    .line 234
    return-void
.end method

.method public onHTThirdPartyExit()V
    .locals 2

    .prologue
    .line 223
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "\u7b2c\u4e09\u65b9 SDK \u9000\u51fa"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 224
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->access$900()I

    move-result v0

    const-string v1, "\u7b2c\u4e09\u65b9 SDK \u9000\u51fa"

    invoke-static {v0, v1}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->resultCallback(ILjava/lang/String;)V

    .line 225
    return-void
.end method
