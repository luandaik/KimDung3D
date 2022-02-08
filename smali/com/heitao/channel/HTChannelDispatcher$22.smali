.class Lcom/heitao/channel/HTChannelDispatcher$22;
.super Ljava/lang/Object;
.source "HTChannelDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispatcher;->doAntiAddictionQuery()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannelDispatcher;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannelDispatcher;)V
    .locals 0

    .prologue
    .line 479
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispatcher$22;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 482
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$22;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    invoke-virtual {v0}, Lcom/heitao/channel/HTBaseChannel;->doAntiAddictionQuery()V

    .line 483
    return-void
.end method
