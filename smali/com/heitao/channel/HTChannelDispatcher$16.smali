.class Lcom/heitao/channel/HTChannelDispatcher$16;
.super Ljava/lang/Object;
.source "HTChannelDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispatcher;->setShowFunctionMenu(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannelDispatcher;

.field final synthetic val$show:Z


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannelDispatcher;Z)V
    .locals 0

    .prologue
    .line 349
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispatcher$16;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iput-boolean p2, p0, Lcom/heitao/channel/HTChannelDispatcher$16;->val$show:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 355
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$16;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iget-boolean v1, p0, Lcom/heitao/channel/HTChannelDispatcher$16;->val$show:Z

    invoke-virtual {v0, v1}, Lcom/heitao/channel/HTBaseChannel;->setShowFunctionMenu(Z)V

    .line 356
    return-void
.end method
