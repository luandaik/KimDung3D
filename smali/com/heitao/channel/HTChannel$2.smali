.class Lcom/heitao/channel/HTChannel$2;
.super Lcom/heitao/platform/listener/HTPLoginListener;
.source "HTChannel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannel;->doLogin(Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannel;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannel;)V
    .locals 0

    .prologue
    .line 133
    iput-object p1, p0, Lcom/heitao/channel/HTChannel$2;->this$0:Lcom/heitao/channel/HTChannel;

    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPLoginListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoginCompleted(Lcom/heitao/platform/model/HTPUser;)V
    .locals 4
    .param p1, "user"    # Lcom/heitao/platform/model/HTPUser;

    .prologue
    .line 146
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 147
    .local v0, "verifyMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "uid"

    iget-object v2, p1, Lcom/heitao/platform/model/HTPUser;->userId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    const-string v1, "token"

    iget-object v2, p1, Lcom/heitao/platform/model/HTPUser;->token:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    const-string v1, "time"

    iget-object v2, p1, Lcom/heitao/platform/model/HTPUser;->time:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    iget-object v1, p0, Lcom/heitao/channel/HTChannel$2;->this$0:Lcom/heitao/channel/HTChannel;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Lcom/heitao/channel/HTChannel;->doLoginCompleted(Ljava/util/Map;Ljava/util/Map;Z)V

    .line 152
    invoke-static {}, Lcom/heitao/platform/api/HTPlatform;->getInstance()Lcom/heitao/platform/api/HTPlatform;

    move-result-object v1

    invoke-virtual {v1}, Lcom/heitao/platform/api/HTPlatform;->showNewWindow()V

    .line 158
    return-void
.end method

.method public onLoginFailed(Lcom/heitao/platform/model/HTPError;)V
    .locals 2
    .param p1, "error"    # Lcom/heitao/platform/model/HTPError;

    .prologue
    .line 138
    iget-object v0, p0, Lcom/heitao/channel/HTChannel$2;->this$0:Lcom/heitao/channel/HTChannel;

    invoke-static {}, Lcom/heitao/model/HTError;->getLoginFailError()Lcom/heitao/model/HTError;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/heitao/channel/HTChannel;->doLogoutFailed(Lcom/heitao/model/HTError;)V

    .line 139
    return-void
.end method
