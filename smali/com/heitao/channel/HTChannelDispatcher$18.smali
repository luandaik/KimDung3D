.class Lcom/heitao/channel/HTChannelDispatcher$18;
.super Ljava/lang/Object;
.source "HTChannelDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispatcher;->onGameLevelChanged(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannelDispatcher;

.field final synthetic val$newLevel:I


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannelDispatcher;I)V
    .locals 0

    .prologue
    .line 397
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispatcher$18;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iput p2, p0, Lcom/heitao/channel/HTChannelDispatcher$18;->val$newLevel:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 403
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$18;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iget v1, p0, Lcom/heitao/channel/HTChannelDispatcher$18;->val$newLevel:I

    invoke-virtual {v0, v1}, Lcom/heitao/channel/HTBaseChannel;->onGameLevelChanged(I)V

    .line 404
    return-void
.end method
