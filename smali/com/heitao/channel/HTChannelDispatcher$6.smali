.class Lcom/heitao/channel/HTChannelDispatcher$6;
.super Ljava/lang/Object;
.source "HTChannelDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispatcher;->onDestroy()V
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
    .line 145
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispatcher$6;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 151
    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispatcher$6;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v1, v1, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    invoke-virtual {v1}, Lcom/heitao/channel/HTBaseChannel;->onDestroy()V

    .line 154
    const-string v0, "ON_GAME_CONFIRM_EXIT"

    .line 155
    .local v0, "GAME_CON_EXIT_NOT_KEY":Ljava/lang/String;
    invoke-static {}, Lcom/heitao/notification/HTNotificationCenter;->getInstance()Lcom/heitao/notification/HTNotificationCenter;

    move-result-object v1

    const-string v2, "ON_GAME_CONFIRM_EXIT"

    invoke-virtual {v1, v2}, Lcom/heitao/notification/HTNotificationCenter;->isRegisteredNotificationForKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 157
    invoke-static {}, Lcom/heitao/notification/HTNotificationCenter;->getInstance()Lcom/heitao/notification/HTNotificationCenter;

    move-result-object v1

    const-string v2, "ON_GAME_CONFIRM_EXIT"

    invoke-virtual {v1, v2}, Lcom/heitao/notification/HTNotificationCenter;->postNotification(Ljava/lang/String;)V

    .line 159
    :cond_0
    return-void
.end method
