.class Lcom/heitao/channel/HTChannelDispatcher$20;
.super Ljava/lang/Object;
.source "HTChannelDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispatcher;->onPlayerRoleNameChanged(Ljava/lang/Boolean;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannelDispatcher;

.field final synthetic val$isCreate:Ljava/lang/Boolean;

.field final synthetic val$roleName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannelDispatcher;Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 434
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispatcher$20;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iput-object p2, p0, Lcom/heitao/channel/HTChannelDispatcher$20;->val$isCreate:Ljava/lang/Boolean;

    iput-object p3, p0, Lcom/heitao/channel/HTChannelDispatcher$20;->val$roleName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 437
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispatcher$20;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispatcher$20;->val$isCreate:Ljava/lang/Boolean;

    iget-object v2, p0, Lcom/heitao/channel/HTChannelDispatcher$20;->val$roleName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/heitao/channel/HTBaseChannel;->onPlayerRoleNameChanged(Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 438
    return-void
.end method
