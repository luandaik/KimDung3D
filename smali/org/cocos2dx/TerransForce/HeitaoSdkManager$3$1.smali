.class Lorg/cocos2dx/TerransForce/HeitaoSdkManager$3$1;
.super Ljava/lang/Object;
.source "HeitaoSdkManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/TerransForce/HeitaoSdkManager$3;->onHTLogoutCompleted(Lcom/heitao/model/HTUser;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/cocos2dx/TerransForce/HeitaoSdkManager$3;


# direct methods
.method constructor <init>(Lorg/cocos2dx/TerransForce/HeitaoSdkManager$3;)V
    .locals 0

    .prologue
    .line 186
    iput-object p1, p0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$3$1;->this$0:Lorg/cocos2dx/TerransForce/HeitaoSdkManager$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 191
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->access$600()I

    move-result v0

    const-string v1, "\u6ce8\u9500\u6210\u529f"

    invoke-static {v0, v1}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->resultCallback(ILjava/lang/String;)V

    .line 192
    return-void
.end method
