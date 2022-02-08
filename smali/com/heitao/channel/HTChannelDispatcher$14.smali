.class Lcom/heitao/channel/HTChannelDispatcher$14;
.super Ljava/lang/Object;
.source "HTChannelDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispatcher;->doPay(Ljava/lang/String;Lcom/heitao/listener/HTPayListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannelDispatcher;

.field final synthetic val$customParameters:Ljava/lang/String;

.field final synthetic val$listener:Lcom/heitao/listener/HTPayListener;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannelDispatcher;Lcom/heitao/listener/HTPayListener;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 308
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispatcher$14;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iput-object p2, p0, Lcom/heitao/channel/HTChannelDispatcher$14;->val$listener:Lcom/heitao/listener/HTPayListener;

    iput-object p3, p0, Lcom/heitao/channel/HTChannelDispatcher$14;->val$customParameters:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 314
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$14;->val$listener:Lcom/heitao/listener/HTPayListener;

    if-eqz v0, :cond_0

    .line 316
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$14;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispatcher$14;->val$listener:Lcom/heitao/listener/HTPayListener;

    iput-object v1, v0, Lcom/heitao/channel/HTBaseChannel;->mPayListener:Lcom/heitao/listener/HTPayListener;

    .line 318
    :cond_0
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$14;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v1, v0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$14;->val$customParameters:Ljava/lang/String;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/heitao/channel/HTBaseChannel;->doPay(Lcom/heitao/model/HTPayInfo;)V

    .line 319
    return-void

    .line 318
    :cond_1
    new-instance v0, Lcom/heitao/model/HTPayInfo;

    iget-object v2, p0, Lcom/heitao/channel/HTChannelDispatcher$14;->val$customParameters:Ljava/lang/String;

    invoke-direct {v0, v2}, Lcom/heitao/model/HTPayInfo;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method
