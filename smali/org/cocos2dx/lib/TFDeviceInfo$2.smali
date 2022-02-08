.class final Lorg/cocos2dx/lib/TFDeviceInfo$2;
.super Ljava/lang/Object;
.source "TFDeviceInfo.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/cocos2dx/lib/TFDeviceInfo;->getClipBoardText()Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$pActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;


# direct methods
.method constructor <init>(Lorg/cocos2dx/lib/Cocos2dxActivity;)V
    .locals 0

    .prologue
    .line 50
    iput-object p1, p0, Lorg/cocos2dx/lib/TFDeviceInfo$2;->val$pActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 55
    invoke-static {}, Lorg/cocos2dx/lib/TFDeviceInfo;->access$000()Landroid/widget/TextView;

    move-result-object v2

    if-nez v2, :cond_0

    .line 57
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lorg/cocos2dx/lib/TFDeviceInfo$2;->val$pActivity:Lorg/cocos2dx/lib/Cocos2dxActivity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-static {v2}, Lorg/cocos2dx/lib/TFDeviceInfo;->access$002(Landroid/widget/TextView;)Landroid/widget/TextView;

    .line 58
    invoke-static {}, Lorg/cocos2dx/lib/TFDeviceInfo;->access$000()Landroid/widget/TextView;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    :cond_0
    invoke-static {}, Lorg/cocos2dx/lib/Cocos2dxActivity;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "clipboard"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 63
    .local v0, "clipboard":Landroid/content/ClipboardManager;
    invoke-virtual {v0}, Landroid/content/ClipboardManager;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    .line 64
    .local v1, "sz":Ljava/lang/CharSequence;
    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lez v2, :cond_1

    invoke-static {}, Lorg/cocos2dx/lib/TFDeviceInfo;->access$000()Landroid/widget/TextView;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 66
    invoke-static {}, Lorg/cocos2dx/lib/TFDeviceInfo;->access$000()Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    :cond_1
    return-void
.end method
