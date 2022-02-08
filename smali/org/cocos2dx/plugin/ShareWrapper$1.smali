.class final Lorg/cocos2dx/plugin/ShareWrapper$1;
.super Ljava/lang/Object;
.source "ShareWrapper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/plugin/ShareWrapper;->onShareResult(Lorg/cocos2dx/plugin/InterfaceShare;ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$curAdapter:Lorg/cocos2dx/plugin/InterfaceShare;

.field final synthetic val$curMsg:Ljava/lang/String;

.field final synthetic val$curRet:I


# direct methods
.method constructor <init>(Lorg/cocos2dx/plugin/InterfaceShare;ILjava/lang/String;)V
    .locals 0

    .prologue
    .line 36
    iput-object p1, p0, Lorg/cocos2dx/plugin/ShareWrapper$1;->val$curAdapter:Lorg/cocos2dx/plugin/InterfaceShare;

    iput p2, p0, Lorg/cocos2dx/plugin/ShareWrapper$1;->val$curRet:I

    iput-object p3, p0, Lorg/cocos2dx/plugin/ShareWrapper$1;->val$curMsg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 39
    iget-object v1, p0, Lorg/cocos2dx/plugin/ShareWrapper$1;->val$curAdapter:Lorg/cocos2dx/plugin/InterfaceShare;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 40
    .local v0, "name":Ljava/lang/String;
    const/16 v1, 0x2e

    const/16 v2, 0x2f

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 41
    iget v1, p0, Lorg/cocos2dx/plugin/ShareWrapper$1;->val$curRet:I

    iget-object v2, p0, Lorg/cocos2dx/plugin/ShareWrapper$1;->val$curMsg:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lorg/cocos2dx/plugin/ShareWrapper;->access$000(Ljava/lang/String;ILjava/lang/String;)V

    .line 42
    return-void
.end method
