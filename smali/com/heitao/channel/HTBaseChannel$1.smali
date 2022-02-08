.class Lcom/heitao/channel/HTBaseChannel$1;
.super Ljava/lang/Object;
.source "HTBaseChannel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTBaseChannel;->onStartGame()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTBaseChannel;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTBaseChannel;)V
    .locals 0

    .prologue
    .line 413
    iput-object p1, p0, Lcom/heitao/channel/HTBaseChannel$1;->this$0:Lcom/heitao/channel/HTBaseChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 418
    invoke-static {}, Lcom/heitao/common/HTDataCenter;->getInstance()Lcom/heitao/common/HTDataCenter;

    move-result-object v0

    sget-object v1, Lcom/heitao/common/HTDataCenter$HTMethod;->Login:Lcom/heitao/common/HTDataCenter$HTMethod;

    invoke-virtual {v0, v1}, Lcom/heitao/common/HTDataCenter;->isValidCallMethod(Lcom/heitao/common/HTDataCenter$HTMethod;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 420
    iget-object v0, p0, Lcom/heitao/channel/HTBaseChannel$1;->this$0:Lcom/heitao/channel/HTBaseChannel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/heitao/channel/HTBaseChannel;->doLogin(Ljava/util/Map;)V

    .line 426
    :goto_0
    return-void

    .line 424
    :cond_0
    const-string v0, "\u767b\u5f55\u64cd\u4f5c\u8fc7\u5feb"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    goto :goto_0
.end method
