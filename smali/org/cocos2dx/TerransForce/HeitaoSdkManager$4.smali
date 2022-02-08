.class final Lorg/cocos2dx/TerransForce/HeitaoSdkManager$4;
.super Ljava/lang/Object;
.source "HeitaoSdkManager.java"

# interfaces
.implements Lcom/heitao/listener/HTPayListener;


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
    .line 202
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHTPayCompleted(Lcom/heitao/model/HTPayResult;)V
    .locals 2
    .param p1, "result"    # Lcom/heitao/model/HTPayResult;

    .prologue
    .line 214
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->access$800()I

    move-result v0

    const-string v1, "\u652f\u4ed8\u6210\u529f"

    invoke-static {v0, v1}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->resultCallback(ILjava/lang/String;)V

    .line 215
    return-void
.end method

.method public onHTPayFailed(Lcom/heitao/model/HTError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 207
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->access$700()I

    move-result v0

    iget-object v1, p1, Lcom/heitao/model/HTError;->message:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->resultCallback(ILjava/lang/String;)V

    .line 208
    return-void
.end method
