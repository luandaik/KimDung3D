.class final Lorg/cocos2dx/TerransForce/HeitaoSdkManager$6;
.super Ljava/lang/Object;
.source "HeitaoSdkManager.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->showExitGameDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 241
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "index"    # I

    .prologue
    .line 245
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->access$900()I

    move-result v0

    const-string v1, "\u7b2c\u4e09\u65b9 SDK \u9000\u51fa"

    invoke-static {v0, v1}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->resultCallback(ILjava/lang/String;)V

    .line 246
    return-void
.end method
