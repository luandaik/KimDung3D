.class Lcom/heitao/channel/HTChannelDispatcher$10;
.super Ljava/lang/Object;
.source "HTChannelDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispatcher;->onWindowFocusChanged(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannelDispatcher;

.field final synthetic val$hasFocus:Z


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannelDispatcher;Z)V
    .locals 0

    .prologue
    .line 213
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispatcher$10;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iput-boolean p2, p0, Lcom/heitao/channel/HTChannelDispatcher$10;->val$hasFocus:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 220
    const-string v0, "onWindowFocusChanged"

    .line 221
    .local v0, "key":Ljava/lang/String;
    invoke-static {}, Lcom/heitao/notification/HTNotificationCenter;->getInstance()Lcom/heitao/notification/HTNotificationCenter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/heitao/notification/HTNotificationCenter;->isRegisteredNotificationForKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 223
    invoke-static {}, Lcom/heitao/notification/HTNotificationCenter;->getInstance()Lcom/heitao/notification/HTNotificationCenter;

    move-result-object v2

    iget-boolean v1, p0, Lcom/heitao/channel/HTChannelDispatcher$10;->val$hasFocus:Z

    if-eqz v1, :cond_0

    const-string v1, "1"

    :goto_0
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Lcom/heitao/notification/HTNotificationCenter;->postNotification(Ljava/lang/String;Ljava/lang/Object;)V

    .line 229
    :goto_1
    return-void

    .line 223
    :cond_0
    const-string v1, "0"

    goto :goto_0

    .line 227
    :cond_1
    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispatcher$10;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v1, v1, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iget-boolean v2, p0, Lcom/heitao/channel/HTChannelDispatcher$10;->val$hasFocus:Z

    invoke-virtual {v1, v2}, Lcom/heitao/channel/HTBaseChannel;->onWindowFocusChanged(Z)V

    goto :goto_1
.end method
