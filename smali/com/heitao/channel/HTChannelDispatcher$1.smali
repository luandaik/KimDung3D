.class Lcom/heitao/channel/HTChannelDispatcher$1;
.super Ljava/lang/Object;
.source "HTChannelDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispatcher;->onCreate(Landroid/content/Context;)V
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
    .line 78
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispatcher$1;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$1;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/heitao/openudid/HTOpenUDID_manager;->sync(Landroid/content/Context;)V

    .line 85
    invoke-static {}, Lcom/heitao/openudid/HTOpenUDID_manager;->isInitialized()Z

    .line 86
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$1;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispatcher$1;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v1, v1, Lcom/heitao/channel/HTChannelDispatcher;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/heitao/channel/HTBaseChannel;->onCreate(Landroid/content/Context;)V

    .line 87
    return-void
.end method
