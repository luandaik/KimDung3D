.class final Lorg/cocos2dx/TerransForce/TerransForce$1;
.super Ljava/lang/Object;
.source "TerransForce.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/TerransForce/TerransForce;->disableDeviceSleep(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$notSleep:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0

    .prologue
    .line 240
    iput-boolean p1, p0, Lorg/cocos2dx/TerransForce/TerransForce$1;->val$notSleep:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 244
    invoke-static {}, Lorg/cocos2dx/TerransForce/TerransForce;->access$000()Landroid/view/View;

    move-result-object v0

    iget-boolean v1, p0, Lorg/cocos2dx/TerransForce/TerransForce$1;->val$notSleep:Z

    invoke-virtual {v0, v1}, Landroid/view/View;->setKeepScreenOn(Z)V

    .line 245
    return-void
.end method
