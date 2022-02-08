.class Lcom/heitao/channel/HTChannelDispose$1$1;
.super Ljava/lang/Object;
.source "HTChannelDispose.java"

# interfaces
.implements Lcom/heitao/listener/HTLoginVerifyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannelDispose$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/heitao/channel/HTChannelDispose$1;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannelDispose$1;)V
    .locals 0

    .prologue
    .line 97
    iput-object p1, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onHTLoginVerifyCompleted(Lcom/heitao/model/HTUser;Ljava/util/Map;)V
    .locals 3
    .param p1, "user"    # Lcom/heitao/model/HTUser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/heitao/model/HTUser;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p2, "sdkParsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose$1;->this$0:Lcom/heitao/channel/HTChannelDispose;

    iput-object p1, v0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    .line 103
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose$1;->this$0:Lcom/heitao/channel/HTChannelDispose;

    iput-object p2, v0, Lcom/heitao/channel/HTChannelDispose;->mSDKCustomMap:Ljava/util/Map;

    .line 104
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose$1;->this$0:Lcom/heitao/channel/HTChannelDispose;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    if-nez v0, :cond_0

    .line 106
    const-string v0, "\u767b\u5f55\u9a8c\u8bc1\u6210\u529f\u7528\u6237\u4fe1\u606f\u4e3a\u7a7a"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->e(Ljava/lang/String;)V

    .line 110
    :cond_0
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose$1;->this$0:Lcom/heitao/channel/HTChannelDispose;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose;->mLoginListener:Lcom/heitao/listener/HTLoginListener;

    if-eqz v0, :cond_3

    .line 112
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose$1;->this$0:Lcom/heitao/channel/HTChannelDispose;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose;->mLoginListener:Lcom/heitao/listener/HTLoginListener;

    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    iget-object v1, v1, Lcom/heitao/channel/HTChannelDispose$1;->this$0:Lcom/heitao/channel/HTChannelDispose;

    iget-object v1, v1, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    iget-object v2, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    iget-object v2, v2, Lcom/heitao/channel/HTChannelDispose$1;->val$customMap:Ljava/util/Map;

    invoke-interface {v0, v1, v2}, Lcom/heitao/listener/HTLoginListener;->onHTLoginCompleted(Lcom/heitao/model/HTUser;Ljava/util/Map;)V

    .line 120
    :goto_0
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose$1;->this$0:Lcom/heitao/channel/HTChannelDispose;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v1, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->nativeModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose$1;->this$0:Lcom/heitao/channel/HTChannelDispose;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose;->mSDKJoinModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    sget-object v1, Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;->bothModel:Lcom/heitao/channel/HTChannelDispose$HTSDKJoinModel;

    if-ne v0, v1, :cond_2

    .line 122
    :cond_1
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose$1;->this$0:Lcom/heitao/channel/HTChannelDispose;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    iget-object v1, v1, Lcom/heitao/channel/HTChannelDispose$1;->val$customMap:Ljava/util/Map;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/heitao/common/HTUtils;->mapToParsString(Ljava/util/Map;Z)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/heitao/model/HTUser;->custom:Ljava/lang/String;

    .line 123
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose$1;->this$0:Lcom/heitao/channel/HTChannelDispose;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    if-nez v0, :cond_4

    const-string v0, ""

    :goto_1
    invoke-static {v0}, Lcom/heitao/proxy/HTProxy;->doNativeLoginCompleted(Ljava/lang/String;)V

    .line 126
    :cond_2
    invoke-static {}, Lcom/heitao/extension/HTExtensionDispatcher;->getInstance()Lcom/heitao/extension/HTExtensionDispatcher;

    move-result-object v0

    iget-object v0, v0, Lcom/heitao/extension/HTExtensionDispatcher;->extensionApi:Lcom/heitao/extension/HTExtensionApi;

    iget-object v1, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    iget-object v1, v1, Lcom/heitao/channel/HTChannelDispose$1;->this$0:Lcom/heitao/channel/HTChannelDispose;

    iget-object v1, v1, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    invoke-interface {v0, v1}, Lcom/heitao/extension/HTExtensionApi;->onHTLoginCompleted(Lcom/heitao/model/HTUser;)V

    .line 127
    return-void

    .line 116
    :cond_3
    const-string v0, "\u672a\u8bbe\u7f6e\u767b\u5f55\u76d1\u542c"

    invoke-static {v0}, Lcom/heitao/common/HTLog;->w(Ljava/lang/String;)V

    goto :goto_0

    .line 123
    :cond_4
    iget-object v0, p0, Lcom/heitao/channel/HTChannelDispose$1$1;->this$1:Lcom/heitao/channel/HTChannelDispose$1;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose$1;->this$0:Lcom/heitao/channel/HTChannelDispose;

    iget-object v0, v0, Lcom/heitao/channel/HTChannelDispose;->mUser:Lcom/heitao/model/HTUser;

    invoke-virtual {v0}, Lcom/heitao/model/HTUser;->toEncodeString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method
