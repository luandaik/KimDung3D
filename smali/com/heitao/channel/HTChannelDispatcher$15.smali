.class Lcom/heitao/channel/HTChannelDispatcher$15;
.super Ljava/lang/Object;
.source "HTChannelDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispatcher;->doExit(Lcom/heitao/listener/HTExitListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannelDispatcher;

.field final synthetic val$listener:Lcom/heitao/listener/HTExitListener;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannelDispatcher;Lcom/heitao/listener/HTExitListener;)V
    .locals 0

    .prologue
    .line 328
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispatcher$15;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iput-object p2, p0, Lcom/heitao/channel/HTChannelDispatcher$15;->val$listener:Lcom/heitao/listener/HTExitListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 334
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$15;->val$listener:Lcom/heitao/listener/HTExitListener;

    if-eqz v0, :cond_0

    .line 336
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$15;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispatcher$15;->val$listener:Lcom/heitao/listener/HTExitListener;

    iput-object v1, v0, Lcom/heitao/channel/HTBaseChannel;->mExitListener:Lcom/heitao/listener/HTExitListener;

    .line 338
    :cond_0
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$15;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    invoke-virtual {v0}, Lcom/heitao/channel/HTBaseChannel;->doExit()V

    .line 339
    return-void
.end method
