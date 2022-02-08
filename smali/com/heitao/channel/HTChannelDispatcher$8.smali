.class Lcom/heitao/channel/HTChannelDispatcher$8;
.super Ljava/lang/Object;
.source "HTChannelDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispatcher;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannelDispatcher;

.field final synthetic val$data:Landroid/content/Intent;

.field final synthetic val$requestCode:I

.field final synthetic val$resultCode:I


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannelDispatcher;IILandroid/content/Intent;)V
    .locals 0

    .prologue
    .line 178
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispatcher$8;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iput p2, p0, Lcom/heitao/channel/HTChannelDispatcher$8;->val$requestCode:I

    iput p3, p0, Lcom/heitao/channel/HTChannelDispatcher$8;->val$resultCode:I

    iput-object p4, p0, Lcom/heitao/channel/HTChannelDispatcher$8;->val$data:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 184
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$8;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iget v1, p0, Lcom/heitao/channel/HTChannelDispatcher$8;->val$requestCode:I

    iget v2, p0, Lcom/heitao/channel/HTChannelDispatcher$8;->val$resultCode:I

    iget-object v3, p0, Lcom/heitao/channel/HTChannelDispatcher$8;->val$data:Landroid/content/Intent;

    invoke-virtual {v0, v1, v2, v3}, Lcom/heitao/channel/HTBaseChannel;->onActivityResult(IILandroid/content/Intent;)V

    .line 185
    return-void
.end method
