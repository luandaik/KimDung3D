.class Lcom/heitao/channel/HTChannelDispatcher$19;
.super Ljava/lang/Object;
.source "HTChannelDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispatcher;->doSendData(Ljava/lang/String;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannelDispatcher;

.field final synthetic val$customMap:Ljava/util/Map;

.field final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannelDispatcher;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 415
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispatcher$19;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iput-object p2, p0, Lcom/heitao/channel/HTChannelDispatcher$19;->val$key:Ljava/lang/String;

    iput-object p3, p0, Lcom/heitao/channel/HTChannelDispatcher$19;->val$customMap:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 421
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$19;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispatcher$19;->val$key:Ljava/lang/String;

    iget-object v2, p0, Lcom/heitao/channel/HTChannelDispatcher$19;->val$customMap:Ljava/util/Map;

    invoke-virtual {v0, v1, v2}, Lcom/heitao/channel/HTBaseChannel;->doSendData(Ljava/lang/String;Ljava/util/Map;)V

    .line 422
    return-void
.end method
