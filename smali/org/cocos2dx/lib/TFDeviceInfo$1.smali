.class final Lorg/cocos2dx/lib/TFDeviceInfo$1;
.super Ljava/lang/Object;
.source "TFDeviceInfo.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/lib/TFDeviceInfo;->copyToPasteBord(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$content:Ljava/lang/String;

.field final synthetic val$pActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;


# direct methods
.method constructor <init>(Ljava/lang/String;Lorg/cocos2dx/lib/Cocos2dxActivity;)V
    .locals 0

    .prologue
    .line 30
    iput-object p1, p0, Lorg/cocos2dx/lib/TFDeviceInfo$1;->val$content:Ljava/lang/String;

    iput-object p2, p0, Lorg/cocos2dx/lib/TFDeviceInfo$1;->val$pActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 33
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "clipboard"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 34
    .local v0, "clipboard":Landroid/content/ClipboardManager;
    iget-object v1, p0, Lorg/cocos2dx/lib/TFDeviceInfo$1;->val$content:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 35
    invoke-static {}, Lorg/cocos2dx/lib/TFDeviceInfo;->access$000()Landroid/widget/TextView;

    move-result-object v1

    if-nez v1, :cond_0

    .line 37
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lorg/cocos2dx/lib/TFDeviceInfo$1;->val$pActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-static {v1}, Lorg/cocos2dx/lib/TFDeviceInfo;->access$002(Landroid/widget/TextView;)Landroid/widget/TextView;

    .line 38
    invoke-static {}, Lorg/cocos2dx/lib/TFDeviceInfo;->access$000()Landroid/widget/TextView;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    :cond_0
    return-void
.end method
