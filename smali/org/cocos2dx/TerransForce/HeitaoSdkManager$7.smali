.class final Lorg/cocos2dx/TerransForce/HeitaoSdkManager$7;
.super Ljava/lang/Object;
.source "HeitaoSdkManager.java"

# interfaces
.implements Lcom/heitao/listener/HTAppUpdateListener;


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
    .line 260
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHTAppUpdate(Lcom/heitao/model/HTAppUpdateInfo;)V
    .locals 0
    .param p1, "appUpdateInfo"    # Lcom/heitao/model/HTAppUpdateInfo;

    .prologue
    .line 278
    invoke-static {}, Lorg/cocos2dx/TerransForce/HeitaoSdkManager;->access$1100()V

    .line 279
    return-void
.end method
