.class Lcom/heitao/channel/HTChannelDispatcher$9;
.super Ljava/lang/Object;
.source "HTChannelDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispatcher;->onConfigurationChanged(Landroid/content/res/Configuration;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannelDispatcher;

.field final synthetic val$newConfig:Landroid/content/res/Configuration;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannelDispatcher;Landroid/content/res/Configuration;)V
    .locals 0

    .prologue
    .line 191
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispatcher$9;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iput-object p2, p0, Lcom/heitao/channel/HTChannelDispatcher$9;->val$newConfig:Landroid/content/res/Configuration;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 198
    const-string v0, "onConfigurationChanged"

    .line 199
    .local v0, "key":Ljava/lang/String;
    invoke-static {}, Lcom/heitao/notification/HTNotificationCenter;->getInstance()Lcom/heitao/notification/HTNotificationCenter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/heitao/notification/HTNotificationCenter;->isRegisteredNotificationForKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 201
    invoke-static {}, Lcom/heitao/notification/HTNotificationCenter;->getInstance()Lcom/heitao/notification/HTNotificationCenter;

    move-result-object v1

    iget-object v2, p0, Lcom/heitao/channel/HTChannelDispatcher$9;->val$newConfig:Landroid/content/res/Configuration;

    invoke-virtual {v1, v0, v2}, Lcom/heitao/notification/HTNotificationCenter;->postNotification(Ljava/lang/String;Ljava/lang/Object;)V

    .line 207
    :goto_0
    return-void

    .line 205
    :cond_0
    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispatcher$9;->this$0:Lcom/heitao/channel/HTChannelDispatcher;

    iget-object v1, v1, Lcom/heitao/channel/HTChannelDispatcher;->mChannel:Lcom/heitao/channel/HTBaseChannel;

    iget-object v2, p0, Lcom/heitao/channel/HTChannelDispatcher$9;->val$newConfig:Landroid/content/res/Configuration;

    invoke-virtual {v1, v2}, Lcom/heitao/channel/HTBaseChannel;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    goto :goto_0
.end method
