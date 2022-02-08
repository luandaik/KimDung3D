.class Lcom/heitao/request/HTBaseLoginVerify$2$3;
.super Ljava/lang/Object;
.source "HTBaseLoginVerify.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/request/HTBaseLoginVerify$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/request/HTBaseLoginVerify$2;


# direct methods
.method constructor <init>(Lcom/heitao/request/HTBaseLoginVerify$2;)V
    .locals 0

    .prologue
    .line 317
    iput-object p1, p0, Lcom/heitao/request/HTBaseLoginVerify$2$3;->this$1:Lcom/heitao/request/HTBaseLoginVerify$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 323
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 325
    invoke-static {}, Lcom/heitao/channel/HTChannelDispatcher;->getInstance()Lcom/heitao/channel/HTChannelDispatcher;

    move-result-object v1

    invoke-virtual {v1}, Lcom/heitao/channel/HTChannelDispatcher;->getChannel()Lcom/heitao/channel/HTBaseChannel;

    move-result-object v1

    iget-object v0, v1, Lcom/heitao/channel/HTBaseChannel;->mExitListener:Lcom/heitao/listener/HTExitListener;

    .line 326
    .local v0, "listener":Lcom/heitao/listener/HTExitListener;
    if-eqz v0, :cond_0

    .line 328
    invoke-interface {v0}, Lcom/heitao/listener/HTExitListener;->onHTThirdPartyExit()V

    .line 330
    :cond_0
    return-void
.end method
