.class Lcom/heitao/channel/HTChannelDispatcher$12;
.super Ljava/lang/Object;
.source "HTChannelDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispatcher;->doLogin(Ljava/lang/String;Lcom/heitao/listener/HTLoginListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannelDispatcher;

.field final synthetic val$customParameters:Ljava/lang/String;

.field final synthetic val$listener:Lcom/heitao/listener/HTLoginListener;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannelDispatcher;Lcom/heitao/listener/HTLoginListener;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 268
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispatcher$12;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iput-object p2, p0, Lcom/heitao/channel/HTChannelDispatcher$12;->val$listener:Lcom/heitao/listener/HTLoginListener;

    iput-object p3, p0, Lcom/heitao/channel/HTChannelDispatcher$12;->val$customParameters:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 274
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$12;->val$listener:Lcom/heitao/listener/HTLoginListener;

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$12;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispatcher$12;->val$listener:Lcom/heitao/listener/HTLoginListener;

    iput-object v1, v0, Lcom/heitao/channel/HTBaseChannel;->mLoginListener:Lcom/heitao/listener/HTLoginListener;

    .line 278
    :cond_0
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$12;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispatcher$12;->val$customParameters:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/heitao/common/HTUtils;->parsStringToMap(Ljava/lang/String;Z)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/heitao/channel/HTBaseChannel;->doLogin(Ljava/util/Map;)V

    .line 279
    return-void
.end method
