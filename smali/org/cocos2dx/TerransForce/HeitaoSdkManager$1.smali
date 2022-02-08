.class final Lorg/cocos2dx/TerransForce/HeitaoSdkManager$1;
.super Ljava/lang/Object;
.source "HeitaoSdkManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->resultCallback(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$desc:Ljava/lang/String;

.field final synthetic val$nResult:I


# direct methods
.method constructor <init>(ILjava/lang/String;)V
    .locals 0

    .prologue
    .line 114
    iput p1, p0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$1;->val$nResult:I

    iput-object p2, p0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$1;->val$desc:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 117
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->access$000()I

    move-result v0

    iget v1, p0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$1;->val$nResult:I

    iget-object v2, p0, Lorg/cocos2dx/TerransForce/HeitaoSdkManager$1;->val$desc:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->access$100(IILjava/lang/String;)V

    .line 118
    return-void
.end method
