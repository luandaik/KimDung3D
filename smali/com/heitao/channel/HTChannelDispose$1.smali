.class Lcom/heitao/channel/HTChannelDispose$1;
.super Ljava/lang/Object;
.source "HTChannelDispose.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispose;->doLoginCompleted(Ljava/util/Map;Ljava/util/Map;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannelDispose;

.field final synthetic val$customMap:Ljava/util/Map;

.field final synthetic val$verifyMap:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannelDispose;Ljava/util/Map;Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 89
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispose$1;->this$0:Lcom/heitao/channel/HTChannelDispose;

    iput-object p2, p0, Lcom/heitao/channel/HTChannelDispose$1;->val$verifyMap:Ljava/util/Map;

    iput-object p3, p0, Lcom/heitao/channel/HTChannelDispose$1;->val$customMap:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 95
    new-instance v0, Lcom/heitao/request/HTLoginVerify;

    invoke-direct {v0}, Lcom/heitao/request/HTLoginVerify;-><init>()V

    .line 96
    .local v0, "loginVerify":Lcom/heitao/request/HTLoginVerify;
    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispose$1;->val$verifyMap:Ljava/util/Map;

    new-instance v2, Lcom/heitao/channel/HTChannelDispose$1$1;

    invoke-direct {v2, p0}, Lcom/heitao/channel/HTChannelDispose$1$1;-><init>(Lcom/heitao/channel/HTChannelDispose$1;)V

    invoke-virtual {v0, v1, v2}, Lcom/heitao/request/HTLoginVerify;->doLoginVerify(Ljava/util/Map;Lcom/heitao/listener/HTLoginVerifyListener;)V

    .line 129
    return-void
.end method
