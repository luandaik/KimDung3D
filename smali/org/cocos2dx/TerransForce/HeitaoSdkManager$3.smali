.class final Lorg/cocos2dx/TerransForce/HeitaoSdkManager$3;
.super Ljava/lang/Object;
.source "HeitaoSdkManager.java"

# interfaces
.implements Lcom/heitao/listener/HTLogoutListener;


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
    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHTLogoutCompleted(Lcom/heitao/model/HTUser;Ljava/util/Map;)V
    .locals 4
    .param p1, "user"    # Lcom/heitao/model/HTUser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/heitao/model/HTUser;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 185
    .local p2, "customParsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->access$500()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 186
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$3$1;

    invoke-direct {v1, p0}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$3$1;-><init>(Lorg/cocos2dx/TerransForce/HeitaoSdkManager$3;)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 199
    :goto_0
    return-void

    .line 197
    :cond_0
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->access$600()I

    move-result v0

    const-string v1, "\u6ce8\u9500\u6210\u529f"

    invoke-static {v0, v1}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->resultCallback(ILjava/lang/String;)V

    goto :goto_0
.end method

.method public onHTLogoutFailed(Lcom/heitao/model/HTError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/model/HTError;

    .prologue
    .line 176
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->access$400()I

    move-result v0

    iget-object v1, p1, Lcom/heitao/model/HTError;->message:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->resultCallback(ILjava/lang/String;)V

    .line 177
    return-void
.end method
